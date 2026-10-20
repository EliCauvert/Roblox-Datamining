local ServerTriggeredModals = script:FindFirstAncestor("ServerTriggeredModals")
local Parent = ServerTriggeredModals.Parent
local ReactModule = require(Parent.React)
local SduiFeatureEntryPoint = require(Parent.SduiSharedUtilities).SduiFeatureEntryPoint
local PromptStyleModule = require(script.Parent.SduiV2.PromptStyle)
local UsePromptEntriesModule = require(script.Parent.SduiV2.usePromptEntries)
local FFlagPromptsActionEventLoggingModule = require(ServerTriggeredModals.Flags.FFlagPromptsActionEventLogging)

return function(p1)
	-- upvalues: UsePromptEntriesModule (copy), PromptStyleModule (copy), ReactModule (copy), SduiFeatureEntryPoint (copy), FFlagPromptsActionEventLoggingModule (copy)
	local UsePromptEntriesModuleResultEntry = UsePromptEntriesModule(p1.configKey, PromptStyleModule.SystemBanner)[1]
	
	return if UsePromptEntriesModuleResultEntry then ReactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
		Layout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		SystemBanner = ReactModule.createElement(SduiFeatureEntryPoint, {
			shouldDisplayLoading = false,
			shouldDisplayError = false,
			LayoutOrder = 1,
			configKey = p1.configKey,
			identifier = UsePromptEntriesModuleResultEntry.identifier,
			appPage = p1.appPage,
			additionalAnalyticsData = if FFlagPromptsActionEventLoggingModule then {
				promptInstanceId = if UsePromptEntriesModuleResultEntry.identifier then UsePromptEntriesModuleResultEntry.identifier else nil
			} else nil
		}),
		ContentContainer = ReactModule.createElement("Frame", {
			LayoutOrder = 2,
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 0)
		}, {
			UIFlexItem = ReactModule.createElement("UIFlexItem", { FlexMode = Enum.UIFlexMode.Fill }),
			Content = p1.contentSlot
		})
	}) else p1.contentSlot
end