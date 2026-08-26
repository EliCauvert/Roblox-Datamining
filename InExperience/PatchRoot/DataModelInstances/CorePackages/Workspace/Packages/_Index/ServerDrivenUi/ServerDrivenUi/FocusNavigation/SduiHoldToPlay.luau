local guiService = game:GetService("GuiService")
local serverDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local parent = serverDrivenUi.Parent
local reactModule = require(parent.React)
local responsiveModule = require(parent.Responsive)
local getInputModeStore = responsiveModule.GetInputModeStore
local constants = require(parent.HoldToPlay).Constants
local appShortcutBarContext = require(parent.AppShortcutBar).AppShortcutBarContext
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local focusNavigationEventNameEnum = focusNavigationUtilsModule.FocusNavigationEventNameEnum
local useButtonHold = focusNavigationUtilsModule.useButtonHold
local buttonHoldStateEnum = focusNavigationUtilsModule.ButtonHoldStateEnum
local gamePlayButtonModule = require(parent.GamePlayButton)
local useOnPlayButtonCallback = gamePlayButtonModule.useOnPlayButtonCallback
local usePlayButtonState = gamePlayButtonModule.usePlayButtonState
local playButtonStates = gamePlayButtonModule.PlayButtonStates
local robloxAppSessionizationModule = require(parent.RobloxAppSessionization)
local setGamePlaySession = robloxAppSessionizationModule.SetGamePlaySession
local sessionType = robloxAppSessionizationModule.SessionType
local holdToPlayLauncher = require(parent.DiscoveryAnalytics).Constants.Context.HoldToPlayLauncher
local _ = require(parent.SduiCoreSystem)
local sduiFocusNavActionsModule = require(serverDrivenUi.FocusNavigation.SduiFocusNavActions)
local useSduiReportExperienceLaunched = require(parent.SduiSharedContent).useSduiReportExperienceLaunched

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), useButtonHold (ref), constants (ref), buttonHoldStateEnum (ref), appShortcutBarContext (ref), guiService (ref), getInputModeStore (ref), responsiveModule (ref), focusNavigationEventNameEnum (ref), usePlayButtonState (ref), useOnPlayButtonCallback (ref), holdToPlayLauncher (ref), useSduiReportExperienceLaunched (ref), setGamePlaySession (ref), sessionType (ref), playButtonStates (ref), sduiFocusNavActionsModule (ref)
	local dependencies = p1.sduiContext.dependencies
	local networking = dependencies.networking
	local sessionService = dependencies.sessionService
	local var1 = reactModule.useRef(nil)
	local var2 = useButtonHold(constants.SIGNAL_HOLD_INTENT_SECONDS, constants.SIGNAL_HOLD_COMPLETE_SECONDS)
	local var3 = if var2.holdState ~= buttonHoldStateEnum.HOLDING then if var2.holdState ~= buttonHoldStateEnum.JUST_PRESSED then var2.holdState == buttonHoldStateEnum.COMPLETED else true else true
	local var4 = var2.holdState == buttonHoldStateEnum.COMPLETED
	local var5 = appShortcutBarContext.useDispatchButtonHoldStarted()
	local var6 = appShortcutBarContext.useDispatchButtonHoldEnded()
	local var7 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), guiService (copy)
		return if p1.guiObject then p1.guiObject else guiService.SelectedCoreObject
	end, { p1.guiObject })
	local var8 = if var2.holdState ~= buttonHoldStateEnum.HOLDING then var2.holdState == buttonHoldStateEnum.COMPLETED else true
	reactModule.useEffect(function()
		-- upvalues: var8 (ref), getInputModeStore (copy), p1 (ref), responsiveModule (copy)
		if var8 then
			if p1.setDisabledForHold and getInputModeStore(false).getLastInputType(false) == responsiveModule.Input.Directional then
				p1.setDisabledForHold(true)
			end
		end
		return function()
			-- upvalues: p1 (copy)
			if p1.setDisabledForHold then
				p1.setDisabledForHold(false)
			end
		end
	end, { var8, p1.setDisabledForHold })
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), var3 (ref), var5 (ref), focusNavigationEventNameEnum (copy), var2 (ref), var6 (ref)
		if not var1.current and var3 then
			var1.current = true
			var5(focusNavigationEventNameEnum.HoldToPlay, var2.holdProgress)
			
			return
		elseif var1.current and not var3 then
			var6(focusNavigationEventNameEnum.HoldToPlay)
			var1.current = false
		end
	end, { var3, var2.holdProgress, var5, var6 })
	local var9 = usePlayButtonState(networking, p1.universeId)
	local var10 = useOnPlayButtonCallback(p1.universeId, nil, holdToPlayLauncher, nil, nil)
	local var11 = useSduiReportExperienceLaunched(p1.sduiContext, p1.analyticsContext, p1.universeId, p1.placeId)
	reactModule.useEffect(function()
		-- upvalues: var4 (ref), var9 (ref), setGamePlaySession (copy), sessionService (ref), sessionType (copy), var10 (ref), var11 (ref), var2 (ref), playButtonStates (copy)
		if var4 then
			local playButtonState = var9.playButtonState
			setGamePlaySession(sessionService, sessionType.StructuralIdentifier.GamePlayFromHoldToPlay, true)
			var10(playButtonState, var11)
			
			if var2.cancelHold and playButtonState == playButtonStates.Playable then
				var2.cancelHold()
			end
		end
	end, {
		var4, var2.cancelHold, var9.playButtonState, sessionService, var11, var10
	})
	
	return reactModule.createElement(sduiFocusNavActionsModule, {
		focusNavActions = reactModule.useMemo(function()
			-- upvalues: focusNavigationEventNameEnum (copy), var2 (ref)
			return {
				keys = {
					[Enum.KeyCode.ButtonA] = focusNavigationEventNameEnum.HoldToPlay
				},
				events = {
					[focusNavigationEventNameEnum.HoldToPlay] = { handler = var2.eventHandler }
				}
			}
		end, { var2.eventHandler }),
		guiObject = var7
	})
end)