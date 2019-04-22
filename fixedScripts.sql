ALTER TABLE stake_orders
  DROP CONSTRAINT stake_orders_pkey;

with t0 as (
  select row_number() over (order by "senderId", timestamp, "rowId") as r, trs.id, "senderId"
  from trs
  where type = 40
  order by "senderId", timestamp, "rowId"
),
     t1 as (
       select row_number() over (order by "senderId", "startTime") as r, id, "senderId"
       from stake_orders
       order by "senderId", "startTime"
     ),
     t2 as (
       select t0.id as t_id, t1.id as s_id
       from t0
              left join t1 on t0.r = t1.r
     )
update stake_orders
set id = t_id
FROM t2
where id = s_id;

CREATE TABLE migrated_mem_acc (
                                address varchar(30),
                                public_key varchar(128)
);

INSERT INTO migrated_mem_acc("address", "public_key")
SELECT "address", public_key as "public_key"
FROM dblink(
         'dbname=ddk port=5432 host=192.168.50.35 user=ddkMasterUser password=QWEcde123',
         'SELECT address, encode("publicKey", ''hex''::text) from mem_accounts')
       AS t1("address" varchar(30), "public_key" varchar(128));

update trs
set "senderPublicKey" = migrated_mem_acc.public_key
from migrated_mem_acc
where
    trs."senderId" = migrated_mem_acc.address and
  migrated_mem_acc.public_key is not null and
    trs."senderPublicKey" = 'd8299cb39f5dd81b6e999228e7ca0b4cf596ac33f7b9d0e36471ac657f0e844b';


delete from trs
where id in (select t.id
             from trs t
                    LEFT JOIN public.referals ref ON (((ref.address)::text = (t."senderId")::text))
             where type = 0 and level[1] is null);
