<?php

echo "<p>\"Data has been processed\"</p>";

date_default_timezone_set('UTC');

echo date('h:i:s:u a, l F jS Y e');

echo "</p>";

$usersName = $_POST['username'];
$usersStreet = $_POST['streetaddress'];
$usersCity = $_POST['cityname'];

echo $usersName. '</br>' ;
echo $usersStreet. '</br>' ;
echo $usersCity. '</br>';

$str = <<<EOD
The customers name is
The ower of $usersStreet is $usersName.
He lives in $usersCity. </br>
EOD;

echo $str;

define('pi',3.1416);

echo "The value of pi is ". pi.'</br>';

echo "</br>5+2 = ". (5+2);
echo "</br>5-2 = ". (5-2);
echo "</br>5*2 = ". (5*2);
echo "</br>5/2 = ". (double)(5/2);
echo "</br>5%2 = ". (5%2).'</br>';

//always use ." [text] " for strings;

$Num = 5;
$Num += 10;
echo $Num."</br>";

$Number = 5;
echo "++$Num = ".++$Number."</br>"; //Add immediate then show
echo "$Num++ = ".$Number++."</br>"; //show original then add
echo $Number."</br>"; //See the difference

$Num = 5;
$refToNum1 = &$Num;
$Num = 100;
echo '$refToNum = &$Num = '. $refToNum1."</br>"; //changes as $Num changes

$Num = 5;
$refToNum2 = $Num;
$Num = 100;
echo '$refToNum = $Num = '. $refToNum2."</br>"; //value retained

/* == != < > <= >= COMMON
=== EQUAL & SAME TYPE
!== NOT-EQUAL or SAME TYPE

&& = and
|| = or
! logical not

	if (condition){ [action] }
	else { [action] }; 
*/

$grade = 69;

$refgrade = &$grade;

$grade = 71;
$grade = 100;
$grade = 25;
$grade = 50;
$grade = 75;
$grade = 100;
$grade = 101;

if ($refgrade == 60){
	echo "PASANG AWA HAHAHA"."</br>";
} elseif (($refgrade>=61) && ($refgrade<=70)){
	echo "GIT GUD"."</br>";
} elseif (($refgrade>=71) && ($refgrade<=90)){
	echo "MATHALINO"."</br>";
} elseif (($refgrade>=91) && ($refgrade<=100)){
	echo "CHEATING IS NOT LEARNING"."</br>";
} else if ($refgrade<60){
	echo "MAG SORRY KA SA NANAY MO"."</br>";
} else if (!(($refgrade>=0) && ($refgrade<=100))){
	echo "BOBO 0 to 100 lang TANGA"."</br>";
}


$BiggestNum = (15>10) ? 15:10;
echo "The bigger number is ".$BiggestNum.'.'."</br>";

switch($refgrade){
	case 25:
		echo "Silver"."</br>";
		break;

	case 50:
		echo "Gold"."</br>";
		break;
	case 75:
		echo "Diamond"."</br>";
		break;
	case 100:
		echo "Galaxy"."</br>";
		break;
	default:
		echo "Alien"."</br>";
		break;
}

$num = 0;

while ($num<20){
	echo ++$num.', ';
}
echo "</br>";

for($num=0; $num<=20; $num+=5){
	if ($num != 20){
		echo $num.', ';
	} else {
		echo $num.'. '."</br>";
	}
}

$bestFriends = array('Joko','Jolo','Jomo');
echo "My best friend is ".$bestFriends[0].'. '."His older brother is ".$bestFriends[1].'. '."His younger brother is ".$bestFriends[2].'.'."</br>";

foreach ($bestFriends as $friend){
	echo $friend.', ';
}

$customer = array('Name'=>$usersName, 'Street'=>$usersStreet, 'City'=>$usersCity);
echo '</br>';
foreach($customer as $key => $value){
	echo $key.' : '.$value.'</br>';
}
$plus = $bestFriends + $customer;
$damnson = $bestFriends==$customer;
echo $damnson;

$customers = array(	array('Joko','Middle','Brother'),
					array('Jolo','Oldest','Brother'),
					array('Jomo','Youngest','Brother'));
echo '</br>';					
for($row = 0; $row<3; $row++){
	for($col = 0; $col<3; $col++){
		if ($col!=2){
			echo $customers[$row][$col]. ' ';
		} else {
			echo $customers[$row][$col]. '.'.'</br>';
		}
	}
}

echo '</br>';

$randString = "          random String     ";
echo strlen("$randString").'</br>';
echo strlen(ltrim("$randString")).' '.ltrim("$randString").'</br>';
echo strlen(rtrim("$randString")).' '.rtrim("$randString").'</br>';
echo strlen(trim("$randString")).' '.trim("$randString").'</br>';
echo '</br>';

$randString = "random string";
echo strtoupper($randString)."</br>";
echo strtolower($randString)."</br>";
echo ucfirst(trim($randString))."</br>"; //added trim to remove space
$array2str = explode(' ',$randString,2);
$str2array = implode(' ',$array2str);
echo $array2str[0].'</br>';
echo $array2str[1].'</br>';
echo $str2array.'</br>';
$StringPart = substr("Random String",0,6);
echo $StringPart.'</br>';
$man = "Man";
$manhole = "Manhole";
echo strcmp($man,$manhole).'</br>';
echo strcmp($manhole,$man).'</br>';
echo "The String ".strstr($randString,"ing").'</br>';
echo "Loc The String ".stripos($randString,"S").'</br>';
$newStr = str_replace("string", "numbers", $randString);
echo $newStr;

echo '</br>';
echo "The randomString is $randString </br>";
printf ("The randString is %s </br>",$randString);
$decimal = 2.3456;
$integer = 16.3;
printf("decimal number = %.3f. pi = %.2f.</br>",$decimal,pi);
printf("int2bin = %b.</br>",$integer);
printf("int2cha = %c.</br>",$integer);
printf("int2dec = %d.</br>",$integer);
printf("int2oct = %o.</br>",$integer);
printf("int2hex = %x.</br>",$integer);

/* */
?>	
