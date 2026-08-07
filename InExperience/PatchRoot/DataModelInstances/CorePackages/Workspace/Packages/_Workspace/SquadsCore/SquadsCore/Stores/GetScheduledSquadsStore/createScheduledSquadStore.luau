local squadsCore = script:FindFirstAncestor("SquadsCore")
local parent = squadsCore.Parent
local cryoModule = require(parent.Cryo)
local signalsModule = require(parent.Signals)
local createComputed = signalsModule.createComputed
local getSubscribedScheduledSquads = require(squadsCore.NetworkRequests).getSubscribedScheduledSquads
local getScheduledSquadStatus = require(squadsCore.NetworkRequests).getScheduledSquadStatus
local _ = require(squadsCore.Types)

return function() --[[ line: 25 ]]
	-- upvalues: signalsModule (ref), createComputed (ref), getSubscribedScheduledSquads (ref), cryoModule (ref), getScheduledSquadStatus (ref)
	local var3, var4 = signalsModule.createSignal({})
	local var5, var6 = signalsModule.createSignal({})
	
	local _ = function(p0) --[[ line: 44 ]]
		-- upvalues: var5 (ref), var6 (ref), cryoModule (copy)
		var6(cryoModule.Dictionary.join(var5(false), { [p0.scheduledGroupUpId] = p0 }))
	end
	
	return {
		getSubscribedScheduledSquads = createComputed(function(p1) --[[ line: 30 ]]
			-- upvalues: var3 (ref)
			return var3(p1)
		end),
		getScheduledSquadsStatus = createComputed(function(p2) --[[ line: 34 ]]
			-- upvalues: var5 (ref)
			return var5(p2)
		end),
		fetchSubscribedScheduledSquads = function() --[[ line: 38 ]]
			-- upvalues: getSubscribedScheduledSquads (copy), var4 (ref)
			getSubscribedScheduledSquads(function(p3) --[[ line: 39 ]]
				-- upvalues: var4 (copy)
				var4(p3)
			end, nil)
		end,
		fetchAndCacheScheduledSquadStatus = function(p4, p5) --[[ line: 49 ]]
			-- upvalues: getScheduledSquadStatus (copy), var5 (ref), var6 (ref), cryoModule (copy)
			getScheduledSquadStatus(p4, function(p6) --[[ line: 50 ]]
				-- upvalues: var5 (copy), var6 (copy), cryoModule (copy), p5 (ref)
				var6(cryoModule.Dictionary.join(var5(false), { [p6.scheduledGroupUpId] = p6 }))
				
				if p5 then
					p5()
				end
			end, function() --[[ line: 55 ]]
				-- upvalues: p5 (ref)
				if p5 then
					p5()
				end
			end)
		end
	}
end