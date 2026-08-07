local localizationService = game:GetService("LocalizationService")
local parent = script:FindFirstAncestor("AppStartup").Parent
local dashModule = require(parent.Dash)
local reactModule = require(parent.React)
local appLinking = require(parent.RoactServiceTags).AppLinking
local appLogging = require(parent.RoactServiceTags).AppLogging
local appAppLifecycleObserverService = require(parent.RoactServiceTags).AppAppLifecycleObserverService
local appStartupMessageService = require(parent.RoactServiceTags).AppStartupMessageService
local useRoactService = require(parent.RobloxAppHooks).useRoactService
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useDesignTokens = require(parent.Style).useDesignTokens
local appPage = require(parent.RobloxAppEnums).AppPage
local navigateDown = require(parent.NavigationRodux).Thunks.NavigateDown
local fFlagSignalsNavP3Dispatch = require(parent.SharedFlags).FFlagSignalsNavP3Dispatch
local var3 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local focusNavigableSurfaceIdentifierEnum = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local useAppFocusRoot = focusNavigationUtilsModule.useAppFocusRoot
local showStartupMessageOnUnhide = game:DefineFastFlag("ShowStartupMessageOnUnhide", false)
local startupMessageActionButtonEnabledEngineFeature = game:GetEngineFeature("StartupMessageActionButtonEnabled")

local function selectScreenSize(p0) --[[ line: 30 ]]
	return p0.ScreenSize
end

return function() --[[ line: 34 | named "useStartupMessageProps" ]]
	-- upvalues: useRoactService (ref), appLinking (ref), appLogging (ref), showStartupMessageOnUnhide (ref), appAppLifecycleObserverService (ref), appStartupMessageService (ref), useSelector (ref), selectScreenSize (ref), useDispatch (ref), useDesignTokens (ref), reactModule (ref), startupMessageActionButtonEnabledEngineFeature (ref), useLocalization (ref), dashModule (ref), localizationService (ref), appPage (ref), fFlagSignalsNavP3Dispatch (ref), var3 (ref), navigateDown (ref), useAppFocusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref)
	local var8 = useRoactService(appLinking)
	local var9 = useRoactService(appLogging)
	local var10 = if showStartupMessageOnUnhide then useRoactService(appAppLifecycleObserverService) else nil
	local var11 = useRoactService(appStartupMessageService)
	local var12 = useSelector(selectScreenSize)
	local var13 = useDispatch()
	local var14 = useDesignTokens(function(p1) --[[ line: 43 ]]
		return p1.Color.Common.Scrim
	end)
	local var15, var16 = reactModule.useState(false)
	local var17, var18 = reactModule.useState(false)
	local var19 = if showStartupMessageOnUnhide then reactModule.useCallback(function() --[[ line: 50 ]]
		-- upvalues: var16 (ref), var18 (ref)
		var16(false)
		var18(false)
	end, {}) else nil
	
	if showStartupMessageOnUnhide then
		reactModule.useEffect(function() --[[ line: 57 ]]
			-- upvalues: var10 (ref), var19 (ref)
			if var10 then
				local onUnhideConnection = var10.OnUnhide:Connect(var19)
				
				return function() --[[ line: 63 ]]
					-- upvalues: onUnhideConnection (ref)
					if onUnhideConnection then
						onUnhideConnection:Disconnect()
					end
				end
			end
		end, { var10, var19 })
	end
	local startupMessage = var11:getStartupMessage()
	local var21 = if startupMessage and not var15 then true else false
	local startupMessage_1 = startupMessage or {}
	local titleLocalizationKey = startupMessage_1.titleLocalizationKey
	local bodyLocalizationKey = startupMessage_1.bodyLocalizationKey
	local var23 = if startupMessageActionButtonEnabledEngineFeature then startupMessage_1.actionButtonLocalizationKey else nil
	local loggingEventName = startupMessage_1.loggingEventName
	local links = startupMessage_1.links or {}
	local var25 = useLocalization(dashModule.map(links, function(p2) --[[ line: 83 ]]
		return p2.localizationKey
	end))
	local var26 = dashModule.reduce(links, function(p3, p4, p5) --[[ line: 86 ]]
		-- upvalues: dashModule (copy), var25 (ref)
		return dashModule.append(p3, { { label = var25[p5], url = p4.url } })
	end, {})
	local date = startupMessage_1.date
	local robloxLocaleId = localizationService.RobloxLocaleId
	local var27 = tonumber(startupMessage_1.date)
	
	if var27 then
		date = DateTime.fromUnixTimestamp(var27):FormatUniversalTime("LL", robloxLocaleId)
	end
	local var28 = useLocalization({
		buttonText = "CommonUI.Messages.Action.Dismiss",
		titleText = titleLocalizationKey,
		bodyText = bodyLocalizationKey and { bodyLocalizationKey, date = date },
		actionButtonText = var23
	})
	local var29 = reactModule.useCallback(function() --[[ line: 109 ]]
		-- upvalues: var16 (ref)
		var16(true)
	end, {})
	
	local function onActionButtonActivated() --[[ line: 113 ]]
		-- upvalues: var11 (ref)
		var11:executeActionButton()
	end
	
	local var31 = reactModule.useCallback(function(p6, p7) --[[ line: 117 ]]
		-- upvalues: var8 (ref), appPage (copy), fFlagSignalsNavP3Dispatch (copy), var3 (copy), var13 (ref), navigateDown (copy)
		var8:isURLRegistered(p6):andThen(function(p8) --[[ line: 118 ]]
			-- upvalues: var8 (copy), p6 (ref), appPage (copy), p7 (ref), fFlagSignalsNavP3Dispatch (copy), var3 (copy), var13 (copy), navigateDown (copy)
			if p8 then
				var8:detectURL(p6)
				
				return
			end
			local t = {
				name = appPage.GenericWebPage,
				detail = p6,
				extraProps = { title = p7 }
			}
			
			if fFlagSignalsNavP3Dispatch then
				var3.down(var3.fromLegacyPage(t))
				
				return
			end
			var13(navigateDown(t))
		end)
	end, { var13, var8 })
	local var32 = useAppFocusRoot({
		isAutoFocusRoot = true,
		surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.CentralOverlay,
		isFocusable = not var15
	})
	reactModule.useEffect(function() --[[ line: 144 ]]
		-- upvalues: var17 (ref), var21 (ref), loggingEventName (ref), var9 (ref), var18 (ref)
		if not var17 and var21 and loggingEventName then
			var9:logEphemeralCounterEvent({
				description = "Startup Message Displayed Event",
				eventName = loggingEventName,
				backends = { "EphemeralCounter" },
				lastUpdated = { 24, 2, 18 }
			})
			var18(true)
		end
	end, { var17, var21, loggingEventName })
	
	return {
		displayStartupMessage = var21,
		screenSize = var12,
		message = startupMessage_1,
		localizedStrings = var28,
		localizedLinks = var26,
		overlayColor = var14,
		onDismissed = var29,
		onOpenUrl = var31,
		onActionButtonActivated = if startupMessageActionButtonEnabledEngineFeature then onActionButtonActivated else nil,
		focusNavRef = var32
	}
end