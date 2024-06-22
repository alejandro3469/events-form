<%@ Page Title="Form" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="Form.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h3 class="m-100-px">Create a web page as an invitation for your event</h3>
    <hr />
    <div class="d-flex flex-column align-items-left justify-content-between grid gap-3">

        <div class="row row-gap-3">
            <div class="col-6">
                <label>Event title</label>
                <asp:TextBox type="text" class="form-control" runat="server" />
            </div>
            <div class="col-6">
                <label>Event type</label>
                <asp:DropDownList ID="Listbox1" class="form-select" aria-label="Default select example" runat="server">
                    <asp:ListItem Value="null" Selected="True">Choose a type of event</asp:ListItem>
                    <asp:ListItem Value="null">Wedding</asp:ListItem>
                    <asp:ListItem Value="null">Party</asp:ListItem>
                    <asp:ListItem Value="null">Dinner</asp:ListItem>
                </asp:DropDownList>
            </div>

            <div class="row col-6">
                <div class="form-check">
                    <asp:CheckBox class="form-check-input" ID="flexCheckDefault" runat="server" />
                    <label class="form-check-label" for="flexCheckDefault">
                        Will be food
                    </label>
                </div>
                <div class="form-check form-check-switch">
                    <asp:CheckBox class="form-check-input" ID="flexSwitchCheckDefault" runat="server" />
                    <label class="form-check-label" for="flexSwitchCheckDefault">Darkmode</label>
                </div>
            </div>

            <div class="col-6">
                <label>Hosting type</label>
                <div class="form-check">
                    <asp:RadioButton GroupName="hosting_place" type="radio" class="form-check-input" name="btnradio" ID="btnradio1" autocomplete="off" Checked="true" runat="server" />
                    <label class="form-check-label" for="btnradio1">House</label>
                </div>

                <div class="form-check">
                    <asp:RadioButton GroupName="hosting_place" type="radio" class="form-check-input" name="btnradio" ID="btnradio2" autocomplete="off" runat="server" />
                    <label class="form-check-label" for="btnradio2">Apartment</label>

                </div>

                <div class="form-check">
                    <asp:RadioButton GroupName="hosting_place" type="radio" class="form-check-input" name="btnradio" ID="btnradio3" autocomplete="off" runat="server" />
                    <label class="form-check-label" for="btnradio3">Saloon</label>

                </div>
            </div>
            <div class="col-6">
                <label>Number of guests</label>
                <asp:TextBox type="text" class="form-control" runat="server" />
            </div>


            <div class="col-6 gap-6">

                <label class="text-nowrap">Primary color (hex)</label>
                <asp:TextBox type="color" class="form-control  form-control-color" ID="exampleColorInput" value="#563d7c" title="Choose your color" runat="server" />
            </div>
        </div>

    <asp:Button Text="Send" class="btn btn-primary col-3" ID="MyButton" runat="server" />
    </div>

</asp:Content>
