docker volume rm $(docker volume ls | awk ' /'10.+'/{ print $2 }')
