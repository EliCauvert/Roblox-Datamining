local squadsCore = script:FindFirstAncestor("SquadsCore")
local parent = squadsCore.Parent
local cryoModule = require(parent.Cryo)
local signalsModule = require(parent.Signals)
local createComputed = signalsModule.createComputed
local getSubscribedScheduledSquads = require(squadsCore.NetworkRequests).getSubscribedScheduledSquads
local getScheduledSquadStatus = require(squadsCore.NetworkRequests).getScheduledSquadStatus
local _ = require(squadsCore.Types)

return function()
	-- upvalues: signalsModule (ref), createComputed (ref), getSubscribedScheduledSquads (ref), cryoModule (ref), getScheduledSquadStatus (ref)
	local var1, var2 = signalsModule.createSignal({})
	local var3, var4 = signalsModule.createSignal({})
	
	local _ = function(p1)
		-- upvalues: var3 (ref), var4 (ref), cryoModule (copy)
		var4(cryoModule.Dictionary.join(var3(false), { [p1.scheduledGroupUpId] = p1 }))
	end
	
	return {
		getSubscribedScheduledSquads = createComputed(function(p1)
			-- upvalues: var1 (ref)
			return var1(p1)
		end),
		getScheduledSquadsStatus = createComputed(function(p1)
			-- upvalues: var3 (ref)
			return var3(p1)
		end),
		fetchSubscribedScheduledSquads = function()
			-- upvalues: getSubscribedScheduledSquads (copy), var2 (ref)
			getSubscribedScheduledSquads(function(p1)
				-- upvalues: var2 (copy)
				var2(p1)
			end, nil)
		end,
		fetchAndCacheScheduledSquadStatus = function(p1, p2)
			-- upvalues: getScheduledSquadStatus (copy), var3 (ref), var4 (ref), cryoModule (copy)
			getScheduledSquadStatus(p1, function(p3)
				-- upvalues: var3 (copy), var4 (copy), cryoModule (copy), p2 (ref)
				var4(cryoModule.Dictionary.join(var3(false), { [p3.scheduledGroupUpId] = p3 }))
				
				if p2 then
					p2()
				end
			end, function()
				-- upvalues: p2 (ref)
				if p2 then
					p2()
				end
			end)
		end
	}
end