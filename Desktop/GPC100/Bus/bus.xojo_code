#tag Class
Protected Class bus
	#tag Method, Flags = &h0
		Sub Constructor()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Read(addr As UInt16) As Byte
		  for each k as addrRange in memMapAddr
		    if k.includes(addr) then
		      
		      return   memMapDevice(memMapAddr.IndexOf(k)).Read(addr-k.startAddr)
		    end
		    
		  next
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Register(startAddr as Uint16, endAddr as Uint16, device as busDevice)
		  Dim r as new addrRange(startAddr,endAddr)
		  memMapAddr.Add(r)
		  memMapDevice.Add(device)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Write(Addr As UInt16, Data As Byte)
		  for each k as addrRange in memMapAddr
		    if k.includes(addr) then
		       memMapDevice(memMapAddr.IndexOf(k)).Write(addr-k.startAddr, data)
		      
		    end
		    
		  next
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		memMapAddr() As addrRange
	#tag EndProperty

	#tag Property, Flags = &h0
		memMapDevice() As busDevice
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
