return {
	CreateSignal = function()
		local t = {}
		local bindableEvent = Instance.new("BindableEvent")
		local var1 = nil
		local var2 = nil
		
		function t.fire(_, ...)
			-- upvalues: var1 (write), var2 (write), bindableEvent (ref)
			var1 = { ... }
			var2 = select("#", ...)
			bindableEvent:Fire()
		end
		
		function t.connect(_, p1)
			-- upvalues: bindableEvent (ref), var1 (write), var2 (write)
			if not p1 then
				error("connect(nil)", 2)
			end
			return bindableEvent.Event:Connect(function()
				-- upvalues: p1 (ref), var1 (copy), var2 (copy)
				p1(unpack(var1, 1, var2))
			end)
		end
		
		return t
	end
}