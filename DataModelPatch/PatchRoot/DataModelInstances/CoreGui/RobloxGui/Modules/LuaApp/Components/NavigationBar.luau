local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local ColorsModule = require(Modules.LuaApp.Themes.Colors)
local LocalizedTextLabelModule = require(Modules.LuaApp.Components.LocalizedTextLabel)
local TouchFriendlyIconButtonModule = require(Modules.LuaApp.Components.Generic.TouchFriendlyIconButton)
local NavigateBackModule = require(Modules.LuaApp.Thunks.NavigateBack)
local FFlagSignalsNavP3Dispatch = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(CorePackages.Workspace.Packages.RobloxAppNavigation).NavigationCommands else nil
local NavigationBar = RoactModule.PureComponent:extend("NavigationBar")
NavigationBar.defaultProps = {
	icon = "LuaApp/icons/ic-roblox-close",
	iconSize = 36,
	buttonSize = 36,
	buttonLeftPadding = 10,
	titleTextSize = 23,
	paddingTop = 0,
	paddingBottom = 0,
	iconColor = ColorsModule.White,
	titleFont = Enum.Font.SourceSansBold,
	titleColor = ColorsModule.White
}

function NavigationBar.render(p1)
	-- upvalues: RoactModule (copy), TouchFriendlyIconButtonModule (copy), LocalizedTextLabelModule (copy)
	local ButtonSize = p1.props.buttonSize
	local Title = p1.props.title
	local TitleFont = p1.props.titleFont
	local TitleTextSize = p1.props.titleTextSize
	local TitleColor = p1.props.titleColor
	
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = p1.props.Size,
		Position = p1.props.Position
	}, {
		Padding = RoactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, p1.props.paddingTop),
			PaddingBottom = UDim.new(0, p1.props.paddingBottom)
		}),
		NavigationButton = RoactModule.createElement(TouchFriendlyIconButtonModule, {
			Position = UDim2.new(0, p1.props.buttonLeftPadding, 0.5, 0),
			AnchorPoint = Vector2.new(0, 0.5),
			Size = UDim2.new(0, ButtonSize, 0, ButtonSize),
			onActivated = p1.props.onNavigationButtonActivated or p1.props.navigateBack,
			icon = p1.props.icon,
			iconColor = p1.props.iconColor,
			iconSize = p1.props.iconSize
		}),
		Title = Title and RoactModule.createElement(LocalizedTextLabelModule, {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, 0),
			Text = Title,
			Font = TitleFont,
			TextSize = TitleTextSize,
			TextColor3 = TitleColor,
			TextXAlignment = Enum.TextXAlignment.Center,
			TextYAlignment = Enum.TextYAlignment.Center
		})
	})
end

return RoactRoduxModule.connect(nil, function(Callback)
	-- upvalues: FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateBackModule (copy)
	return {
		navigateBack = function()
			-- upvalues: FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), Callback (copy), NavigateBackModule (upval)
			return if FFlagSignalsNavP3Dispatch then NavigationCommands.back() else Callback(NavigateBackModule())
		end
	}
end)(NavigationBar)