local GuiService = game:GetService("GuiService")
local ServerDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local Parent = ServerDrivenUi.Parent
local ReactModule = require(Parent.React)
local ResponsiveModule = require(Parent.Responsive)
local GetInputModeStoreFunction = ResponsiveModule.GetInputModeStore
local Constants = require(Parent.HoldToPlay).Constants
local AppShortcutBarContext = require(Parent.AppShortcutBar).AppShortcutBarContext
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local FocusNavigationEventNameEnum = FocusNavigationUtilsModule.FocusNavigationEventNameEnum
local UseButtonHoldFunction = FocusNavigationUtilsModule.useButtonHold
local ButtonHoldStateEnum = FocusNavigationUtilsModule.ButtonHoldStateEnum
local GamePlayButtonModule = require(Parent.GamePlayButton)
local UseOnPlayButtonCallbackFunction = GamePlayButtonModule.useOnPlayButtonCallback
local UsePlayButtonStateFunction = GamePlayButtonModule.usePlayButtonState
local PlayButtonStates = GamePlayButtonModule.PlayButtonStates
local RobloxAppSessionizationModule = require(Parent.RobloxAppSessionization)
local SetGamePlaySessionFunction = RobloxAppSessionizationModule.SetGamePlaySession
local SessionType = RobloxAppSessionizationModule.SessionType
local HoldToPlayLauncher = require(Parent.DiscoveryAnalytics).Constants.Context.HoldToPlayLauncher
local _ = require(Parent.SduiCoreSystem)
local SduiFocusNavActionsModule = require(ServerDrivenUi.FocusNavigation.SduiFocusNavActions)
local UseSduiReportExperienceLaunchedFunction = require(Parent.SduiSharedContent).useSduiReportExperienceLaunched

