local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local UseDesignTokensFunction = require(CorePackages.Workspace.Packages.Style).useDesignTokens
local _ = require(CorePackages.Packages.ReactOtter)
local GetFFlagConsoleApplyTokenizationEdpFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagConsoleApplyTokenizationEdp

local function tokenSelector(p1)
	return p1.LuaApps.ExperienceDetails or {}
end

return function()
	-- upvalues: UseDesignTokensFunction (copy), tokenSelector (copy), GetFFlagConsoleApplyTokenizationEdpFunction (copy), ReactModule (copy)
	local UseDesignTokensResult = UseDesignTokensFunction(tokenSelector)
	local ThumbnailSize = UseDesignTokensResult.ThumbnailSize
	local ThumbnailMargin = UseDesignTokensResult.ThumbnailMargin
	local SideMargin = UseDesignTokensResult.SideMargin
	local HeaderItemPadding = UseDesignTokensResult.HeaderItemPadding
	local HeaderDescriptionMaxRows = UseDesignTokensResult.HeaderDescriptionMaxRows
	local HeaderDescriptionLineHeight = UseDesignTokensResult.HeaderDescriptionLineHeight
	local ThumbnailShadowHeight = UseDesignTokensResult.ThumbnailShadowHeight
	local HeaderGradientHeight = UseDesignTokensResult.HeaderGradientHeight
	local HeaderBarBackgroundHeight = UseDesignTokensResult.HeaderBarBackgroundHeight
	local HeaderBottomMargin = UseDesignTokensResult.HeaderBottomMargin
	local ActionBarButtonBackgroundColor = UseDesignTokensResult.ActionBarButtonBackgroundColor
	local ActionBarTextButtonPadding = UseDesignTokensResult.ActionBarTextButtonPadding
	local AnimationConfig = UseDesignTokensResult.AnimationConfig
	local ItemPadding = UseDesignTokensResult.ItemPadding
	local SafeAreaSize = UseDesignTokensResult.SafeAreaSize
	local TrailingWhitespace = UseDesignTokensResult.TrailingWhitespace
	local IconSize = UseDesignTokensResult.IconSize
	local ExpandableAreaHeightOffset = if GetFFlagConsoleApplyTokenizationEdpFunction() then UseDesignTokensResult.ExpandableAreaHeightOffset else nil
	local ActionBarHeight = UseDesignTokensResult.actionBarHeight
	
	return ReactModule.useMemo(function()
		-- upvalues: ThumbnailSize (copy), ThumbnailMargin (copy), SideMargin (copy), HeaderItemPadding (copy), HeaderDescriptionMaxRows (copy), HeaderDescriptionLineHeight (copy), ThumbnailShadowHeight (copy), HeaderGradientHeight (copy), HeaderBarBackgroundHeight (copy), HeaderBottomMargin (copy), ActionBarButtonBackgroundColor (copy), ActionBarTextButtonPadding (copy), AnimationConfig (copy), ItemPadding (copy), SafeAreaSize (copy), TrailingWhitespace (copy), IconSize (copy), ExpandableAreaHeightOffset (copy), ActionBarHeight (copy)
		return {
			thumbnailSize = ThumbnailSize,
			thumbnailMargin = ThumbnailMargin,
			sideMargin = SideMargin,
			headerItemPadding = HeaderItemPadding,
			headerDescriptionMaxRows = HeaderDescriptionMaxRows,
			headerDescriptionLineHeight = HeaderDescriptionLineHeight,
			thumbnailShadowHeight = ThumbnailShadowHeight,
			headerGradientHeight = HeaderGradientHeight,
			headerBarBackgroundHeight = HeaderBarBackgroundHeight,
			headerBottomMargin = HeaderBottomMargin,
			actionBarButtonBackgroundColor = if ActionBarButtonBackgroundColor then {
				Color = ActionBarButtonBackgroundColor.Color3,
				Transparency = ActionBarButtonBackgroundColor.Transparency
			} else nil,
			actionBarTextButtonPadding = ActionBarTextButtonPadding,
			animationConfig = AnimationConfig,
			itemPadding = ItemPadding,
			safeAreaSize = SafeAreaSize,
			trailingWhitespace = TrailingWhitespace,
			iconSize = IconSize,
			expandableAreaHeightOffset = ExpandableAreaHeightOffset,
			actionBarHeight = ActionBarHeight
		}
	end, {
		ThumbnailSize, ThumbnailMargin, SideMargin, HeaderItemPadding,
		HeaderDescriptionLineHeight, ActionBarButtonBackgroundColor,
		ActionBarTextButtonPadding, ThumbnailShadowHeight, HeaderBarBackgroundHeight,
		HeaderGradientHeight, HeaderBottomMargin, AnimationConfig, ItemPadding,
		SafeAreaSize, TrailingWhitespace, IconSize, ExpandableAreaHeightOffset,
		ActionBarHeight
	})
end