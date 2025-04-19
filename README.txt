Per il progetto scaricare e installare XAMPP Version 8.2.12  
al link https://sourceforge.net/projects/xampp/files/XAMPP%20Windows/8.2.12/xampp-windows-x64-8.2.12-0-VS16-installer.exe

Una volta estratta, copiare ed incollare la cartella del progetto ("wedding-planner") nella cartella
 di Xampp -> htdocs C:\xampp\htdocs, avremo così  il progetto in C:\xampp\htdocs\wedding-planner

Successivamente bisogna far partire Xampp e premere start su Apache e MySQL 
e cioè premere sul tasto Admin accanto alla sezione MySQL (in alternativa usare direttamente http://localhost/phpmyadmin/) per aprire l'interfaccia del DB. 
Successivamente dobbiamo creare il database col nome "datab matrimonio" importando file di dump del database.

Quindi ora dopo aver fatto queste operazioni non resta che aprire la web app attraverso http://localhost/wedding-planner/ 
che ci indirizzerà alla homepage del progetto.

Per l'invio di email in locale far riferimento al txt corrispondente.
Per l'inizializzazione della fase di test far riferimento al txt presente nella cartella tests.