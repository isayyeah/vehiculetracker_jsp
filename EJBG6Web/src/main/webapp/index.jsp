<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Vehicles and Trackers Management</title>

    <!-- Add Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/css/bootstrap.min.css">
    <!-- Add Font Awesome CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

    <!-- Custom Styles -->
    <style>
        body {
            background: linear-gradient(to right, #3498db, #2c3e50);
            color: #fff;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .container {
            text-align: center;
            margin-top: 50px;
        }

        .btn {
            margin-bottom: 10px;
            font-size: 18px;
        }

        .btn-primary {
            background-color: #2980b9;
            border-color: #2980b9;
        }

        .btn-success {
            background-color: #27ae60;
            border-color: #27ae60;
        }

        .btn-danger {
            background-color: #e74c3c;
            border-color: #e74c3c;
        }

        .btn:hover {
            opacity: 0.8;
        }

        h1 {
            font-size: 3rem;
        }
    </style>
</head>
<body>

    <div class="container">
        <h1 class="display-4 mb-4">
            <i class="fas fa-car"></i> Vehicles and Trackers Management
        </h1>
        <form action="VehiculeController" class="mb-4">
            <button class="btn btn-primary btn-block">Manage Vehicles</button>
        </form>

        <form action="TraceurController" class="mb-4">
            <button class="btn btn-success btn-block">Manage Trackers</button>
        </form>

        <form action="AffectationTraceurVehiculeController" class="mb-4">
            <button class="btn btn-danger btn-block">Assign Trackers to Vehicles</button>
        </form>
    </div>

    <!-- Add Bootstrap JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>

</body>
</html>
