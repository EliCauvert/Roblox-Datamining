local Parent = script.Parent.Parent
local Context = Parent.context
local DependenciesModule = require(Parent.dependencies)
local React = DependenciesModule.React
local UIBlox = DependenciesModule.UIBlox
local FoundationModule = require(Parent.Parent.Foundation)
local UseStyleFunction = UIBlox.Core.Style.useStyle
local UseTokensFunction = FoundationModule.Hooks.useTokens
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local TypeModule = require(Parent.type)
local ButtonStack = UIBlox.App.Button.ButtonStack
local ButtonType = UIBlox.App.Button.Enum.ButtonType
local ConstantsModule = require(Parent.constants)
local DefaultContentPadding = ConstantsModule.DefaultContentPadding
local DefaultButtonHeight = ConstantsModule.DefaultButtonHeight
local UseNotificationCardStateModule = require(Context.useNotificationCardState)
local UseNotificationCardDataModule = require(Context.useNotificationCardData)

local function _(Alert)
	-- upvalues: TypeModule (copy), ButtonType (copy)
	return if Alert == TypeModule.SENDERButtonStyleEnum.Growth then ButtonType.PrimaryContextual elseif Alert == TypeModule.SENDERButtonStyleEnum.Primary then ButtonType.PrimarySystem elseif Alert == TypeModule.SENDERButtonStyleEnum.Secondary then ButtonType.Secondary elseif Alert == TypeModule.SENDERButtonStyleEnum.Alert then ButtonType.Alert else ButtonType.Secondary
end

local function v16(Button, Callback, NotificationPayload)
	-- upvalues: UseStyleFunction (copy), FoundationFontFaceMigration (copy), UseTokensFunction (copy), TypeModule (copy), ButtonType (copy)
	local UseStyleResult = UseStyleFunction()
	local UseTokensResult = if FoundationFontFaceMigration then UseTokensFunction() else nil
	local CaptionLarge = if FoundationFontFaceMigration then UseTokensResult.Typography.CaptionLarge else UseStyleResult.Font.CaptionHeader
	local List = {}
	
	if Button then
		for _, value in ipairs(Button) do
			local ButtonStyle = value.buttonStyle
			table.insert(List, {
				buttonType = if ButtonStyle == TypeModule.SENDERButtonStyleEnum.Growth then ButtonType.PrimaryContextual elseif ButtonStyle == TypeModule.SENDERButtonStyleEnum.Primary then ButtonType.PrimarySystem elseif ButtonStyle == TypeModule.SENDERButtonStyleEnum.Secondary then ButtonType.Secondary elseif ButtonStyle == TypeModule.SENDERButtonStyleEnum.Alert then ButtonType.Alert else ButtonType.Secondary,
				props = {
					text = value.label.text,
					fontStyle = CaptionLarge,
					onActivated = function()
						-- upvalues: Callback (copy), NotificationPayload (copy), value (copy)
						if Callback and NotificationPayload then
							Callback(value, NotificationPayload)
						end
					end
				}
			})
		end
	end
	return List
end

return function()
	-- upvalues: UseNotificationCardStateModule (copy), UseNotificationCardDataModule (copy), v16 (copy), React (copy), DefaultContentPadding (copy), ButtonStack (copy), DefaultButtonHeight (copy)
	local Button = UseNotificationCardStateModule("button")
	local UseNotificationCardDataModuleResult = UseNotificationCardDataModule()
	local Buttons = v16(Button, UseNotificationCardDataModuleResult.handleActions, UseNotificationCardDataModuleResult.notificationPayload)
	
	return if #Buttons > 0 then React.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = 3,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y
	}, {
		UIPadding = React.createElement("UIPadding", { PaddingTop = UDim.new(0, DefaultContentPadding) }),
		ActionButtons = Buttons and React.createElement(ButtonStack, {
			buttonHeight = DefaultButtonHeight,
			buttons = Buttons,
			marginBetween = DefaultContentPadding
		})
	}) else nil
end