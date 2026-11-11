local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local GetTransparencyStoreModule = require(ExpChat.Stores.GetTransparencyStore)
local UseIsChatBackgroundVisibleModule = require(ExpChat.Stores.GetTransparencyStore.useIsChatBackgroundVisible)
local UsePausableTimeoutModule = require(ExpChat.Stores.GetTransparencyStore.usePausableTimeout)
local DictationAnalyticsModule = require(script.Parent.DictationAnalytics)
local DictationFTUXStorageModule = require(script.Parent.DictationFTUXStorage)

return function(p1)
	-- upvalues: UseIsChatBackgroundVisibleModule (copy), GetTransparencyStoreModule (copy), SignalsReactModule (copy), ReactModule (copy), DictationFTUXStorageModule (copy), DictationAnalyticsModule (copy), UsePausableTimeoutModule (copy)
	local UseIsChatBackgroundVisibleModuleResult = UseIsChatBackgroundVisibleModule()
	local UseSignalStateResult = SignalsReactModule.useSignalState(GetTransparencyStoreModule(false).getIsTextBoxFocused)
	local UseStateResult, UseStateResult2 = ReactModule.useState(function()
		-- upvalues: DictationFTUXStorageModule (upval)
		return DictationFTUXStorageModule.hasBeenDismissed()
	end)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(function()
		-- upvalues: DictationFTUXStorageModule (upval)
		return DictationFTUXStorageModule.hasBeenUsed()
	end)
	local UseResult = ReactModule.useCallback(function(p2)
		-- upvalues: UseStateResult2 (copy), DictationFTUXStorageModule (upval), DictationAnalyticsModule (upval)
		UseStateResult2(function(p3)
			-- upvalues: DictationFTUXStorageModule (upval), DictationAnalyticsModule (upval), p2 (copy)
			if p3 then
				return p3
			else
				DictationFTUXStorageModule.markDismissed()
				DictationAnalyticsModule.fire(DictationAnalyticsModule.Events.FtuxDismiss, {
					[DictationAnalyticsModule.Properties.SttMode] = DictationAnalyticsModule.Modes.Continuous,
					[DictationAnalyticsModule.Properties.DismissReason] = p2 or DictationAnalyticsModule.DismissReasons.UserInteraction
				})
				
				return true
			end
		end)
	end, {})
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2_1 (copy), DictationFTUXStorageModule (upval)
		UseStateResult2_1(function(p2)
			-- upvalues: DictationFTUXStorageModule (upval)
			if p2 then
				return p2
			else
				DictationFTUXStorageModule.markUsed()
				
				return true
			end
		end)
	end, {})
	local UseIsChatBackgroundVisibleModuleResult1 = UseStateResult1 and (not UseStateResult and (p1.isEligible and (not p1.isComposing and (not p1.isActive and (not UseSignalStateResult and UseIsChatBackgroundVisibleModuleResult)))))
	UsePausableTimeoutModule(UseIsChatBackgroundVisibleModuleResult1, 10, (ReactModule.useCallback(function()
		-- upvalues: UseResult (copy), DictationAnalyticsModule (upval)
		UseResult(DictationAnalyticsModule.DismissReasons.Visibility)
	end, { UseResult })))
	local UseRefResult = ReactModule.useRef(false)
	ReactModule.useEffect(function()
		-- upvalues: UseIsChatBackgroundVisibleModuleResult1 (copy), UseRefResult (copy), DictationAnalyticsModule (upval)
		if UseIsChatBackgroundVisibleModuleResult1 and not UseRefResult.current then
			UseRefResult.current = true
			DictationAnalyticsModule.fire(DictationAnalyticsModule.Events.FtuxShown, {
				[DictationAnalyticsModule.Properties.SttMode] = DictationAnalyticsModule.Modes.Continuous
			})
		end
	end, { UseIsChatBackgroundVisibleModuleResult1 })
	
	return {
		shouldShow = UseIsChatBackgroundVisibleModuleResult1,
		dismiss = UseResult,
		markUsed = UseResult1
	}
end