local sduiSharedUtilities = script:FindFirstAncestor("SduiSharedUtilities")
local parent = sduiSharedUtilities.Parent
local reactModule = require(parent.React)
local _ = require(parent.Foundation)
local getSduiComponentWrapper = require(parent.SduiCoreSystem).getSduiComponentWrapper
local _ = require(sduiSharedUtilities.SduiLoadTimer)
local useCreateClientBindingSduiContextModule = require(sduiSharedUtilities.useCreateClientBindingSduiContext)
local useComponentConfigModule = require(sduiSharedUtilities.hooks.useComponentConfig)
local useComponentLifecycleTimingModule = require(sduiSharedUtilities.hooks.useComponentLifecycleTiming)
local useDataUpdatedTimestampModule = require(sduiSharedUtilities.hooks.useDataUpdatedTimestamp)
local useLocalAnalyticsDataModule = require(sduiSharedUtilities.hooks.useLocalAnalyticsData)
local useUiStatusModule = require(sduiSharedUtilities.hooks.useUiStatus)
local _ = require(sduiSharedUtilities.SduiIntegrationTypes)
local useStatefulRefModule = require(sduiSharedUtilities.hooks.useStatefulRef)
local sduiFeatureEntryPointUiModule = require(sduiSharedUtilities.ui.SduiFeatureEntryPointUi)
local fFlagSduiFeatureEntryPointTakesAbsoluteSizeHandler = require(parent.SharedFlags).FFlagSduiFeatureEntryPointTakesAbsoluteSizeHandler

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: useComponentConfigModule (ref), useComponentLifecycleTimingModule (ref), useDataUpdatedTimestampModule (ref), useUiStatusModule (ref), useStatefulRefModule (ref), useCreateClientBindingSduiContextModule (ref), useLocalAnalyticsDataModule (ref), reactModule (ref), sduiFeatureEntryPointUiModule (ref), getSduiComponentWrapper (ref), fFlagSduiFeatureEntryPointTakesAbsoluteSizeHandler (ref)
	local configKey = p1.configKey
	local appPage = p1.appPage
	local var1 = p1.shouldDisplayLoading == nil or p1.shouldDisplayLoading
	local var2 = p1.shouldDisplayError == nil or p1.shouldDisplayError
	local var3 = useComponentConfigModule(configKey, p1.identifier)
	useComponentLifecycleTimingModule(p1.loadTimer, typeof(var3) == "table")
	local var4 = useDataUpdatedTimestampModule(configKey, p1.identifier)
	local var5 = useUiStatusModule(configKey)
	local var6, var7 = useStatefulRefModule(p2)
	
	return reactModule.createElement(sduiFeatureEntryPointUiModule, {
		onRetry = p1.onRetry,
		contentSlot = if var3 then reactModule.createElement(getSduiComponentWrapper(var3), {
			debugName = `SduiFeatureEntryPoint-{configKey}`,
			componentConfig = var3,
			sduiContext = useCreateClientBindingSduiContextModule(appPage, var6, nil, var4, configKey, p1.appCompositionEnabledOverride, p1.routeName),
			localAnalyticsData = useLocalAnalyticsDataModule(configKey, appPage, p1.additionalAnalyticsData),
			extraLocalProps = p1.extraLocalProps
		}) else nil,
		uiStatus = var5,
		errorSlot = p1.errorSlot,
		loadingSlot = p1.loadingSlot,
		shouldDisplayLoading = var1,
		shouldDisplayError = var2,
		onAbsoluteSizeChange = if fFlagSduiFeatureEntryPointTakesAbsoluteSizeHandler then p1.onAbsoluteSizeChange else nil,
		Size = if p1.Size then p1.Size else UDim2.new(1, 0, 0, 0),
		AutomaticSize = if p1.AutomaticSize then p1.AutomaticSize else Enum.AutomaticSize.Y,
		Position = p1.Position,
		LayoutOrder = p1.LayoutOrder,
		ref = var7
	})
end))