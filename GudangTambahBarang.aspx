<%@ Page Title="Tambah Barang" Language="C#" MasterPageFile="~/Lab.master" AutoEventWireup="true" CodeFile="GudangTambahBarang.aspx.cs" Inherits="GudangTambahBarang" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <style>
        .entry:not(:first-of-type) {
            margin-top: 10px;
        }

        .glyphicon {
            font-size: 12px;
        }

        td {
            padding: 2px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContent" runat="Server">
    <div class="col-md-12 col-sm-12 col-xs-12">
        <div class="x_panel">
            <div class="x_title">
                <h2>Input Data Barang</h2>
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
                <form id="myForm" class="form-horizontal form-label-left">
                    <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="kode-barang">
                            Kode Barang<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="text" id="kode-barang" name="kode-barang" required="required" class="form-control col-md-7 col-xs-12">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="nama-barang">
                            Nama Barang<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="text" id="nama-barang" name="nama-barang" required="required" class="form-control col-md-7 col-xs-12">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="nama-lain" class="control-label col-md-3 col-sm-3 col-xs-12">Spesifikasi</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input id="spesifikasi" class="form-control col-md-7 col-xs-12" type="text" name="spesifikasi">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="satuan-barang" class="control-label col-md-3 col-sm-3 col-xs-12">Satuan Barang<span class="required">*</span></label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <asp:Repeater runat="server" ID="lstSatuan">
                                <HeaderTemplate>
                                    <select id="satuan-barang" name="satuan-barang" class="form-control" required>
                                    <option value="">Pilih salah satu...</option>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <option value="<%# DataBinder.Eval(Container.DataItem, "ID") %>"><%# DataBinder.Eval(Container.DataItem, "SATUAN") %></option>
                                </ItemTemplate>
                                <FooterTemplate>
                                    </select>
                                </FooterTemplate>
                            </asp:Repeater>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="keterangan" class="control-label col-md-3 col-sm-3 col-xs-12">Keterangan</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input id="keterangan" class="form-control col-md-7 col-xs-12" type="text" name="keterangan">
                        </div>
                    </div>
                    
                    <div class="ln_solid"></div>
                    <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">Kemasan</label>
                        <div class="col-md-6 col-sm-6 col-xs-6">
                            <table>
                                <tbody>
                                    <tr>
                                        <td><input class="form-control jumlah" name="jumlah[]" type="number" step="0.001" placeholder="Jumlah" required="required"/></td>
                                        <td nowrap><label name="unit[]" class="unit">Label</label> dalam setiap </td>
                                        <td>
                                            <asp:Repeater runat="server" ID="listKemasan">
                                                <HeaderTemplate>
                                                    <select name="kemasan[]" class="form-control kemasan" required="required">
                                                        <option value="">Pilih salah satu kemasan...</option>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <option value="<%# DataBinder.Eval(Container.DataItem, "ID") %>"><%# DataBinder.Eval(Container.DataItem, "KEMASAN") %></option>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    </select>
                                                </FooterTemplate>
                                            </asp:Repeater>
                                        </td>
                                        <td><button class="btn btn-success btn-add" type="button"><i class="glyphicon glyphicon-plus gs"></i></button></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="ln_solid"></div>
                    <div class="form-group">
                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                            <a href="GudangMasterBarang.aspx" class="btn btn-danger">Batal</a>
                            <button id="myButton" class="btn btn-success">Tambahkan Data Barang</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="BodyFooterContainer" runat="Server">
    <script>

        $('#satuan-barang').change(function () {
            if ($("#satuan-barang").val() == '') {
                return;
            }

            var satuanTerkecil = $("#satuan-barang option:selected").text();

            $('.unit').each(function (i, obj) {
                $('.unit')[i].textContent = satuanTerkecil;
            });
        });

        //*
        $("#myButton").on("click", function (e) {
            if (e.handleObj.handler.caller.arguments[0] == e)
                return;

            var $myForm = $('#myForm')
            if (!$myForm[0].checkValidity()) {
                $myForm.find(':submit').click();
                return;
            }

            e.preventDefault();
            var aData = [];
            var kode = $("#kode-barang").val();
            var nama = $("#nama-barang").val();
            var spesifikasi = $("#spesifikasi").val();
            var satuan = $("#satuan-barang").val();
            var keterangan = $("#keterangan").val();

            var kemasan = '';
            $('.unit').each(function (i, obj) {
                if (kemasan == '') {
                    kemasan = $('.kemasan')[i].value + '/' + $('.jumlah')[i].value;
                }
                else {
                    kemasan = kemasan + '*' + $('.kemasan')[i].value + '/' + $('.jumlah')[i].value;
                }
            });

            var jsonData = JSON.stringify({ kode: kode, nama: nama, spesifikasi: spesifikasi, satuan: satuan, keterangan: keterangan, kemasan: kemasan });
            $.ajax({
                type: "POST",  
                url: "GudangTambahBarang.aspx/TambahBarang",
                data: jsonData,
                contentType: "application/json; charset=utf-8",
                dataType: "json", // dataType is json format
                success: OnSuccess,
                error: OnErrorCall
            });

            function OnSuccess(response) {
                if (response.d.Status == true) {
                    new PNotify({
                        title: 'Transaksi Barang Masuk Berhasil',
                        text: 'Data sudah berhasil ditambahkan',
                        type: 'success',
                        styling: 'bootstrap3'
                    });
                    $("#barang").val('').trigger('change');
                    $("#vendor").val('').trigger('change');
                    $('#myForm').trigger("reset");
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

        $(function () {
            $(document).on('click', '.btn-add', function (e) {
                var $myForm = $('#myForm')
                if (!$myForm[0].checkValidity()) {
                    $myForm.find(':submit').click();
                    return;
                }

                e.preventDefault();

                var controlForm = $(this).closest('table'),
                    currentEntry = $(this).parents('tr:first'),
                    newEntry = $(currentEntry.clone()).appendTo(controlForm);

                newEntry.find('input').val('');
                controlForm.find('tr:not(:last) .btn-add')
                    .removeClass('btn-add').addClass('btn-remove')
                    .removeClass('btn-success').addClass('btn-danger')
                    .html('<span class="glyphicon glyphicon-minus gs"></span>');
            }).on('click', '.btn-remove', function (e) {
                $(this).parents('tr:first').remove();

                e.preventDefault();
                return false;
            });
        });
    </script>
</asp:Content>

