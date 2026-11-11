local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local RoactGamepadModule = require(CorePackages.Packages.RoactGamepad)
local UseDesignTokensFunction = require(CorePackages.Workspace.Packages.Style).useDesignTokens
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local FFlagRenameDeprecatedUIBloxTokens = require(CorePackages.Workspace.Packages.SharedFlags).FFlagRenameDeprecatedUIBloxTokens
local Button = UIBloxModule.App.Button.Button
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local StandardButtonSize = UIBloxModule.App.Button.Enum.StandardButtonSize
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)

return (ReactModule.forwardRef(function(Frame, Ref)
	-- upvalues: UseLocalizationFunction (copy), UseDesignTokensFunction (copy), ReactModule (copy), RoactGamepadModule (copy), FFlagRenameDeprecatedUIBloxTokens (copy), Button (copy), StandardButtonSize (copy), ButtonType (copy)
	local UseLocalizationResult = UseLocalizationFunction({ loadMore = "Feature.Catalog.Action.LoadMore" })
	local UseDesignTokensResult = UseDesignTokensFunction()
	
	return ReactModule.createElement(RoactGamepadModule.Focusable.Frame, {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_1200 else UseDesignTokensResult.Global.Size_600),
		ref = Ref,
		NextSelectionUp = Frame.NextSelectionUp,
		NextSelectionDown = Frame.NextSelectionDown,
		LayoutOrder = Frame.LayoutOrder
	}, {
		LoadMoreButton = ReactModule.createElement(Button, {
			onActivated = Frame.onActivated,
			text = UseLocalizationResult.loadMore,
			standardSize = StandardButtonSize.Regular,
			buttonType = ButtonType.Secondary,
			size = UDim2.fromScale(1, 1),
			anchorPoint = Vector2.new(0.5, 0.5),
			position = UDim2.fromScale(0.5, 0.5)
		})
	})
end))