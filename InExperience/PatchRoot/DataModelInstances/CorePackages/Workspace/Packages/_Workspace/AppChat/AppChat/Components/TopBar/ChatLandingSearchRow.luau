local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local EnumScreensModule = require(AppChat.EnumScreens)
local GetTopBarStoreModule = require(AppChat.Stores.GetTopBarStore)
local ChatSearchFieldContainerModule = require(script.Parent.ChatSearchField.ChatSearchFieldContainer)
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local UseSignalBindingFunction = SignalsReactModule.useSignalBinding
local UseSignalStateFunction = SignalsReactModule.useSignalState
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseTelemetryModule = require(AppChat.Telemetry.useTelemetry)
local ChatLandingTelemetryLayerModule = require(AppChat.Telemetry.Layers.ChatLandingTelemetryLayer)
local ChatLandingTelemetryEventsModule = require(AppChat.Components.ChatLanding.ChatLandingTelemetryEvents)

local function getFilterText(p1) --[[ Line: 46 ]]
	-- upvalues: GetTopBarStoreModule (copy), EnumScreensModule (copy)
	return GetTopBarStoreModule(p1).getScreenTopBar(EnumScreensModule.ChatLanding)(p1).filterText or ""
end

local function getShouldAutoFocus(p1) --[[ Line: 50 ]]
	-- upvalues: GetTopBarStoreModule (copy), EnumScreensModule (copy)
	return GetTopBarStoreModule(p1).getScreenTopBar(EnumScreensModule.ChatLanding)(p1).shouldAutoFocusCenter or false
end

local function _(Callback: (any, any) -> ()) --[[ Line: 55 | Named "exitSearch" ]]
	-- upvalues: EnumScreensModule (copy)
	Callback(EnumScreensModule.ChatLanding, { shouldRenderCenter = false, filterText = "" })
end

local function SearchBackButton(Frame) --[[ Line: 63 ]]
	-- upvalues: GetTopBarStoreModule (copy), ReactModule (copy), EnumScreensModule (copy), FoundationModule (copy)
	local SetScreenTopBarFunction = GetTopBarStoreModule(false).setScreenTopBar
	
	return ReactModule.createElement(FoundationModule.IconButton, {
		testId = "ChatLandingSearchBack",
		icon = FoundationModule.Enums.IconName.ChevronLargeLeft,
		size = FoundationModule.Enums.InputSize.Medium,
		LayoutOrder = Frame.LayoutOrder,
		onActivated = ReactModule.useCallback(function() --[[ Line: 66 ]]
			-- upvalues: SetScreenTopBarFunction (copy), EnumScreensModule (upval)
			SetScreenTopBarFunction(EnumScreensModule.ChatLanding, { shouldRenderCenter = false, filterText = "" })
		end, { SetScreenTopBarFunction })
	})
end

local function SearchCancelButton(Frame) --[[ Line: 80 ]]
	-- upvalues: GetTopBarStoreModule (copy), ReactModule (copy), EnumScreensModule (copy), FoundationModule (copy)
	local SetScreenTopBarFunction = GetTopBarStoreModule(false).setScreenTopBar
	
	return ReactModule.createElement(FoundationModule.Button, {
		testId = "ChatLandingSearchCancel",
		text = Frame.text,
		variant = FoundationModule.Enums.ButtonVariant.Utility,
		size = FoundationModule.Enums.InputSize.Medium,
		LayoutOrder = Frame.LayoutOrder,
		onActivated = ReactModule.useCallback(function() --[[ Line: 83 ]]
			-- upvalues: SetScreenTopBarFunction (copy), EnumScreensModule (upval)
			SetScreenTopBarFunction(EnumScreensModule.ChatLanding, { shouldRenderCenter = false, filterText = "" })
		end, { SetScreenTopBarFunction })
	})
end

