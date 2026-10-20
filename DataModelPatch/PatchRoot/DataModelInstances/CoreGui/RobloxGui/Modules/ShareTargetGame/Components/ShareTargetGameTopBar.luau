local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local NavigationBarModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Components.NavigationBar)
local ShareTargetGameTopBar = RoactModule.PureComponent:extend("ShareTargetGameTopBar")
ShareTargetGameTopBar.defaultProps = { LayoutOrder = 0 }

function ShareTargetGameTopBar.render(p1)
	-- upvalues: UIBloxModule (copy), RoactModule (copy), NavigationBarModule (copy)
	return UIBloxModule.Style.withStyle(function(p2)
		-- upvalues: RoactModule (upval), p1 (copy), NavigationBarModule (upval)
		return RoactModule.createElement("Frame", {
			BackgroundTransparency = 0,
			BorderSizePixel = 0,
			BackgroundColor3 = p2.Theme.BackgroundDefault.Color,
			Size = UDim2.new(1, 0, 0, 88),
			LayoutOrder = p1.props.LayoutOrder
		}, {
			topBar = RoactModule.createElement(NavigationBarModule, {
				paddingTop = 12,
				title = "Feature.Chat.Heading.ShareGameToChat",
				iconSize = 36,
				icon = "rbxasset://textures/ui/LuaChat/icons/ic-close-white.png",
				buttonLeftPadding = 15,
				titleFont = p2.Font.Header2.Font,
				titleTextSize = p2.Font.Header2.RelativeSize * p2.Font.BaseSize,
				titleColor = p2.Theme.TextEmphasis.Color,
				iconColor = p2.Theme.IconEmphasis.Color,
				Size = UDim2.new(1, 0, 1, 0)
			})
		})
	end)
end

return ShareTargetGameTopBar