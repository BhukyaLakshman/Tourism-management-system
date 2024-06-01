<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Payment Form</title>
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
  <div class="container">
    <h1 class="mt-5">Payment Form</h1>
    <div class="row mt-5">
      <div class="col-md-6 offset-md-3">
        <form action="process_payment" method="post">
          <div class="form-group">
            <label for="userName">Name on Card:</label>
            <input type="text" class="form-control" id="userName" name="userName" required>
          </div>
          <div class="form-group">
            <label for="cardNumber">Card Number:</label>
            <input type="text" class="form-control" id="cardNumber" name="cardNumber" maxlength="16" required>
          </div>
          <div class="form-group">
            <label for="expirationDate">Expiration Date:</label>
            <input type="date" class="form-control" id="expirationDate" name="expirationDate" placeholder="MM/YYYY" required>
          </div>
          <div class="form-group">
            <label for="paymentAmount">Payment Amount:</label>
            <input type="number" class="form-control" id="paymentAmount" name="paymentAmount" step="0.01" required>
          </div>
          <button type="submit" class="btn btn-primary">Submit Payment</button>
        </form>
      </div>
    </div>
  </div>

  <!-- Bootstrap JS and jQuery (Optional) -->
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
