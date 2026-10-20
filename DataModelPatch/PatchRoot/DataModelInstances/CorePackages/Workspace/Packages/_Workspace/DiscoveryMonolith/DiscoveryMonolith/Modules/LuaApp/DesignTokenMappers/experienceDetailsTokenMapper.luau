local Parent = script:FindFirstAncestor("DiscoveryMonolith").Parent
local _ = require(Parent.RobloxAppHooks)
local _ = require(Parent.Style)
local UiMode = require(Parent.RobloxAppEnums).UiMode
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagRenameDeprecatedUIBloxTokens = SharedFlagsModule.FFlagRenameDeprecatedUIBloxTokens
local GetFFlagConsoleApplyTokenizationEdpFunction = SharedFlagsModule.GetFFlagConsoleApplyTokenizationEdp
local FFlagLuaAppUnifyPlayButtonNonMobileEdp = SharedFlagsModule.FFlagLuaAppUnifyPlayButtonNonMobileEdp

return function(p1, p2)
	-- upvalues: FFlagRenameDeprecatedUIBloxTokens (copy), UiMode (copy), GetFFlagConsoleApplyTokenizationEdpFunction (copy), FFlagLuaAppUnifyPlayButtonNonMobileEdp (copy)
	local ThumbnailSize: number? = nil
	local SideMargin: number? = nil
	local Size800 = nil
	local Size200 = nil
	local HeaderBarBackgroundHeight: number? = nil
	local HeaderDescriptionMaxRows: number? = nil
	local LineHeight130 = nil
	local ThumbnailShadowHeight: number? = nil
	local HeaderGradientHeight: number? = nil
	local Size1000 = nil
	local Surface300 = nil
	local ActionBarTextButtonPadding: Vector2? = nil
	local AnimationConfig = nil
	local Size600 = nil
	local SafeAreaSize: Vector2? = nil
	local TrailingWhitespace: number? = nil
	local v1 = nil
	local Medium = if FFlagRenameDeprecatedUIBloxTokens then p2.Radius.Medium else p2.Semantic.Radius.Medium
	local Size400 = if FFlagRenameDeprecatedUIBloxTokens then p2.Size.Size_400 else p2.Global.Size_200
	local PanelWidthScale = 1
	local Size600_1 = if FFlagRenameDeprecatedUIBloxTokens then p2.Size.Size_600 else p2.Global.Size_300
	local Size1200 = nil
	
	if p1.uiMode == UiMode.TenFoot then
		if GetFFlagConsoleApplyTokenizationEdpFunction() then
			v1 = (if FFlagRenameDeprecatedUIBloxTokens then p2.Size.Size_200 else p2.Global.Size_100) * 49
			ThumbnailSize = (if FFlagRenameDeprecatedUIBloxTokens then p2.Size.Size_200 else p2.Global.Size_100) * 33
		else
			ThumbnailSize = 400
		end
		SideMargin = 0
		HeaderGradientHeight = 0
		HeaderBarBackgroundHeight = 0
		HeaderDescriptionMaxRows = 4
		Size800 = if FFlagRenameDeprecatedUIBloxTokens then p2.Size.Size_800 else p2.Global.Space_400
		Size200 = if FFlagRenameDeprecatedUIBloxTokens then p2.Size.Size_200 else p2.Global.Space_100
		LineHeight130 = if FFlagRenameDeprecatedUIBloxTokens then p2.LineHeight.LineHeight_130 else p2.Global.LineHeight_300
		ThumbnailShadowHeight = 0
		Size1000 = if FFlagRenameDeprecatedUIBloxTokens then p2.Size.Size_1000 else p2.Global.Space_500
		Surface300 = if FFlagRenameDeprecatedUIBloxTokens then p2.Color.Surface.Surface_300 else p2.Semantic.Color.BackgroundUi.Default
		ActionBarTextButtonPadding = Vector2.new(if FFlagRenameDeprecatedUIBloxTokens then p2.Size.Size_400 else p2.Global.Size_200, if FFlagRenameDeprecatedUIBloxTokens then p2.Size.Size_200 else p2.Global.Size_100)
		AnimationConfig = { dampingRatio = 1, frequency = 3 }
		Size600 = if FFlagRenameDeprecatedUIBloxTokens then p2.Size.Size_600 else p2.Global.Space_300
		SafeAreaSize = Vector2.new(if FFlagRenameDeprecatedUIBloxTokens then p2.Size.Size_1600 else p2.Global.Size_800, if FFlagRenameDeprecatedUIBloxTokens then p2.Size.Size_2400 else p2.Global.Size_1200)
		TrailingWhitespace = 3000
		PanelWidthScale = 0.6
		Size1200 = if FFlagLuaAppUnifyPlayButtonNonMobileEdp then if FFlagRenameDeprecatedUIBloxTokens then p2.Size.Size_1000 else p2.Global.Size_500 else nil
	else
		Size1200 = if FFlagRenameDeprecatedUIBloxTokens then p2.Size.Size_1200 else p2.Global.Size_600
	end
	return {
		ThumbnailSize = ThumbnailSize,
		ThumbnailMargin = Size800,
		SideMargin = SideMargin,
		HeaderItemPadding = Size200,
		HeaderDescriptionMaxRows = HeaderDescriptionMaxRows,
		HeaderDescriptionLineHeight = LineHeight130,
		ThumbnailShadowHeight = ThumbnailShadowHeight,
		HeaderGradientHeight = HeaderGradientHeight,
		HeaderBarBackgroundHeight = HeaderBarBackgroundHeight,
		HeaderBottomMargin = Size1000,
		ActionBarButtonBackgroundColor = Surface300,
		ActionBarTextButtonPadding = ActionBarTextButtonPadding,
		AnimationConfig = AnimationConfig,
		ItemPadding = Size600,
		SafeAreaSize = SafeAreaSize,
		TrailingWhitespace = TrailingWhitespace,
		PanelRadius = Medium,
		PanelHeaderMargin = Size400,
		PanelWidthScale = PanelWidthScale,
		PanelInnerPadding = Size600_1,
		IconSize = if FFlagRenameDeprecatedUIBloxTokens then p2.Size.Size_900 else p2.Semantic.Icon.Size.Medium,
		ExpandableAreaHeightOffset = if GetFFlagConsoleApplyTokenizationEdpFunction() then v1 else nil,
		actionBarHeight = Size1200
	}
end