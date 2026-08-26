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

return function(p1)
	-- upvalues: cryoModule (ref), t (ref), useStyle (ref), useTokens (ref), useIsInExperienceModule (ref), useTelemetryModule (ref), chatDetailsTelemetryLayerModule (ref), useEffectOnMount (ref), chatDetailsTelemetryEventsModule (ref), reactModule (ref), flexIconWithTextCellModule (ref)
	local var1 = cryoModule.Dictionary.join(t, p1)
	local style = var1.style or useStyle()
	local var2 = useTokens()
	local var3 = useIsInExperienceModule()
	local var4 = useTelemetryModule(chatDetailsTelemetryLayerModule.Context)
	useEffectOnMount(function()
		-- upvalues: var4 (ref), chatDetailsTelemetryEventsModule (copy)
		var4.emit(chatDetailsTelemetryEventsModule.ChatDetailsCreateUnfilteredChatCellRendered, {})
	end)
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = var1.layoutOrder,
		Size = UDim2.fromScale(1, 0)
	}, {
		CreateUnfilteredChatRow = reactModule.createElement(flexIconWithTextCellModule, {
			showDivider = false,
			LayoutOrder = var1.layoutOrder,
			onActivated = var1.onActivated,
			primaryIcon = var1.iconImage,
			Size = UDim2.new(1, 0, 0, var1.cellHeight),
			style = style,
			Text = var1.bodyText,
			SubTitleText = var1.subTitleText,
			isDisabled = var1.isLoading,
			BackgroundTransparency = if var3 then var2.Color.None.Transparency else nil
		})
	})
end