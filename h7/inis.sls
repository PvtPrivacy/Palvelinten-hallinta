
# init.sls

# Install other important applications

install_moreapps:
  pkg.installed:
    - name: curl
    - name: cowsay
    - name: pacman

# Install micro text editor
install_micro:
  pkg.installed:
    - name: micro

# Set micro as the default text editor
set_default_editor: # < Big Sticker/Label/Section
  cmd.run: # < Permits the use of shell commands 
    - name: echo "export EDITOR=micro" >> /etc/profile
    - unless: grep -q "export EDITOR=micro" /etc/profile

# Addes a text file inside of this 
create_patchnotes: 
  file.managed:
    - name:  /srv/salt/patchnotes.txt
    - contents: Installed application

        
