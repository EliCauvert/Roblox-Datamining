local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local FitChildrenModule = require(Modules.LuaApp.FitChildren)
local AlignmentModule = require(Modules.LuaApp.Enum.Alignment)
local FoundationModule = require(CorePackages.Packages.Foundation)
local UseDesignTokensFunction = require(CorePackages.Workspace.Packages.Style).useDesignTokens
local BackgroundFill = require(CorePackages.Workspace.Packages.AuthCommon).Components.BackgroundFill
local FFlagEnableLeftNavOnConsole = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableLeftNavOnConsole

return (ReactModule.forwardRef(function(p1, Ref)
	-- upvalues: UseDesignTokensFunction (copy), AlignmentModule (copy), ReactModule (copy), FitChildrenModule (copy), FoundationModule (copy), FFlagEnableLeftNavOnConsole (copy), BackgroundFill (copy)
	local EngagementScreen = UseDesignTokensFunction().LuaApps.EngagementScreen
	local ContentAlign = p1.ContentAlign or AlignmentModule.Top
	local FooterElement = p1.FooterElement
	local config = {
		[AlignmentModule.Top] = {
			Position = UDim2.new(0.5, 0, 0, 0),
			AnchorPoint = Vector2.new(0.5, 0)
		},
		[AlignmentModule.Bottom] = {
			Position = UDim2.new(0.5, 0, 1, 0),
			AnchorPoint = Vector2.new(0.5, 1)
		}
	}
	
	return {
		Logo = ReactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			Position = EngagementScreen.robloxLogoTextImagePosition,
			Size = EngagementScreen.robloxLogoTextImageSize,
			Image = EngagementScreen.robloxLogoTextImageUrl,
			AnchorPoint = Vector2.new(0.5, 0.5)
		}),
		AlignmentContainer = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ZIndex = 2,
			Position = EngagementScreen.buttonContainerPosition,
			Size = UDim2.new(0, EngagementScreen.containerWidth, 0, EngagementScreen.containerHeight),
			AnchorPoint = Vector2.new(0.5, 0.5),
			ref = Ref
		}, {
			Content = ReactModule.createElement(FitChildrenModule.FitFrame, {
				BackgroundTransparency = 1,
				Position = config[ContentAlign].Position,
				Size = UDim2.new(1, 0, 1, 0),
				fitAxis = FitChildrenModule.FitAxis.Height,
				AnchorPoint = config[ContentAlign].AnchorPoint
			}, { p1.children })
		}),
		Footer = FooterElement and ReactModule.createElement(FoundationModule.View, {
			ZIndex = 3,
			tag = "col align-x-center",
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			Position = UDim2.new(0.5, 0, 1, -40),
			AnchorPoint = Vector2.new(0.5, 1)
		}, { Content = FooterElement }),
		Background = if FFlagEnableLeftNavOnConsole then ReactModule.createElement(BackgroundFill, {
			Image = "rbxasset://textures/ui/LuaApp/graphic/Auth/GridBackground.jpg"
		}) else nil
	}
end))