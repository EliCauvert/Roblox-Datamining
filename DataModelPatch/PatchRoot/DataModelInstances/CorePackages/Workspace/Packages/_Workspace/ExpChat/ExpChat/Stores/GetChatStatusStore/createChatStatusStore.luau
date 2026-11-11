local CreateSignalFunction = require(script:FindFirstAncestor("ExpChat").Parent.Signals).createSignal

return function()
	-- upvalues: CreateSignalFunction (copy)
	local Unknown, Unknown2 = CreateSignalFunction("Unknown")
	
	return { getChatStatus = Unknown, setChatStatus = Unknown2 }
end