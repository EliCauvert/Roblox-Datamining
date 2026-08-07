local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local getTransparencyStoreModule = require(expChat.Stores.GetTransparencyStore)
local useIsChatBackgroundVisibleModule = require(expChat.Stores.GetTransparencyStore.useIsChatBackgroundVisible)
local usePausableTimeoutModule = require(expChat.Stores.GetTransparencyStore.usePausableTimeout)
local dictationAnalyticsModule = require(script.Parent.DictationAnalytics)
local dictationFTUXStorageModule = require(script.Parent.DictationFTUXStorage)

return function(p0) --[[ line: 44 | named "useDictationFTUX" ]]
	-- upvalues: useIsChatBackgroundVisibleModule (ref), getTransparencyStoreModule (ref), signalsReactModule (ref), reactModule (ref), dictationFTUXStorageModule (ref), dictationAnalyticsModule (ref), usePausableTimeoutModule (ref)
	local var8 = useIsChatBackgroundVisibleModule()
	local var9 = signalsReactModule.useSignalState(getTransparencyStoreModule(false).getIsTextBoxFocused)
	local var10, var11 = reactModule.useState(function() --[[ line: 53 ]]
		-- upvalues: dictationFTUXStorageModule (copy)
		return dictationFTUXStorageModule.hasBeenDismissed()
	end)
	local var12, var13 = reactModule.useState(function() --[[ line: 56 ]]
		-- upvalues: dictationFTUXStorageModule (copy)
		return dictationFTUXStorageModule.hasBeenUsed()
	end)
	local var14 = reactModule.useCallback(function(p1) --[[ line: 60 ]]
		-- upvalues: var11 (ref), dictationFTUXStorageModule (copy), dictationAnalyticsModule (copy)
		var11(function(p2) --[[ line: 63 ]]
			-- upvalues: dictationFTUXStorageModule (copy), dictationAnalyticsModule (copy), p1 (ref)
			if p2 then
				return p2
			end
			dictationFTUXStorageModule.markDismissed()
			dictationAnalyticsModule.fire(dictationAnalyticsModule.Events.FtuxDismiss, {
				[dictationAnalyticsModule.Properties.SttMode] = dictationAnalyticsModule.Modes.Continuous,
				[dictationAnalyticsModule.Properties.DismissReason] = p1 or dictationAnalyticsModule.DismissReasons.UserInteraction
			})
			
			return true
		end)
	end, {})
	local var15 = reactModule.useCallback(function() --[[ line: 77 ]]
		-- upvalues: var13 (ref), dictationFTUXStorageModule (copy)
		var13(function(p3) --[[ line: 78 ]]
			-- upvalues: dictationFTUXStorageModule (copy)
			if p3 then
				return p3
			end
			dictationFTUXStorageModule.markUsed()
			
			return true
		end)
	end, {})
	local var8_1 = var12 and (not var10 and (p0.isEligible and (not p0.isComposing and (not p0.isActive and (not var9 and var8)))))
	usePausableTimeoutModule(var8_1, 10, reactModule.useCallback(function() --[[ line: 102 ]]
		-- upvalues: var14 (ref), dictationAnalyticsModule (copy)
		var14(dictationAnalyticsModule.DismissReasons.Visibility)
	end, { var14 }))
	local var17 = reactModule.useRef(false)
	reactModule.useEffect(function() --[[ line: 111 ]]
		-- upvalues: var8_1 (ref), var17 (ref), dictationAnalyticsModule (copy)
		if var8_1 and not var17.current then
			var17.current = true
			dictationAnalyticsModule.fire(dictationAnalyticsModule.Events.FtuxShown, {
				[dictationAnalyticsModule.Properties.SttMode] = dictationAnalyticsModule.Modes.Continuous
			})
		end
	end, { var8_1 })
	
	return { shouldShow = var8_1, dismiss = var14, markUsed = var15 }
end