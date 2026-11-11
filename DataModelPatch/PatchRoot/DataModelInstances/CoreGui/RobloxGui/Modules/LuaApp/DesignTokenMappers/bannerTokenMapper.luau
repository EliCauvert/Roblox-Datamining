local CorePackages = game:GetService("CorePackages")
local _ = require(CorePackages.Workspace.Packages.RobloxAppHooks)
local _ = require(CorePackages.Workspace.Packages.Style)
local UiMode = require(CorePackages.Workspace.Packages.RobloxAppEnums).UiMode
local CryoModule = require(CorePackages.Packages.Cryo)
local StaticSMBannerTheme = game:DefineFastFlag("StaticSMBannerTheme", false)
local FFlagEnableLeftNavOnConsole = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableLeftNavOnConsole

return function(p1, p2)
	-- upvalues: StaticSMBannerTheme (copy), UiMode (copy), FFlagEnableLeftNavOnConsole (copy), CryoModule (copy)
	local Size400 = 0
	local Size600 = 0
	local Size400_1 = 0
	local Size1600 = 0
	local Size1600_1 = 0
	local JoinResult = { autoButtonColor = true, height = p2.Size.Size_1000 }
	local JoinResult1 = {
		autoButtonColor = true,
		verticalPadding = 5,
		horizontalPadding = 15,
		height = p2.Size.Size_400,
		typography = p2.Typography.BodyLarge,
		textColor = if StaticSMBannerTheme then p2.Color.Extended.White.White_100 else p2.Color.Content.Emphasis,
		backgroundColor = p2.Color.Extended.Gray.Gray_700
	}
	
	if p1.uiMode == UiMode.TenFoot and not FFlagEnableLeftNavOnConsole then
		JoinResult = CryoModule.Dictionary.join(JoinResult, {
			autoButtonColor = false,
			cornerRadius = UDim.new(0, p2.Radius.Medium),
			height = p2.Size.Size_1200,
			strokeColor = p2.Color.Stroke.Emphasis
		})
		JoinResult1 = CryoModule.Dictionary.join(JoinResult1, {
			autoButtonColor = false,
			cornerRadius = UDim.new(0, p2.Radius.Medium),
			height = p2.Size.Size_800,
			strokeColor = p2.Color.System.Contrast,
			verticalPadding = p2.Size.Size_100,
			horizontalPadding = p2.Size.Size_200
		})
		Size400 = p2.Size.Size_400
		Size600 = p2.Size.Size_600
		Size400_1 = p2.Size.Size_400
		Size1600 = p2.Size.Size_1600
		Size1600_1 = p2.Size.Size_1600
	end
	return {
		verticalPadding = Size400,
		topMargin = Size600,
		bottomMargin = Size400_1,
		leftMargin = Size1600,
		rightMargin = Size1600_1,
		siteMessageBanner = JoinResult1,
		securityBanner = JoinResult
	}
end