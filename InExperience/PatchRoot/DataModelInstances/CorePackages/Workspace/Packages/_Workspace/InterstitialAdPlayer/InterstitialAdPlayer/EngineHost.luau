local Parent = script.Parent
local AdSessionModule = require(Parent.AdSession)
local _ = require(Parent.types)

return {
	createEngineHost = function(p1)
		-- upvalues: AdSessionModule (copy)
		local v1 = nil
		local v2 = true
		local Callback = nil
		p1.visibilityChanged.Event:Connect(function(p2)
			-- upvalues: v2 (ref), Callback (ref)
			v2 = p2
			
			if Callback then
				Callback(p2)
			end
		end)
		
		return {
			config = p1.ad,
			userId = p1.userId,
			experience = p1.experience,
			reportResult = function(Cancelled)
				-- upvalues: v1 (ref), AdSessionModule (upval), p1 (copy)
				v1 = Cancelled
				
				if Cancelled == AdSessionModule.Result.Cancelled then
					p1.finished:Fire(Cancelled)
				end
			end,
			reportReadyToEnter = function()
				-- upvalues: p1 (copy), v1 (ref)
				p1.finished:Fire(v1)
			end,
			subscribeVisibility = function(Callback1: (any) -> ())
				-- upvalues: Callback (ref), v2 (ref)
				Callback = Callback1
				
				if not v2 then
					Callback1(false)
				end
				return function()
					-- upvalues: Callback (upval), Callback1 (copy)
					if Callback == Callback1 then
						Callback = nil
					end
				end
			end
		}
	end
}