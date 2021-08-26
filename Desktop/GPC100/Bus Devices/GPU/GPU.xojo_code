#tag Class
Protected Class GPU
Inherits busDevice
	#tag Method, Flags = &h0
		Function colorConv(c as byte) As Color
		  Dim r as byte
		  Dim g as byte
		  Dim b as byte
		  Dim cr as integer
		  dim cg as integer
		  Dim cb as integer
		  r = c And &b11100000
		  g = c And &b00011100
		  b = c And &b00000011
		  r=Bitwise.ShiftRight(r,5)
		  g=Bitwise.shiftRight(g,2)
		  //Red
		  Select case r
		  case &b000
		    cr=0
		  case &b001
		    cr=255/8
		  case &b010
		    cr=255/4
		  case &b011
		    cr=(255/4)+(255/8)
		  case &b100
		    cr=255/2
		  case &b101
		    cr=(255/2)+(255/8)
		  case &b110
		    cr=(255/2)+(255/4)
		  case &b111
		    cr=255
		  end select
		  //Green
		  Select case g
		  case &b000
		    cg=0
		  case &b001
		    cg=255/8
		  case &b010
		    cg=255/4
		  case &b011
		    cg=(255/4)+(255/8)
		  case &b100
		    cg=255/2
		  case &b101
		    cg=(255/2)+(255/8)
		  case &b110
		    cg=(255/2)+(255/4)
		  case &b111
		    cg=255
		  end select
		  //Blue
		  Select case b
		  case &b00
		    cb=0
		  case &b01
		    cb=255/3
		  case &b10
		    cb=(255/3)*2
		  case &b11
		    cb= 255
		  End select
		  Return Color.RGB(cr,cg,cb)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  for i as integer = 0 to 199
		    for i2 as integer = 0 to 149
		      FB.Add(Color.Black)
		    next
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub exec()
		  Select case inst
		  Case &h0
		    FB(y*199+x) = colorConv(val)
		  else
		    
		  end select
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Write(addr as Uint16, data as byte)
		  // Calling the overridden superclass method.
		  Super.Write(addr, data)
		  Select case addr
		  case 0
		    inst=data
		  case 1
		    x=data
		  case 2
		    y=data
		  case 3
		    x2=data
		  case 4
		    y2=data
		  case 5
		    ascii=data
		  case 6
		    bcolor=data
		  case 7
		    val=data
		    exec
		  end select
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		ascii As byte
	#tag EndProperty

	#tag Property, Flags = &h0
		bcolor As byte
	#tag EndProperty

	#tag Property, Flags = &h0
		FB() As Color
	#tag EndProperty

	#tag Property, Flags = &h0
		inst As byte
	#tag EndProperty

	#tag Property, Flags = &h0
		val As byte
	#tag EndProperty

	#tag Property, Flags = &h0
		x As Byte
	#tag EndProperty

	#tag Property, Flags = &h0
		x2 As byte
	#tag EndProperty

	#tag Property, Flags = &h0
		y As byte
	#tag EndProperty

	#tag Property, Flags = &h0
		y2 As byte
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
			Name="x"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Byte"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="y"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="byte"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="val"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="byte"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
