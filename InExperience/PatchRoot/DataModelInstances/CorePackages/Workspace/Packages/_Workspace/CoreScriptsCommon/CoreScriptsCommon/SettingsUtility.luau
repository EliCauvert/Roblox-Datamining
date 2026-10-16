return {
	CreateSignal = function() --[[ Line: 2 ]]
		local BindableEvent = Instance.new("BindableEvent")
		local List = nil
		local Selected = nil
		
		return {
			fire = function(_, ...) --[[ Line: 10 ]]
				-- upvalues: List (ref), Selected (ref), BindableEvent (copy)
				List = { ... }
				Selected = select("#", ...)
				BindableEvent:Fire()
			end,
			connect = function(_, Callback) --[[ Line: 16 ]]
				-- upvalues: BindableEvent (copy), List (ref), Selected (ref)
				if not Callback then
					error("connect(nil)", 2)
				end
				return BindableEvent.Event:Connect(function() --[[ Line: 20 ]]
					-- upvalues: Callback (copy), List (upval), Selected (upval)
					Callback(unpack(List, 1, Selected))
				end)
			end
		}
	end
}