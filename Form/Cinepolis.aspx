<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Cinepolis.aspx.cs" Inherits="Form.Cinepolis" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Peliculas taquilleras</h1>
    <hr />
    <asp:GridView runat="server" ID="gvPeliculas"></asp:GridView>
</asp:Content>
