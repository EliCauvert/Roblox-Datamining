local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local _ = require(appChat.types)
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local useTelemetryModule = require(appChat.Telemetry.useTelemetry)
local chatDetailsTelemetryEventsModule = require(appChat.Components.ChatDetails.ChatDetailsTelemetryEvents)
local chatDetailsTelemetryLayerModule = require(appChat.Telemetry.Layers.ChatDetailsTelemetryLayer)
local useEffectOnMount = require(parent.RoactUtils).Hooks.useEffectOnMount
local useStyle = require(parent.UIBlox).Core.Style.useStyle
local flexIconWithTextCellModule = require(appChat.Components.Cells.FlexIconWithTextCell)
local useTokens = require(parent.Foundation).Hooks.useTokens
local useIsInExperienceModule = require(appChat.Hooks.useIsInExperience)
local t = {
	bodyText = "Placeholder body",
	subTitleText = "Placeholder subtitle",
	iconImage = nil,
	cellHeight = 48,
	onActivated = function() end
}

return function(p0)
	-- upvalues: cryoModule (ref), t (ref), useStyle (ref), useTokens (ref), useIsInExperienceModule (ref), useTelemetryModule (ref), chatDetailsTelemetryLayerModule (ref), useEffectOnMount (ref), chatDetailsTelemetryEventsModule (ref), reactModule (ref), flexIconWithTextCellModule (ref)
	local var9 = cryoModule.Dictionary.join(t, p0)
	local style = var9.style or useStyle()
	local var11 = useTokens()
	local var12 = useIsInExperienceModule()
	local var13 = useTelemetryModule(chatDetailsTelemetryLayerModule.Context)
	useEffectOnMount(function()
		-- upvalues: var13 (ref), chatDetailsTelemetryEventsModule (copy)
		var13.emit(chatDetailsTelemetryEventsModule.ChatDetailsCreateUnfilteredChatCellRendered, {})
	end)
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = var9.layoutOrder,
		Size = UDim2.fromScale(1, 0)
	}, {
		CreateUnfilteredChatRow = reactModule.createElement(flexIconWithTextCellModule, {
			showDivider = false,
			LayoutOrder = var9.layoutOrder,
			onActivated = var9.onActivated,
			primaryIcon = var9.iconImage,
			Size = UDim2.new(1, 0, 0, var9.cellHeight),
			style = style,
			Text = var9.bodyText,
			SubTitleText = var9.subTitleText,
			isDisabled = var9.isLoading,
			BackgroundTransparency = if var12 then var11.Color.None.Transparency else nil
		})
	})
end