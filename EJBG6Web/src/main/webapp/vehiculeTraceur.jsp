<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<!DOCTYPE html>
<meta charset="ISO-8859-1">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Affectation Traceur - Véhicule</title>

    <!-- Add Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <!-- Add SweetAlert CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@10.15.5/dist/sweetalert2.min.css">

    <!-- Custom Styles -->
    <style>
        body {
            background: linear-gradient(to right, #ffffff, #ffffff);
            color: #000;
        }

        .container {
            text-align: center;
            margin-top: 50px;
        }

        .btn {
            margin-bottom: 10px;
        }

        .btn:hover {
            opacity: 0.8;
        }
    </style>
</head>
<body>

<div class="container">

    <h1 class="display-4 mb-4">Affectation Traceur - Véhicule</h1>

    <div>
        <a href="/EJBG6Web/index.jsp" class="col-md-6  btn btn-warning">HOME</a>
    </div>

    <!-- Button to show modal for adding assignment -->
    <button class="col-md-6 btn btn-primary mb-3" data-toggle="modal" data-target="#assignTrackerModal">Assigner un traceur</button>

    <!-- Table to display assigned trackers to vehicles -->
    <table class="table table-striped table-bordered">
        <thead>
        <tr>
            <th>Véhicule</th>
            <th>Traceur</th>
            <th>Date de Début</th>
            <th>Date de Fin</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="vehiculeTrac" items="${vehiculeTraceur}">
            <tr>
                <td>${vehiculeTrac.vehicule1.id}</td>
                <td>${vehiculeTrac.tracker1.id}</td>
                <td>${vehiculeTrac.vehiculetrackerPK.dateDebut}</td>
                <td>${vehiculeTrac.dateFin}</td>
                <td>
                    <!-- Button to show modal for editing assignment -->
                    <button class="btn btn-warning btn-sm" data-toggle="modal" data-target="#editAssignmentModal${vehiculeTrac.vehicule1.id}_${vehiculeTrac.tracker1.id}">Modifier</button>

                    <!-- Button to delete assignment -->
                    <button class="btn btn-danger btn-sm" onclick="confirmDelete(${vehiculeTrac.vehicule1.id}, ${vehiculeTrac.tracker1.id})">Supprimer</button>
</td>
            </tr>

         <!-- Modals for editing and deleting assignments -->
<div class="modal fade" id="editAssignmentModal${vehiculeTrac.vehicule1.id}_${vehiculeTrac.tracker1.id}" tabindex="-1" role="dialog" aria-labelledby="editAssignmentModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editAssignmentModalLabel">Modifier l'affectation</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <!-- Form for editing an assignment -->
                <form action="AffectationTraceurVehiculeController" method="post">
                    <!-- Mettez à jour l'action pour appeler la méthode unassignTrackerFromVehicle -->
                    <input type="hidden" name="action" value="unassign">
                    <input type="hidden" name="vehicule" value="${vehiculeTrac.vehicule1.id}">
                    <input type="hidden" name="tracker" value="${vehiculeTrac.tracker1.id}">
                    <div class="form-group">
                        <label for="editDateDebut">Nouvelle Date de Début:</label>
                        <input type="date" class="form-control" id="editDateDebut" name="dateDebut" value="${vehiculeTrac.vehiculetrackerPK.dateDebut}" readonly>
                    </div>
                    <div class="form-group">
                        <label for="editDateFin">Nouvelle Date de Fin:</label>
                        <input type="date" class="form-control" id="editDateFin" name="dateFin"  value="${vehiculeTrac.dateFin}">
                    </div>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Fermer</button>
                    <button type="submit" class="btn btn-primary">Enregistrer les modifications</button>
                </form>
            </div>
        </div>
    </div>
</div>


        </c:forEach>
        </tbody>
    </table>
</div>

<!-- Modal for adding an assignment -->
<div class="modal fade" id="assignTrackerModal" tabindex="-1" role="dialog" aria-labelledby="assignTrackerModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="assignTrackerModalLabel">Assigner un traceur</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <!-- Form for adding an assignment -->
                <form action="AffectationTraceurVehiculeController" method="post">
                    <input type="hidden" name="action" value="assign">
                    
                    <div class="form-group">
                        <label for="assignVehicule">Véhicule:</label>
                        <select class="form-control" id="assignVehicule" name="vehicule" required>
    <c:forEach var="vehicule" items="${vehicules}">
        <option value="${vehicule.id}">${vehicule.matricule}</option>
    </c:forEach>
</select>
                    </div>
                    
                    <div class="form-group">
                        <label for="assignTracker">Traceur:</label>
                        <select class="form-control" id="assignTracker" name="tracker" required>
    <c:forEach var="traceur" items="${traceurs}">
        <option value="${traceur.id}">${traceur.simNumber}</option>
    </c:forEach>
</select>
                    </div>
                    
                    <div class="form-group">
                        <label for="assignDateDebut">Date de Début:</label>
                        <input type="date" class="form-control" id="assignDateDebut" name="dateDebut" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="assignDateFin">Date de Fin:</label>
                        <input type="date" class="form-control" id="assignDateFin" name="dateFin" required>
                    </div>
                    
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Fermer</button>
                    <button type="submit" class="btn btn-primary">Assigner</button>
                </form>
            </div>
        </div>
    </div>
</div>





<!-- Add JQuery JS -->
 <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<!-- Add Bootstrap JS -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10.15.5/dist/sweetalert2.all.min.js"></script>
<script>
function confirmDelete(vehicule, tracker) {
    Swal.fire({
        title: 'Êtes-vous sûr?',
        text: "Vous ne pourrez pas revenir en arrière!",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Oui, supprimer!'
    }).then((result) => {
        if (result.isConfirmed) {
            // Appeler la méthode deleteTrackerVehicle
            window.location.href = "AffectationTraceurVehiculeController?action=delete&vehicule=" + vehicule + "&tracker=" + tracker;
        }
    });
}
</script>


</body>
</html>
