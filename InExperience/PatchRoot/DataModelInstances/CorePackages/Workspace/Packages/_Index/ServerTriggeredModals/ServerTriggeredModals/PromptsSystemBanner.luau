local serverTriggeredModals = script:FindFirstAncestor("ServerTriggeredModals")
local parent = serverTriggeredModals.Parent
local reactModule = require(parent.React)
local sduiFeatureEntryPoint = require(parent.SduiSharedUtilities).SduiFeatureEntryPoint
local promptStyleModule = require(script.Parent.SduiV2.PromptStyle)
local usePromptEntriesModule = require(script.Parent.SduiV2.usePromptEntries)
local fFlagPromptsActionEventLoggingModule = require(serverTriggeredModals.Flags.FFlagPromptsActionEventLogging)

return function(p1)
	-- upvalues: usePromptEntriesModule (ref), promptStyleModule (ref), reactModule (ref), sduiFeatureEntryPoint (ref), fFlagPromptsActionEventLoggingModule (ref)
	local var1 = usePromptEntriesModule(p1.configKey, promptStyleModule.SystemBanner)[1]
	
	return if var1 then reactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
		Layout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		SystemBanner = reactModule.createElement(sduiFeatureEntryPoint, {
			shouldDisplayLoading = false,
			shouldDisplayError = false,
			LayoutOrder = 1,
			configKey = p1.configKey,
			identifier = var1.identifier,
			appPage = p1.appPage,
			additionalAnalyticsData = if fFlagPromptsActionEventLoggingModule then {
				promptInstanceId = if var1.identifier then var1.identifier else nil
			} else nil
		}),
		ContentContainer = reactModule.createElement("Frame", {
			LayoutOrder = 2,
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 0)
		}, {
			UIFlexItem = reactModule.createElement("UIFlexItem", { FlexMode = Enum.UIFlexMode.Fill }),
			Content = p1.contentSlot
		})
	}) else p1.contentSlot
end