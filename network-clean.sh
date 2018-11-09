docker network rm $(docker network ls | awk ' /'10.+'/{ print $1 }')
