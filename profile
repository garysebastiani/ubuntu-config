# /etc/profile: system-wide .profile file for the Bourne shell (sh(1))
# and Bourne compatible shells (bash(1), ksh(1), ash(1), ...).

if [ "$PS1" ]; then
  if [ "$BASH" ] && [ "$BASH" != "/bin/sh" ]; then
    # The file bash.bashrc already sets the default PS1.
    # PS1='\h:\w\$ '
    if [ -f /etc/bash.bashrc ]; then
      . /etc/bash.bashrc
    fi
  else
    if [ "`id -u`" -eq 0 ]; then
      PS1='# '
    else
      PS1='$ '
    fi
  fi
fi

# The default umask is now handled by pam_umask.
# See pam_umask(8) and /etc/login.defs.

if [ -d /etc/profile.d ]; then
  for i in /etc/profile.d/*.sh; do
    if [ -r $i ]; then
      . $i
    fi
  done
  unset i
fi

JAVA_HOME=/opt/java/jdk1.8.0_45
ECLIPSE_HOME=/opt/eclipse/eclipse-jee-luna-64
GRADLE_HOMe=/opt/gradle/gradle-2.3
ANDROID_HOME=/opt/android/android-sdk-linu
PATH=$PATH:$JAVA_HOME/bin
PATH=$PATH:$ECLIPSE_HOME
PATH=$PATH:$GRADLE_HOME/bin
PATH=$PATH:$ANDROID_HOME/tools

export JAVA_HOME
export GRADLE_HOME
export ECLIPSE_HOME
export ANDROID_HOME
export PATH

# On met le clavier en français
setxkbmap fr

# On coupe l'écran VGA
xrandr --output VGA-0 --off
# On met l'écran en 1920
xrandr --output DVI-0 --mode 1920x1080

# On se met en mode vi
set -o vi