return ReactModule.memo(function(p1)
	-- upvalues: ReactModule (copy), UseButtonHoldFunction (copy), Constants (copy), ButtonHoldStateEnum (copy), AppShortcutBarContext (copy), GuiService (copy), GetInputModeStoreFunction (copy), ResponsiveModule (copy), FocusNavigationEventNameEnum (copy), UsePlayButtonStateFunction (copy), UseOnPlayButtonCallbackFunction (copy), HoldToPlayLauncher (copy), UseSduiReportExperienceLaunchedFunction (copy), SetGamePlaySessionFunction (copy), SessionType (copy), PlayButtonStates (copy), SduiFocusNavActionsModule (copy)
	local Dependencies = p1.sduiContext.dependencies
	local Networking = Dependencies.networking
	local SessionService = Dependencies.sessionService
	local UseRefResult = ReactModule.useRef(nil)
	local UseButtonHoldResult = UseButtonHoldFunction(Constants.SIGNAL_HOLD_INTENT_SECONDS, Constants.SIGNAL_HOLD_COMPLETE_SECONDS)
	local IsHoldStateMatch: boolean = UseButtonHoldResult.holdState == ButtonHoldStateEnum.HOLDING or (UseButtonHoldResult.holdState == ButtonHoldStateEnum.JUST_PRESSED or UseButtonHoldResult.holdState == ButtonHoldStateEnum.COMPLETED)
	local IsHoldStateMatch1 = UseButtonHoldResult.holdState == ButtonHoldStateEnum.COMPLETED
	local UseDispatchButtonHoldStartedResult = AppShortcutBarContext.useDispatchButtonHoldStarted()
	local UseDispatchButtonHoldEndedResult = AppShortcutBarContext.useDispatchButtonHoldEnded()
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: p1 (copy), GuiService (upval)
		return if p1.guiObject then p1.guiObject else GuiService.SelectedCoreObject
	end, { p1.guiObject })
	local IsHoldStateMatch2: boolean = UseButtonHoldResult.holdState == ButtonHoldStateEnum.HOLDING or UseButtonHoldResult.holdState == ButtonHoldStateEnum.COMPLETED
	ReactModule.useEffect(function()
		-- upvalues: IsHoldStateMatch2 (copy), GetInputModeStoreFunction (upval), p1 (copy), ResponsiveModule (upval)
		if IsHoldStateMatch2 then
			local LastInputType = GetInputModeStoreFunction(false).getLastInputType(false)
			
			if p1.setDisabledForHold and LastInputType == ResponsiveModule.Input.Directional then
				p1.setDisabledForHold(true)
			end
		end
		return function()
			-- upvalues: p1 (upval)
			if p1.setDisabledForHold then
				p1.setDisabledForHold(false)
			end
		end
	end, { IsHoldStateMatch2, p1.setDisabledForHold })
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy), IsHoldStateMatch (copy), UseDispatchButtonHoldStartedResult (copy), FocusNavigationEventNameEnum (upval), UseButtonHoldResult (copy), UseDispatchButtonHoldEndedResult (copy)
		if not UseRefResult.current and IsHoldStateMatch then
			UseRefResult.current = true
			UseDispatchButtonHoldStartedResult(FocusNavigationEventNameEnum.HoldToPlay, UseButtonHoldResult.holdProgress)
			
			return
		end
		if UseRefResult.current and not IsHoldStateMatch then
			UseDispatchButtonHoldEndedResult(FocusNavigationEventNameEnum.HoldToPlay)
			UseRefResult.current = false
		end
	end, {
		IsHoldStateMatch,
		UseButtonHoldResult.holdProgress,
		UseDispatchButtonHoldStartedResult,
		UseDispatchButtonHoldEndedResult
	})
	local UsePlayButtonStateResult = UsePlayButtonStateFunction(Networking, p1.universeId)
	local UseOnPlayButtonCallbackResult = UseOnPlayButtonCallbackFunction(p1.universeId, nil, HoldToPlayLauncher, nil, nil)
	local UseSduiReportExperienceLaunchedResult = UseSduiReportExperienceLaunchedFunction(p1.sduiContext, p1.analyticsContext, p1.universeId, p1.placeId)
	ReactModule.useEffect(function()
		-- upvalues: IsHoldStateMatch1 (copy), UsePlayButtonStateResult (copy), SetGamePlaySessionFunction (upval), SessionService (copy), SessionType (upval), UseOnPlayButtonCallbackResult (copy), UseSduiReportExperienceLaunchedResult (copy), UseButtonHoldResult (copy), PlayButtonStates (upval)
		if IsHoldStateMatch1 then
			local PlayButtonState = UsePlayButtonStateResult.playButtonState
			SetGamePlaySessionFunction(SessionService, SessionType.StructuralIdentifier.GamePlayFromHoldToPlay, true)
			UseOnPlayButtonCallbackResult(PlayButtonState, UseSduiReportExperienceLaunchedResult)
			
			if UseButtonHoldResult.cancelHold and PlayButtonState == PlayButtonStates.Playable then
				UseButtonHoldResult.cancelHold()
			end
		end
	end, {
		IsHoldStateMatch1, UseButtonHoldResult.cancelHold,
		UsePlayButtonStateResult.playButtonState, SessionService,
		UseSduiReportExperienceLaunchedResult, UseOnPlayButtonCallbackResult
	})
	
	return ReactModule.createElement(SduiFocusNavActionsModule, {
		focusNavActions = ReactModule.useMemo(function()
			-- upvalues: FocusNavigationEventNameEnum (upval), UseButtonHoldResult (copy)
			return {
				keys = {
					[Enum.KeyCode.ButtonA] = FocusNavigationEventNameEnum.HoldToPlay
				},
				events = {
					[FocusNavigationEventNameEnum.HoldToPlay] = { handler = UseButtonHoldResult.eventHandler }
				}
			}
		end, { UseButtonHoldResult.eventHandler }),
		guiObject = UseMemoResult
	})
end)