local CreateEffectFunction = require(script.Parent.Parent.Signals).createEffect

return function(Callback) --[[ Line: 8 | Named "createDetachedEffect" ]]
	-- upvalues: CreateEffectFunction (copy)
	local Flag = false
	local BindableEvent = nil
	
	local function disposeEffect() --[[ Line: 12 ]]
		-- upvalues: Flag (ref), BindableEvent (ref)
		if not Flag then
			Flag = true
			
			if BindableEvent ~= nil then
				BindableEvent:Fire()
			end
		end
	end
	
	local Effect: () -> () = CreateEffectFunction(function(p1) --[[ Line: 21 ]]
		-- upvalues: Callback (copy), disposeEffect (copy)
		Callback(p1, disposeEffect)
	end)
	
	if Flag then
		Effect()
	else
		local BindableEvent1 = Instance.new("BindableEvent")
		BindableEvent = BindableEvent1
		BindableEvent1.Event:Once(function() --[[ Line: 30 ]]
			-- upvalues: BindableEvent1 (copy), BindableEvent (ref), Effect (copy)
			BindableEvent1:Destroy()
			BindableEvent = nil
			Effect()
		end)
	end
end