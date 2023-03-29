########################################
#                                      #
# SCRIPT DE SAUVEGARDE DES CONTENER WSL#
#                                      #
########################################
#PRE REQUIS:
#Script à utiliser en tant qu'Administrateur

# Variables 

# Get-Date -Format "dddd MM/dd/yyyy HH:mm K"
$ladate=Get-Date -UFormat "%d%m%Y"


Write-Host  -ForegroundColor DarkMagenta "###########################################"
Write-Host -ForegroundColor DarkMagenta "Script de Backup des conteneurs WSL Linux"
Write-Host  -ForegroundColor DarkMagenta "###########################################"
Write-Host  ""

#Affichage des conteneur Listés
Write-Host -ForegroundColor green "Etat de vos conteneurs "
Write-Host  ""
wsl --list --verbose

#Arret des conteneur Listés
Write-Host  ""
Write-Host -ForegroundColor green "Arret des conteneurs ..."
wsl --shutdown 

#Affichage des conteneur Listés
Write-Host  ""
Write-Host -ForegroundColor green "Etat de vos conteneurs"
Write-Host  ""
wsl --list --verbose



# Commande d'export du conteneur Linux
#wsl --export distro_name file_name.tar

write-host "### Exemple de commande 
#wsl --export Ubuntu C:\Shared\WSL2\Backups\Ubuntu.tar
#wsl --export Fedora C:\Shared\WSL2\Backups\Fedora.tar
#wsl --export CentOS C:\Shared\WSL2\Backups\CentOS.tar 
#C:\bkp_ubuntu
"


# Test du repertoire si le répertoire bkp_ubuntu existe bien 
if (-not (Test-Path -Path C:\bkp_ubuntu\)) {
    Write-Error 'Votre répertoire n existe pas merci de modifier le script '
} else {


Write-Host -ForegroundColor yellow 'Confirmation du chemin de la sauvegarde.Ready To build the Backup : OK'
Write-Host -ForegroundColor green "Export des conteneur"
Write-Host -ForegroundColor Magenta "Export en cours ..."
wsl --export Ubuntu-20.04 C:\bkp_ubuntu\backup_"$ladate"_ubuntu20_04.tar
Write-host -ForegroundColor green "Votre Backup s'est Terminée ..."
write-host -ForegroundColor DarkBlue "Voici le repertoire de destination de la sauvegarde C:\bkp_ubuntu\"

}


exit
