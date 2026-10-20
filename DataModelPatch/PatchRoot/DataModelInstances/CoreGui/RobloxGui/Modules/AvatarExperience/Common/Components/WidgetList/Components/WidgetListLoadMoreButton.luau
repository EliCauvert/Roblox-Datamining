local CorePackages = game:GetService("CorePackages")
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local ReactModule = require(CorePackages.Packages.React)
local RoactGamepadModule = require(CorePackages.Packages.RoactGamepad)
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local Button = UIBloxModule.App.Button.Button
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local StandardButtonSize = UIBloxModule.App.Button.Enum.StandardButtonSize

return (ReactModule.forwardRef(function(p1, Ref)
	-- upvalues: UseLocalizationFunction (copy), ReactModule (copy), RoactGamepadModule (copy), Button (copy), StandardButtonSize (copy), ButtonType (copy)
	return ReactModule.createElement(RoactGamepadModule.Focusable.Frame, {
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.fromScale(1, 1),
		ref = Ref,
		NextSelectionUp = p1.NextSelectionUp
	}, {
		LoadMoreButton = ReactModule.createElement(Button, {
			onActivated = p1.onActivated,
			text = UseLocalizationFunction({ loadMore = "Feature.Catalog.Action.LoadMore" }).loadMore,
			standardSize = StandardButtonSize.Regular,
			buttonType = ButtonType.Secondary,
			size = UDim2.fromScale(1, 1),
			anchorPoint = Vector2.new(0.5, 0.5),
			position = UDim2.fromScale(0.5, 0.5)
		})
	})
end))