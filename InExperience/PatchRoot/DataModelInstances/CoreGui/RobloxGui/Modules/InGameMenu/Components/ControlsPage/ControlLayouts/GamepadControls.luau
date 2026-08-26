local userInputService = game:GetService("UserInputService")
local corePackagesService = game:GetService("CorePackages")
local inGameMenuDependenciesModule = require(corePackagesService.Packages.InGameMenuDependencies)
local roact = inGameMenuDependenciesModule.Roact
local UIBlox = inGameMenuDependenciesModule.UIBlox
local parent = script.Parent.Parent.Parent.Parent
local controlLayoutContainerModule = require(script.Parent.Parent.ControlLayoutContainer)
local themedTextLabelModule = require(parent.Components.ThemedTextLabel)
local assetsModule = require(parent.Resources.Assets)
local controlsModule = require(parent.Resources.Controls)
local reactModule = require(corePackagesService.Packages.React)
local withLocalizationModule = require(parent.Localization.withLocalization)
local imageSetLabel = UIBlox.Core.ImageSet.ImageSetLabel
local image = require(corePackagesService.Packages.Foundation).Image
local fFlagCoreUiMigrateUIBloxToFoundation = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagCoreUiMigrateUIBloxToFoundation
local var1 = #controlsModule.gamepadLabels.right * 43 + 62

local function verticalControlsList(p1)
	-- upvalues: withLocalizationModule (ref), roact (ref), themedTextLabelModule (ref)
	return withLocalizationModule(p1.controls)(function(p2)
		-- upvalues: roact (copy), themedTextLabelModule (copy), p1 (ref)
		local t = {
			ListLayout = roact.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, 21)
			})
		}
		
		for i, v in ipairs(p2) do
			t["controlLabel_" .. i] = roact.createElement(themedTextLabelModule, {
				fontKey = "Header2",
				themeKey = "TextEmphasis",
				TextXAlignment = p1.TextXAlignment,
				Size = UDim2.new(0, 1, 0, 22),
				Text = v,
				LayoutOrder = i
			})
		end
		return roact.createElement("Frame", {
			BackgroundTransparency = 1,
			Position = p1.Position,
			Size = UDim2.new(0, 0, 1, 0)
		}, t)
	end)
end

return function(p2)
	-- upvalues: userInputService (ref), roact (ref), controlLayoutContainerModule (ref), fFlagCoreUiMigrateUIBloxToFoundation (ref), image (ref), imageSetLabel (ref), assetsModule (ref), reactModule (ref), verticalControlsList (ref), controlsModule (ref), var1 (ref)
	local platform = userInputService:GetPlatform()
	
	return roact.createElement(controlLayoutContainerModule, {
		titleText = "CoreScripts.InGameMenu.Controls.GamepadTitle",
		closeButtonRef = p2.closeButtonRef
	}, {
		GamepadImage = roact.createElement(if fFlagCoreUiMigrateUIBloxToFoundation then image else imageSetLabel, {
			BackgroundTransparency = if fFlagCoreUiMigrateUIBloxToFoundation then nil else 1,
			backgroundStyle = if fFlagCoreUiMigrateUIBloxToFoundation then { Transparency = 1 } else nil,
			Image = if if platform ~= Enum.Platform.XBox360 then platform == Enum.Platform.XBoxOne else true then assetsModule.Images.GamepadXbox else assetsModule.Images.Gamepad,
			Size = UDim2.new(0, 473, 0, 465),
			Position = UDim2.new(0.5, 16.5, 0.5, 0),
			AnchorPoint = Vector2.new(0.5, 0.5),
			testId = if fFlagCoreUiMigrateUIBloxToFoundation then "GamepadInstructions" else nil,
			[reactModule.Tag] = if fFlagCoreUiMigrateUIBloxToFoundation then nil else "data-testid=GamepadInstructions"
		}, {
			LeftControlsList = roact.createElement(verticalControlsList, {
				TextXAlignment = Enum.TextXAlignment.Right,
				Position = UDim2.new(0, -26, 0, 62),
				controls = controlsModule.gamepadLabels.left
			}),
			RightControlsList = roact.createElement(verticalControlsList, {
				TextXAlignment = Enum.TextXAlignment.Left,
				Position = UDim2.new(1, -7, 0, 62),
				controls = controlsModule.gamepadLabels.right
			}),
			RightIconsControlslIst = roact.createElement(verticalControlsList, {
				TextXAlignment = Enum.TextXAlignment.Left,
				Position = UDim2.new(1, 26, 0, var1),
				controls = controlsModule.gamepadLabels.camera
			})
		})
	})
end