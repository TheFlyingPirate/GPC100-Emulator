#tag Class
Protected Class RAM
Inherits busDevice
	#tag Method, Flags = &h0
		Sub Constructor(size As UInt16)
		  Dim mem2() As Byte
		  for i as integer =0 to size
		    mem2.Add(&h0)
		  next
		  Mem=mem2
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
		  Mem(addr)=data
		  
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
