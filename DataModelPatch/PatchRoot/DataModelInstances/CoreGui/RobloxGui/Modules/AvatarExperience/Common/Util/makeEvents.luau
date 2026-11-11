return function(List)
	local Events = {}
	local t = {}
	local t1 = {}
	
	for _, value in List do
		local BindableEvent = Instance.new("BindableEvent")
		Events[value] = BindableEvent.Event
		
		t[value] = function(...)
			-- upvalues: BindableEvent (copy)
			BindableEvent:Fire(...)
		end
		
		t1[value] = function()
			-- upvalues: BindableEvent (copy)
			BindableEvent:Destroy()
		end
	end
	return Events, t, t1
end