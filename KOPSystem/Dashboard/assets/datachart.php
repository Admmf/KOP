<?php
// Include the database connection file
include "dbconn/dbconn.php";


// Check if the connection is successful
if ($dbconn->connect_error) {
    die("Connection failed: " . $dbconn->connect_error);
}

// Fetch data from the database
$result = $dbconn->query("SELECT * FROM promise_detail ; SELECT * FROM promise");

// Check if the query was successful
if ($result) {
    // Create an array to store the data
    $data = array();

    // Loop through the result set and populate the data array
    while ($row = $result->fetch_assoc()) {
        $data[] = array(
            'category' => $row['Category_Promise'],
            'value'    => $row['Status']
        );
    }

    // Convert data to JSON format
    $json_data = json_encode($data);

    // Output JSON data
    echo $json_data;
} else {
    // Handle query error
    echo "Error: " . $dbconn->error;
}

// Close the database connection
$dbconn->close();
?>
