local createEffect = require(script.Parent.Parent.Signals).createEffect

return function(p1)
	-- upvalues: createEffect (ref)
	local var1 = false
	local var2 = nil
	
	local function disposeEffect()
		-- upvalues: var1 (write), var2 (write)
		if not var1 then
			var1 = true
			
			if var2 ~= nil then
				var2:Fire()
			end
		end
	end
	
	local var3 = createEffect(function(p2)
		-- upvalues: p1 (ref), disposeEffect (ref)
		p1(p2, disposeEffect)
	end)
	local bindableEvent = Instance.new("BindableEvent")
	var2 = bindableEvent
	bindableEvent.Event:Once(function()
		-- upvalues: bindableEvent (ref), var2 (write), var3 (ref)
		bindableEvent:Destroy()
		var2 = nil
		var3()
	end)
end