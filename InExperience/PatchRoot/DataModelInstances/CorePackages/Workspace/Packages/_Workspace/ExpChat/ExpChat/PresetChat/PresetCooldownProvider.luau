local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local GetPresetChatStoreModule = require(ExpChat.Stores.GetPresetChatStore)
local PresetCooldownContextModule = require(script.Parent.PresetCooldownContext)

return function(p1)
	-- upvalues: GetPresetChatStoreModule (copy), SignalsReactModule (copy), ReactModule (copy), PresetCooldownContextModule (copy)
	local PresetChatStoreModule = GetPresetChatStoreModule(false)
	local UseSignalStateResult = SignalsReactModule.useSignalState(PresetChatStoreModule.getPresetCooldownEndsAt)
	local IsClockTimeBelow: boolean = UseSignalStateResult ~= nil and os.clock() < UseSignalStateResult
	ReactModule.useEffect(function()
		-- upvalues: UseSignalStateResult (copy), PresetChatStoreModule (copy)
		if UseSignalStateResult == nil then return end
		local UseSignalStateResultDelta = UseSignalStateResult - os.clock()
		
		if UseSignalStateResultDelta <= 0 then
			PresetChatStoreModule.setPresetCooldownEndsAt(nil)
			
			return
		end
		local Flag = false
		task.delay(UseSignalStateResultDelta, function()
			-- upvalues: Flag (ref), PresetChatStoreModule (upval), UseSignalStateResult (upval)
			if Flag then return end
			if PresetChatStoreModule.getPresetCooldownEndsAt(false) == UseSignalStateResult then
				PresetChatStoreModule.setPresetCooldownEndsAt(nil)
			end
		end)
		
		return function()
			-- upvalues: Flag (ref)
			Flag = true
		end
	end, {
		UseSignalStateResult,
		PresetChatStoreModule.setPresetCooldownEndsAt,
		PresetChatStoreModule.getPresetCooldownEndsAt
	})
	
	return ReactModule.createElement(PresetCooldownContextModule.Provider, {
		value = ReactModule.useMemo(function()
			-- upvalues: UseSignalStateResult (copy), IsClockTimeBelow (copy)
			return {
				endsAt = UseSignalStateResult,
				isCooldownActive = IsClockTimeBelow
			}
		end, { UseSignalStateResult, IsClockTimeBelow })
	}, p1.children)
end