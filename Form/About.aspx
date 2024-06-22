<%@ Page Title="Form" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="Form.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
    <h3>Cretae a web page as an invitation for your event</h3>
    <hr />
    <div class="mb-3">
        <label>Event title</label>
        <input type="text" class="form-control">
    </div>
    <div class="row g-3 align-items-center">
        <div class="col-auto">
            <label for="inputPassword6" class="col-form-label">Password</label>
        </div>
        <div class="col-auto">
            <input type="password" id="inputPassword6" class="form-control" aria-describedby="passwordHelpInline">
        </div>
        <div class="col-auto">
            <span id="passwordHelpInline" class="form-text">Must be 8-20 characters long.
            </span>
        </div>
    </div>
    <select class="form-select" aria-label="Default select example">
        <option selected>Chhose a type of event</option>
        <option value="1">Wedding</option>
        <option value="2">Party</option>
        <option value="3">Dinner</option>
    </select>

    <div class="form-check">
        <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
        <label class="form-check-label" for="flexCheckDefault">
            Will be food
        </label>
    </div>

    <div class="btn-group" role="group" aria-label="Basic radio toggle button group">
        <input type="radio" class="btn-check" name="btnradio" id="btnradio1" autocomplete="off" checked>
        <label class="btn btn-outline-primary" for="btnradio1">House</label>

        <input type="radio" class="btn-check" name="btnradio" id="btnradio2" autocomplete="off">
        <label class="btn btn-outline-primary" for="btnradio2">Apoartment</label>

        <input type="radio" class="btn-check" name="btnradio" id="btnradio3" autocomplete="off">
        <label class="btn btn-outline-primary" for="btnradio3">Saloon</label>
    </div>

    <div class="form-check form-switch">
        <input class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckDefault">
        <label class="form-check-label" for="flexSwitchCheckDefault">Lightmode/Darkmode</label>
    </div>

    <div>
        <label for="customRange1" class="form-label">Number of people</label>
        <input type="range" class="form-range" id="customRange1">
    </div>
    <div>
        <label for="exampleColorInput" class="form-label">Invitation main color</label>
        <input type="color" class="form-control form-control-color" id="exampleColorInput" value="#563d7c" title="Choose your color">
    </div>

</asp:Content>
