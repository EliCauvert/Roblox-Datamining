local signalsModule = require(script:FindFirstAncestor("BuildExperience").Parent.Signals)

return function()
	-- upvalues: signalsModule (ref)
	local t = {}
	
	local function getLoadingSignal(value)
		-- upvalues: t (ref), signalsModule (copy)
		local var3 = t[value]
		
		if var3 == nil then
			local idle, idle_1 = signalsModule.createSignal("Idle")
			local idle_2, idle_3 = signalsModule.createSignal("Idle")
			var3 = {
				getAgentStatus = idle,
				setAgentStatus = idle_1,
				getPlaytestStatus = idle_2,
				setPlaytestStatus = idle_3,
				getStatus = signalsModule.createComputed(function(p0)
					-- upvalues: idle (ref), idle_2 (ref)
					return if idle(p0) == "Loading" or idle_2(p0) == "Loading" then "Loading" elseif idle(p0) == "Completed" or idle_2(p0) == "Completed" then "Completed" else "Idle"
				end),
				getIsPlaytestLoading = signalsModule.createComputed(function(p1)
					-- upvalues: idle_2 (ref)
					return idle_2(p1) == "Loading"
				end)
			}
			t[value] = var3
		end
		return var3
	end
	
	return {
		getAgentStatusForPlaceId = function(p2)
			-- upvalues: getLoadingSignal (ref)
			return getLoadingSignal(p2).getAgentStatus
		end,
		getPlaytestStatusForPlaceId = function(p3)
			-- upvalues: getLoadingSignal (ref)
			return getLoadingSignal(p3).getPlaytestStatus
		end,
		getStatusForPlaceId = function(p4)
			-- upvalues: getLoadingSignal (ref)
			return getLoadingSignal(p4).getStatus
		end,
		getIsPlaytestLoadingForPlaceId = function(p5)
			-- upvalues: getLoadingSignal (ref)
			return getLoadingSignal(p5).getIsPlaytestLoading
		end,
		setAgentStatusForPlaceId = function(value, p6)
			-- upvalues: getLoadingSignal (ref)
			getLoadingSignal(value).setAgentStatus(p6)
		end,
		setPlaytestStatusForPlaceId = function(value, p7)
			-- upvalues: getLoadingSignal (ref)
			getLoadingSignal(value).setPlaytestStatus(p7)
		end,
		clearCompletedStatusForPlaceId = function(p8)
			-- upvalues: getLoadingSignal (ref)
			local var8 = getLoadingSignal(p8)
			
			if var8.getStatus() == "Completed" then
				var8.setAgentStatus("Idle")
				var8.setPlaytestStatus("Idle")
				
				return
			end
		end
	}
end