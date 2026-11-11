local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local WithLocalizationModule = require(Modules.LuaApp.withLocalization)
local WithStyleFunction = require(CorePackages.Packages.UIBlox).Style.withStyle
local UseDesignTokensFunction = require(CorePackages.Workspace.Packages.Style).useDesignTokens
local FitChildrenModule = require(Modules.LuaApp.FitChildren)
local FitTextLabelModule = require(Modules.LuaApp.Components.FitTextLabel)
local UserThumbnailModule = require(Modules.LuaApp.Components.Authentication.CrossDeviceLogin.UserThumbnail)

return function(Player: Player)
	-- upvalues: UseDesignTokensFunction (copy), WithStyleFunction (copy), WithLocalizationModule (copy), RoactModule (copy), UserThumbnailModule (copy), FitTextLabelModule (copy), FitChildrenModule (copy)
	local LoginView = UseDesignTokensFunction().LuaApps.LoginView
	
	return WithStyleFunction(function(p1)
		-- upvalues: Player (copy), WithLocalizationModule (upval), RoactModule (upval), UserThumbnailModule (upval), LoginView (copy), FitTextLabelModule (upval), FitChildrenModule (upval)
		local UserId = Player.UserId
		local DisplayName = Player.DisplayName
		local BodyFont = p1.Font.Body.Font
		local BaseSize = p1.Font.BaseSize
		local ScaledBaseSize = BaseSize * p1.Font.Body.RelativeSize
		local ScaledBaseSize1 = BaseSize * p1.Font.CaptionBody.RelativeSize
		local Transparency = p1.Theme.TextEmphasis.Transparency
		local Color = p1.Theme.TextEmphasis.Color
		local Color1 = p1.Theme.BackgroundUIDefault.Color
		local LeftAlignText = Player.leftAlignText
		
		return WithLocalizationModule({
			confirmLogin = "Authentication.CrossDevice.Label.ConfirmOnDevice",
			loggingInAs = "Authentication.CrossDevice.Label.LogginInAs"
		})(function(p2)
			-- upvalues: RoactModule (upval), UserThumbnailModule (upval), LoginView (upval), UserId (copy), Color1 (copy), FitTextLabelModule (upval), FitChildrenModule (upval), Color (copy), BodyFont (copy), ScaledBaseSize (copy), Transparency (copy), LeftAlignText (copy), DisplayName (copy), ScaledBaseSize1 (copy)
			return RoactModule.createFragment({
				UserThumbnail = RoactModule.createElement(UserThumbnailModule, {
					LayoutOrder = 1,
					Size = UDim2.new(0, LoginView.thumbnailSize, 0, LoginView.thumbnailSize),
					UserId = UserId,
					MaskColor = Color1
				}),
				Spacer = RoactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 2,
					Size = UDim2.new(1, 0, 0, LoginView.spacerSize)
				}),
				ConfirmLogin = RoactModule.createElement(FitTextLabelModule, {
					TextWrapped = true,
					BackgroundTransparency = 1,
					LayoutOrder = 3,
					Size = UDim2.new(1, 0, 0, 0),
					fitAxis = FitChildrenModule.FitAxis.Height,
					Text = p2.confirmLogin,
					TextColor3 = Color,
					Font = BodyFont,
					TextSize = ScaledBaseSize,
					TextTransparency = Transparency,
					TextXAlignment = if LeftAlignText then Enum.TextXAlignment.Left else nil
				}),
				LoggingInAs = DisplayName and RoactModule.createElement(FitTextLabelModule, {
					TextWrapped = true,
					RichText = true,
					BackgroundTransparency = 1,
					LayoutOrder = 4,
					Size = UDim2.new(1, 0, 0, 0),
					fitAxis = FitChildrenModule.FitAxis.Height,
					Text = string.format(p2.loggingInAs, "<b>" .. DisplayName .. "</b>"),
					TextColor3 = Color,
					Font = BodyFont,
					TextSize = ScaledBaseSize1,
					TextTransparency = Transparency,
					TextXAlignment = if LeftAlignText then Enum.TextXAlignment.Left else nil
				})
			})
		end)
	end)
end