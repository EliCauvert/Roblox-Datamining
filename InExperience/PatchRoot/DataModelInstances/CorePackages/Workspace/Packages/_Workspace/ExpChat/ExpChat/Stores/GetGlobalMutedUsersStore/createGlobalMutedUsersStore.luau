local CreateSignalFunction = require(script:FindFirstAncestor("ExpChat").Parent.Signals).createSignal

return function() --[[ Line: 29 ]]
	-- upvalues: CreateSignalFunction (copy)
	local Signal, Signal2 = CreateSignalFunction({})
	local Signal1, Signal2_1 = CreateSignalFunction({})
	local Signal3, Signal2_2 = CreateSignalFunction({})
	
	return {
		getMutedGlobalUsernames = Signal,
		getMutedGlobalDisplayNames = Signal1,
		getMutedGlobalUserIds = Signal3,
		muteGlobalUsername = function(Text: string) --[[ Line: 34 ]]
			-- upvalues: Signal (copy), Signal2 (copy)
			local Lowered = string.lower(Text)
			local Copy = table.clone(Signal(false))
			Copy[Lowered] = true
			Signal2(Copy)
		end,
		unmuteGlobalUsername = function(Text: string) --[[ Line: 41 ]]
			-- upvalues: Signal (copy), Signal2 (copy)
			local Lowered = string.lower(Text)
			local Copy = table.clone(Signal(false))
			Copy[Lowered] = nil
			Signal2(Copy)
		end,
		muteGlobalDisplayName = function(Text: string) --[[ Line: 48 ]]
			-- upvalues: Signal1 (copy), Signal2_1 (copy)
			local Lowered = string.lower(Text)
			local Copy = table.clone(Signal1(false))
			Copy[Lowered] = true
			Signal2_1(Copy)
		end,
		unmuteGlobalDisplayName = function(Text: string) --[[ Line: 55 ]]
			-- upvalues: Signal1 (copy), Signal2_1 (copy)
			local Lowered = string.lower(Text)
			local Copy = table.clone(Signal1(false))
			Copy[Lowered] = nil
			Signal2_1(Copy)
		end,
		isUsernameMuted = function(Text: string): boolean --[[ Line: 62 ]]
			-- upvalues: Signal (copy)
			return Signal(false)[string.lower(Text)] == true
		end,
		isDisplayNameMuted = function(Text: string): boolean --[[ Line: 66 ]]
			-- upvalues: Signal1 (copy)
			return Signal1(false)[string.lower(Text)] == true
		end,
		muteGlobalUserId = function(p1) --[[ Line: 70 ]]
			-- upvalues: Signal3 (copy), Signal2_2 (copy)
			local Text = tostring(p1)
			local Copy = table.clone(Signal3(false))
			Copy[Text] = true
			Signal2_2(Copy)
		end,
		unmuteGlobalUserId = function(p1) --[[ Line: 77 ]]
			-- upvalues: Signal3 (copy), Signal2_2 (copy)
			local Text = tostring(p1)
			local Copy = table.clone(Signal3(false))
			Copy[Text] = nil
			Signal2_2(Copy)
		end,
		isUserIdMuted = function(p1): boolean --[[ Line: 84 ]]
			-- upvalues: Signal3 (copy)
			return Signal3(false)[tostring(p1)] == true
		end
	}
end