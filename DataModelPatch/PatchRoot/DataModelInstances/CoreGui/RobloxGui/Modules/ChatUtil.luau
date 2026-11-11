return {
	Signal = function()
		local BindableEvent = Instance.new("BindableEvent")
		local List = nil
		local Selected = nil
		
		return {
			fire = function(_, ...)
				-- upvalues: List (ref), Selected (ref), BindableEvent (copy)
				List = { ... }
				Selected = select("#", ...)
				BindableEvent:Fire()
			end,
			connect = function(_, Callback)
				-- upvalues: BindableEvent (copy), List (ref), Selected (ref)
				if not Callback then
					error("connect(nil)", 2)
				end
				return BindableEvent.Event:connect(function()
					-- upvalues: Callback (copy), List (upval), Selected (upval)
					Callback(unpack(List, 1, Selected))
				end)
			end,
			wait = function(_)
				-- upvalues: BindableEvent (copy), List (ref), Selected (ref)
				BindableEvent.Event:wait()
				assert(List, "Missing arg data, likely due to :TweenSize/Position corrupting threadrefs.")
				
				return unpack(List, 1, Selected)
			end
		}
	end
}