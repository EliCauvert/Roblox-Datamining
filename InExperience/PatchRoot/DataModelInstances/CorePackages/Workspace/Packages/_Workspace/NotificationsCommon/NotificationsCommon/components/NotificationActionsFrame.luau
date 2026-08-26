local parent = script.Parent.Parent
local context = parent.context
local dependenciesModule = require(parent.dependencies)
local react = dependenciesModule.React
local UIBlox = dependenciesModule.UIBlox
local useStyle = UIBlox.Core.Style.useStyle
local typeModule = require(parent.type)
local buttonStack = UIBlox.App.Button.ButtonStack
local buttonType = UIBlox.App.Button.Enum.ButtonType
local constantsModule = require(parent.constants)
local defaultContentPadding = constantsModule.DefaultContentPadding
local defaultButtonHeight = constantsModule.DefaultButtonHeight
local useNotificationCardStateModule = require(context.useNotificationCardState)
local useNotificationCardDataModule = require(context.useNotificationCardData)

local _ = function(p1)
	-- upvalues: typeModule (ref), buttonType (ref)
	return if p1 == typeModule.SENDERButtonStyleEnum.Growth then buttonType.PrimaryContextual elseif p1 == typeModule.SENDERButtonStyleEnum.Primary then buttonType.PrimarySystem elseif p1 == typeModule.SENDERButtonStyleEnum.Secondary then buttonType.Secondary elseif p1 == typeModule.SENDERButtonStyleEnum.Alert then buttonType.Alert else buttonType.Secondary
end

local var1 = function(p1, p2, p3)
	-- upvalues: useStyle (ref), typeModule (ref), buttonType (ref)
	local captionHeader = useStyle().Font.CaptionHeader
	local t = {}
	
	if p1 then
		for i, v in ipairs(p1) do
			local t_1 = {}
			local buttonStyle = v.buttonStyle
			t_1.buttonType = if buttonStyle == typeModule.SENDERButtonStyleEnum.Growth then buttonType.PrimaryContextual elseif buttonStyle == typeModule.SENDERButtonStyleEnum.Primary then buttonType.PrimarySystem elseif buttonStyle == typeModule.SENDERButtonStyleEnum.Secondary then buttonType.Secondary elseif buttonStyle == typeModule.SENDERButtonStyleEnum.Alert then buttonType.Alert else buttonType.Secondary
			t_1.props = {
				text = v.label.text,
				fontStyle = captionHeader,
				onActivated = function()
					-- upvalues: p2 (ref), p3 (ref), v (ref)
					if p2 and p3 then
						p2(v, p3)
					end
				end
			}
			table.insert(t, t_1)
		end
	end
	return t
end

return function()
	-- upvalues: useNotificationCardStateModule (ref), useNotificationCardDataModule (ref), var1 (ref), react (ref), defaultContentPadding (ref), buttonStack (ref), defaultButtonHeight (ref)
	local var2 = useNotificationCardDataModule()
	local var3 = var1(useNotificationCardStateModule("button"), var2.handleActions, var2.notificationPayload)
	
	return if #var3 > 0 then react.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = 3,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y
	}, {
		UIPadding = react.createElement("UIPadding", { PaddingTop = UDim.new(0, defaultContentPadding) }),
		ActionButtons = var3 and react.createElement(buttonStack, {
			buttonHeight = defaultButtonHeight,
			buttons = var3,
			marginBetween = defaultContentPadding
		})
	}) else nil
end