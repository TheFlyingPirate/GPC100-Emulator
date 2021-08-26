#tag Class
Protected Class addrRange
	#tag Method, Flags = &h0
		Sub Constructor(startAdd As Uint16, endAdd As UInt16)
		  startAddr=startAdd
		  endAddr=endAdd
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function includes(Addr As Uint16) As Boolean
		  if Addr>=startAddr and Addr<=endAddr then
		    return true
		  else 
		    return false
		  end
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		endAddr As UInt16
	#tag EndProperty

	#tag Property, Flags = &h0
		startAddr As UInt16
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
		#tag ViewProperty
			Name="startAddr"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="UInt16"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="endAddr"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="UInt16"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
