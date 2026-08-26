local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local getPresetChatStoreModule = require(expChat.Stores.GetPresetChatStore)
local presetCooldownContextModule = require(script.Parent.PresetCooldownContext)

return function(value)
	-- upvalues: getPresetChatStoreModule (ref), signalsReactModule (ref), reactModule (ref), presetCooldownContextModule (ref)
	local var1 = getPresetChatStoreModule(false)
	local var2 = signalsReactModule.useSignalState(var1.getPresetCooldownEndsAt)
	local var3 = var2 ~= nil and os.clock() < var2
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), var1 (ref)
		if var2 == nil then return end
		local var4 = var2 - os.clock()
		
		if var4 <= 0 then
			var1.setPresetCooldownEndsAt(nil)
			
			return
		end
		local var5 = false
		task.delay(var4, function()
			-- upvalues: var5 (write), var1 (copy), var2 (copy)
			if var5 then return end
			if var1.getPresetCooldownEndsAt(false) == var2 then
				var1.setPresetCooldownEndsAt(nil)
			end
		end)
		
		return function()
			-- upvalues: var5 (write)
			var5 = true
		end
	end, {
		var2,
		var1.setPresetCooldownEndsAt,
		var1.getPresetCooldownEndsAt
	})
	
	return reactModule.createElement(presetCooldownContextModule.Provider, {
		value = reactModule.useMemo(function()
			-- upvalues: var2 (ref), var3 (ref)
			return { endsAt = var2, isCooldownActive = var3 }
		end, { var2, var3 })
	}, value.children)
end