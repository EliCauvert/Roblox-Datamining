local CorePackages = game:GetService("CorePackages")
local AppFonts = require(CorePackages.Workspace.Packages.Style).AppFonts
local _ = require(CorePackages.Workspace.Packages.RobloxAppHooks)
local _ = require(CorePackages.Workspace.Packages.Style)
local UiMode = require(CorePackages.Workspace.Packages.RobloxAppEnums).UiMode

return function(p1, p2)
	-- upvalues: AppFonts (copy), UiMode (copy)
	local Size400 = p2.Size.Size_400
	local Size2000 = p2.Size.Size_2000
	local Size500 = p2.Size.Size_500
	local Size2400 = p2.Size.Size_2400
	local TitleLarge = { FontSize = 24, Font = AppFonts.default:getMedium() }
	local HeadingSmall = { FontSize = 24, Font = AppFonts.default:getMedium() }
	local BodyLarge = { FontSize = 19, Font = AppFonts.default:getDefault() }
	local Emphasis = p2.Color.Content.Emphasis
	local Emphasis1 = p2.Color.Content.Emphasis
	local Emphasis2 = p2.Color.Content.Emphasis
	local BodySmall = { FontSize = 14, Font = AppFonts.default:getDefault() }
	local Alert = p2.Color.System.Alert
	local Size200 = 0
	local Bottom = Enum.VerticalAlignment.Bottom
	local ButtonFrameWidth = 1
	
	if p1.uiMode == UiMode.TenFoot then
		Size400 = p2.Size.Size_1600
		Size2000 = p2.Size.Size_1600
		Size500 = p2.Size.Size_600 + p2.Size.Size_400
		Size2400 = p2.Size.Size_1600 * 2
		HeadingSmall = p2.Typography.HeadingSmall
		TitleLarge = p2.Typography.TitleLarge
		BodyLarge = p2.Typography.BodyLarge
		Emphasis2 = p2.Color.Content.Default
		BodySmall = p2.Typography.BodySmall
		Size200 = p2.Size.Size_200
		Bottom = Enum.VerticalAlignment.Center
		ButtonFrameWidth = 0.5
	end
	return {
		verticalPadding = Size500,
		iconSize = Size2400,
		layoutHeaderFont = HeadingSmall,
		headerFont = TitleLarge,
		bodyFont = BodyLarge,
		layoutTextColor = Emphasis,
		headerTextColor = Emphasis1,
		bodyTextColor = Emphasis2,
		textAlertFont = BodySmall,
		textAlertColor = Alert,
		headerPadding = Size200,
		warningTextVerticalAlignment = Bottom,
		buttonFrameWidth = ButtonFrameWidth,
		getDevicePadding = function(p3)
			-- upvalues: Size2000 (ref), Size400 (ref)
			return if p3 then Size2000 else Size400
		end
	}
end