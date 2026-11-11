local WechatQQAuth = script:FindFirstAncestor("WechatQQAuth")
local Parent = WechatQQAuth.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local WechatQQButtonModule = require(WechatQQAuth.Components.WechatQQButton)
local View = FoundationModule.View
local Image = FoundationModule.Image
local Text = FoundationModule.Text

return function(_)
	-- upvalues: UseLocalizationFunction (copy), ReactModule (copy), View (copy), Image (copy), Text (copy), WechatQQButtonModule (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		antiAddictionText = "Luobu.Authentication.Login.Label.AntiAddictionText",
		logInTextWeChat = "Authentication.Login.Action.WeChatLogin",
		logInTextQQ = "Authentication.Login.Action.QQLogin",
		networkLicense = "Luobu.Authentication.Login.Label.NetworkLicense"
	})
	
	return ReactModule.createElement(View, {
		tag = "size-full col align-x-center align-y-center gap-xxlarge padding-large"
	}, {
		Logo = ReactModule.createElement(Image, {
			tag = "gui-object-defaults",
			Image = "rbxasset://textures/ui/LuaApp/graphic/Auth/logo_white_luobu.png",
			ZIndex = 1,
			LayoutOrder = 1,
			aspectRatio = 4.0546875,
			Size = UDim2.new(0.7, 0, 0.7, 0),
			sizeConstraint = { MaxSize = Vector2.new(460, 113.44894026974951) }
		}),
		ContentContainer = ReactModule.createElement(View, {
			tag = "col align-x-center align-y-center auto-xy gap-medium",
			LayoutOrder = 2,
			sizeConstraint = {
				MinSize = Vector2.new(0, 0),
				MaxSize = Vector2.new(360, 1e999)
			}
		}, {
			AntiAddictionText = ReactModule.createElement(Text, {
				tag = "auto-y gui-object-defaults size-full-0 text-align-x-left text-align-y-center text-wrap text-label-small padding-bottom-large",
				LayoutOrder = 1,
				Text = UseLocalizationResult.antiAddictionText,
				textStyle = { Transparency = 0.5 }
			}),
			WechatButton = ReactModule.createElement(WechatQQButtonModule, {
				iconImage = "rbxasset://textures/ui/LuaApp/graphic/Auth/wechatlogo.png",
				backgroundColor = "#00e87e",
				layoutOrder = 2,
				text = UseLocalizationResult.logInTextWeChat,
				onActivated = function() end
			}),
			QQButton = ReactModule.createElement(WechatQQButtonModule, {
				iconImage = "rbxasset://textures/ui/LuaApp/graphic/Auth/qqlogo.png",
				backgroundColor = "#2bb1ff",
				layoutOrder = 3,
				text = UseLocalizationResult.logInTextQQ,
				onActivated = function() end
			}),
			NetworkLicense = ReactModule.createElement(Text, {
				tag = "auto-y gui-object-defaults size-full-0 text-align-x-left text-align-y-center text-wrap text-label-small padding-bottom-large",
				LayoutOrder = 4,
				Text = UseLocalizationResult.networkLicense,
				textStyle = { Transparency = 0.5 }
			})
		})
	})
end