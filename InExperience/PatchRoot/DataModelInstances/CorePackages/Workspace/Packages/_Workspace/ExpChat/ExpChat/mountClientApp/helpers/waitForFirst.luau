return function(...) --[[ Line: 1 | Named "waitForFirst" ]]
	local BindableEvent = Instance.new("BindableEvent")
	local Connections = { ... }
	
	local function fire(...) --[[ Line: 5 ]]
		-- upvalues: Connections (copy), BindableEvent (copy)
		for i = 1, #Connections do
			Connections[i]:Disconnect()
		end
		return BindableEvent:Fire(...)
	end
	
	for i = 1, #Connections do
		Connections[i] = Connections[i]:Connect(fire)
	end
	return BindableEvent.Event:Wait()
end