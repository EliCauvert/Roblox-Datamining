local sduiSharedUtilities = script:FindFirstAncestor("SduiSharedUtilities")
local parent = sduiSharedUtilities.Parent
local reactModule = require(parent.React)
local _ = require(parent.Foundation)
local dataHydrationModule = require(parent.DataHydration)
local signalsReactModule = require(parent.SignalsReact)
local getSduiComponentWrapper = require(parent.SduiCoreSystem).getSduiComponentWrapper
local getSduiApiStoreModule = require(sduiSharedUtilities.getSduiApiStore)
local _ = require(sduiSharedUtilities.SduiLoadTimer)
local useCreateClientBindingSduiContextModule = require(sduiSharedUtilities.useCreateClientBindingSduiContext)
local dataHydrationTypes = dataHydrationModule.DataHydrationTypes
local useComponentConfigModule = require(sduiSharedUtilities.hooks.useComponentConfig)
local useComponentLifecycleTimingModule = require(sduiSharedUtilities.hooks.useComponentLifecycleTiming)
local useDataUpdatedTimestampModule = require(sduiSharedUtilities.hooks.useDataUpdatedTimestamp)
local useLocalAnalyticsDataModule = require(sduiSharedUtilities.hooks.useLocalAnalyticsData)
local useUiStatusModule = require(sduiSharedUtilities.hooks.useUiStatus)
local _ = require(sduiSharedUtilities.SduiIntegrationTypes)
local useStatefulRefModule = require(sduiSharedUtilities.hooks.useStatefulRef)
local sduiFeatureEntryPointUiModule = require(sduiSharedUtilities.ui.SduiFeatureEntryPointUi)
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagSduiFeatureEntryPointTakesAbsoluteSizeHandler = sharedFlagsModule.FFlagSduiFeatureEntryPointTakesAbsoluteSizeHandler
local fFlagSduiUseSharedUiStatusHook = sharedFlagsModule.FFlagSduiUseSharedUiStatusHook
local fFlagSduiClientPageScope = sharedFlagsModule.FFlagSduiClientPageScope

local function _(p1)
	-- upvalues: signalsReactModule (ref), getSduiApiStoreModule (ref), dataHydrationTypes (ref)
	local var1 = signalsReactModule.useSignalState(getSduiApiStoreModule().getData(p1).status)
	
	return if var1 == dataHydrationTypes.DataStatus.NotReady then "Loading" elseif var1 == dataHydrationTypes.DataStatus.Failed then "Error" else "Resolved"
end

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: useComponentConfigModule (ref), useComponentLifecycleTimingModule (ref), useDataUpdatedTimestampModule (ref), fFlagSduiUseSharedUiStatusHook (ref), useUiStatusModule (ref), signalsReactModule (ref), getSduiApiStoreModule (ref), dataHydrationTypes (ref), useStatefulRefModule (ref), useCreateClientBindingSduiContextModule (ref), fFlagSduiClientPageScope (ref), useLocalAnalyticsDataModule (ref), reactModule (ref), sduiFeatureEntryPointUiModule (ref), getSduiComponentWrapper (ref), fFlagSduiFeatureEntryPointTakesAbsoluteSizeHandler (ref)
	local var1
	local configKey = p1.configKey
	local appPage = p1.appPage
	local var2 = p1.shouldDisplayLoading == nil or p1.shouldDisplayLoading
	local var3 = p1.shouldDisplayError == nil or p1.shouldDisplayError
	local var4 = useComponentConfigModule(configKey, p1.identifier)
	useComponentLifecycleTimingModule(p1.loadTimer, typeof(var4) == "table")
	local var5 = useDataUpdatedTimestampModule(configKey, p1.identifier)
	local _ = nil
	
	if fFlagSduiUseSharedUiStatusHook then
		var1 = useUiStatusModule(configKey)
	else
		local var6 = signalsReactModule.useSignalState(getSduiApiStoreModule().getData(configKey).status)
		var1 = if var6 == dataHydrationTypes.DataStatus.NotReady then "Loading" elseif var6 == dataHydrationTypes.DataStatus.Failed then "Error" else "Resolved"
	end
	local var7, var8 = useStatefulRefModule(p2)
	
	return reactModule.createElement(sduiFeatureEntryPointUiModule, {
		onRetry = p1.onRetry,
		contentSlot = if var4 then reactModule.createElement(getSduiComponentWrapper(var4), {
			debugName = `SduiFeatureEntryPoint-{configKey}`,
			componentConfig = var4,
			sduiContext = useCreateClientBindingSduiContextModule(appPage, var7, nil, var5, if fFlagSduiClientPageScope then configKey else nil, p1.appCompositionEnabledOverride, p1.routeName),
			localAnalyticsData = useLocalAnalyticsDataModule(configKey, appPage, p1.additionalAnalyticsData),
			extraLocalProps = p1.extraLocalProps
		}) else nil,
		uiStatus = var1,
		errorSlot = p1.errorSlot,
		loadingSlot = p1.loadingSlot,
		shouldDisplayLoading = var2,
		shouldDisplayError = var3,
		onAbsoluteSizeChange = if fFlagSduiFeatureEntryPointTakesAbsoluteSizeHandler then p1.onAbsoluteSizeChange else nil,
		Size = if p1.Size then p1.Size else UDim2.new(1, 0, 0, 0),
		AutomaticSize = if p1.AutomaticSize then p1.AutomaticSize else Enum.AutomaticSize.Y,
		Position = p1.Position,
		LayoutOrder = p1.LayoutOrder,
		ref = var8
	})
end))