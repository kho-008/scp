WORK_DATE=`date +%Y%m%d_%H%M%S`

BACKUP_DIR=backup_$WORK_DATE
if [ ! -d $BACKUP_DIR ]; then
  mkdir $BACKUP_DIR
fi

LOGDIR=log
if [ ! -d $LOGDIR ]; then
  mkdir $LOGDIR
fi

while read FILE_TO_PATH || [ -n "${FILE_TO_PATH}" ]; do
  mkdir -p "${BACKUP_DIR}/`dirname ${FILE_TO_PATH}`"
  scp -v -i ~/.ssh/id_rsa_kho -r user_name@example.example.jp:/home/user_name/public_html/path/${FILE_TO_PATH} ./${BACKUP_DIR}/${FILE_TO_PATH} 2>>${LOGDIR}/${WORK_DATE}.log
done < file_list.txt