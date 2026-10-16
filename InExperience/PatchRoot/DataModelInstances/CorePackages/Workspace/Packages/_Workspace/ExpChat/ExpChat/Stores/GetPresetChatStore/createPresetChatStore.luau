local CreateSignalFunction = require(script:FindFirstAncestor("ExpChat").Parent.Signals).createSignal

return function() --[[ Line: 75 ]]
	-- upvalues: CreateSignalFunction (copy)
	local Signal, Signal2 = CreateSignalFunction(false)
	local Signal1, Signal2_1 = CreateSignalFunction(true)
	local Signal3, Signal2_2 = CreateSignalFunction(false)
	local Signal4, Signal2_3 = CreateSignalFunction({})
	local Signal5, Signal2_4 = CreateSignalFunction(1)
	local Signal6, Signal2_5 = CreateSignalFunction("")
	local Disabled, Disabled2 = CreateSignalFunction("Disabled")
	local Signal7, Signal2_6 = CreateSignalFunction(nil)
	local Signal8, Signal2_7 = CreateSignalFunction(nil)
	local Signal9, Signal2_8 = CreateSignalFunction(0)
	local Signal10, Signal2_9 = CreateSignalFunction({})
	local Signal11, Signal2_10 = CreateSignalFunction({})
	
	return {
		getIsEnabled = Signal,
		getIsLoading = Signal1,
		getIsTrayOpen = Signal3,
		getCategoryGroups = Signal4,
		getSelectedGroupIndex = Signal5,
		getVersion = Signal6,
		getAccessLevel = Disabled,
		getLayoutModeOverride = Signal7,
		getPresetCooldownEndsAt = Signal8,
		getChatWindowBottomY = Signal9,
		getPresetClickCounts = Signal10,
		getViewedGroupIds = Signal11,
		setIsEnabled = Signal2,
		setIsLoading = Signal2_1,
		setIsTrayOpen = Signal2_2,
		setCategoryGroups = Signal2_3,
		setSelectedGroupIndex = Signal2_4,
		setVersion = Signal2_5,
		setAccessLevel = Disabled2,
		setLayoutModeOverride = Signal2_6,
		setPresetCooldownEndsAt = Signal2_7,
		setChatWindowBottomY = Signal2_8,
		setPresetClickCounts = Signal2_9,
		incrementPresetClickCount = function(Key) --[[ Line: 89 ]]
			-- upvalues: Signal10 (copy), Signal2_9 (copy)
			local Copy = table.clone(Signal10(false))
			Copy[Key] = if Copy[Key] then Copy[Key] + 1 else 1
			Signal2_9(Copy)
		end,
		setViewedGroupIds = Signal2_10,
		markGroupViewed = function(Key) --[[ Line: 95 ]]
			-- upvalues: Signal11 (copy), Signal2_10 (copy)
			if not Signal11(false)[Key] then
				local Copy = table.clone(Signal11(false))
				Copy[Key] = true
				Signal2_10(Copy)
				
				return
			end
		end
	}
end