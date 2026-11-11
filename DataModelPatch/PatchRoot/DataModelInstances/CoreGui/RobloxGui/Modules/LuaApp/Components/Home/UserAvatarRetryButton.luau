local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactModule = require(game:GetService("CorePackages").Packages.Roact)
local FitChildrenModule = require(Modules.LuaApp.FitChildren)
local RetryButtonModule = require(Modules.LuaApp.Components.RetryButton)
local LocalizedTextLabelModule = require(Modules.LuaApp.Components.LocalizedTextLabel)
local WithThemeDEPRECATEDModule = require(Modules.LuaApp.withTheme_DEPRECATED)
local UserAvatarRetryButton = RoactModule.PureComponent:extend("UserAvatarRetryButton")

function UserAvatarRetryButton.render(p1)
	-- upvalues: RoactModule (copy), FitChildrenModule (copy), RetryButtonModule (copy), LocalizedTextLabelModule (copy)
	local AppTheme = p1.props.appTheme
	local MaxTextWidth = p1.props.maxTextWidth
	
	return RoactModule.createElement(FitChildrenModule.FitFrame, {
		BackgroundTransparency = 1,
		Position = p1.props.position,
		AnchorPoint = p1.props.anchorPoint
	}, {
		ListLayout = RoactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, 40)
		}),
		RetryButton = RoactModule.createElement(RetryButtonModule, {
			layoutOrder = 1,
			onRetry = p1.props.onRetry,
			Position = UDim2.new(0.5, 0, 0.5, 0),
			AnchorPoint = Vector2.new(0.5, 0.5)
		}),
		FailMessage = RoactModule.createElement(LocalizedTextLabelModule, {
			LayoutOrder = 2,
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			Text = "Feature.Avatar.Message.FailedToLoadAvatar",
			TextScaled = true,
			TextXAlignment = Enum.TextXAlignment.Center,
			TextYAlignment = Enum.TextYAlignment.Top,
			Size = if MaxTextWidth then UDim2.new(0, MaxTextWidth, 0, 72) else UDim2.new(1, 0, 0, 72),
			TextColor3 = AppTheme.Main.BodyText.Color,
			Font = AppTheme.Main.BodyText.Font
		}, {
			UITextSizeConstraint = RoactModule.createElement("UITextSizeConstraint", { MaxTextSize = 24 })
		})
	})
end

return (WithThemeDEPRECATEDModule(UserAvatarRetryButton))