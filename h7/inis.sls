
# init.sls

# Install other important applications

install_moreapps:
  pkg.installed:
    - name: curl
    - name: cowsay

# Install micro text editor
install_micro:
  pkg.installed:
    - name: micro

# Set micro as the default text editor
set_default_editor: # < Big Sticker/Label/Section
  cmd.run: # < Permits the use of shell commands 
    - name: echo "export EDITOR=micro" >> /etc/profile
    - unless: grep -q "export EDITOR=micro" /etc/profile

# Install a plugin or extension for micro
install_micro_plugin:
  cmd.run:
    - name: micro --plugin install nordcolors
    - unless: micro --plugin list | grep -q nordcolors
  require:
    - pkg: install_micro

# Addes a text file inside of this 
create_patchnotes: 
  file.managed:
    - name:  /srv/salt/patchnotes.txt
    - contents: Thank you for using my init.sls file C:
Copyright: lolololol






# IGNORE 
# Restart the Salt master in order to pick up this change:

pkill salt-master
salt-master -d



        
