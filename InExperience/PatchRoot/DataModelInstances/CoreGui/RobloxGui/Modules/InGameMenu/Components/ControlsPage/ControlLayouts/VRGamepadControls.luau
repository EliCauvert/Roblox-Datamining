local corePackagesService = game:GetService("CorePackages")
local inGameMenuDependenciesModule = require(corePackagesService.Packages.InGameMenuDependencies)
local roact = inGameMenuDependenciesModule.Roact
local UIBlox = inGameMenuDependenciesModule.UIBlox
local inGameMenu = script:FindFirstAncestor("InGameMenu")
local array = require(corePackagesService.Packages.LuauPolyfill).Array
local controlLayoutContainerModule = require(script.Parent.Parent.ControlLayoutContainer)
local themedTextLabelModule = require(inGameMenu.Components.ThemedTextLabel)
local assetsModule = require(inGameMenu.Resources.Assets)
local controlsModule = require(inGameMenu.Resources.Controls)
local reactModule = require(corePackagesService.Packages.React)
local withLocalizationModule = require(inGameMenu.Localization.withLocalization)
local imageSetLabel = UIBlox.Core.ImageSet.ImageSetLabel
local image = require(corePackagesService.Packages.Foundation).Image
local fFlagCoreUiMigrateUIBloxToFoundation = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagCoreUiMigrateUIBloxToFoundation
local t = {
	ResetCameraLabel = "CoreScripts.InGameMenu.Controls.ResetCameraLabel",
	MenuLabel = "CoreScripts.InGameMenu.Controls.MenuLabel",
	SelectItemLabel = "CoreScripts.InGameMenu.Controls.SelectItemLabel",
	BackExitLabel = "CoreScripts.InGameMenu.Controls.BackExitLabel",
	FirstPersonCameraLabel = "CoreScripts.InGameMenu.Controls.FirstPersonCameraLabel",
	JumpSelectLabel = "CoreScripts.InGameMenu.Controls.JumpSelectLabel"
}

return function(_)
	-- upvalues: roact (ref), controlLayoutContainerModule (ref), fFlagCoreUiMigrateUIBloxToFoundation (ref), image (ref), imageSetLabel (ref), assetsModule (ref), reactModule (ref), array (ref), controlsModule (ref), t (ref), withLocalizationModule (ref), themedTextLabelModule (ref)
	return roact.createElement(controlLayoutContainerModule, {
		titleText = "CoreScripts.InGameMenu.Controls.GamepadTitle"
	}, {
		GamepadImage = roact.createElement(if fFlagCoreUiMigrateUIBloxToFoundation then image else imageSetLabel, {
			BackgroundTransparency = if fFlagCoreUiMigrateUIBloxToFoundation then nil else 1,
			backgroundStyle = if fFlagCoreUiMigrateUIBloxToFoundation then { Transparency = 1 } else nil,
			Image = assetsModule.Images.GamepadQuest,
			Size = UDim2.new(1, 0, 0.6, 0),
			Position = UDim2.new(0.5, 16.5, 0.5, 0),
			AnchorPoint = Vector2.new(0.5, 0.5),
			SizeConstraint = Enum.SizeConstraint.RelativeXX,
			testId = if fFlagCoreUiMigrateUIBloxToFoundation then "VRGamepadInstructions" else nil,
			[reactModule.Tag] = if fFlagCoreUiMigrateUIBloxToFoundation then nil else "data-testid=VRGamepadInstructions"
		}, {
			array.map(controlsModule.questGamepadLabels, function(p1, p2)
				-- upvalues: t (copy), withLocalizationModule (copy), roact (copy), themedTextLabelModule (copy)
				return withLocalizationModule({ t[p1.labelKey] })(function(p3)
					-- upvalues: roact (copy), themedTextLabelModule (copy), p1 (ref), p2 (ref)
					return roact.createElement(themedTextLabelModule, {
						fontKey = "Header2",
						themeKey = "TextEmphasis",
						TextScaled = true,
						key = p1.labelKey,
						TextXAlignment = p1.xAlignment or Enum.TextXAlignment.Right,
						Size = UDim2.new(p1.width, 0, 0.026, 0),
						Text = p3[1],
						LayoutOrder = p2,
						Position = UDim2.new(p1.xPosition, 0, p1.yPosition, 0)
					})
				end)
			end)
		})
	})
end