local function SearchField(p1) --[[ Line: 97 ]]
	-- upvalues: GetTopBarStoreModule (copy), UseSignalBindingFunction (copy), getFilterText (copy), UseSignalStateFunction (copy), getShouldAutoFocus (copy), ReactModule (copy), EnumScreensModule (copy), ChatSearchFieldContainerModule (copy)
	local SetScreenTopBarFunction = GetTopBarStoreModule(false).setScreenTopBar
	local UseSignalBindingResult = UseSignalBindingFunction(getFilterText)
	local UseSignalStateResult = UseSignalStateFunction(getShouldAutoFocus)
	ReactModule.useEffect(function() --[[ Line: 106 ]]
		-- upvalues: UseSignalStateResult (copy), SetScreenTopBarFunction (copy), EnumScreensModule (upval)
		if UseSignalStateResult then
			SetScreenTopBarFunction(EnumScreensModule.ChatLanding, { shouldAutoFocusCenter = false })
		end
	end, { UseSignalStateResult, SetScreenTopBarFunction })
	local UseResult = ReactModule.useCallback(function() --[[ Line: 120 ]]
		-- upvalues: SetScreenTopBarFunction (copy), EnumScreensModule (upval)
		SetScreenTopBarFunction(EnumScreensModule.ChatLanding, { shouldRenderCenter = false, filterText = "" })
	end, { SetScreenTopBarFunction })
	
	return ReactModule.createElement(ChatSearchFieldContainerModule, {
		text = UseSignalBindingResult,
		shouldAutoFocus = UseSignalStateResult,
		onChanged = ReactModule.useCallback(function(FilterText) --[[ Line: 114 ]]
			-- upvalues: SetScreenTopBarFunction (copy), EnumScreensModule (upval)
			SetScreenTopBarFunction(EnumScreensModule.ChatLanding, { filterText = FilterText })
		end, { SetScreenTopBarFunction }),
		onExit = if p1.hasExit then UseResult else nil,
		onFocusGained = p1.onFocusGained,
		testId = p1.testId
	})
end

return function(Frame) --[[ Line: 135 | Named "ChatLandingSearchRow" ]]
	-- upvalues: UseTelemetryModule (copy), ChatLandingTelemetryLayerModule (copy), UseLocalizationFunction (copy), ReactModule (copy), ChatLandingTelemetryEventsModule (copy), FoundationModule (copy), SearchBackButton (copy), SearchField (copy), SearchCancelButton (copy)
	local IsHasExit = Frame.hasExit ~= false
	local ExitVariant = Frame.exitVariant or "Cancel"
	local IsChevron: boolean = IsHasExit and ExitVariant == "Chevron"
	local IsCancel: boolean = IsHasExit and ExitVariant == "Cancel"
	local Height = Frame.height
	local PaddingHorizontal = Frame.paddingHorizontal
	local ReportFocusAsSearchEntry = Frame.reportFocusAsSearchEntry
	local UseTelemetryModuleResult = UseTelemetryModule(ChatLandingTelemetryLayerModule.Context)
	local UseLocalizationResult = UseLocalizationFunction({ cancelText = "Feature.Chat.Action.Cancel" })
	local UseResult = ReactModule.useCallback(function() --[[ Line: 149 ]]
		-- upvalues: UseTelemetryModuleResult (copy), ChatLandingTelemetryEventsModule (upval)
		UseTelemetryModuleResult.emit(ChatLandingTelemetryEventsModule.ChatLandingSearchBtnClicked, {})
	end, { UseTelemetryModuleResult })
	
	return ReactModule.createElement(FoundationModule.View, {
		tag = {
			["row align-y-center gap-small"] = true,
			["size-full"] = Height == nil
		},
		Size = if Height then UDim2.new(1, 0, 0, Height) else nil,
		LayoutOrder = Frame.LayoutOrder,
		padding = if PaddingHorizontal then {
			left = UDim.new(0, PaddingHorizontal),
			right = UDim.new(0, PaddingHorizontal)
		} else nil
	}, {
		back = if IsChevron then ReactModule.createElement(SearchBackButton, { LayoutOrder = 1 }) else nil,
		field = ReactModule.createElement(FoundationModule.View, { tag = "grow auto-y", LayoutOrder = 2 }, {
			input = ReactModule.createElement(SearchField, {
				hasExit = IsHasExit,
				testId = Frame.testId,
				onFocusGained = if ReportFocusAsSearchEntry then UseResult else nil
			})
		}),
		cancel = if IsCancel then ReactModule.createElement(SearchCancelButton, { LayoutOrder = 3, text = UseLocalizationResult.cancelText }) else nil
	})
end