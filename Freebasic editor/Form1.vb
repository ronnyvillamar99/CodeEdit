
Imports IWshRuntimeLibrary
Imports System.IO
Imports System.FieldAccessException
Imports ICSharpCode.TextEditor.Document
Imports ICSharpCode.TextEditor

Public Class Form1
    Inherits System.Windows.Forms.Form
    Dim narchivo As String
    Dim lna_actual As Integer
    Dim CARACTER As Integer
    Dim txtTab As Integer
    Dim picTab As Integer
    Dim strDir As String

    Friend WithEvents textEdit As TextEditorControl

    Dim curx As Integer
    Dim oshell As WshShell

    Dim fsmp As FileSyntaxModeProvider

    Private Sub Form1_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Timer1.Interval = 1
        Timer1.Start()
        NuevoToolStripMenuItem.PerformClick()
        TabControl1.TabPages(0).Dispose()
        TxtTexto = TabControl1.SelectedTab.Controls(0)
        strDir = Application.StartupPath & "\Plugins"

        If My.Computer.FileSystem.DirectoryExists(strDir) Then


            fsmp = New FileSyntaxModeProvider(strDir)
            HighlightingManager.Manager.AddSyntaxModeFileProvider(fsmp)
        End If
        Timer2.Start()
    End Sub

    Private Sub CerrarToolStripMenuItem_Click(sender As Object, e As EventArgs)

    End Sub



    Private Sub DesacerToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles DesacerToolStripMenuItem.Click
        TxtTexto.Undo()
    End Sub

    Private Sub ToolStripComboBox1_Click(sender As Object, e As EventArgs) Handles ToolStripComboBox1.Click
        TxtTexto.Redo()
    End Sub


    Private Sub GuardarToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles GuardarToolStripMenuItem.Click

        If TabControl1.SelectedTab.Text = "nuevo" Then
            GuardarComoToolStripMenuItem.PerformClick()
        Else
            Try
                Dim swEscritor As IO.StreamWriter
                swEscritor = New IO.StreamWriter(TabControl1.SelectedTab.Name)
                swEscritor.Write(TabControl1.SelectedTab.Controls(0).Text)
                swEscritor.Close()
            Catch ex As Exception
            End Try
        End If
    End Sub

    Private Sub SalirToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles SalirToolStripMenuItem.Click

    End Sub

    Private Sub NuevoToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles NuevoToolStripMenuItem.Click

        Dim tabnueva As New TabPage
        Dim newTextBox As New TextEditorControl
        If TabControl1.TabPages.Count > 0 Then
            If TabControl1.SelectedTab.Controls.Count = 3 Then
                txtTab = 2
                picTab = 0
            Else
                txtTab = 0
                picTab = 1

            End If

        End If
        TxtTexto = TabControl1.SelectedTab.Controls(txtTab)

        TabControl1.TabPages.Add(tabnueva)
        tabnueva.Text = "nuevo"
        tabnueva.Controls.Add(newTextBox)
        '========================
        newTextBox.Size = TxtTexto.Size
        newTextBox.Location = TxtTexto.Location
        newTextBox.Anchor = TxtTexto.Anchor
        newTextBox.Font = TxtTexto.Font

        TxtTexto = TabControl1.SelectedTab.Controls(txtTab)
        '========================


    End Sub


    Private Sub AbrirToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles AbrirToolStripMenuItem.Click

        ' configurar el cuadro de diálogo por código
        Me.dlgAbrir.Title = "Seleccionar archivo a leer"
        Me.dlgAbrir.Filter = "Archivos de codigo (*.bas*.bi*.cpp*.hpp*.bat*.h*.c)|*.bas;*.bi;*.cpp;*.hpp;*.bat;*.h;*.c|Texto (*.txt)|*.txt|Todos los archivos (*.*)|*.*"
        ' abrir el diálogo
        If dlgAbrir.ShowDialog = Windows.Forms.DialogResult.OK Then
            ' si se han seleccionado varios archivos
            ' mostrar su nombre
            If Me.dlgAbrir.FileNames.Length > 1 Then
                Dim sArchivo As String
                For Each sArchivo In Me.dlgAbrir.FileNames
                    MessageBox.Show("Archivo seleccionado: " & sArchivo)
                Next
            End If
            ' abrir el primer archivo con un Stream
            ' y volcarlo al TextBox
            Dim srLector As New IO.StreamReader(Me.dlgAbrir.FileName)
            NuevoToolStripMenuItem.PerformClick()
            TabControl1.SelectedTab = TabControl1.TabPages.Item(TabControl1.TabCount - 1)
            TabControl1.SelectedTab.Controls(0).Text = srLector.ReadToEnd()
            srLector.Close()
            narchivo = dlgAbrir.SafeFileName
            TabControl1.SelectedTab.Text = narchivo
            TabControl1.SelectedTab.Name = dlgAbrir.FileName

            TxtTexto = TabControl1.SelectedTab.Controls(txtTab)

            Dim file As New FileInfo(TabControl1.SelectedTab.Name)
            TxtTexto.SetHighlighting(file.Extension)
            Try

                If LCase(file.Extension) = ".bas" Or LCase(file.Extension) = ".bi" Then
                    lbl_tipo.Text = "Archivo Basic"
                    txtTexto.SetHighlighting("Basic")

                ElseIf LCase(file.Extension) = ".bat" Then
                    lbl_tipo.Text = "Archivo Batch"
                    txtTexto.SetHighlighting("Batch File")
                Else

                    lbl_tipo.Text = "Archivo de texto"
                End If
            Catch ex As Exception
            End Try
        End If
    End Sub

    Private Sub GuardarComoToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles GuardarComoToolStripMenuItem.Click
        ' configurar por código el diálogo de grabación de archivos
        Me.dlggrabar.Filter = "Archivo basic (*.bas)|*.bas|Texto (*.txt)|*.txt"
        Me.dlggrabar.FilterIndex = 1
        Me.dlggrabar.ValidateNames = True
        If dlggrabar.ShowDialog = Windows.Forms.DialogResult.OK Then
            ' si todo es correcto, escribir mediante un objeto Stream
            ' el contenido del TextBox en el archivo indicado por
            ' las propiedades del cuadro de diálogo
            Dim swEscritor As IO.StreamWriter
            swEscritor = New IO.StreamWriter(Me.dlggrabar.FileName)
            swEscritor.Write(TabControl1.SelectedTab.Controls(0).Text)
            swEscritor.Close()
            TabControl1.SelectedTab.Name = dlggrabar.FileName
            Dim file As New FileInfo(dlggrabar.FileName)
            TabControl1.SelectedTab.Text = file.Name
            GuardarToolStripMenuItem.PerformClick()

        End If
    End Sub

    Private Sub SalirToolStripMenuItem1_Click(sender As Object, e As EventArgs) Handles SalirToolStripMenuItem1.Click
        Me.Close()
    End Sub

    Private Sub CerrarToolStripMenuItem_Click_1(sender As Object, e As EventArgs) Handles CerrarToolStripMenuItem.Click
        TxtTexto.Visible = False
    End Sub


    Private Sub CortarCtrlXToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles CortarCtrlXToolStripMenuItem.Click

    End Sub

    Private Sub CopiarCtrlCToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles CopiarCtrlCToolStripMenuItem.Click

    End Sub

    Private Sub FuentesToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles FuentesToolStripMenuItem.Click
        Me.dlgfuente.ShowApply = True
        Me.dlgfuente.ShowDialog()
        Me.AplicarFuente()
    End Sub
    ' este método cambia el fuente del TextBox
    Private Sub AplicarFuente()
        Me.TabControl1.SelectedTab.Controls(0).Font = Me.dlgfuente.Font
    End Sub
    ' al pulsar el botón Aplicar del diálogo de
    ' selección de fuente, se produce este evento
    Private Sub dlgFuente_Apply(ByVal sender As Object, ByVal e As System.EventArgs) Handles dlgfuente.Apply
        Me.AplicarFuente()
    End Sub

    Private Sub ColorDeFuenteToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles ColorDeFuenteToolStripMenuItem.Click
        Me.dlgcolor.ShowDialog()
        Me.TabControl1.SelectedTab.Controls(0).ForeColor = Me.dlgcolor.Color
    End Sub

    Private Sub ColorDePaginaToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles ColorDePaginaToolStripMenuItem.Click
        Me.dlgcolor.ShowDialog()
        Me.TabControl1.SelectedTab.Controls(0).BackColor = Me.dlgcolor.Color
    End Sub

    Private Sub BuscarToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles BuscarToolStripMenuItem.Click
        ' crear un objeto frmBuscar
        Dim ofrmBuscar As New Form2()
        ' establecer dependencia entre forms
        Me.AddOwnedForm(ofrmBuscar)
        ofrmBuscar.Show()
    End Sub

    Private Sub ArchivoToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles ArchivoToolStripMenuItem.Click

    End Sub

    Private Sub AyudaToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles AyudaToolStripMenuItem.Click

    End Sub


    Private Sub NumeroDeLineaToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles NumeroDeLineaToolStripMenuItem.Click
        txtTexto.ShowLineNumbers = NumeroDeLineaToolStripMenuItem.Checked
    End Sub

    Private Sub Timer1_Tick(sender As Object, e As EventArgs) Handles Timer1.Tick

       
        If TabControl1.TabPages.Count > 0 Then
            If TabControl1.SelectedTab.Controls.Count = 3 Then
                txtTab = 2
                picTab = 0
            Else
                txtTab = 0
                picTab = 1

            End If

        End If
        TxtTexto = TabControl1.SelectedTab.Controls(txtTab)

        ' lbl_pos.Text = "Lin: " & textEdit.GetLineFromCharIndex(textEdit.Lines.Count) + 1 & _
        '        " Col: " & textEdit.Lines(textEdit.GetLineFromCharIndex(textEdit.Lines.Count)).Length

       

    End Sub
    Sub textedir_scoll(sender As Object, e As EventArgs) Handles TxtTexto.Scroll

    End Sub
  

    Private Sub ToolStripButton1_Click(sender As Object, e As EventArgs) Handles ToolStripButton1.Click
        NuevoToolStripMenuItem.PerformClick()
    End Sub

    Private Sub ToolStripButton2_Click(sender As Object, e As EventArgs) Handles btn_abrir.Click
        AbrirToolStripMenuItem.PerformClick()
    End Sub

    Private Sub ToolStripButton3_Click(sender As Object, e As EventArgs) Handles btn_guardar.Click
        GuardarToolStripMenuItem.PerformClick()
    End Sub

    Private Sub CerrarToolStripMenuItem1_Click(sender As Object, e As EventArgs) Handles CerrarToolStripMenuItem1.Click
        TabControl1.SelectedTab.Dispose()
    End Sub

    Private Sub CerrarTodasMenosLaActualToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles CerrarTodasMenosLaActualToolStripMenuItem.Click
        Try
            Dim t As Integer
            For t = 0 To TabControl1.TabPages.Count
                If TabControl1.SelectedIndex = 0 Then
                    TabControl1.TabPages(TabControl1.SelectedIndex + 1).Dispose()
                Else
                    TabControl1.TabPages(TabControl1.SelectedIndex - 1).Dispose()

                End If
            Next
        Catch ex As Exception
        End Try
    End Sub

    Private Sub CompilarToolStripMenuItem1_Click(sender As Object, e As EventArgs) Handles CompilarToolStripMenuItem1.Click
        CompilarF9ToolStripMenuItem.PerformClick()
    End Sub

    Private Sub CompilarF9ToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles CompilarF9ToolStripMenuItem.Click
        GuardarToolStripMenuItem.PerformClick()

        If DialogResult = Windows.Forms.DialogResult.OK Or TabControl1.SelectedTab.Text <> "nuevo" Then
            Dim file As New FileInfo(TabControl1.SelectedTab.Name.ToString.Replace(".bas", ".exe"))
            SplitContainer1.Panel2Collapsed = False

            txt_visor.Text = txt_visor.Text & DOS(TabControl1.SelectedTab.Name)
            txt_visor.SelectionStart = txt_visor.Text.Length + vbCrLf.Length
            txt_visor.ScrollToCaret()

            If file.Exists Then
                txt_visor.Text = txt_visor.Text & "Compilacion correcta --> " & TabControl1.SelectedTab.Name & vbCrLf

                txt_visor.Text = txt_visor.Text & "Archivo ejecutable producido -->" & TabControl1.SelectedTab.Name.ToString.Replace(".bas", ".exe") & vbCrLf
                txt_visor.SelectionStart = txt_visor.Text.Length + vbCrLf.Length
                txt_visor.ScrollToCaret()
                EjecutarF5ToolStripMenuItem.Enabled = True
                btn_ejecutar.Enabled = True

            End If




        Else


        End If
    End Sub

    Private Sub EjecutarF5ToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles EjecutarF5ToolStripMenuItem.Click
        System.Diagnostics.Process.Start(TabControl1.SelectedTab.Name.ToString.Replace(".bas", ".exe"))
        DetenerEjecucionToolStripMenuItem.Enabled = True
        EjecutarF5ToolStripMenuItem.Enabled = False
        btn_ejecutar.Enabled = False
        DetenerEjecucionToolStripMenuItem.Enabled = True
    End Sub

    Private Sub DetenerEjecucionToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles DetenerEjecucionToolStripMenuItem.Click
        oshell.Exec("taskkill /f /im" & TabControl1.SelectedTab.Text.ToString.Replace(".bas", ".exe"))
        DetenerEjecucionToolStripMenuItem.Enabled = False
        EjecutarF5ToolStripMenuItem.Enabled = True
        DetenerEjecucionToolStripMenuItem.Enabled = False
    End Sub


    Private Sub btn_cerr_vis_Click(sender As Object, e As EventArgs) Handles btn_cerr_vis.Click

        SplitContainer1.Panel2Collapsed = True

    End Sub

    Private Sub btn_compilar_Click(sender As Object, e As EventArgs) Handles btn_compilar.Click
        CompilarF9ToolStripMenuItem.PerformClick()
    End Sub

    Private Sub btn_cerrar_ej_Click(sender As Object, e As EventArgs) Handles btn_cerrar_ej.Click
        DetenerEjecucionToolStripMenuItem.PerformClick()

    End Sub

    Function DOS(comando As String) As String

        Dim oexec As WshExec
        Dim ret As String
        Dim comll As String = Chr(34)
        Dim file As New FileInfo(comando)
        oshell = New WshShell
        oexec = oshell.Exec("fbc.exe " & comll & comando & comll)
        ret = oexec.StdOut.ReadAll
        DOS = ret


    End Function

    Private Sub ToolStripButton2_Click_1(sender As Object, e As EventArgs) Handles btn_ejecutar.Click
        EjecutarF5ToolStripMenuItem.PerformClick()
    End Sub


    Private Sub DepurarF10ToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles DepurarF10ToolStripMenuItem.Click
        Dim arch As FileInfo
        arch = New FileInfo(TabControl1.SelectedTab.Name.Replace(".bas", ".exe"))
        CompilarF9ToolStripMenuItem.PerformClick()
        If arch.Exists Then
            arch.Delete()
        End If
    End Sub

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        txt_visor.Clear()
    End Sub

    Private Sub PegarCtrlVToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles PegarCtrlVToolStripMenuItem.Click

    End Sub

    Private Sub SeleccionarTodoCtrlAToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles SeleccionarTodoCtrlAToolStripMenuItem.Click

    End Sub

    Private Sub Timer2_Tick(sender As Object, e As EventArgs) Handles Timer2.Tick

    End Sub
  


    Private Sub DonarToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles DonarToolStripMenuItem.Click
        Shell("cmd.exe /c start https://www.paypal.me/RonnyVillamar")
    End Sub

    Private Sub VerAyudaToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles VerAyudaToolStripMenuItem.Click

    End Sub

    Private Sub AercaDeToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles AercaDeToolStripMenuItem.Click
        AboutBox1.ShowDialog()
    End Sub
End Class

