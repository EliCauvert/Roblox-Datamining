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
local var1 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local focusNavigableSurfaceIdentifierEnum = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local useAppFocusRoot = focusNavigationUtilsModule.useAppFocusRoot
local showStartupMessageOnUnhide = game:DefineFastFlag("ShowStartupMessageOnUnhide", false)
local startupMessageActionButtonEnabledEngineFeature = game:GetEngineFeature("StartupMessageActionButtonEnabled")

local function selectScreenSize(p1)
	return p1.ScreenSize
end

return function()
	-- upvalues: useRoactService (ref), appLinking (ref), appLogging (ref), showStartupMessageOnUnhide (ref), appAppLifecycleObserverService (ref), appStartupMessageService (ref), useSelector (ref), selectScreenSize (ref), useDispatch (ref), useDesignTokens (ref), reactModule (ref), startupMessageActionButtonEnabledEngineFeature (ref), useLocalization (ref), dashModule (ref), localizationService (ref), appPage (ref), fFlagSignalsNavP3Dispatch (ref), var1 (ref), navigateDown (ref), useAppFocusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref)
	local var2 = useRoactService(appLinking)
	local var3 = useRoactService(appLogging)
	local var4 = if showStartupMessageOnUnhide then useRoactService(appAppLifecycleObserverService) else nil
	local var5 = useRoactService(appStartupMessageService)
	local var6 = useSelector(selectScreenSize)
	local var7 = useDispatch()
	local var8 = useDesignTokens(function(p1)
		return p1.Color.Common.Scrim
	end)
	local var9, var10 = reactModule.useState(false)
	local var11, var12 = reactModule.useState(false)
	local var13 = if showStartupMessageOnUnhide then reactModule.useCallback(function()
		-- upvalues: var10 (ref), var12 (ref)
		var10(false)
		var12(false)
	end, {}) else nil
	
	if showStartupMessageOnUnhide then
		reactModule.useEffect(function()
			-- upvalues: var4 (ref), var13 (ref)
			if var4 then
				local onUnhideConnection = var4.OnUnhide:Connect(var13)
				
				return function()
					-- upvalues: onUnhideConnection (ref)
					if onUnhideConnection then
						onUnhideConnection:Disconnect()
					end
				end
			end
		end, { var4, var13 })
	end
	local startupMessage = var5:getStartupMessage()
	local var14 = if startupMessage and not var9 then true else false
	local startupMessage_1 = startupMessage or {}
	local titleLocalizationKey = startupMessage_1.titleLocalizationKey
	local bodyLocalizationKey = startupMessage_1.bodyLocalizationKey
	local var15 = if startupMessageActionButtonEnabledEngineFeature then startupMessage_1.actionButtonLocalizationKey else nil
	local loggingEventName = startupMessage_1.loggingEventName
	local links = startupMessage_1.links or {}
	local var16 = useLocalization(dashModule.map(links, function(p1)
		return p1.localizationKey
	end))
	local var17 = dashModule.reduce(links, function(p1, p2, p3)
		-- upvalues: dashModule (copy), var16 (ref)
		return dashModule.append(p1, { { label = var16[p3], url = p2.url } })
	end, {})
	local date = startupMessage_1.date
	local robloxLocaleId = localizationService.RobloxLocaleId
	local var18 = tonumber(startupMessage_1.date)
	
	if var18 then
		date = DateTime.fromUnixTimestamp(var18):FormatUniversalTime("LL", robloxLocaleId)
	end
	local var19 = useLocalization({
		buttonText = "CommonUI.Messages.Action.Dismiss",
		titleText = titleLocalizationKey,
		bodyText = bodyLocalizationKey and { bodyLocalizationKey, date = date },
		actionButtonText = var15
	})
	local var20 = reactModule.useCallback(function()
		-- upvalues: var10 (ref)
		var10(true)
	end, {})
	
	local function onActionButtonActivated()
		-- upvalues: var5 (ref)
		var5:executeActionButton()
	end
	
	local var21 = reactModule.useCallback(function(p1, p2)
		-- upvalues: var2 (ref), appPage (copy), fFlagSignalsNavP3Dispatch (copy), var1 (copy), var7 (ref), navigateDown (copy)
		var2:isURLRegistered(p1):andThen(function(p3)
			-- upvalues: var2 (copy), p1 (ref), appPage (copy), p2 (ref), fFlagSignalsNavP3Dispatch (copy), var1 (copy), var7 (copy), navigateDown (copy)
			if p3 then
				var2:detectURL(p1)
				
				return
			end
			local t = {
				name = appPage.GenericWebPage,
				detail = p1,
				extraProps = { title = p2 }
			}
			
			if fFlagSignalsNavP3Dispatch then
				var1.down(var1.fromLegacyPage(t))
				
				return
			end
			var7(navigateDown(t))
		end)
	end, { var7, var2 })
	local var22 = useAppFocusRoot({
		isAutoFocusRoot = true,
		surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.CentralOverlay,
		isFocusable = not var9
	})
	reactModule.useEffect(function()
		-- upvalues: var11 (ref), var14 (ref), loggingEventName (ref), var3 (ref), var12 (ref)
		if not var11 and var14 and loggingEventName then
			var3:logEphemeralCounterEvent({
				description = "Startup Message Displayed Event",
				eventName = loggingEventName,
				backends = { "EphemeralCounter" },
				lastUpdated = { 24, 2, 18 }
			})
			var12(true)
		end
	end, { var11, var14, loggingEventName })
	
	return {
		displayStartupMessage = var14,
		screenSize = var6,
		message = startupMessage_1,
		localizedStrings = var19,
		localizedLinks = var17,
		overlayColor = var8,
		onDismissed = var20,
		onOpenUrl = var21,
		onActionButtonActivated = if startupMessageActionButtonEnabledEngineFeature then onActionButtonActivated else nil,
		focusNavRef = var22
	}
end