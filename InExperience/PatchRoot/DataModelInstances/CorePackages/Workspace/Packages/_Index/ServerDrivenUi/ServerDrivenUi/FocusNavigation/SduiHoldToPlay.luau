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

return reactModule.memo(function(p0) --[[ line: 50 | named "SduiHoldToPlay" ]]
	-- upvalues: reactModule (ref), useButtonHold (ref), constants (ref), buttonHoldStateEnum (ref), appShortcutBarContext (ref), guiService (ref), getInputModeStore (ref), responsiveModule (ref), focusNavigationEventNameEnum (ref), usePlayButtonState (ref), useOnPlayButtonCallback (ref), holdToPlayLauncher (ref), useSduiReportExperienceLaunched (ref), setGamePlaySession (ref), sessionType (ref), playButtonStates (ref), sduiFocusNavActionsModule (ref)
	local dependencies = p0.sduiContext.dependencies
	local networking = dependencies.networking
	local sessionService = dependencies.sessionService
	local var8 = reactModule.useRef(nil)
	local var9 = useButtonHold(constants.SIGNAL_HOLD_INTENT_SECONDS, constants.SIGNAL_HOLD_COMPLETE_SECONDS)
	local var10 = if var9.holdState ~= buttonHoldStateEnum.HOLDING then if var9.holdState ~= buttonHoldStateEnum.JUST_PRESSED then var9.holdState == buttonHoldStateEnum.COMPLETED else true else true
	local var11 = var9.holdState == buttonHoldStateEnum.COMPLETED
	local var12 = appShortcutBarContext.useDispatchButtonHoldStarted()
	local var13 = appShortcutBarContext.useDispatchButtonHoldEnded()
	local var14 = reactModule.useMemo(function() --[[ line: 65 ]]
		-- upvalues: p0 (ref), guiService (copy)
		return if p0.guiObject then p0.guiObject else guiService.SelectedCoreObject
	end, { p0.guiObject })
	local var15 = if var9.holdState ~= buttonHoldStateEnum.HOLDING then var9.holdState == buttonHoldStateEnum.COMPLETED else true
	reactModule.useEffect(function() --[[ line: 76 ]]
		-- upvalues: var15 (ref), getInputModeStore (copy), p0 (ref), responsiveModule (copy)
		if var15 then
			if p0.setDisabledForHold and getInputModeStore(false).getLastInputType(false) == responsiveModule.Input.Directional then
				p0.setDisabledForHold(true)
			end
		end
		return function() --[[ line: 84 ]]
			-- upvalues: p0 (copy)
			if p0.setDisabledForHold then
				p0.setDisabledForHold(false)
			end
		end
	end, { var15, p0.setDisabledForHold })
	reactModule.useEffect(function() --[[ line: 96 ]]
		-- upvalues: var8 (ref), var10 (ref), var12 (ref), focusNavigationEventNameEnum (copy), var9 (ref), var13 (ref)
		if not var8.current and var10 then
			var8.current = true
			var12(focusNavigationEventNameEnum.HoldToPlay, var9.holdProgress)
			
			return
		elseif var8.current and not var10 then
			var13(focusNavigationEventNameEnum.HoldToPlay)
			var8.current = false
		end
	end, { var10, var9.holdProgress, var12, var13 })
	local var16 = usePlayButtonState(networking, p0.universeId)
	local var17 = useOnPlayButtonCallback(p0.universeId, nil, holdToPlayLauncher, nil, nil)
	local var18 = useSduiReportExperienceLaunched(p0.sduiContext, p0.analyticsContext, p0.universeId, p0.placeId)
	reactModule.useEffect(function() --[[ line: 112 ]]
		-- upvalues: var11 (ref), var16 (ref), setGamePlaySession (copy), sessionService (ref), sessionType (copy), var17 (ref), var18 (ref), var9 (ref), playButtonStates (copy)
		if var11 then
			local playButtonState = var16.playButtonState
			setGamePlaySession(sessionService, sessionType.StructuralIdentifier.GamePlayFromHoldToPlay, true)
			var17(playButtonState, var18)
			
			if var9.cancelHold and playButtonState == playButtonStates.Playable then
				var9.cancelHold()
			end
		end
	end, {
		var11, var9.cancelHold, var16.playButtonState, sessionService, var18, var17
	})
	
	return reactModule.createElement(sduiFocusNavActionsModule, {
		focusNavActions = reactModule.useMemo(function() --[[ line: 132 ]]
			-- upvalues: focusNavigationEventNameEnum (copy), var9 (ref)
			return {
				keys = {
					[Enum.KeyCode.ButtonA] = focusNavigationEventNameEnum.HoldToPlay
				},
				events = {
					[focusNavigationEventNameEnum.HoldToPlay] = { handler = var9.eventHandler }
				}
			}
		end, { var9.eventHandler }),
		guiObject = var14
	})
end)