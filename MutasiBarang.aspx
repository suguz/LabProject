<%@ Page Title="Mutasi Barang Antar Laboratorium" Language="C#" MasterPageFile="~/Lab.master" AutoEventWireup="true" CodeFile="MutasiBarang.aspx.cs" Inherits="MutasiBarang" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContent" Runat="Server">
    <div class="col-md-12 col-sm-12 col-xs-12">
        <div class="x_panel">
            <div class="x_title">
                <h2>Data Mutasi Antar Laboratorium</h2>
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
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">Laboratorium asal<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <select class="select2_lab form-control" tabindex="-1" name="labAsal" id="labAsal" required>
                                <asp:Repeater runat="server" ID="lstLabAsal">
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
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">Laboratorium tujuan<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <select class="select2_lab form-control" tabindex="-1" name="labTujuan" id="labTujuan" required>
                                <asp:Repeater runat="server" ID="lstLabTujuan">
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
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="jumlah">Jumlah <span id="txtUnit"></span><span class="required">*</span></label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input id="jumlah" class="form-control col-md-7 col-xs-12" type="number" step="0.00001" name="jumlah" required >
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">Keterangan</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <textarea id="keterangan" class="form-control col-md-7 col-xs-12" rows="5" name="keterangan"></textarea>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">User Entry<span class="required">*</span></label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input id="user" class="form-control col-md-7 col-xs-12" type="text" name="user" required/>
                        </div>
                    </div>

                    <div class="ln_solid"></div>
                    <div class="form-group">
                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                            <a href="MutasiBarang.aspx" class="btn btn-danger">Batal</a>
                            <button id="myButton" class="btn btn-success">Mutasi</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="BodyFooterContainer" Runat="Server">
    <script type="text/javascript">   
        $('#barang').change(function () {
            if ($("#barang").val() == '') {
                return;
            }

            var jsonData = JSON.stringify({ barang: $("#barang").val() });
            $.ajax({
                type: "POST",
                url: "GudangBarangMasuk.aspx/GetUnit",
                data: jsonData,
                contentType: "application/json; charset=utf-8",
                dataType: "json", // dataType is json format
                success: OnSuccess,
                error: OnErrorCall
            });

            function OnSuccess(response) {
                if (response.d.Status == true && response.d.Value != '') {
                    $('#txtUnit').text('(' + response.d.Value + ') ');
                }
                else {
                    new PNotify({
                        title: 'Error mengambil unit barang',
                        text: response.d.ErrorMessage,
                        type: 'error',
                        styling: 'bootstrap3'
                    });
                }
            }
            function OnErrorCall(response) {
                new PNotify({
                    title: 'Gagal mengambil unit barang',
                    text: response.statusText + ' (' + response.status + ') : ' + response.responseJSON.Message,
                    type: 'error',
                    styling: 'bootstrap3'
                });
            }
        });

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
            var jumlah = $("#jumlah").val();
            var labAsal = $("#labAsal").val();
            var labTujuan = $("#labTujuan").val();
            var keterangan = $("#keterangan").val();
            var user = $("#user").val();
            var jsonData = JSON.stringify({ barang: barang, jumlah: jumlah, labAsal: labAsal, labTujuan: labTujuan, keterangan: keterangan, user: user });
            $.ajax({
                type: "POST",  
                url: "MutasiBarang.aspx/Mutasi",
                data: jsonData,
                contentType: "application/json; charset=utf-8",
                dataType: "json", // dataType is json format
                success: OnSuccess,
                error: OnErrorCall
            });

            function OnSuccess(response) {
                if (response.d.Status == true) {
                    new PNotify({
                        title: 'Transaksi Mutasi Barang Berhasil',
                        text: 'Data sudah berhasil ditambahkan',
                        type: 'success',
                        styling: 'bootstrap3'
                    });
                    $("#barang").val('').trigger('change');
                    $("#labAsal").val('').trigger('change');
                    $("#labTujuan").val('').trigger('change');
                    $('#myForm').trigger("reset");
                    // generate tanda terima
                }
                else
                {
                    new PNotify({
                        title: 'Transaksi Mutasi Barang Gagal',
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