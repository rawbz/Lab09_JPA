<%-- Document : main Created on : 21-Oct-2021, 1:16:56 PM Author : MMM --%> <%@
taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@page
    contentType="text/html" pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html>
        <head>
            <!-- Required meta tags -->
            <meta charset="utf-8" />
            <meta name="viewport" content="width=device-width, initial-scale=1" />

            <!-- Bootstrap CSS -->
            <link
                href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
                rel="stylesheet"
                integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
                crossorigin="anonymous"
                />
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Main Page</title>
        </head>

        <body>

            <nav class="navbar navbar-expand-lg navbar-dark bg-dark border-bottom">
                <div class="container-fluid">
                    <a class="navbar-brand" href="#">User System</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="#">Home</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Add User</a>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                    Dropdown
                                </a>
                                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <li><a class="dropdown-item" href="#">Action</a></li>
                                    <li><a class="dropdown-item" href="#">Another action</a></li>
                                    <li><hr class="dropdown-divider"></li>
                                    <li><a class="dropdown-item" href="#">Something else here</a></li>
                                </ul>
                            </li>
                        </ul>
                        <form class="d-flex">
                            <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                            <button class="btn btn-outline-success" type="submit">Search</button>
                        </form>
                    </div>
                </div>
            </nav>

            <div class="container-fluid bg-dark text-white p-5">
                <div class="row">
                    <div class="col-3 text-center">
                        <h3 class="pb-3">Add User</h3>
                        <form action="Users" method="post">
                            <div class="input-group mb-3">
                                <input
                                    type="text"
                                    name="email"
                                    value=""
                                    class="form-control"
                                    placeholder="Email"
                                    aria-label="Recipient's username"
                                    aria-describedby="basic-addon2"
                                    />
                            </div>
                            <div class="input-group mb-3">
                                <input
                                    type="text"
                                    name="firstName"
                                    value=""
                                    class="form-control"
                                    placeholder="First Name"
                                    aria-label="Recipient's username"
                                    aria-describedby="basic-addon2"
                                    />
                            </div>
                            <div class="input-group mb-3">
                                <input
                                    type="text"
                                    name="lastName"
                                    value=""
                                    class="form-control"
                                    placeholder="Last Name"
                                    aria-label="Recipient's username"
                                    aria-describedby="basic-addon2"
                                    />
                            </div>
                            <div class="input-group mb-3">
                                <input
                                    type="password"
                                    name="password"
                                    value=""
                                    class="form-control"
                                    placeholder="Password"
                                    aria-label="Recipient's username"
                                    aria-describedby="basic-addon2"
                                    />
                            </div>
                            <div class="input-group mb-3">

                                <select class="form-select" id="inputGroupSelect01" name="roleSelect">
                                    <option selected>Choose Role</option>
                                    <%--JSTL used to loop through avaliable roles --%>
                                    <c:forEach items="${roleLabel}" var="r">
                                        <option value="${r.role_id}">${r.role_name}</option>
                                    </c:forEach>               
                                </select>
                            </div>
                            <div class="d-grid gap-2">
                                <input type="hidden" name="action" value="add">
                                <button class="btn btn-primary" type="submit">Save</button>
                            </div>
                        </form>
                    </div>

                    <div class="col-6 text-center">
                        <h3 class="pb-3">Manage Users</h3>
                        <div class="row">
                            <c:forEach items="${users}" var="user">
                                <div class="col-sm-3">
                                    <div class="card text-white bg-dark border-light mb-3">
                                        <c:choose>
                                            <c:when test="${user.role == 1}">
                                                <div class="pt-3">
                                                    <img src="https://img.icons8.com/bubbles/100/000000/admin-settings-male.png"/>
                                                </div>
                                            </c:when>
                                            <c:when test="${user.role == 2}">
                                                <div class="pt-3">
                                                    <img src="https://img.icons8.com/bubbles/100/000000/user.png" />
                                                </div>
                                            </c:when>
                                            <c:when test="${user.role == 3}">
                                                <div class="pt-3">
                                                    <img src="https://img.icons8.com/bubbles/100/000000/marilyn-monro.png"/>
                                                </div>
                                            </c:when>
                                        </c:choose>
                                        <div class="card-body">
                                            
                                            <c:forEach items="${roleLabel}" var="r">
                                        <c:choose>
                                            <c:when test="${user.role == r.role_id}">
                                                <h5 class="card-title">${r.role_name}</h5>
                                            </c:when>   
                                        </c:choose>
                                    </c:forEach>
                                         
                                            <p class="card-text">${user.first_name} ${user.last_name}</p>
                                            <p class="card-text">${user.email}</p>
                                            <%-- This is a form for the edit button--%>
                                            <form action="Users" method="post">
                                                <input type="hidden" name="action" value="edit">
                                                <input type="hidden" name="toEdit" value="${user.email}">
                                                <button type="submit" class="btn btn-warning">Edit</button>
                                            </form>
                                            <%-- This is a form for the delete button--%>    
                                            <form action="Users" method="post">
                                                <input type="hidden" name="action" value="delete"> 
                                                <input type="hidden" name="toDelete" value="${user.email}">
                                                <button type="submit" class="btn btn-danger mt-3">Delete</button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>

                    <div class="col-3 text-center">
                        <h3 class="pb-3">Edit User</h3>
                        <form class="border border-info p-2" action="Users" method="post">
                            <div class="input-group mb-3">
                                <input
                                    type="text"
                                    class="form-control"
                                    placeholder="Email"
                                    aria-label="Recipient's email"
                                    aria-describedby="basic-addon2"
                                    name="updatedEmail"
                                    value="${updatedEmail}"
                                    />
                            </div>
                            <div class="input-group mb-3">
                                <input
                                    type="text"
                                    class="form-control"
                                    placeholder="First Name"
                                    aria-label="Recipient's username"
                                    aria-describedby="basic-addon2"
                                    name="updatedFirstName"
                                    value="${updatedFirstName}"
                                    />
                            </div>
                            <div class="input-group mb-3">
                                <input
                                    type="text"
                                    class="form-control"
                                    placeholder="Last Name"
                                    aria-label="Recipient's username"
                                    aria-describedby="basic-addon2"
                                    name="updatedLastName"
                                    value="${updatedLastName}"
                                    />
                            </div>
                            <div class="input-group mb-3">
                                <input
                                    type="text"
                                    class="form-control"
                                    placeholder="Password"
                                    aria-label="Recipient's username"
                                    aria-describedby="basic-addon2"
                                    name="updatedPassword"
                                    value="${updatedPassword}"
                                    />
                            </div>
                            <div class="input-group mb-3">
                                <select class="form-select" id="inputGroupSelect01" name="updatedRole">

                                    <c:forEach items="${roleLabel}" var="r">
                                        <c:choose>
                                            <c:when test="${updatedRole == r.role_id}">
                                                <option value="${r.role_id}" selected>${r.role_name}</option>
                                            </c:when>
                                            <c:otherwise>
                                                <option value="${r.role_id}">${r.role_name}</option>
                                            </c:otherwise>    
                                        </c:choose>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="d-grid gap-2">
                                <button class="btn btn-warning" type="submit"  name="action" value="save">Save</button>
                        </form>

                        <button class="btn btn-primary" action="Users" method="get">Cancel</button>
                    </div>
                </div>
            </div>
        </div>
        <%-- A comment --%>
        <a href="https://icons8.com/icon/108652/user">User icon by Icons8</a>
        <a href="https://icons8.com/icon/118624/admin-settings-male">Admin Settings Male icon by Icons8</a>
        <a href="https://icons8.com/icon/68569/marilyn-monroe">Marilyn Monroe icon by Icons8</a>
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"
        ></script>
    </body>
</html>
