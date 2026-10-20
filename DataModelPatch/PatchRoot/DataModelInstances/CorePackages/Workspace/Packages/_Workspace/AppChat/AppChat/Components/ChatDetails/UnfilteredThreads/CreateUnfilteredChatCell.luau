local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local _ = require(AppChat.types)
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local UseTelemetryModule = require(AppChat.Telemetry.useTelemetry)
local ChatDetailsTelemetryEventsModule = require(AppChat.Components.ChatDetails.ChatDetailsTelemetryEvents)
local ChatDetailsTelemetryLayerModule = require(AppChat.Telemetry.Layers.ChatDetailsTelemetryLayer)
local UseEffectOnMountFunction = require(Parent.RoactUtils).Hooks.useEffectOnMount
local UseStyleFunction = require(Parent.UIBlox).Core.Style.useStyle
local FlexIconWithTextCellModule = require(AppChat.Components.Cells.FlexIconWithTextCell)
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens
local UseIsInExperienceModule = require(AppChat.Hooks.useIsInExperience)
local config = {
	bodyText = "Placeholder body",
	subTitleText = "Placeholder subtitle",
	iconImage = nil,
	cellHeight = 48,
	onActivated = function() end
}

return function(p1)
	-- upvalues: CryoModule (copy), config (copy), UseStyleFunction (copy), UseTokensFunction (copy), UseIsInExperienceModule (copy), UseTelemetryModule (copy), ChatDetailsTelemetryLayerModule (copy), UseEffectOnMountFunction (copy), ChatDetailsTelemetryEventsModule (copy), ReactModule (copy), FlexIconWithTextCellModule (copy)
	local JoinResult = CryoModule.Dictionary.join(config, p1)
	local UseStyleResult = UseStyleFunction()
	local Style = JoinResult.style or UseStyleResult
	local UseTokensResult = UseTokensFunction()
	local UseIsInExperienceModuleResult = UseIsInExperienceModule()
	local UseTelemetryModuleResult = UseTelemetryModule(ChatDetailsTelemetryLayerModule.Context)
	UseEffectOnMountFunction(function()
		-- upvalues: UseTelemetryModuleResult (copy), ChatDetailsTelemetryEventsModule (upval)
		UseTelemetryModuleResult.emit(ChatDetailsTelemetryEventsModule.ChatDetailsCreateUnfilteredChatCellRendered, {})
	end)
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = JoinResult.layoutOrder,
		Size = UDim2.fromScale(1, 0)
	}, {
		CreateUnfilteredChatRow = ReactModule.createElement(FlexIconWithTextCellModule, {
			showDivider = false,
			LayoutOrder = JoinResult.layoutOrder,
			onActivated = JoinResult.onActivated,
			primaryIcon = JoinResult.iconImage,
			Size = UDim2.new(1, 0, 0, JoinResult.cellHeight),
			style = Style,
			Text = JoinResult.bodyText,
			SubTitleText = JoinResult.subTitleText,
			isDisabled = JoinResult.isLoading,
			BackgroundTransparency = if UseIsInExperienceModuleResult then UseTokensResult.Color.None.Transparency else nil
		})
	})
end