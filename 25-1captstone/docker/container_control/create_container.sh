here=$(dirname $(realpath $0))

export cloud_dir=${here%/*/*}/main
export config_dir=${here%/*/*}/config
export image_tag=cloud_project:dev

echo -e "\n\n"

for i in security01 security02 security03 security04 security05 security06 security07 security08 security09 security10
do
    ${here}/Security_department/${i}/0-run_${i}.sh
done

echo -e "\n\n"
