here=$(dirname $(realpath $0))

export cloud_dir=${here%/*/*}/main
export config_dir=${here%/*/*}/config
export image_tag=cloud_project:dev

echo -e "\n\n"

for i in security01
do
    ${here}/Security_department/${i}/0-run_${i}.sh
done

echo -e "\n\n"
