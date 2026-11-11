local SduiSharedUtilities = script:FindFirstAncestor("SduiSharedUtilities")
local Parent = SduiSharedUtilities.Parent
local ReactModule = require(Parent.React)
local _ = require(Parent.Foundation)
local SignalsReactModule = require(Parent.SignalsReact)
local GetSduiComponentWrapperFunction = require(Parent.SduiCoreSystem).getSduiComponentWrapper
local GetSduiApiStoreModule = require(SduiSharedUtilities.getSduiApiStore)
local _ = require(SduiSharedUtilities.SduiLoadTimer)
local UseCreateClientBindingSduiContextModule = require(SduiSharedUtilities.useCreateClientBindingSduiContext)
local DataHydrationTypes = require(Parent.DataHydration).DataHydrationTypes
local UseComponentConfigModule = require(SduiSharedUtilities.hooks.useComponentConfig)
local UseComponentLifecycleTimingModule = require(SduiSharedUtilities.hooks.useComponentLifecycleTiming)
local UseDataUpdatedTimestampModule = require(SduiSharedUtilities.hooks.useDataUpdatedTimestamp)
local UseLocalAnalyticsDataModule = require(SduiSharedUtilities.hooks.useLocalAnalyticsData)
local UseUiStatusModule = require(SduiSharedUtilities.hooks.useUiStatus)
local _ = require(SduiSharedUtilities.SduiIntegrationTypes)
local UseStatefulRefModule = require(SduiSharedUtilities.hooks.useStatefulRef)
local SduiFeatureEntryPointUiModule = require(SduiSharedUtilities.ui.SduiFeatureEntryPointUi)
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagSduiFeatureEntryPointTakesAbsoluteSizeHandler = SharedFlagsModule.FFlagSduiFeatureEntryPointTakesAbsoluteSizeHandler
local FFlagSduiUseSharedUiStatusHook = SharedFlagsModule.FFlagSduiUseSharedUiStatusHook
local FFlagSduiClientPageScope = SharedFlagsModule.FFlagSduiClientPageScope
local FFlagEnableSduiV2HomeInterleave = SharedFlagsModule.FFlagEnableSduiV2HomeInterleave

local function _(p1): string
	-- upvalues: SignalsReactModule (copy), GetSduiApiStoreModule (copy), DataHydrationTypes (copy)
	local UseSignalStateResult = SignalsReactModule.useSignalState(GetSduiApiStoreModule().getData(p1).status)
	
	return if UseSignalStateResult == DataHydrationTypes.DataStatus.NotReady then "Loading" elseif UseSignalStateResult == DataHydrationTypes.DataStatus.Failed then "Error" else "Resolved"
end

return ReactModule.memo(ReactModule.forwardRef(function(Frame: Frame, p1)
	-- upvalues: UseComponentConfigModule (copy), UseComponentLifecycleTimingModule (copy), FFlagEnableSduiV2HomeInterleave (copy), UseDataUpdatedTimestampModule (copy), FFlagSduiUseSharedUiStatusHook (copy), UseUiStatusModule (copy), SignalsReactModule (copy), GetSduiApiStoreModule (copy), DataHydrationTypes (copy), UseStatefulRefModule (copy), UseCreateClientBindingSduiContextModule (copy), FFlagSduiClientPageScope (copy), UseLocalAnalyticsDataModule (copy), ReactModule (copy), SduiFeatureEntryPointUiModule (copy), GetSduiComponentWrapperFunction (copy), FFlagSduiFeatureEntryPointTakesAbsoluteSizeHandler (copy)
	local ConfigKey = Frame.configKey
	local AppPage = Frame.appPage
	local NoShouldDisplayLoading = Frame.shouldDisplayLoading == nil or Frame.shouldDisplayLoading
	local NoShouldDisplayError = Frame.shouldDisplayError == nil or Frame.shouldDisplayError
	local UseComponentConfigModuleResult = UseComponentConfigModule(ConfigKey, Frame.identifier)
	UseComponentLifecycleTimingModule(Frame.loadTimer, typeof(UseComponentConfigModuleResult) == "table")
	local UseDataUpdatedTimestampModuleResult = if FFlagEnableSduiV2HomeInterleave then UseDataUpdatedTimestampModule(ConfigKey, Frame.identifier) else nil
	local UseUiStatusModuleResult = nil
	
	if FFlagSduiUseSharedUiStatusHook then
		UseUiStatusModuleResult = UseUiStatusModule(ConfigKey)
	else
		local UseSignalStateResult = SignalsReactModule.useSignalState(GetSduiApiStoreModule().getData(ConfigKey).status)
		UseUiStatusModuleResult = if UseSignalStateResult == DataHydrationTypes.DataStatus.NotReady then "Loading" elseif UseSignalStateResult == DataHydrationTypes.DataStatus.Failed then "Error" else "Resolved"
	end
	local UseStatefulRefModuleResult, UseStatefulRefModuleResult2 = UseStatefulRefModule(p1)
	local UseCreateClientBindingSduiContextModuleResult = UseCreateClientBindingSduiContextModule(AppPage, UseStatefulRefModuleResult, nil, if FFlagEnableSduiV2HomeInterleave then UseDataUpdatedTimestampModuleResult else nil, if FFlagSduiClientPageScope then ConfigKey else nil, if FFlagEnableSduiV2HomeInterleave then Frame.appCompositionEnabledOverride else nil, Frame.routeName)
	local UseLocalAnalyticsDataModuleResult = UseLocalAnalyticsDataModule(ConfigKey, AppPage, Frame.additionalAnalyticsData)
	
	return ReactModule.createElement(SduiFeatureEntryPointUiModule, {
		onRetry = Frame.onRetry,
		contentSlot = if UseComponentConfigModuleResult then ReactModule.createElement(GetSduiComponentWrapperFunction(UseComponentConfigModuleResult), {
			debugName = `SduiFeatureEntryPoint-{ConfigKey}`,
			componentConfig = UseComponentConfigModuleResult,
			sduiContext = UseCreateClientBindingSduiContextModuleResult,
			localAnalyticsData = UseLocalAnalyticsDataModuleResult,
			extraLocalProps = if FFlagEnableSduiV2HomeInterleave then Frame.extraLocalProps else nil
		}) else nil,
		uiStatus = UseUiStatusModuleResult,
		errorSlot = Frame.errorSlot,
		loadingSlot = Frame.loadingSlot,
		shouldDisplayLoading = NoShouldDisplayLoading,
		shouldDisplayError = NoShouldDisplayError,
		onAbsoluteSizeChange = if FFlagSduiFeatureEntryPointTakesAbsoluteSizeHandler then Frame.onAbsoluteSizeChange else nil,
		Size = if Frame.Size then Frame.Size else UDim2.new(1, 0, 0, 0),
		AutomaticSize = if Frame.AutomaticSize then Frame.AutomaticSize else Enum.AutomaticSize.Y,
		Position = Frame.Position,
		LayoutOrder = Frame.LayoutOrder,
		ref = UseStatefulRefModuleResult2
	})
end))