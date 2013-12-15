. scripts/getCredentialsFromProperties.sh

action=$1
db="cyclos3"
file="dump.sql"
creds="-u $dbUser -p$dbPwd $db"

if [ "$action" == "" ]; then
	action="export"
fi

case $action in 
    export) 
		mysqldump $creds > $file
        ;;
    import)
		mysql $creds < $file
    	;;
esac