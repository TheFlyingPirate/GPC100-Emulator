#tag Class
Protected Class mainSystem
	#tag Method, Flags = &h0
		Sub Constructor()
		  Dim b() as byte
		  firmwareROM = new ROM(b)
		  ram = new RAM(100)
		  ram.Write(8,&b00000011)
		  mainBus = new bus
		  cpu = new CPU(mainBus)
		  mainBus.Register(&h4C,163,ram)
		  mainBus.Register(0,&h4B,firmwareROM)
		  gpu =new GPU
		  mainBus.register(&h8000,&h8007,gpu)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub tick()
		  self.cpu.tick()
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		cpu As CPU
	#tag EndProperty

	#tag Property, Flags = &h0
		firmwareROM As ROM
	#tag EndProperty

	#tag Property, Flags = &h0
		gpu As GPU
	#tag EndProperty

	#tag Property, Flags = &h0
		mainBus As Bus
	#tag EndProperty

	#tag Property, Flags = &h0
		ram As RAM
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
			Name="cpu"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
