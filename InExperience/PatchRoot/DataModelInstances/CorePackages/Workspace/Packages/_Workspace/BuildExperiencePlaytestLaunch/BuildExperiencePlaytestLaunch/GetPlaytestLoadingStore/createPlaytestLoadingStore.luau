local SignalsModule = require(script:FindFirstAncestor("BuildExperiencePlaytestLaunch").Parent.Signals)

return function() --[[ Line: 22 | Named "createPlaytestLoadingStore" ]]
	-- upvalues: SignalsModule (copy)
	local t = {}
	
	local function getLoadingSignal(Key) --[[ Line: 35 ]]
		-- upvalues: t (copy), SignalsModule (upval)
		local Entry = t[Key]
		
		if Entry == nil then
			local Idle, Idle2 = SignalsModule.createSignal("Idle")
			local Idle1, Idle2_1 = SignalsModule.createSignal("Idle")
			Entry = {
				getAgentStatus = Idle,
				setAgentStatus = Idle2,
				getPlaytestStatus = Idle1,
				setPlaytestStatus = Idle2_1,
				getStatus = SignalsModule.createComputed(function(p1): string --[[ Line: 41 ]]
					-- upvalues: Idle (copy), Idle1 (copy)
					return if Idle(p1) == "Loading" or Idle1(p1) == "Loading" then "Loading" elseif Idle(p1) == "Completed" or Idle1(p1) == "Completed" then "Completed" else "Idle"
				end),
				getIsPlaytestLoading = SignalsModule.createComputed(function(p1): boolean --[[ Line: 51 ]]
					-- upvalues: Idle1 (copy)
					return Idle1(p1) == "Loading"
				end)
			}
			t[Key] = Entry
		end
		return Entry
	end
	
	return {
		getAgentStatusForPlaceId = function(p1) --[[ Line: 67 ]]
			-- upvalues: getLoadingSignal (copy)
			return getLoadingSignal(p1).getAgentStatus
		end,
		getPlaytestStatusForPlaceId = function(p1) --[[ Line: 71 ]]
			-- upvalues: getLoadingSignal (copy)
			return getLoadingSignal(p1).getPlaytestStatus
		end,
		getStatusForPlaceId = function(p1) --[[ Line: 75 ]]
			-- upvalues: getLoadingSignal (copy)
			return getLoadingSignal(p1).getStatus
		end,
		getIsPlaytestLoadingForPlaceId = function(p1) --[[ Line: 79 ]]
			-- upvalues: getLoadingSignal (copy)
			return getLoadingSignal(p1).getIsPlaytestLoading
		end,
		setAgentStatusForPlaceId = function(p1, p2) --[[ Line: 83 ]]
			-- upvalues: getLoadingSignal (copy)
			getLoadingSignal(p1).setAgentStatus(p2)
		end,
		setPlaytestStatusForPlaceId = function(p1, p2) --[[ Line: 87 ]]
			-- upvalues: getLoadingSignal (copy)
			getLoadingSignal(p1).setPlaytestStatus(p2)
		end,
		clearCompletedStatusForPlaceId = function(p1) --[[ Line: 91 ]]
			-- upvalues: getLoadingSignal (copy)
			local LoadingSignal = getLoadingSignal(p1)
			
			if LoadingSignal.getStatus() == "Completed" then
				LoadingSignal.setAgentStatus("Idle")
				LoadingSignal.setPlaytestStatus("Idle")
				
				return
			end
		end
	}
end