<%@ Page Title="Stok per Barang per Laboratorium" Language="C#" MasterPageFile="~/Lab.master" AutoEventWireup="true" CodeFile="StokBarang.aspx.cs" Inherits="StokBarang" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContent" Runat="Server">
    <div class="col-md-12 col-sm-12 col-xs-12">
        <div class="x_panel">
            <div class="x_title">
                <h2>Data Stok Barang</h2>
                <ul class="nav navbar-right panel_toolbox">
                    <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                        <ul class="dropdown-menu" role="menu">
                            <li><a href="#">Settings 1</a>
                            </li>
                            <li><a href="#">Settings 2</a>
                            </li>
                        </ul>
                    </li>
                    <li><a class="close-link"><i class="fa fa-close"></i></a>
                    </li>
                </ul>
                <div class="clearfix"></div>
            </div>
            <div class="x_content">
                <br />
                <form id="myForm" class="form-horizontal form-label-left" method="post">
                    <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="barang">Barang<span class="required">*</span></label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <select class="select2_barang form-control" tabindex="-1" name="barang" id="barang" required="required">
                                <asp:Repeater runat="server" ID="lstBarang">
                                    <HeaderTemplate>
                                        <option></option>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <option value="<%# DataBinder.Eval(Container.DataItem, "ID") %>"><%# DataBinder.Eval(Container.DataItem, "NAMA") %></option>
                                    </ItemTemplate>
                                </asp:Repeater>
                              </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                            <button id="myButton" class="btn btn-success">Tampilkan Stok</button>
                        </div>
                    </div>
                    <div class="ln_solid"></div>
                    <div class="x_content">
                        <div class="table-responsive">
                            <table class="table table-striped jambo_table bulk_action" id="records_table">
                                <thead>
                                    <tr class="headings">
                                        <th class="column-title">Laboratorium</th>
                                        <th class="column-title">Stok</th>
                                        <th class="column-title">Terpakai</th>
                                        <th class="column-title">Sisa</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    
                                </tbody>
                            </table>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="BodyFooterContainer" Runat="Server">
    <script type="text/javascript">   
        //*
        $("#myButton").on("click", function (e) {

            var $myForm = $('#myForm')
            if (!$myForm[0].checkValidity()) {
                $myForm.find(':submit').click();
                return;
            }

            e.preventDefault();
            var aData = [];
            var barang = $("#barang").val();
            var jsonData = JSON.stringify({ barang: barang });
            $.ajax({
                type: "POST",  
                url: "StokBarang.aspx/Stok",
                data: jsonData,
                contentType: "application/json; charset=utf-8",
                dataType: "json", // dataType is json format
                success: OnSuccess,
                error: OnErrorCall
            });

            function OnSuccess(response) {
                if (response.d.Status == true) {
                    $("#records_table").find("tr:gt(0)").remove();
                    var trHTML = '';
                    $.each(response.d.Value, function (i, item) {
                        trHTML += '<tr class="even pointer"><td class=" ">' + item.NamaLab + '</td><td class=" ">' + item.Jumlah + ' ' + item.Satuan + '</td><td class=" ">0 ' + item.Satuan + '</td><td class=" ">' + item.Jumlah + ' ' + item.Satuan + '</td></tr>';
                    });
                    $('#records_table').append(trHTML);
                }
                else
                {
                    new PNotify({
                        title: 'Transaksi Barang Masuk Gagal',
                        text: response.d.ErrorMessage,
                        type: 'error',
                        styling: 'bootstrap3'
                    });
                }
            }
            function OnErrorCall(response) {
                new PNotify({
                    title: 'Gagal Mengirim Data',
                    text: response.statusText + ' (' + response.status + ') : ' + response.responseJSON.Message,
                    type: 'error',
                    styling: 'bootstrap3'
                });
            }
        });
        //*
    </script>  
</asp:Content>