<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Video.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>

        <div class="w-75 p-3 mx-auto">
            <table>
                <tr>
                    <td>
                        <button type="button" class="btn btn-light" data-bs-toggle="modal" data-bs-target="#Modalins" data-bs-whatever="@mdo">Inserisci</button>
                    </td>
                    <td>
                        <button type="button" runat="server" id="Modifica" class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#ModalMod" data-bs-whatever="@fat" visible="false">Modifica</button>
                    </td>
                    <td>
                        <button type="button" runat="server" id="Elimina" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#ModalEli" data-bs-whatever="@getbootstrap" visible="false">Elimina</button>
                    </td>
                    <td>
                        <asp:Button ID="btnRicarica" runat="server" Text="Aggiorna" OnClick="btnRicarica_Click" class="btn btn-info" />
                    </td>
                </tr>
            </table>
            <asp:GridView ID="griglia" runat="server" DataKeyNames="codVideo" OnRowDataBound="griglia_RowDataBound1" OnSelectedIndexChanged="griglia_SelectedIndexChanged" CssClass="table table-dark table-striped">
                <Columns>
                    <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
                </Columns>
                <HeaderStyle CssClass="bg-dark text-white text-capitalize" />
                <SelectedRowStyle CssClass="bg-light text-grey font-weight-bold" Font-Bold="True" />
            </asp:GridView>
        </div>
        <div class="w-75 p-3 mx-auto">
            <asp:Literal ID="lit" runat="server"></asp:Literal>
        </div>

        <%--MODAL INSERIMENTO--%>




        <div class="modal fade" id="Modalins" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title text-dark" id="exampleModalLabel">Inserisci film</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="mb-3">
                            <label for="recipient-name" class="col-form-label text-dark">Nome:</label>
                            <asp:TextBox ID="txtTitolo" runat="server" CssClass="form-control"></asp:TextBox>

                        </div>
                        <div class="mb-3">
                            <label for="message-text" class="col-form-label text-dark">Sinossi:</label>
                            <asp:TextBox ID="txtSinossi" runat="server" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>

                        </div>
                        <div class="mb-3">
                            <label for="message-text" class="col-form-label text-dark">Link:</label>
                            <asp:TextBox ID="txtLink" runat="server" CssClass="form-control"></asp:TextBox>

                        </div>
                        <div class="mb-3 text-dark">
                            <label for="message-text" class="col-form-label text-dark">Link:</label>
                            <asp:FileUpload ID="FileUpload1" runat="server" />
                        </div>
                        <div class="mb-3 text-dark">
                            <label for="message-text" class="col-form-label text-dark">Incluso:</label>
                            <asp:CheckBox ID="cbxAbbonamento" runat="server" />
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <asp:Button ID="btnInserisci" runat="server" Text="Inserisci" CssClass="btn btn-primary" OnClick="btnInserisci_Click" />

                    </div>
                </div>
            </div>
        </div>

        <%--MODAL MODIFICA--%>
        <div>
            <div class="modal fade" id="ModalMod" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title text-dark" id="Modalfilm">Modifica film</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <div class="mb-3">
                                <label for="recipient-name" class="col-form-label text-dark">Nome:</label>
                                <asp:TextBox ID="txtNomeM" runat="server" CssClass="form-control"></asp:TextBox>

                            </div>
                            <div class="mb-3">
                                <label for="message-text" class="col-form-label text-dark">Sinossi:</label>
                                <asp:TextBox ID="txtSinossiM" runat="server" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>

                            </div>
                            <div class="mb-3">
                                <label for="message-text" class="col-form-label text-dark">Link:</label>
                                <asp:TextBox ID="txtLinkM" runat="server" CssClass="form-control"></asp:TextBox>

                            </div>
                            <div class="mb-3 text-dark">
                                <label for="message-text" class="col-form-label text-dark">Link:</label>
                                <asp:FileUpload ID="FileUpload2" runat="server" />
                            </div>
                            <div class="mb-3 text-dark">
                                <label for="message-text" class="col-form-label text-dark">Incluso:</label>
                                <asp:CheckBox ID="cbxAbbonamentoM" runat="server" />
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <asp:Button ID="btnModifica" runat="server" Text="Modifica" CssClass="btn btn-primary" OnClick="btnModifica_Click" />

                        </div>
                    </div>
                </div>
            </div>
        </div>

        <%--MODAL ELIMINA--%>
        <div class="modal fade" id="ModalEli" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title text-dark" id="ModalElim">Elimina film</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="mb-3">
                            <label for="recipient-name" class="col-form-label text-dark">Sicuro di voler eliminare questo film?</label>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <asp:Button ID="btnElimina" runat="server" Text="Elimina" CssClass="btn btn-primary" OnClick="btnElimina_Click" />

                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

