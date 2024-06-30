<?php
if (isset($_POST['fullname']) && isset($_POST['email']) && isset($_POST['message'])) {
  $email_to = "gm.officeofkb@gmail.com";
  $email_subject = "New form submissions";

  $fullname = $_POST['fullname'];
  $email = $_POST['email'];
  $message = $_POST['message'];

  $error_message = "";

  // Validate email address
  if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
    $error_message .= 'The Email address you entered does not appear to be valid.<br>';
  }

  // Validate fullname
  if (!preg_match('/^[A-Za-z .\'-]+$/i', $fullname)) {
    $error_message .= 'The Fullname you entered does not appear to be valid.<br>';
  }

  // Validate message
  if (strlen($message) < 2) {
    $error_message .= 'The Message you entered do not appear to be valid.<br>';
  }

  if (strlen($error_message) > 0) {
    echo "We're sorry, but there were error(s) found with the form you submitted. ";
    echo "These errors appear below.<br><br>";
    echo $error_message . "<br><br>";
    echo "Please go back and fix these errors.<br><br>";
    die();
  }

  $email_message = "Form details below.\n\n";
  $email_message .= "Fullname: " . $fullname . "\n";
  $email_message .= "Email: " . $email . "\n";
  $email_message .= "Message: " . $message . "\n";

  $headers = 'From: ' . $email . "\r\n" .
    'Reply-To: ' . $email . "\r\n" .
    'X-Mailer: PHP/' . phpversion();

  if (@mail($email_to, $email_subject, $email_message, $headers)) {
    echo "Thanks for getting in touch. We'll get back to you soon.";
  } else {
    echo "Error sending email. Please try again later.";
  }
}
?>
