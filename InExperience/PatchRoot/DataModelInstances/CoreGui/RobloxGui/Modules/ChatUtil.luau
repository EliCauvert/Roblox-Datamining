return {
	Signal = function()
		local t = {}
		local bindableEvent = Instance.new("BindableEvent")
		local var2 = nil
		local var3 = nil
		
		function t.fire(_, ...)
			-- upvalues: var2 (write), var3 (write), bindableEvent (ref)
			var2 = { ... }
			var3 = select("#", ...)
			bindableEvent:Fire()
		end
		
		function t.connect(_, p0)
			-- upvalues: bindableEvent (ref), var2 (write), var3 (write)
			if not p0 then
				error("connect(nil)", 2)
			end
			return bindableEvent.Event:connect(function()
				-- upvalues: p0 (ref), var2 (copy), var3 (copy)
				p0(unpack(var2, 1, var3))
			end)
		end
		
		function t.wait(_)
			-- upvalues: bindableEvent (ref), var2 (write), var3 (write)
			bindableEvent.Event:wait()
			assert(var2, "Missing arg data, likely due to :TweenSize/Position corrupting threadrefs.")
			
			return unpack(var2, 1, var3)
		end
		
		return t
	end
}