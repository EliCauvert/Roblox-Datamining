local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local getPresetChatStoreModule = require(expChat.Stores.GetPresetChatStore)
local presetCooldownContextModule = require(script.Parent.PresetCooldownContext)

return function(value)
	-- upvalues: getPresetChatStoreModule (ref), signalsReactModule (ref), reactModule (ref), presetCooldownContextModule (ref)
	local var5 = getPresetChatStoreModule(false)
	local var6 = signalsReactModule.useSignalState(var5.getPresetCooldownEndsAt)
	local var7 = var6 ~= nil and os.clock() < var6
	reactModule.useEffect(function()
		-- upvalues: var6 (ref), var5 (ref)
		if var6 == nil then return end
		local var8 = var6 - os.clock()
		
		if var8 <= 0 then
			var5.setPresetCooldownEndsAt(nil)
			
			return
		end
		local var9 = false
		task.delay(var8, function()
			-- upvalues: var9 (write), var5 (copy), var6 (copy)
			if var9 then return end
			if var5.getPresetCooldownEndsAt(false) == var6 then
				var5.setPresetCooldownEndsAt(nil)
			end
		end)
		
		return function()
			-- upvalues: var9 (write)
			var9 = true
		end
	end, {
		var6,
		var5.setPresetCooldownEndsAt,
		var5.getPresetCooldownEndsAt
	})
	
	return reactModule.createElement(presetCooldownContextModule.Provider, {
		value = reactModule.useMemo(function()
			-- upvalues: var6 (ref), var7 (ref)
			return { endsAt = var6, isCooldownActive = var7 }
		end, { var6, var7 })
	}, value.children)
end