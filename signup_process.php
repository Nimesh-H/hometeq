<?php
session_start();
include("db.php");
$pagename="Sign Up Results"; //Create and populate a variable called $pagename
echo "<link rel=stylesheet type=text/css href=mystylesheet.css>"; //Call in stylesheet
echo "<title>".$pagename."</title>"; //display name of the page as window title
echo "<body>";
include ("headfile.html"); //include header layout file
echo "<h4>".$pagename."</h4>"; //display name of the page on the web page
//display random text

if(!empty($_POST['firstName']) || !empty($_POST['lastName']) || !empty($_POST['address']) || !empty($_POST['postcode']) || !empty($_POST['telNo']) || !empty($_POST['email']) || !empty($_POST['pw1']) || !empty($_POST['pw2'])) {
    $firstName=$_POST['firstName'];
    $lastName=$_POST['lastName'];
    $address=$_POST['address'];
    $postcode=$_POST['postcode'];
    $telno=$_POST['telNo'];
    if ($_POST['pw1'] != $_POST['pw2']){
        echo "<p> <b>Sign-up Failed!</b>";
        echo "<p> <b>Passswords are not matching</b>";
        echo "<p> Go back And <b>Try Again</b> <a href='signup.php'><b>Sign Up</b></a>";
    }
    else{
        $pwOne=$_POST['pw1'];
        $pwTwo=$_POST['pw2'];
        $pattern = "/^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,})$/i";
        if (preg_match($pattern,$_POST['email'])){
            $email=$_POST['email'];
            $SQL="Insert into users (userFName,userSName,userAddress,userPostCode,userTelNo,userEmail,userPassword) values('$firstName','$lastName','$address','$postcode','$telno','$email','$pwTwo')";
            $exeSQL=mysqli_query($conn, $SQL) or die (mysqli_error($conn));
            $errorNo=mysqli_errno($conn);
            
            if ($errorNo==0){
                echo "<p><b>Sign-up successful!</b>";
                echo "<p>To continue, please <a href='login.php'><b>login</b></a>";
            }
            else {
                if($errorNo==1062){
                    echo "<p> <b>Sign-up Failed!</b>";
                    echo "<p><b>Email has already been taken</b>";
                    echo "<p> Go back And <b>Try Again</b> <a href='signup.php'><b>Sign Up</b></a>";
                }
                if ($errorNo==1064) {
                    echo "<p> <b>Sign-up Failed!</b>";
                    echo "<p><b>Invalid characters entered.</b>";
                    echo "<p> Go back And <b>Try Again</b> <a href='signup.php'><b>Sign Up</b></a>";
                }

            }
        }
        else {
            echo "<p> <b>Sign-up Failed!</b>";
            echo "<p> <b>Email is not in the right format</b>";
            echo "<p> Go back And <b>Try Again</b> <a href='signup.php'><b>Sign Up</b></a>";
        }
    }
}
else {
    echo "<p> <b>Sign-up Failed!</b>";
    echo "<p><b> All mandatory fields Should be filled in</b>";
    echo "<p> Go back And <b>Try Again</b> <a href='signup.php'><b>Sign Up</b></a>";
}

include("footfile.html"); //include head layout
echo "</body>";
?>