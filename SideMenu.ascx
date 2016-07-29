<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SideMenu.ascx.cs" Inherits="SideMenu" %>
<asp:Repeater ID="FirstLevelMenuRepeater" runat="server" OnItemDataBound="FirstLevelMenuRepeater_ItemDataBound1">
    <ItemTemplate>
        <li><a href="<%# DataBinder.Eval(Container.DataItem, "URL") %>">
            <i class="fa <%# DataBinder.Eval(Container.DataItem, "Logo") %>"></i>
            <%# DataBinder.Eval(Container.DataItem, "Teks") %>
            <span class="fa fa-chevron-down"></span></a>
            <asp:Repeater ID="SecondLevelMenuRepeater" runat="server">
                <HeaderTemplate>
                    <ul class="nav child_menu">
                </HeaderTemplate>
                <ItemTemplate>
                    <li>
                        <a href="<%# DataBinder.Eval(Container.DataItem, "URL") %>">
                            <i class="fa <%# DataBinder.Eval(Container.DataItem, "Logo") %>"></i>
                            <%# DataBinder.Eval(Container.DataItem, "Teks") %>
                        </a>
                    </li>
                </ItemTemplate>
                <FooterTemplate>
                    </ul>
                </FooterTemplate>
            </asp:Repeater>
        </li>
    </ItemTemplate>
</asp:Repeater>