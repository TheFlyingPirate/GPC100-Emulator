#tag Class
Protected Class ROM
Inherits busDevice
	#tag Method, Flags = &h0
		Sub Constructor(content() As Byte)
		  Mem=content
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Read(addr As Uint16) As Byte
		  // Calling the overridden superclass method.
		  Var returnValue as Byte = Super.Read(addr)
		  return Mem(addr)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Write(addr as Uint16, data as byte)
		  // Calling the overridden superclass method.
		  Super.Write(addr, data)
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		Mem() As Byte
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
