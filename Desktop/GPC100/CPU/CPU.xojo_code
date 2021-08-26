#tag Class
Protected Class CPU
	#tag Method, Flags = &h0
		Function ALU(op as byte, reg0 as byte, reg1 as byte) As byte
		  
		  
		  
		  
		  Var p0,p1 as Byte
		  
		  Select Case reg0
		  Case 0
		    p0 =  R0
		  Case 1
		    p0 =  R1
		  Case 2
		    p0 =  R2
		  Case 3
		    p0 =  R3
		  Case 4
		    p0 =  R4
		  Case 5
		    p0 =  R5
		  Case 6
		    p0 =  R6
		  Case 7
		    p0 = R7
		  End Select
		  
		  Select Case reg1
		  Case 0
		    p1 =  R0
		  Case 1
		    p1 =  R1
		  Case 2
		    p1 =  R2
		  Case 3
		    p1 =  R3
		  Case 4
		    p1 =  R4
		  Case 5
		    p1 =  R5
		  Case 6
		    p1 =  R6
		  Case 7
		    p1 =  R7
		  End Select
		  
		  Select case op
		  case 0
		    return p0+p1
		  case 1
		    Dim i as Integer = p0+p1
		    if i> 255 then
		      ca = true
		      i=i-256
		    end
		    return i
		  case 2
		    return p0 And p1
		  case 3
		    return p0 Or p1
		  case 4
		    return Not p0
		  case 5
		    return p0 Xor p1
		  case 6
		    return Bitwise.ShiftLeft(p0,1)
		  case 7
		    return Bitwise.ShiftRight(p0,1)
		    
		  End Select
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(b As bus)
		  InstructionPointer = 0
		  curBus = b
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub tick()
		  if stepCounter = 0 then
		    InstructionRegister = curBus.Read(InstructionPointer)
		    stepCounter = stepCounter + 1
		  end
		  if stepCounter>0 then
		    Select Case InstructionRegister
		    Case &h00  //NOP
		      stepCounter = 0
		      InstructionPointer=InstructionPointer+4
		    Case &h10 //LDR R0
		      MemoryPointer = curBus.Read(InstructionPointer+1)
		      MemoryPointer = Bitwise.ShiftLeft(MemoryPointer,8)
		      MemoryPointer = MemoryPointer + curBus.Read(InstructionPointer+2)
		      R0 = curBus.Read(MemoryPointer)
		      stepCounter = 0
		      InstructionPointer=InstructionPointer+4
		    Case &h11 //LDR R1
		      MemoryPointer = curBus.Read(InstructionPointer+1)
		      MemoryPointer = Bitwise.ShiftLeft(MemoryPointer,8)
		      MemoryPointer = MemoryPointer + curBus.Read(InstructionPointer+2)
		      R1 = curBus.Read(MemoryPointer)
		      stepCounter = 0
		      InstructionPointer=InstructionPointer+4
		    Case &h12 //LDR R2
		      MemoryPointer = curBus.Read(InstructionPointer+1)
		      MemoryPointer = Bitwise.ShiftLeft(MemoryPointer,8)
		      MemoryPointer = MemoryPointer + curBus.Read(InstructionPointer+2)
		      R2 = curBus.Read(MemoryPointer)
		      stepCounter = 0
		      InstructionPointer=InstructionPointer+4
		    Case &h13 //LDR R3
		      MemoryPointer = curBus.Read(InstructionPointer+1)
		      MemoryPointer = Bitwise.ShiftLeft(MemoryPointer,8)
		      MemoryPointer = MemoryPointer + curBus.Read(InstructionPointer+2)
		      R3 = curBus.Read(MemoryPointer)
		      stepCounter = 0
		      InstructionPointer=InstructionPointer+4
		    Case &h14 //LDR R4
		      MemoryPointer = curBus.Read(InstructionPointer+1)
		      MemoryPointer = Bitwise.ShiftLeft(MemoryPointer,8)
		      MemoryPointer = MemoryPointer + curBus.Read(InstructionPointer+2)
		      R4 = curBus.Read(MemoryPointer)
		      stepCounter = 0
		      InstructionPointer=InstructionPointer+4
		    Case &h15 //LDR R5
		      MemoryPointer = curBus.Read(InstructionPointer+1)
		      MemoryPointer = Bitwise.ShiftLeft(MemoryPointer,8)
		      MemoryPointer = MemoryPointer + curBus.Read(InstructionPointer+2)
		      R5 = curBus.Read(MemoryPointer)
		      stepCounter = 0
		      InstructionPointer=InstructionPointer+4
		    Case &h16 //LDR R6
		      MemoryPointer = curBus.Read(InstructionPointer+1)
		      MemoryPointer = Bitwise.ShiftLeft(MemoryPointer,8)
		      MemoryPointer = MemoryPointer + curBus.Read(InstructionPointer+2)
		      R6 = curBus.Read(MemoryPointer)
		      stepCounter = 0
		      InstructionPointer=InstructionPointer+4
		    Case &h17 //LDR R7
		      MemoryPointer = curBus.Read(InstructionPointer+1)
		      MemoryPointer = Bitwise.ShiftLeft(MemoryPointer,8)
		      MemoryPointer = MemoryPointer + curBus.Read(InstructionPointer+2)
		      R7 = curBus.Read(MemoryPointer)
		      stepCounter = 0
		      InstructionPointer=InstructionPointer+4
		    Case &h18 //LDI R0
		      MemoryPointer = InstructionPointer+1
		      R0 = curBus.Read(MemoryPointer)
		      stepCounter = 0
		      InstructionPointer=InstructionPointer+4
		    Case &h19 //LDI R1
		      MemoryPointer = InstructionPointer+1
		      R1 = curBus.Read(MemoryPointer)
		      stepCounter = 0
		      InstructionPointer=InstructionPointer+4
		    Case &h1a //LDI R2
		      MemoryPointer = InstructionPointer+1
		      R2 = curBus.Read(MemoryPointer)
		      stepCounter = 0
		      InstructionPointer=InstructionPointer+4
		    Case &h1b //LDI R3
		      MemoryPointer = InstructionPointer+1
		      R3 = curBus.Read(MemoryPointer)
		      stepCounter = 0
		      InstructionPointer=InstructionPointer+4
		    Case &h1c //LDI R4
		      MemoryPointer = InstructionPointer+1
		      R4 = curBus.Read(MemoryPointer)
		      stepCounter = 0
		      InstructionPointer=InstructionPointer+4
		    Case &h1d //LDI R5
		      MemoryPointer = InstructionPointer+1
		      R5 = curBus.Read(MemoryPointer)
		      stepCounter = 0
		      InstructionPointer=InstructionPointer+4
		    Case &h1e //LDI R6
		      MemoryPointer = InstructionPointer+1
		      R6 = curBus.Read(MemoryPointer)
		      stepCounter = 0
		      InstructionPointer=InstructionPointer+4
		    Case &h1f //LDI R7
		      MemoryPointer = InstructionPointer+1
		      R7 = curBus.Read(MemoryPointer)
		      stepCounter = 0
		      InstructionPointer=InstructionPointer+4
		    Case &h20 //ST R0
		      MemoryPointer = curBus.Read(InstructionPointer+1)
		      MemoryPointer = Bitwise.ShiftLeft(MemoryPointer,8)
		      MemoryPointer = MemoryPointer + curBus.Read(InstructionPointer+2)
		      curBus.Write(MemoryPointer,R0)
		      stepCounter = 0
		      InstructionPointer=InstructionPointer+4
		    Case &h21 //ST R1
		      MemoryPointer = curBus.Read(InstructionPointer+1)
		      MemoryPointer = Bitwise.ShiftLeft(MemoryPointer,8)
		      MemoryPointer = MemoryPointer + curBus.Read(InstructionPointer+2)
		      curBus.Write(MemoryPointer,R1)
		      stepCounter = 0
		      InstructionPointer=InstructionPointer+4
		    Case &h22 //ST R2
		      MemoryPointer = curBus.Read(InstructionPointer+1)
		      MemoryPointer = Bitwise.ShiftLeft(MemoryPointer,8)
		      MemoryPointer = MemoryPointer + curBus.Read(InstructionPointer+2)
		      curBus.Write(MemoryPointer,R2)
		      stepCounter = 0
		      InstructionPointer=InstructionPointer+4
		    Case &h23 //ST R3
		      MemoryPointer = curBus.Read(InstructionPointer+1)
		      MemoryPointer = Bitwise.ShiftLeft(MemoryPointer,8)
		      MemoryPointer = MemoryPointer + curBus.Read(InstructionPointer+2)
		      curBus.Write(MemoryPointer,R3)
		      stepCounter = 0
		      InstructionPointer=InstructionPointer+4
		    Case &h24 //ST R4
		      MemoryPointer = curBus.Read(InstructionPointer+1)
		      MemoryPointer = Bitwise.ShiftLeft(MemoryPointer,8)
		      MemoryPointer = MemoryPointer + curBus.Read(InstructionPointer+2)
		      curBus.Write(MemoryPointer,R4)
		      stepCounter = 0
		      InstructionPointer=InstructionPointer+4
		    Case &h25 //ST R5
		      MemoryPointer = curBus.Read(InstructionPointer+1)
		      MemoryPointer = Bitwise.ShiftLeft(MemoryPointer,8)
		      MemoryPointer = MemoryPointer + curBus.Read(InstructionPointer+2)
		      curBus.Write(MemoryPointer,R5)
		      stepCounter = 0
		      InstructionPointer=InstructionPointer+4
		    Case &h26 //ST R6
		      MemoryPointer = curBus.Read(InstructionPointer+1)
		      MemoryPointer = Bitwise.ShiftLeft(MemoryPointer,8)
		      MemoryPointer = MemoryPointer + curBus.Read(InstructionPointer+2)
		      curBus.Write(MemoryPointer,R6)
		      stepCounter = 0
		      InstructionPointer=InstructionPointer+4
		    Case &h27 //ST R7
		      MemoryPointer = curBus.Read(InstructionPointer+1)
		      MemoryPointer = Bitwise.ShiftLeft(MemoryPointer,8)
		      MemoryPointer = MemoryPointer + curBus.Read(InstructionPointer+2)
		      curBus.Write(MemoryPointer,R7)
		      stepCounter = 0
		      InstructionPointer=InstructionPointer+4
		    Case &h80 //ADD R0
		      R0 = ALU(0,curBus.Read(InstructionPointer+1),curBus.Read(InstructionPointer+2))
		      stepCounter = 0
		      InstructionPointer=InstructionPointer+4
		    Case &h81 //ADD R1
		      R1= ALU(0,curBus.Read(InstructionPointer+1),curBus.Read(InstructionPointer+2))
		      stepCounter = 0
		      InstructionPointer=InstructionPointer+4
		    Case &h82 //ADD R2
		      R2 = ALU(0,curBus.Read(InstructionPointer+1),curBus.Read(InstructionPointer+2))
		      stepCounter = 0
		      InstructionPointer=InstructionPointer+4
		    Case &h83 //ADD R3
		      R3 = ALU(0,curBus.Read(InstructionPointer+1),curBus.Read(InstructionPointer+2))
		      stepCounter = 0
		      InstructionPointer=InstructionPointer+4
		    Case &h84 //ADD R4
		      R4 = ALU(0,curBus.Read(InstructionPointer+1),curBus.Read(InstructionPointer+2))
		      stepCounter = 0
		      InstructionPointer=InstructionPointer+4
		    Case &h85 //ADD R5
		      R5 = ALU(0,curBus.Read(InstructionPointer+1),curBus.Read(InstructionPointer+2))
		      stepCounter = 0
		      InstructionPointer=InstructionPointer+4
		    Case &h86 //ADD R6
		      R6 = ALU(0,curBus.Read(InstructionPointer+1),curBus.Read(InstructionPointer+2))
		      stepCounter = 0
		      InstructionPointer=InstructionPointer+4
		    Case &h87 //ADD R7
		      R7 = ALU(0,curBus.Read(InstructionPointer+1),curBus.Read(InstructionPointer+2))
		      stepCounter = 0
		      InstructionPointer=InstructionPointer+4
		    Case &h88 //ADC R0
		      R0 = ALU(1,curBus.Read(InstructionPointer+1),curBus.Read(InstructionPointer+2))
		      stepCounter = 0
		      InstructionPointer=InstructionPointer+4
		    Case &h89 //ADC R1
		      R1 = ALU(1,curBus.Read(InstructionPointer+1),curBus.Read(InstructionPointer+2))
		      stepCounter = 0
		      InstructionPointer=InstructionPointer+4
		    Case &h8a //ADC R2
		      R2 = ALU(1,curBus.Read(InstructionPointer+1),curBus.Read(InstructionPointer+2))
		      stepCounter = 0
		      InstructionPointer=InstructionPointer+4
		    Case &h8b //ADC R3
		      R3 = ALU(1,curBus.Read(InstructionPointer+1),curBus.Read(InstructionPointer+2))
		      stepCounter = 0
		      InstructionPointer=InstructionPointer+4
		    Case &h8c //ADC R4
		      R4 = ALU(1,curBus.Read(InstructionPointer+1),curBus.Read(InstructionPointer+2))
		      stepCounter = 0
		      InstructionPointer=InstructionPointer+4
		    Case &h8d //ADC R5
		      R5 = ALU(1,curBus.Read(InstructionPointer+1),curBus.Read(InstructionPointer+2))
		      stepCounter = 0
		      InstructionPointer=InstructionPointer+4
		    Case &h8e //ADC R6
		      R6 = ALU(1,curBus.Read(InstructionPointer+1),curBus.Read(InstructionPointer+2))
		      stepCounter = 0
		      InstructionPointer=InstructionPointer+4
		    Case &h8f //ADC R7
		      R7 = ALU(1,curBus.Read(InstructionPointer+1),curBus.Read(InstructionPointer+2))
		      stepCounter = 0
		      InstructionPointer=InstructionPointer+4
		    Case &h90 //AND R0
		      R0 = ALU(2,curBus.Read(InstructionPointer+1),curBus.Read(InstructionPointer+2))
		      stepCounter = 0
		      InstructionPointer=InstructionPointer+4
		    Case &h91 //AND R1
		      R1 = ALU(2,curBus.Read(InstructionPointer+1),curBus.Read(InstructionPointer+2))
		      stepCounter = 0
		      InstructionPointer=InstructionPointer+4
		    Case &h92 //AND R2
		      R2 = ALU(2,curBus.Read(InstructionPointer+1),curBus.Read(InstructionPointer+2))
		      stepCounter = 0
		      InstructionPointer=InstructionPointer+4
		    Case &h93 //AND R3
		      R3 = ALU(2,curBus.Read(InstructionPointer+1),curBus.Read(InstructionPointer+2))
		      stepCounter = 0
		      InstructionPointer=InstructionPointer+4
		    Case &h94 //AND R4
		      R4 = ALU(2,curBus.Read(InstructionPointer+1),curBus.Read(InstructionPointer+2))
		      stepCounter = 0
		      InstructionPointer=InstructionPointer+4
		    Case &h95 //AND R5
		      R5 = ALU(2,curBus.Read(InstructionPointer+1),curBus.Read(InstructionPointer+2))
		      stepCounter = 0
		      InstructionPointer=InstructionPointer+4
		    Case &h96 //AND R6
		      R6 = ALU(2,curBus.Read(InstructionPointer+1),curBus.Read(InstructionPointer+2))
		      stepCounter = 0
		      InstructionPointer=InstructionPointer+4
		    Case &h97 //AND R7
		      R7 = ALU(2,curBus.Read(InstructionPointer+1),curBus.Read(InstructionPointer+2))
		      stepCounter = 0
		      InstructionPointer=InstructionPointer+4
		    Case &h98 //OR R0
		      R0 = ALU(3,curBus.Read(InstructionPointer+1),curBus.Read(InstructionPointer+2))
		      stepCounter = 0
		      InstructionPointer=InstructionPointer+4
		    Case &h99 //OR R1
		      R1 = ALU(3,curBus.Read(InstructionPointer+1),curBus.Read(InstructionPointer+2))
		      stepCounter = 0
		      InstructionPointer=InstructionPointer+4
		    Case &h9a //OR R2
		      R2 = ALU(3,curBus.Read(InstructionPointer+1),curBus.Read(InstructionPointer+2))
		      stepCounter = 0
		      InstructionPointer=InstructionPointer+4
		    Case &h9b //OR R3
		      R3 = ALU(3,curBus.Read(InstructionPointer+1),curBus.Read(InstructionPointer+2))
		      stepCounter = 0
		      InstructionPointer=InstructionPointer+4
		    Case &h9c //OR R4
		      R4 = ALU(3,curBus.Read(InstructionPointer+1),curBus.Read(InstructionPointer+2))
		      stepCounter = 0
		      InstructionPointer=InstructionPointer+4
		    Case &h9d //OR R5
		      R5 = ALU(3,curBus.Read(InstructionPointer+1),curBus.Read(InstructionPointer+2))
		      stepCounter = 0
		      InstructionPointer=InstructionPointer+4
		    Case &h9e //OR R6
		      R6 = ALU(3,curBus.Read(InstructionPointer+1),curBus.Read(InstructionPointer+2))
		      stepCounter = 0
		      InstructionPointer=InstructionPointer+4
		    Case &h9f //OR R7
		      R0 = ALU(3,curBus.Read(InstructionPointer+1),curBus.Read(InstructionPointer+2))
		      stepCounter = 0
		      InstructionPointer=InstructionPointer+4
		    End Select
		  end if
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		ca As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		curBus As Bus
	#tag EndProperty

	#tag Property, Flags = &h0
		InstructionPointer As UInt16
	#tag EndProperty

	#tag Property, Flags = &h0
		InstructionRegister As Byte
	#tag EndProperty

	#tag Property, Flags = &h0
		MemoryPointer As UInt16
	#tag EndProperty

	#tag Property, Flags = &h0
		R0 As Byte
	#tag EndProperty

	#tag Property, Flags = &h0
		R1 As Byte
	#tag EndProperty

	#tag Property, Flags = &h0
		R2 As Byte
	#tag EndProperty

	#tag Property, Flags = &h0
		R3 As Byte
	#tag EndProperty

	#tag Property, Flags = &h0
		R4 As Byte
	#tag EndProperty

	#tag Property, Flags = &h0
		R5 As Byte
	#tag EndProperty

	#tag Property, Flags = &h0
		R6 As Byte
	#tag EndProperty

	#tag Property, Flags = &h0
		R7 As Byte
	#tag EndProperty

	#tag Property, Flags = &h0
		stepCounter As Byte
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
			Name="R0"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Byte"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="R1"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Byte"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="R2"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Byte"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="R3"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Byte"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="R4"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Byte"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="R5"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Byte"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="R6"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Byte"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="R7"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Byte"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="stepCounter"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Byte"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="InstructionPointer"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="UInt16"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="InstructionRegister"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Byte"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="MemoryPointer"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="UInt16"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
