local LocalizationService = game:GetService("LocalizationService")
local Parent = script:FindFirstAncestor("AppStartup").Parent
local DashModule = require(Parent.Dash)
local ReactModule = require(Parent.React)
local AppLinking = require(Parent.RoactServiceTags).AppLinking
local AppLogging = require(Parent.RoactServiceTags).AppLogging
local AppAppLifecycleObserverService = require(Parent.RoactServiceTags).AppAppLifecycleObserverService
local AppStartupMessageService = require(Parent.RoactServiceTags).AppStartupMessageService
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseDesignTokensFunction = require(Parent.Style).useDesignTokens
local AppPage = require(Parent.RobloxAppEnums).AppPage
local NavigateDownFunction = require(Parent.NavigationRodux).Thunks.NavigateDown
local FFlagSignalsNavP3Dispatch = require(Parent.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(Parent.RobloxAppNavigation).NavigationCommands else nil
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local UseAppFocusRootFunction = FocusNavigationUtilsModule.useAppFocusRoot
local ShowStartupMessageOnUnhide = game:DefineFastFlag("ShowStartupMessageOnUnhide", false)
local StartupMessageActionButtonEnabledEngineFeature = game:GetEngineFeature("StartupMessageActionButtonEnabled")

local function selectScreenSize(p1) --[[ Line: 30 ]]
	return p1.ScreenSize
end

return function() --[[ Line: 34 | Named "useStartupMessageProps" ]]
	-- upvalues: UseRoactServiceFunction (copy), AppLinking (copy), AppLogging (copy), ShowStartupMessageOnUnhide (copy), AppAppLifecycleObserverService (copy), AppStartupMessageService (copy), UseSelectorFunction (copy), selectScreenSize (copy), UseDispatchFunction (copy), UseDesignTokensFunction (copy), ReactModule (copy), StartupMessageActionButtonEnabledEngineFeature (copy), UseLocalizationFunction (copy), DashModule (copy), LocalizationService (copy), AppPage (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownFunction (copy), UseAppFocusRootFunction (copy), FocusNavigableSurfaceIdentifierEnum (copy)
	local UseRoactServiceResult = UseRoactServiceFunction(AppLinking)
	local UseRoactServiceResult1 = UseRoactServiceFunction(AppLogging)
	local UseRoactServiceResult2 = if ShowStartupMessageOnUnhide then UseRoactServiceFunction(AppAppLifecycleObserverService) else nil
	local UseRoactServiceResult3 = UseRoactServiceFunction(AppStartupMessageService)
	local UseSelectorResult = UseSelectorFunction(selectScreenSize)
	local UseDispatchResult = UseDispatchFunction()
	local UseDesignTokensResult = UseDesignTokensFunction(function(p1) --[[ Line: 43 ]]
		return p1.Color.Common.Scrim
	end)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local UseResult = if ShowStartupMessageOnUnhide then ReactModule.useCallback(function() --[[ Line: 50 ]]
		-- upvalues: UseStateResult2 (copy), UseStateResult2_1 (copy)
		UseStateResult2(false)
		UseStateResult2_1(false)
	end, {}) else nil
	
	if ShowStartupMessageOnUnhide then
		ReactModule.useEffect(function() --[[ Line: 57 ]]
			-- upvalues: UseRoactServiceResult2 (copy), UseResult (copy)
			if not UseRoactServiceResult2 then return end
			local OnUnhideConnection = UseRoactServiceResult2.OnUnhide:Connect(UseResult)
			
			return function() --[[ Line: 63 ]]
				-- upvalues: OnUnhideConnection (copy)
				if OnUnhideConnection then
					OnUnhideConnection:Disconnect()
				end
			end
		end, { UseRoactServiceResult2, UseResult })
	end
	local StartupMessage = UseRoactServiceResult3:getStartupMessage()
	local NoUseStateResult: boolean = StartupMessage and not UseStateResult or false
	local StartupMessage1 = StartupMessage or {}
	local TitleLocalizationKey = StartupMessage1.titleLocalizationKey
	local BodyLocalizationKey = StartupMessage1.bodyLocalizationKey
	local ActionButtonLocalizationKey = if StartupMessageActionButtonEnabledEngineFeature then StartupMessage1.actionButtonLocalizationKey else nil
	local LoggingEventName = StartupMessage1.loggingEventName
	local Links = StartupMessage1.links or {}
	local UseLocalizationResult = UseLocalizationFunction(DashModule.map(Links, function(p1) --[[ Line: 83 ]]
		return p1.localizationKey
	end))
	local ReduceResult = DashModule.reduce(Links, function(p1, p2, p3) --[[ Line: 86 ]]
		-- upvalues: DashModule (upval), UseLocalizationResult (copy)
		return DashModule.append(p1, { { label = UseLocalizationResult[p3], url = p2.url } })
	end, {})
	local Date = StartupMessage1.date
	local RobloxLocaleId = LocalizationService.RobloxLocaleId
	local Number: number? = tonumber(StartupMessage1.date)
	
	if Number then
		Date = DateTime.fromUnixTimestamp(Number):FormatUniversalTime("LL", RobloxLocaleId)
	end
	local UseLocalizationResult1 = UseLocalizationFunction({
		buttonText = "CommonUI.Messages.Action.Dismiss",
		titleText = TitleLocalizationKey,
		bodyText = BodyLocalizationKey and { BodyLocalizationKey, date = Date },
		actionButtonText = ActionButtonLocalizationKey
	})
	local UseResult1 = ReactModule.useCallback(function() --[[ Line: 109 ]]
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(true)
	end, {})
	
	local function onActionButtonActivated() --[[ Line: 113 ]]
		-- upvalues: UseRoactServiceResult3 (copy)
		UseRoactServiceResult3:executeActionButton()
	end
	
	local UseResult2 = ReactModule.useCallback(function(Detail, Title) --[[ Line: 117 ]]
		-- upvalues: UseRoactServiceResult (copy), AppPage (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (copy), NavigateDownFunction (upval)
		UseRoactServiceResult:isURLRegistered(Detail):andThen(function(Result) --[[ Line: 118 ]]
			-- upvalues: UseRoactServiceResult (upval), Detail (copy), AppPage (upval), Title (copy), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (upval), NavigateDownFunction (upval)
			if Result then
				UseRoactServiceResult:detectURL(Detail)
				
				return
			end
			local config = {
				name = AppPage.GenericWebPage,
				detail = Detail,
				extraProps = { title = Title }
			}
			
			if FFlagSignalsNavP3Dispatch then
				NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
				
				return
			else
				UseDispatchResult(NavigateDownFunction(config))
			end
		end)
	end, { UseDispatchResult, UseRoactServiceResult })
	local UseAppFocusRootResult = UseAppFocusRootFunction({
		isAutoFocusRoot = true,
		surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.CentralOverlay,
		isFocusable = not UseStateResult
	})
	ReactModule.useEffect(function() --[[ Line: 144 ]]
		-- upvalues: UseStateResult1 (copy), NoUseStateResult (copy), LoggingEventName (copy), UseRoactServiceResult1 (copy), UseStateResult2_1 (copy)
		if not UseStateResult1 and NoUseStateResult and LoggingEventName then
			UseRoactServiceResult1:logEphemeralCounterEvent({
				description = "Startup Message Displayed Event",
				eventName = LoggingEventName,
				backends = { "EphemeralCounter" },
				lastUpdated = { 24, 2, 18 }
			})
			UseStateResult2_1(true)
		end
	end, { UseStateResult1, NoUseStateResult, LoggingEventName })
	
	return {
		displayStartupMessage = NoUseStateResult,
		screenSize = UseSelectorResult,
		message = StartupMessage1,
		localizedStrings = UseLocalizationResult1,
		localizedLinks = ReduceResult,
		overlayColor = UseDesignTokensResult,
		onDismissed = UseResult1,
		onOpenUrl = UseResult2,
		onActionButtonActivated = if StartupMessageActionButtonEnabledEngineFeature then onActionButtonActivated else nil,
		focusNavRef = UseAppFocusRootResult
	}
end