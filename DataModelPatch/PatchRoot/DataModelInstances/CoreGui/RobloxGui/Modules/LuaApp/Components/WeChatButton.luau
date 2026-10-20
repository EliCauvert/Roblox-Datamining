local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local CryoModule = require(CorePackages.Packages.Cryo)
local GenericIconTextButtonModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Components.GenericIconTextButton)
local Colors = require(CorePackages.Workspace.Packages.Style).Colors
local _UDim2 = UDim2.new(0, 37, 0, 37)
local WeChatButton = RoactModule.PureComponent:extend("WeChatButton")

function WeChatButton.render(p1)
	-- upvalues: Colors (copy), RoactModule (copy), GenericIconTextButtonModule (copy), CryoModule (copy), _UDim2 (copy)
	local Props = p1.props
	
	return RoactModule.createElement(GenericIconTextButtonModule, CryoModule.Dictionary.join(Props, {
		iconImage = "rbxasset://textures/ui/LuaApp/graphic/Auth/wechatlogo.png",
		leftIconEnabled = true,
		iconRightPadding = 10,
		iconSize = _UDim2,
		themeSettings = {
			OnPressTransparency = 0.5,
			DisabledTransparency = 0.5,
			Color = Props.Color or Colors.Green,
			Transparency = Props.Transparency or 0,
			DisabledColor = Colors.White,
			Text = { Transparency = 0, Color = Colors.White },
			Border = { Hidden = true, Transparency = 1 }
		}
	}))
end

return WeChatButton