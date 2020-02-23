#! /bin/bash
 echo "CIRCUIT OPERATIONS IN BASH"
 echo "============================================="
 echo "Created by Cristian Calderon"
 echo "23/02/2020"
 echo "Written in Git Bash"
 echo "============================================="
 function Program {
 echo "PLEASE SELECT THE ACTION YOU WANT TO PERFORM:"
 echo "1-DELTA-STAR CONVERSION."
 echo "2-CURRENT DIVIDER CIRCUIT."
 echo "3-VOLTAGE DIVIDER CIRCUIT."
 read menu1
  if [ $menu1 = 1 ];
then
echo "Please choose the option that is required:"
 echo "1-Convert Star into Delta."
 echo "2-Convert Delta into Star."
read menu2
if [ $menu2 = 1 ];
then
echo "Please enter the Resistance Values  (R1,R2,R3): "
echo "Enter R1 in KΩ:"
read R1
echo "Enter R2 in KΩ:"
read R2
echo "Enter R3 in KΩ:"
read R3
echo "The entered Star is (" $R1 "KΩ," $R2 "KΩ," $R3"KΩ)"
echo "============================================="
Ra=$(echo "scale=2;($R1*$R2 + $R1*$R3 +$R2*$R3)/$R1"| bc );
Rb=$(echo "scale=2;($R1*$R2 + $R1*$R3 +$R2*$R3)/$R2"| bc );
Rc=$(echo "scale=2;($R1*$R2 + $R1*$R3 +$R2*$R3)/$R3"| bc );

echo "YOUR NEW DELTA NETWORK (Ra,Rb,Rc) is: (" $Ra "kΩ," $Rb "kΩ," $Rc"kΩ)"
pregunta
fi


if [ $menu2 = 2 ];
then
echo "Please enter the Resistance Values  (Ra,Rb,Rc): "
echo "Enter Ra in KΩ:"
read Ra
echo "Enter Rb in KΩ:"
read Rb
echo "Enter Rc in KΩ:"
read Rc
echo "The entered Delta is (" $Ra "KΩ," $Rb "KΩ," $Rc"KΩ)"
echo "============================================="
R1=$(echo "scale=2;((($Rb*$Rc)/($Ra +$Rb + $Rc)))"| bc );
R2=$(echo "scale=2;((($Ra*$Rc)/($Ra +$Rb + $Rc)))"| bc );
R3=$(echo "scale=2;((($Ra*$Rb)/($Ra +$Rb + $Rc)))"| bc );

echo "YOUR NEW STAR NETWORK(R1,R2,R3) is: (" $R1 "kΩ," $R2 "kΩ," $R3"kΩ)"
fi
pregunta
fi


if [ $menu1 = 2 ];

then
echo "Please enter the ITOTAL value and the Resistance Values  (R1,R2): "
echo "Enter ITOTAL:"
read ITOTAL
echo "Enter R1 in KΩ:"
read R1
echo "Enter R2 in KΩ:"
read R2
echo "The entered Values are (" $ITotal "Amperes," $R1 "KΩ," $R2"KΩ)"
echo "============================================="
echo "Please choose the option that is required:"
 echo "1-Calculate Voltage and Current in R1."
 echo "2-Calculate Voltage and Current in R2."
read menu3
if [ $menu3 = 1 ];
then
I1=$(echo "scale=2;((($R1*$R2)/($R1+$R2))*($ITOTAL/$R1))"| bc );
V1=$(echo "scale=2;(($R1*$I1))"| bc );
echo "THE VOLTAJE AND CURRENT OF R1 IS:(" $I1 "Amperes," $V1 "Volts)"
pregunta
elif [ $menu3 = 2 ];
then
I2=$(echo "scale=2;(($R1*$R2)/($R1+$R2))*($ITOTAL/$R2)"| bc );
V2=$(echo "scale=2;($R2*$I2)"| bc );
echo "THE VOLTAJE AND CURRENT OF R2 IS: (" $I2 "Amperes," $V2 "Volts)"
fi
pregunta
fi

if [ $menu1 = 3 ];

then
echo "Please enter the VTotal value and the Resistance Values  (R1,R2): "
echo "Enter VTOTAL:"
read VTOTAL
echo "Enter R1 in KΩ:"
read R1
echo "Enter R2 in KΩ:"
read R2
echo "The entered Values are (" $VTOTAL "Volts," $R1 "KΩ," $R2"KΩ)"
echo "============================================="
echo "Please choose the option that is required:"
 echo "1-Calculate Voltage and Current in R1."
 echo "2-Calculate Voltage and Current in R2."
read menu4
if [ $menu4 = 1 ];
then
I1=$(echo "scale=2;(($VTOTAL/($R1+$R2)))"| bc );
V1=$(echo "scale=2;(($R1*$I1))"| bc );
echo "THE VOLTAJE AND CURRENT OF R1 IS:(" $I1 "Amperes," $V1 "Volts)"
pregunta
elif [ $menu4 = 2 ];
then
I2=$(echo "scale=2;(($VTOTAL/($R1+$R2)))"| bc );
V2=$(echo "scale=2;($R2*$I2)"| bc );
echo "THE VOLTAJE AND CURRENT OF R2 IS: (" $I2 "Amperes," $V2 "Volts)"
fi
pregunta
fi

function notvalid {
echo Entry not valid. Please try again.
echo =============================================
echo =============================================
echo =============================================
echo =============================================
}

if [ "$menu1" -gt 3 ];
then
notvalid
fi
Program
if [ "$menu1" -lt 1 ];
then
notvalid
fi
Program

}

function pregunta (){
sleep 4
echo "============================================="
echo "Want to Continue? Type 1 for Yes, 2 for Exit"
read opcion
  case $opcion in
      1) 
        clear
         Program
      ;;
      2)
         salir
      ;;
       *)
         echo "Entry not Valid, Please try again."
         echo "============================================="
      ;;
      
  esac
}

function salir {
               exit
           }

Program


