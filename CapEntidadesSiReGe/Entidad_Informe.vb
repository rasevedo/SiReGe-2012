Public Class Entidad_Informe

    Private idInforme As Integer
    Private tituloInforme As String
    Private nombreFuncionario As String
    Private tipoInforme As String
    Private numeroOficio As String
    Private fechaAprobacion As DateTime
    Private fechaCulminacion As DateTime
    Private fechaTraslado As DateTime
    Private avanceInforme As String
    Private remitido As String
    Private hallazgo As String
    Private recomendaciones As String
    Private observaciones As String


    Public Property _idInforme
        Get
            Return idInforme
        End Get
        Set(value)
            idInforme = value
        End Set
    End Property

    Public Property _tituloInforme
        Get
            Return tituloInforme
        End Get
        Set(value)
            tituloInforme = value
        End Set
    End Property

    Public Property _nombreFuncionario
        Get
            Return nombreFuncionario
        End Get
        Set(value)
            nombreFuncionario = value
        End Set
    End Property


    Public Property _tipoInforme
        Get
            Return tipoInforme
        End Get
        Set(value)
            tipoInforme = value
        End Set
    End Property

    Public Property _numeroOficio
        Get
            Return numeroOficio
        End Get
        Set(value)
            numeroOficio = value
        End Set
    End Property

    Public Property _fechaAprobacion
        Get
            Return fechaAprobacion
        End Get
        Set(value)
            fechaAprobacion = value
        End Set
    End Property

    Public Property _fechaCulminacion
        Get
            Return fechaCulminacion
        End Get
        Set(value)
            fechaCulminacion = value
        End Set
    End Property

    Public Property _fechaTraslado
        Get
            Return fechaTraslado
        End Get
        Set(value)
            fechaTraslado = value
        End Set
    End Property

    Public Property _avanceInforme
        Get
            Return avanceInforme
        End Get
        Set(value)
            avanceInforme = value
        End Set
    End Property

    Public Property _remitido
        Get
            Return remitido
        End Get
        Set(value)
            remitido = value
        End Set
    End Property

    Public Property _hallazgo
        Get
            Return hallazgo
        End Get
        Set(value)
            hallazgo = value
        End Set
    End Property

    Public Property _recomendaciones
        Get
            Return recomendaciones
        End Get
        Set(value)
            recomendaciones = value
        End Set
    End Property

    Public Property _observaciones
        Get
            Return observaciones
        End Get
        Set(value)
            observaciones = value
        End Set
    End Property


    Public Sub New()

    End Sub

End Class