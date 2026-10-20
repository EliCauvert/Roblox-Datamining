local CorePackages = game:GetService("CorePackages")
local InGameMenuDependenciesModule = require(CorePackages.Packages.InGameMenuDependencies)
local Roact = InGameMenuDependenciesModule.Roact
local InGameMenu = script:FindFirstAncestor("InGameMenu")
local Array = require(CorePackages.Packages.LuauPolyfill).Array
local ControlLayoutContainerModule = require(script.Parent.Parent.ControlLayoutContainer)
local ThemedTextLabelModule = require(InGameMenu.Components.ThemedTextLabel)
local AssetsModule = require(InGameMenu.Resources.Assets)
local ControlsModule = require(InGameMenu.Resources.Controls)
local ReactModule = require(CorePackages.Packages.React)
local WithLocalizationModule = require(InGameMenu.Localization.withLocalization)
local ImageSetLabel = InGameMenuDependenciesModule.UIBlox.Core.ImageSet.ImageSetLabel
local Image = require(CorePackages.Packages.Foundation).Image
local FFlagCoreUiMigrateUIBloxToFoundation = require(CorePackages.Workspace.Packages.SharedFlags).FFlagCoreUiMigrateUIBloxToFoundation
local config = {
	ResetCameraLabel = "CoreScripts.InGameMenu.Controls.ResetCameraLabel",
	MenuLabel = "CoreScripts.InGameMenu.Controls.MenuLabel",
	SelectItemLabel = "CoreScripts.InGameMenu.Controls.SelectItemLabel",
	BackExitLabel = "CoreScripts.InGameMenu.Controls.BackExitLabel",
	FirstPersonCameraLabel = "CoreScripts.InGameMenu.Controls.FirstPersonCameraLabel",
	JumpSelectLabel = "CoreScripts.InGameMenu.Controls.JumpSelectLabel"
}

return function(_)
	-- upvalues: Roact (copy), ControlLayoutContainerModule (copy), FFlagCoreUiMigrateUIBloxToFoundation (copy), Image (copy), ImageSetLabel (copy), AssetsModule (copy), ReactModule (copy), Array (copy), ControlsModule (copy), config (copy), WithLocalizationModule (copy), ThemedTextLabelModule (copy)
	return Roact.createElement(ControlLayoutContainerModule, {
		titleText = "CoreScripts.InGameMenu.Controls.GamepadTitle"
	}, {
		GamepadImage = Roact.createElement(if FFlagCoreUiMigrateUIBloxToFoundation then Image else ImageSetLabel, {
			BackgroundTransparency = if FFlagCoreUiMigrateUIBloxToFoundation then nil else 1,
			backgroundStyle = if FFlagCoreUiMigrateUIBloxToFoundation then { Transparency = 1 } else nil,
			Image = AssetsModule.Images.GamepadQuest,
			Size = UDim2.new(1, 0, 0.6, 0),
			Position = UDim2.new(0.5, 16.5, 0.5, 0),
			AnchorPoint = Vector2.new(0.5, 0.5),
			SizeConstraint = Enum.SizeConstraint.RelativeXX,
			testId = if FFlagCoreUiMigrateUIBloxToFoundation then "VRGamepadInstructions" else nil,
			[ReactModule.Tag] = if FFlagCoreUiMigrateUIBloxToFoundation then nil else "data-testid=VRGamepadInstructions"
		}, {
			Array.map(ControlsModule.questGamepadLabels, function(p1, LayoutOrder)
				-- upvalues: config (upval), WithLocalizationModule (upval), Roact (upval), ThemedTextLabelModule (upval)
				return WithLocalizationModule({ config[p1.labelKey] })(function(Entry)
					-- upvalues: Roact (upval), ThemedTextLabelModule (upval), p1 (copy), LayoutOrder (copy)
					return Roact.createElement(ThemedTextLabelModule, {
						fontKey = "Header2",
						themeKey = "TextEmphasis",
						TextScaled = true,
						key = p1.labelKey,
						TextXAlignment = p1.xAlignment or Enum.TextXAlignment.Right,
						Size = UDim2.new(p1.width, 0, 0.026, 0),
						Text = Entry[1],
						LayoutOrder = LayoutOrder,
						Position = UDim2.new(p1.xPosition, 0, p1.yPosition, 0)
					})
				end)
			end)
		})
	})
end