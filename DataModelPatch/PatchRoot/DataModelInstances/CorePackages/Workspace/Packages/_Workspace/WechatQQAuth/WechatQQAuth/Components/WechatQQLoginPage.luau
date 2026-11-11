local WechatQQAuth = script:FindFirstAncestor("WechatQQAuth")
local Parent = WechatQQAuth.Parent
local ReactModule = require(Parent.React)
local AuthCommonModule = require(Parent.AuthCommon)
local BackgroundFill = AuthCommonModule.Components.BackgroundFill
local AuthBackgroundContainer = AuthCommonModule.Components.AuthBackgroundContainer
local AuthBackgroundGate = AuthCommonModule.Components.AuthBackgroundGate
local FullscreenPageWithSafeArea = require(Parent.AppBlox).FullscreenPageWithSafeArea
local WechatQQLoginContainerModule = require(WechatQQAuth.Components.WechatQQLoginContainer)
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local Image = FoundationModule.Image
local _Vector2 = Vector2.new(0.98, 0.98)
local WechatQQLoginPage = ReactModule.PureComponent:extend("WechatQQLoginPage")

function WechatQQLoginPage:init() end

function WechatQQLoginPage:didMount() end

function WechatQQLoginPage:willUnmount() end

function WechatQQLoginPage:render()
	-- upvalues: ReactModule (copy), FullscreenPageWithSafeArea (copy), AuthBackgroundGate (copy), AuthBackgroundContainer (copy), BackgroundFill (copy), View (copy), WechatQQLoginContainerModule (copy), _Vector2 (copy), Image (copy)
	return ReactModule.createElement(FullscreenPageWithSafeArea, {
		includeStatusBar = true,
		renderFullscreenBackground = function(_)
			-- upvalues: ReactModule (upval), AuthBackgroundGate (upval), AuthBackgroundContainer (upval), BackgroundFill (upval)
			return ReactModule.createElement(AuthBackgroundGate, {
				renderTreatment = function()
					-- upvalues: ReactModule (upval), AuthBackgroundContainer (upval)
					return ReactModule.createElement(AuthBackgroundContainer, {})
				end,
				renderLegacy = function()
					-- upvalues: ReactModule (upval), BackgroundFill (upval)
					return ReactModule.createElement(BackgroundFill, {
						Image = "rbxasset://textures/ui/LuaApp/graphic/Auth/GridBackground.jpg",
						AspectRatio = 1
					})
				end
			})
		end
	}, {
		MainWrapper = ReactModule.createElement(View, { tag = "size-full-full" }, {
			ContentContainer = ReactModule.createElement(WechatQQLoginContainerModule, {}),
			AgeRatingContainer = ReactModule.createElement(View, {
				tag = "auto-xy anchor-bottom-right bg-system-contrast radius-small",
				Position = UDim2.new(_Vector2.X, 0, _Vector2.Y, 0)
			}, {
				AgeRatingImage = ReactModule.createElement(Image, {
					tag = "gui-object-defaults size-1200-1600",
					Image = "rbxasset://textures/ui/LuaApp/graphic/Auth/ic_aged_rating.png"
				})
			})
		})
	})
end

return WechatQQLoginPage