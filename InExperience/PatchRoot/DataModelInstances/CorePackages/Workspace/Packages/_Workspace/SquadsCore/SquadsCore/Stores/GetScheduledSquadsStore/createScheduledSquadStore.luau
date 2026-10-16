local SquadsCore = script:FindFirstAncestor("SquadsCore")
local Parent = SquadsCore.Parent
local CryoModule = require(Parent.Cryo)
local SignalsModule = require(Parent.Signals)
local CreateComputedFunction = SignalsModule.createComputed
local GetSubscribedScheduledSquadsFunction = require(SquadsCore.NetworkRequests).getSubscribedScheduledSquads
local GetScheduledSquadStatusFunction = require(SquadsCore.NetworkRequests).getScheduledSquadStatus
local _ = require(SquadsCore.Types)

return function() --[[ Line: 25 ]]
	-- upvalues: SignalsModule (copy), CreateComputedFunction (copy), GetSubscribedScheduledSquadsFunction (copy), CryoModule (copy), GetScheduledSquadStatusFunction (copy)
	local Signal, Signal2 = SignalsModule.createSignal({})
	local Signal1, Signal2_1 = SignalsModule.createSignal({})
	
	local function _(p1) --[[ Line: 44 ]]
		-- upvalues: Signal1 (copy), Signal2_1 (copy), CryoModule (upval)
		Signal2_1(CryoModule.Dictionary.join(Signal1(false), { [p1.scheduledGroupUpId] = p1 }))
	end
	
	return {
		getSubscribedScheduledSquads = CreateComputedFunction(function(p1) --[[ Line: 30 ]]
			-- upvalues: Signal (copy)
			return Signal(p1)
		end),
		getScheduledSquadsStatus = CreateComputedFunction(function(p1) --[[ Line: 34 ]]
			-- upvalues: Signal1 (copy)
			return Signal1(p1)
		end),
		fetchSubscribedScheduledSquads = function() --[[ Line: 38 ]]
			-- upvalues: GetSubscribedScheduledSquadsFunction (upval), Signal2 (copy)
			GetSubscribedScheduledSquadsFunction(function(p1) --[[ Line: 39 ]]
				-- upvalues: Signal2 (upval)
				Signal2(p1)
			end, nil)
		end,
		fetchAndCacheScheduledSquadStatus = function(p1, Callback) --[[ Line: 49 ]]
			-- upvalues: GetScheduledSquadStatusFunction (upval), Signal1 (copy), Signal2_1 (copy), CryoModule (upval)
			GetScheduledSquadStatusFunction(p1, function(p2) --[[ Line: 50 ]]
				-- upvalues: Signal1 (upval), Signal2_1 (upval), CryoModule (upval), Callback (copy)
				Signal2_1(CryoModule.Dictionary.join(Signal1(false), { [p2.scheduledGroupUpId] = p2 }))
				
				if Callback then
					Callback()
				end
			end, function() --[[ Line: 55 ]]
				-- upvalues: Callback (copy)
				if Callback then
					Callback()
				end
			end)
		end
	}
end