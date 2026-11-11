local CorePackages = game:GetService("CorePackages")
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local FFlagRenameDeprecatedUIBloxTokens = require(CorePackages.Workspace.Packages.SharedFlags).FFlagRenameDeprecatedUIBloxTokens
local ReactModule = require(CorePackages.Packages.React)
local Focusable = require(CorePackages.Packages.RoactGamepad).Focusable
local ImageSetButton = UIBloxModule.Core.ImageSet.ImageSetButton
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local UseDesignTokensFunction = require(CorePackages.Workspace.Packages.Style).useDesignTokens
local UseIsGamepadFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.useIsGamepad
local ConstantsModule = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.AvatarRefinement.Constants)
local IconsActionsReset = UIBloxModule.App.ImageSet.Images["icons/actions/reset"]

local function mapTokens(p1)
	-- upvalues: FFlagRenameDeprecatedUIBloxTokens (copy)
	return {
		mediumIconSize = if FFlagRenameDeprecatedUIBloxTokens then p1.Size.Size_900 else p1.Semantic.Icon.Size.Medium
	}
end

return function(p1)
	-- upvalues: UseDesignTokensFunction (copy), mapTokens (copy), UseStyleFunction (copy), UseIsGamepadFunction (copy), ReactModule (copy), Focusable (copy), ImageSetButton (copy), ConstantsModule (copy), IconsActionsReset (copy)
	local UseDesignTokensResult = UseDesignTokensFunction(mapTokens)
	
	return ReactModule.createElement(Focusable[ImageSetButton], {
		ref = p1.resetRef,
		AnchorPoint = Vector2.new(1, 1),
		Position = UDim2.new(1, -ConstantsModule.RightMargin, 0, -9),
		Size = UDim2.new(0, UseDesignTokensResult.mediumIconSize, 0, UseDesignTokensResult.mediumIconSize),
		BackgroundTransparency = 1,
		Image = IconsActionsReset,
		ImageColor3 = UseStyleFunction().Theme.SystemPrimaryDefault.Color,
		ImageTransparency = 0,
		LayoutOrder = 1,
		[ReactModule.Event.Activated] = p1.onResetButtonPressed,
		NextSelectionLeft = p1.NextSelectionLeft,
		ZIndex = 3,
		Visible = not UseIsGamepadFunction()
	})
end