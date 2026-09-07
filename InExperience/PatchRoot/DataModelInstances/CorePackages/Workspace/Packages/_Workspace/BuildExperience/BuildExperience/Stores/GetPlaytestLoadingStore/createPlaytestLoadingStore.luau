local signalsModule = require(script:FindFirstAncestor("BuildExperience").Parent.Signals)

return function()
	-- upvalues: signalsModule (ref)
	local t = {}
	
	local function getLoadingSignal(value)
		-- upvalues: t (ref), signalsModule (copy)
		local var1 = t[value]
		
		if var1 == nil then
			local idle, idle_1 = signalsModule.createSignal("Idle")
			local idle_2, idle_3 = signalsModule.createSignal("Idle")
			var1 = {
				getAgentStatus = idle,
				setAgentStatus = idle_1,
				getPlaytestStatus = idle_2,
				setPlaytestStatus = idle_3,
				getStatus = signalsModule.createComputed(function(p1)
					-- upvalues: idle (ref), idle_2 (ref)
					return if idle(p1) == "Loading" or idle_2(p1) == "Loading" then "Loading" elseif idle(p1) == "Completed" or idle_2(p1) == "Completed" then "Completed" else "Idle"
				end),
				getIsPlaytestLoading = signalsModule.createComputed(function(p1)
					-- upvalues: idle_2 (ref)
					return idle_2(p1) == "Loading"
				end)
			}
			t[value] = var1
		end
		return var1
	end
	
	return {
		getAgentStatusForPlaceId = function(p1)
			-- upvalues: getLoadingSignal (ref)
			return getLoadingSignal(p1).getAgentStatus
		end,
		getPlaytestStatusForPlaceId = function(p1)
			-- upvalues: getLoadingSignal (ref)
			return getLoadingSignal(p1).getPlaytestStatus
		end,
		getStatusForPlaceId = function(p1)
			-- upvalues: getLoadingSignal (ref)
			return getLoadingSignal(p1).getStatus
		end,
		getIsPlaytestLoadingForPlaceId = function(p1)
			-- upvalues: getLoadingSignal (ref)
			return getLoadingSignal(p1).getIsPlaytestLoading
		end,
		setAgentStatusForPlaceId = function(value, p1)
			-- upvalues: getLoadingSignal (ref)
			getLoadingSignal(value).setAgentStatus(p1)
		end,
		setPlaytestStatusForPlaceId = function(value, p1)
			-- upvalues: getLoadingSignal (ref)
			getLoadingSignal(value).setPlaytestStatus(p1)
		end,
		clearCompletedStatusForPlaceId = function(p1)
			-- upvalues: getLoadingSignal (ref)
			local var1 = getLoadingSignal(p1)
			
			if var1.getStatus() == "Completed" then
				var1.setAgentStatus("Idle")
				var1.setPlaytestStatus("Idle")
				
				return
			end
		end
	}
end