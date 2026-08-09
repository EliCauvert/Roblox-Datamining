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
local t = {
	ResetCameraLabel = "CoreScripts.InGameMenu.Controls.ResetCameraLabel",
	MenuLabel = "CoreScripts.InGameMenu.Controls.MenuLabel",
	SelectItemLabel = "CoreScripts.InGameMenu.Controls.SelectItemLabel",
	BackExitLabel = "CoreScripts.InGameMenu.Controls.BackExitLabel",
	FirstPersonCameraLabel = "CoreScripts.InGameMenu.Controls.FirstPersonCameraLabel",
	JumpSelectLabel = "CoreScripts.InGameMenu.Controls.JumpSelectLabel"
}

return function(_) --[[ line: 38 | named "GamepadControls" ]]
	-- upvalues: roact (ref), controlLayoutContainerModule (ref), imageSetLabel (ref), assetsModule (ref), reactModule (ref), array (ref), controlsModule (ref), t (ref), withLocalizationModule (ref), themedTextLabelModule (ref)
	return roact.createElement(controlLayoutContainerModule, {
		titleText = "CoreScripts.InGameMenu.Controls.GamepadTitle"
	}, {
		GamepadImage = roact.createElement(imageSetLabel, {
			BackgroundTransparency = 1,
			Image = assetsModule.Images.GamepadQuest,
			Size = UDim2.new(1, 0, 0.6, 0),
			Position = UDim2.new(0.5, 16.5, 0.5, 0),
			AnchorPoint = Vector2.new(0.5, 0.5),
			SizeConstraint = Enum.SizeConstraint.RelativeXX,
			[reactModule.Tag] = "data-testid=VRGamepadInstructions"
		}, {
			array.map(controlsModule.questGamepadLabels, function(p0, p1) --[[ line: 51 ]]
				-- upvalues: t (copy), withLocalizationModule (copy), roact (copy), themedTextLabelModule (copy)
				return withLocalizationModule({ t[p0.labelKey] })(function(p2) --[[ line: 54 ]]
					-- upvalues: roact (copy), themedTextLabelModule (copy), p0 (ref), p1 (ref)
					return roact.createElement(themedTextLabelModule, {
						fontKey = "Header2",
						themeKey = "TextEmphasis",
						TextScaled = true,
						key = p0.labelKey,
						TextXAlignment = p0.xAlignment or Enum.TextXAlignment.Right,
						Size = UDim2.new(p0.width, 0, 0.026, 0),
						Text = p2[1],
						LayoutOrder = p1,
						Position = UDim2.new(p0.xPosition, 0, p0.yPosition, 0)
					})
				end)
			end)
		})
	})
end