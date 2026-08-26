local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local getTransparencyStoreModule = require(expChat.Stores.GetTransparencyStore)
local useIsChatBackgroundVisibleModule = require(expChat.Stores.GetTransparencyStore.useIsChatBackgroundVisible)
local usePausableTimeoutModule = require(expChat.Stores.GetTransparencyStore.usePausableTimeout)
local dictationAnalyticsModule = require(script.Parent.DictationAnalytics)
local dictationFTUXStorageModule = require(script.Parent.DictationFTUXStorage)

return function(p1)
	-- upvalues: useIsChatBackgroundVisibleModule (ref), getTransparencyStoreModule (ref), signalsReactModule (ref), reactModule (ref), dictationFTUXStorageModule (ref), dictationAnalyticsModule (ref), usePausableTimeoutModule (ref)
	local var1 = useIsChatBackgroundVisibleModule()
	local var2 = signalsReactModule.useSignalState(getTransparencyStoreModule(false).getIsTextBoxFocused)
	local var3, var4 = reactModule.useState(function()
		-- upvalues: dictationFTUXStorageModule (copy)
		return dictationFTUXStorageModule.hasBeenDismissed()
	end)
	local var5, var6 = reactModule.useState(function()
		-- upvalues: dictationFTUXStorageModule (copy)
		return dictationFTUXStorageModule.hasBeenUsed()
	end)
	local var7 = reactModule.useCallback(function(p2)
		-- upvalues: var4 (ref), dictationFTUXStorageModule (copy), dictationAnalyticsModule (copy)
		var4(function(p3)
			-- upvalues: dictationFTUXStorageModule (copy), dictationAnalyticsModule (copy), p2 (ref)
			if p3 then
				return p3
			end
			dictationFTUXStorageModule.markDismissed()
			dictationAnalyticsModule.fire(dictationAnalyticsModule.Events.FtuxDismiss, {
				[dictationAnalyticsModule.Properties.SttMode] = dictationAnalyticsModule.Modes.Continuous,
				[dictationAnalyticsModule.Properties.DismissReason] = p2 or dictationAnalyticsModule.DismissReasons.UserInteraction
			})
			
			return true
		end)
	end, {})
	local var8 = reactModule.useCallback(function()
		-- upvalues: var6 (ref), dictationFTUXStorageModule (copy)
		var6(function(p2)
			-- upvalues: dictationFTUXStorageModule (copy)
			if p2 then
				return p2
			end
			dictationFTUXStorageModule.markUsed()
			
			return true
		end)
	end, {})
	local var9 = var5 and (not var3 and (p1.isEligible and (not p1.isComposing and (not p1.isActive and (not var2 and var1)))))
	usePausableTimeoutModule(var9, 10, reactModule.useCallback(function()
		-- upvalues: var7 (ref), dictationAnalyticsModule (copy)
		var7(dictationAnalyticsModule.DismissReasons.Visibility)
	end, { var7 }))
	local var10 = reactModule.useRef(false)
	reactModule.useEffect(function()
		-- upvalues: var9 (ref), var10 (ref), dictationAnalyticsModule (copy)
		if var9 and not var10.current then
			var10.current = true
			dictationAnalyticsModule.fire(dictationAnalyticsModule.Events.FtuxShown, {
				[dictationAnalyticsModule.Properties.SttMode] = dictationAnalyticsModule.Modes.Continuous
			})
		end
	end, { var9 })
	
	return { shouldShow = var9, dismiss = var7, markUsed = var8 }
end