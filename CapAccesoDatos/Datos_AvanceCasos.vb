Imports System.Data.SqlClient
Imports CapEntidadesSiReGe

Public Class Datos_AvanceCasos

    Inherits Conexion
    Dim cmd As New SqlCommand

#Region "Insertar datos a la tabla tblCasoAvances"
    'EFECTO: Esta función inserta los datos para la tabla tblCasoAvances
    'RECIBE: Requiere el llamado de la Entidad de AvanceCasos
    'DEVUELVE: NO DEVUELVE
    Public Function insertarAvancesCasos(ByVal dts As Entidad_AvanceCasos) As Boolean
        Try

            cmd = New SqlCommand("palInsertarCasoAvances")
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Connection = Conx
            cmd.Parameters.AddWithValue("@intIdCasos", dts._idCasos)
            cmd.Parameters.AddWithValue("@vchDetalleAvance", dts._detalleAvance)
            cmd.Parameters.AddWithValue("@dtiFechaAvance", Convert.ToDateTime(dts._fechaAvance))
            If cmd.ExecuteNonQuery Then
                Return True
            Else
                Return False
            End If
        Catch ex As Exception
            MsgBox(ex.Message)
            Return False
        Finally

        End Try
    End Function
#End Region

#Region "Mostrar los datos de la tabla tblCasoAvances"
    'EFECTO: Esta función muestra los datos de la tabla tblCasoAvances
    'RECIBE: No require de parámetros
    'DEVUELVE: Devuelve los datos de la tabla tblCasoAvances
    Public Function mostrarAvanceCasos() As DataTable
        Try

            cmd = New SqlCommand("palMostrarCasoAvances")
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Connection = Conx
            If cmd.ExecuteNonQuery Then
                Dim dt As New DataTable
                Dim da As New SqlDataAdapter(cmd)
                da.Fill(dt)
                Return dt
            Else
                Return Nothing
            End If
        Catch ex As Exception
            MsgBox(ex.Message)
            Return Nothing
        Finally

        End Try
    End Function
#End Region

End Class
