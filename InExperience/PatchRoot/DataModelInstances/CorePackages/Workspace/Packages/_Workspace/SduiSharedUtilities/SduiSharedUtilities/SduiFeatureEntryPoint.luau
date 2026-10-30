local SduiSharedUtilities = script:FindFirstAncestor("SduiSharedUtilities")
local Parent = SduiSharedUtilities.Parent
local ReactModule = require(Parent.React)
local _ = require(Parent.Foundation)
local GetSduiComponentWrapperFunction = require(Parent.SduiCoreSystem).getSduiComponentWrapper
local _ = require(SduiSharedUtilities.SduiLoadTimer)
local UseCreateClientBindingSduiContextModule = require(SduiSharedUtilities.useCreateClientBindingSduiContext)
local UseComponentConfigModule = require(SduiSharedUtilities.hooks.useComponentConfig)
local UseComponentLifecycleTimingModule = require(SduiSharedUtilities.hooks.useComponentLifecycleTiming)
local UseDataUpdatedTimestampModule = require(SduiSharedUtilities.hooks.useDataUpdatedTimestamp)
local UseLocalAnalyticsDataModule = require(SduiSharedUtilities.hooks.useLocalAnalyticsData)
local UseUiStatusModule = require(SduiSharedUtilities.hooks.useUiStatus)
local _ = require(SduiSharedUtilities.SduiIntegrationTypes)
local UseStatefulRefModule = require(SduiSharedUtilities.hooks.useStatefulRef)
local SduiFeatureEntryPointUiModule = require(SduiSharedUtilities.ui.SduiFeatureEntryPointUi)
local FFlagSduiFeatureEntryPointTakesAbsoluteSizeHandler = require(Parent.SharedFlags).FFlagSduiFeatureEntryPointTakesAbsoluteSizeHandler

return ReactModule.memo(ReactModule.forwardRef(function(Frame: Frame, p1)
	-- upvalues: UseComponentConfigModule (copy), UseComponentLifecycleTimingModule (copy), UseDataUpdatedTimestampModule (copy), UseUiStatusModule (copy), UseStatefulRefModule (copy), UseCreateClientBindingSduiContextModule (copy), UseLocalAnalyticsDataModule (copy), ReactModule (copy), SduiFeatureEntryPointUiModule (copy), GetSduiComponentWrapperFunction (copy), FFlagSduiFeatureEntryPointTakesAbsoluteSizeHandler (copy)
	local ConfigKey = Frame.configKey
	local AppPage = Frame.appPage
	local NoShouldDisplayLoading = Frame.shouldDisplayLoading == nil or Frame.shouldDisplayLoading
	local NoShouldDisplayError = Frame.shouldDisplayError == nil or Frame.shouldDisplayError
	local UseComponentConfigModuleResult = UseComponentConfigModule(ConfigKey, Frame.identifier)
	UseComponentLifecycleTimingModule(Frame.loadTimer, typeof(UseComponentConfigModuleResult) == "table")
	local UseDataUpdatedTimestampModuleResult = UseDataUpdatedTimestampModule(ConfigKey, Frame.identifier)
	local UseUiStatusModuleResult = UseUiStatusModule(ConfigKey)
	local UseStatefulRefModuleResult, UseStatefulRefModuleResult2 = UseStatefulRefModule(p1)
	local UseCreateClientBindingSduiContextModuleResult = UseCreateClientBindingSduiContextModule(AppPage, UseStatefulRefModuleResult, nil, UseDataUpdatedTimestampModuleResult, ConfigKey, Frame.appCompositionEnabledOverride, Frame.routeName)
	local UseLocalAnalyticsDataModuleResult = UseLocalAnalyticsDataModule(ConfigKey, AppPage, Frame.additionalAnalyticsData)
	
	return ReactModule.createElement(SduiFeatureEntryPointUiModule, {
		onRetry = Frame.onRetry,
		contentSlot = if UseComponentConfigModuleResult then ReactModule.createElement(GetSduiComponentWrapperFunction(UseComponentConfigModuleResult), {
			debugName = `SduiFeatureEntryPoint-{ConfigKey}`,
			componentConfig = UseComponentConfigModuleResult,
			sduiContext = UseCreateClientBindingSduiContextModuleResult,
			localAnalyticsData = UseLocalAnalyticsDataModuleResult,
			extraLocalProps = Frame.extraLocalProps
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