return {
	CreateSignal = function() --[[ line: 2 ]]
		local t = {}
		local bindableEvent = Instance.new("BindableEvent")
		local var2 = nil
		local var3 = nil
		
		function t.fire(_, ...) --[[ line: 10 ]]
			-- upvalues: var2 (write), var3 (write), bindableEvent (ref)
			var2 = { ... }
			var3 = select("#", ...)
			bindableEvent:Fire()
		end
		
		function t.connect(_, p0) --[[ line: 16 ]]
			-- upvalues: bindableEvent (ref), var2 (write), var3 (write)
			if not p0 then
				error("connect(nil)", 2)
			end
			return bindableEvent.Event:Connect(function() --[[ line: 20 ]]
				-- upvalues: p0 (ref), var2 (copy), var3 (copy)
				p0(unpack(var2, 1, var3))
			end)
		end
		
		return t
	end
}