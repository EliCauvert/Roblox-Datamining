local createEffect = require(script.Parent.Parent.Signals).createEffect

return function(p0)
	-- upvalues: createEffect (ref)
	local var0 = false
	local var1 = nil
	
	local function disposeEffect()
		-- upvalues: var0 (write), var1 (write)
		if not var0 then
			var0 = true
			
			if var1 ~= nil then
				var1:Fire()
			end
		end
	end
	
	local var3 = createEffect(function(p1)
		-- upvalues: p0 (ref), disposeEffect (ref)
		p0(p1, disposeEffect)
	end)
	local bindableEvent = Instance.new("BindableEvent")
	var1 = bindableEvent
	bindableEvent.Event:Once(function()
		-- upvalues: bindableEvent (ref), var1 (write), var3 (ref)
		bindableEvent:Destroy()
		var1 = nil
		var3()
	end)
end