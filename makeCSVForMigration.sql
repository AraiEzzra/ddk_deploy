CREATE OR REPLACE VIEW public.full_trs_list_second_edition AS
SELECT t.id AS t_id,
       t."blockId" AS "t_blockId",
       t."rowId" AS "t_rowId",
       t.type AS t_type,
       t."timestamp" AS t_timestamp,
       t."trsName" AS "t_trsName",
       t."senderPublicKey" AS "t_senderPublicKey",
       t."senderId" AS "t_senderId",
       t."recipientId" AS "t_recipientId",
       t.amount AS t_amount,
       t.fee AS t_fee,
       t.reward AS t_reward,
       t.signature AS t_signature,
       t."signSignature" AS "t_signSignature",
       t."stakedAmount" AS "t_stakedAmount",
       t."stakeId" AS "t_stakeId",
       t.signatures AS t_signatures,
       t.salt AS t_salt,
       v.votes AS v_votes,
       v.reward AS v_reward,
       v.unstake AS v_unstake,
       v."airdropReward" AS "v_airdropReward",
       so.id AS so_id,
       so.status AS so_status,
       so."startTime" AS "so_startTime",
       so."insertTime" AS "so_insertTime",
       so."senderId" AS "so_senderId",
       so."recipientId" AS "so_recipientId",
       so."airdropReward" AS "so_airdropReward",
       so."voteCount" AS "so_voteCount",
       acc.username AS "acc_username",
       acc."secondPublicKey" AS "acc_secondPublicKey",
       ref.level AS ref_level
FROM ((((public.trs t
  LEFT JOIN public.blocks b ON ((t."blockId" = b.id)))
  LEFT JOIN public.votes v ON ((v."transactionId" = t.id)))
  LEFT JOIN public.stake_orders so ON ((so.id = t.id)))
  LEFT JOIN public.referals ref ON (((ref.address)::text = (t."senderId")::text)))
       LEFT JOIN public.mem_accounts acc ON (((acc.address)::text = (t."senderId")::text));

SELECT t_id as id, t_type as type, "t_senderPublicKey" as "senderPublicKey",
       "t_signSignature" as "secondSignature", t_signature as signature,
       "t_recipientId" as "recipientAddress", t_timestamp as "createdAt",
       t_salt as salt, ref_level as referrals, t_amount as amount, "t_stakedAmount" as "stakedAmount",
       acc_username as username, "acc_secondPublicKey" as "secondPublicKey", "so_startTime" as "startTime",
       "so_airdropReward" as "airdropReward", v_votes as votes, v_reward as reward,
       v_unstake as unstake, "v_airdropReward" as "airdropReward", "so_voteCount" as "voteCount",
       "t_rowId" as "rowId"
FROM full_trs_list_second_edition WHERE t_timestamp > 0 ORDER BY "rowId";
