local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local UseOpenQuickMenuCallbackModule = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.Hooks.useOpenQuickMenuCallback)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local Button = UIBloxModule.App.Button.Button
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local StandardButtonSize = UIBloxModule.App.Button.Enum.StandardButtonSize

return (ReactModule.forwardRef(function(p1, ButtonRef)
	-- upvalues: UseLocalizationFunction (copy), UseOpenQuickMenuCallbackModule (copy), ReactModule (copy), Button (copy), ButtonType (copy), StandardButtonSize (copy)
	return ReactModule.createElement(Button, {
		fitContent = true,
		buttonRef = ButtonRef,
		NextSelectionRight = p1.NextSelectionRight,
		text = UseLocalizationFunction({ buttonText = "Feature.Catalog.Heading.QuickMenu" }).buttonText,
		onActivated = UseOpenQuickMenuCallbackModule(),
		buttonType = ButtonType.Secondary,
		standardSize = StandardButtonSize.Small
	})
end))