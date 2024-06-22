<%@ Page Title="Form" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="Form.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h3 class="m-100-px">Create a web page as an invitation for your event</h3>
    <hr />
    <div class="d-flex flex-column align-items-left justify-content-between grid gap-3">
        <div class="row row-gap-3">
            <div class="col-6">
                <label>Event title</label>
                <asp:TextBox type="text" class="form-control" runat="server" ID="txtTitle" />
            </div>
            <div class="col-6">
                <label>Event type</label>
                <asp:DropDownList ID="ddlType" class="form-select" aria-label="Default select example" runat="server">
                    <asp:ListItem Value="null" Selected="True">Choose a type of event</asp:ListItem>
                    <asp:ListItem Value="null">Wedding</asp:ListItem>
                    <asp:ListItem Value="null">Party</asp:ListItem>
                    <asp:ListItem Value="null">Dinner</asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>
        <div class="row">
            <div class="col-6">
                <div class="form-check">
                    <asp:CheckBox class="form-check-input" ID="chkFood" runat="server" />
                    <label class="form-check-label" for="flexCheckDefault">
                        Will be food
                    </label>
                </div>
                <div class="form-check form-check-switch">
                    <asp:CheckBox class="form-check-input" ID="chkDark" runat="server" />
                    <label class="form-check-label" for="flexSwitchCheckDefault">Darkmode</label>
                </div>
            </div>
            <div class="col-6">
                <label>Hosting type</label>
                <div class="form-check">
                    <asp:RadioButton class="form-check-input" name="btnradio" ID="rdbHouse" autocomplete="off" Checked="true" runat="server" />
                    <label class="form-check-label" for="btnradio1">House</label>
                </div>
                <div class="form-check">
                    <asp:RadioButton class="form-check-input" name="btnradio" ID="rdbApartment" runat="server" />
                    <label class="form-check-label" for="btnradio2">Apartment</label>

                </div>
                <div class="form-check">
                    <asp:RadioButton class="form-check-input" name="btnradio" ID="rdbSaloon" autocomplete="off" runat="server" />
                    <label class="form-check-label" for="btnradio3">Saloon</label>

                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-6">
                <label>Number of guests</label>
                <asp:TextBox type="text" class="form-control" runat="server" />
            </div>
            <div class="col-6 gap-6">

                <label class="text-nowrap">Primary color (hex)</label>
                <asp:TextBox type="color" class="form-control  form-control-color" ID="exampleColorInput" value="#563d7c" title="Choose your color" runat="server" />
            </div>
        </div>
        <div class="row">
            <div class="col-9"></div>
            <div class="col-3">
                <asp:Button Text="Send" class="btn btn-primary" Style="width: 100%;" ID="MyButton" runat="server" />
            </div>
        </div>
    </div>
</asp:Content>
