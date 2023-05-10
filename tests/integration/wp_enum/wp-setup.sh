#!bin/bash
set -e 

declare -A extension_name
declare -A versions

# Install Contact Form 7 plugin
extension_name[0]="contact-form-7"
versions[0]="5.7.5"
type[0]="plugin"


# Install Yoast SEO plugin
extension_name[1]="wordpress-seo"
versions[1]="19.7.1"
type[1]="plugin"


# Install Jetpack plugin
extension_name[2]="jetpack"
versions[2]="11.9"
type[2]="plugin"


# Install WordFence plugin
extension_name[3]="wordfence"
versions[3]="7.5.0"
type[3]="plugin"


# Install WPForms plugin
extension_name[4]="wpforms-lite"
versions[4]="1.7.5.3"
type[4]="plugin"


# Install Astra theme
extension_name[5]="oceanwp"
versions[5]="3.4.3"
type[5]="theme"


for i in "${!extension_name[@]}";do 
    curl -o /tmp/"${extension_name[$i]}".zip -Sl https://downloads.wordpress.org/"${type[$i]}"/"${extension_name[$i]}"."${versions[$i]}".zip
    files=($(unzip /tmp/"${extension_name[$i]}".zip -d /usr/src/wordpress/wp-content/"${type[$i]}s" | sed -n 's/^[[:space:]]*inflating:[[:space:]]*//p'))
    for file in "${files[@]}";do
        chown www-data:www-data "$file"
    done
done 
rm -rf /tmp/*
