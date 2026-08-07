return function(...) --[[ line: 1 | named "waitForFirst" ]]
	local bindableEvent = Instance.new("BindableEvent")
	local list = { ... }
	
	local function fire(...) --[[ line: 5 ]]
		-- upvalues: list (ref), bindableEvent (ref)
		for i = 1, #list do
			list[i]:Disconnect()
		end
		return bindableEvent:Fire(...)
	end
	
	for i = 1, #list do
		list[i] = list[i]:Connect(fire)
	end
	return bindableEvent.Event:Wait()
end