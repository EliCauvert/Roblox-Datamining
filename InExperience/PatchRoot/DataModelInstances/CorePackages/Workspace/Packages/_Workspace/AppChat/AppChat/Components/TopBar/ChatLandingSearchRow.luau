local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local EnumScreensModule = require(AppChat.EnumScreens)
local GetTopBarStoreModule = require(AppChat.Stores.GetTopBarStore)
local SearchRowModule = require(Parent.SocialCommon.SearchRow)
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local UseSignalBindingFunction = SignalsReactModule.useSignalBinding
local UseSignalStateFunction = SignalsReactModule.useSignalState
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseTelemetryModule = require(AppChat.Telemetry.useTelemetry)
local ChatLandingTelemetryLayerModule = require(AppChat.Telemetry.Layers.ChatLandingTelemetryLayer)
local ChatLandingTelemetryEventsModule = require(AppChat.Components.ChatLanding.ChatLandingTelemetryEvents)

local function getFilterText(p1)
	-- upvalues: GetTopBarStoreModule (copy), EnumScreensModule (copy)
	return GetTopBarStoreModule(p1).getScreenTopBar(EnumScreensModule.ChatLanding)(p1).filterText or ""
end

local function getShouldAutoFocus(p1)
	-- upvalues: GetTopBarStoreModule (copy), EnumScreensModule (copy)
	return GetTopBarStoreModule(p1).getScreenTopBar(EnumScreensModule.ChatLanding)(p1).shouldAutoFocusCenter or false
end

return function(Frame)
	-- upvalues: GetTopBarStoreModule (copy), UseSignalBindingFunction (copy), getFilterText (copy), UseSignalStateFunction (copy), getShouldAutoFocus (copy), UseTelemetryModule (copy), ChatLandingTelemetryLayerModule (copy), UseLocalizationFunction (copy), ReactModule (copy), EnumScreensModule (copy), ChatLandingTelemetryEventsModule (copy), SearchRowModule (copy)
	local IsHasExit = Frame.hasExit ~= false
	local ReportFocusAsSearchEntry = Frame.reportFocusAsSearchEntry
	local SetScreenTopBarFunction = GetTopBarStoreModule(false).setScreenTopBar
	local UseSignalBindingResult = UseSignalBindingFunction(getFilterText)
	local UseSignalStateResult = UseSignalStateFunction(getShouldAutoFocus)
	local UseTelemetryModuleResult = UseTelemetryModule(ChatLandingTelemetryLayerModule.Context)
	local UseLocalizationResult = UseLocalizationFunction({
		cancelText = "Feature.Chat.Action.Cancel",
		placeholder = "Feature.Chat.Label.SearchWord"
	})
	ReactModule.useEffect(function()
		-- upvalues: UseSignalStateResult (copy), SetScreenTopBarFunction (copy), EnumScreensModule (upval)
		if UseSignalStateResult then
			SetScreenTopBarFunction(EnumScreensModule.ChatLanding, { shouldAutoFocusCenter = false })
		end
	end, { UseSignalStateResult, SetScreenTopBarFunction })
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: SetScreenTopBarFunction (copy), EnumScreensModule (upval)
		SetScreenTopBarFunction(EnumScreensModule.ChatLanding, { shouldRenderCenter = false, filterText = "" })
	end, { SetScreenTopBarFunction })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseTelemetryModuleResult (copy), ChatLandingTelemetryEventsModule (upval)
		UseTelemetryModuleResult.emit(ChatLandingTelemetryEventsModule.ChatLandingSearchBtnClicked, {})
	end, { UseTelemetryModuleResult })
	
	return ReactModule.createElement(SearchRowModule, {
		exitTestId = "ChatLandingSearch",
		text = UseSignalBindingResult,
		placeholder = UseLocalizationResult.placeholder,
		onChanged = ReactModule.useCallback(function(FilterText)
			-- upvalues: SetScreenTopBarFunction (copy), EnumScreensModule (upval)
			SetScreenTopBarFunction(EnumScreensModule.ChatLanding, { filterText = FilterText })
		end, { SetScreenTopBarFunction }),
		onExit = if IsHasExit then UseResult else nil,
		exitVariant = Frame.exitVariant,
		cancelText = UseLocalizationResult.cancelText,
		shouldAutoFocus = UseSignalStateResult,
		onFocusGained = if ReportFocusAsSearchEntry then UseResult1 else nil,
		height = Frame.height,
		paddingHorizontal = Frame.paddingHorizontal,
		LayoutOrder = Frame.LayoutOrder,
		testId = Frame.testId or "ChatSearchField"
	})
end