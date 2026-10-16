local Parent = script.Parent.Parent
local SignalsExperimentalModule = require(Parent.SignalsExperimental)
local ActionHandlersModule = require(script.Parent.ActionHandlers)
local FFlagSignalsRegistryOwnedFanout = require(Parent.SharedFlags).FFlagSignalsRegistryOwnedFanout

return function(p1) --[[ Line: 8 | Named "createSignalsMiddleware" ]]
	-- upvalues: FFlagSignalsRegistryOwnedFanout (copy), SignalsExperimentalModule (copy), ActionHandlersModule (copy)
	return function(Callback, _) --[[ Line: 9 ]]
		-- upvalues: FFlagSignalsRegistryOwnedFanout (upval), SignalsExperimentalModule (upval), ActionHandlersModule (upval), p1 (copy)
		return function(p2) --[[ Line: 10 ]]
			-- upvalues: FFlagSignalsRegistryOwnedFanout (upval), SignalsExperimentalModule (upval), ActionHandlersModule (upval), p1 (upval), Callback (copy)
			if FFlagSignalsRegistryOwnedFanout then
				local v1 = nil
				SignalsExperimentalModule.batch(function() --[[ Line: 13 ]]
					-- upvalues: ActionHandlersModule (upval), p1 (upval), p2 (copy), v1 (ref), Callback (upval)
					ActionHandlersModule.handleAction(p1, p2)
					v1 = Callback(p2)
				end)
				
				return v1
			end
			local v1 = p1[p2.type]
			
			if v1 and #v1 > 0 then
				SignalsExperimentalModule.batch(function() --[[ Line: 25 ]]
					-- upvalues: v1 (copy), p2 (copy), Callback (upval)
					local v2 = true
					
					for _, value in v1 do
						v2 = value(p2) and v2
					end
					return if v2 then nil else Callback(p2)
				end)
				
				return nil
			else
				return Callback(p2)
			end
		end
	end
end