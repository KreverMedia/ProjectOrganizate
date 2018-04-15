Public Class NewCount
    Private _codigo, _rol As String
    Public Property Codigo() As String
        Get
            Return Me._codigo
        End Get
        Set(value As String)
            Me._codigo = value
        End Set
    End Property
    Public Property Rol() As String
        Get
            Return Me._rol
        End Get
        Set(value As String)
            Me._rol = value
        End Set
    End Property
    Public Sub New()
        Me._rol = String.Empty
        Me._codigo = String.Empty
    End Sub
End Class
