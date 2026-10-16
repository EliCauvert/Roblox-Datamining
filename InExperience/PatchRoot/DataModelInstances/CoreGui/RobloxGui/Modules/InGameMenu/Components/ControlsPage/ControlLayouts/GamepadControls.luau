local UserInputService = game:GetService("UserInputService")
local CorePackages = game:GetService("CorePackages")
local InGameMenuDependenciesModule = require(CorePackages.Packages.InGameMenuDependencies)
local Roact = InGameMenuDependenciesModule.Roact
local Parent = script.Parent.Parent.Parent.Parent
local ControlLayoutContainerModule = require(script.Parent.Parent.ControlLayoutContainer)
local ThemedTextLabelModule = require(Parent.Components.ThemedTextLabel)
local AssetsModule = require(Parent.Resources.Assets)
local ControlsModule = require(Parent.Resources.Controls)
local ReactModule = require(CorePackages.Packages.React)
local WithLocalizationModule = require(Parent.Localization.withLocalization)
local ImageSetLabel = InGameMenuDependenciesModule.UIBlox.Core.ImageSet.ImageSetLabel
local Image = require(CorePackages.Packages.Foundation).Image
local FFlagCoreUiMigrateUIBloxToFoundation = require(CorePackages.Workspace.Packages.SharedFlags).FFlagCoreUiMigrateUIBloxToFoundation
local YOffset = #ControlsModule.gamepadLabels.right * 43 + 62

local function verticalControlsList(Label) --[[ Line: 47 ]]
	-- upvalues: WithLocalizationModule (copy), Roact (copy), ThemedTextLabelModule (copy)
	return WithLocalizationModule(Label.controls)(function(List) --[[ Line: 48 ]]
		-- upvalues: Roact (upval), ThemedTextLabelModule (upval), Label (copy)
		local config = {
			ListLayout = Roact.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, 21)
			})
		}
		
		for LayoutOrder, Text in ipairs(List) do
			config["controlLabel_" .. LayoutOrder] = Roact.createElement(ThemedTextLabelModule, {
				fontKey = "Header2",
				themeKey = "TextEmphasis",
				TextXAlignment = Label.TextXAlignment,
				Size = UDim2.new(0, 1, 0, 22),
				Text = Text,
				LayoutOrder = LayoutOrder
			})
		end
		return Roact.createElement("Frame", {
			BackgroundTransparency = 1,
			Position = Label.Position,
			Size = UDim2.new(0, 0, 1, 0)
		}, config)
	end)
end

return function(p1) --[[ Line: 76 | Named "GamepadControls" ]]
	-- upvalues: UserInputService (copy), Roact (copy), ControlLayoutContainerModule (copy), FFlagCoreUiMigrateUIBloxToFoundation (copy), Image (copy), ImageSetLabel (copy), AssetsModule (copy), ReactModule (copy), verticalControlsList (copy), ControlsModule (copy), YOffset (copy)
	local Platform = UserInputService:GetPlatform()
	
	return Roact.createElement(ControlLayoutContainerModule, {
		titleText = "CoreScripts.InGameMenu.Controls.GamepadTitle",
		closeButtonRef = p1.closeButtonRef
	}, {
		GamepadImage = Roact.createElement(if FFlagCoreUiMigrateUIBloxToFoundation then Image else ImageSetLabel, {
			BackgroundTransparency = if FFlagCoreUiMigrateUIBloxToFoundation then nil else 1,
			backgroundStyle = if FFlagCoreUiMigrateUIBloxToFoundation then { Transparency = 1 } else nil,
			Image = (Platform == Enum.Platform.XBox360 or Platform == Enum.Platform.XBoxOne) and AssetsModule.Images.GamepadXbox or AssetsModule.Images.Gamepad,
			Size = UDim2.new(0, 473, 0, 465),
			Position = UDim2.new(0.5, 16.5, 0.5, 0),
			AnchorPoint = Vector2.new(0.5, 0.5),
			testId = if FFlagCoreUiMigrateUIBloxToFoundation then "GamepadInstructions" else nil,
			[ReactModule.Tag] = if FFlagCoreUiMigrateUIBloxToFoundation then nil else "data-testid=GamepadInstructions"
		}, {
			LeftControlsList = Roact.createElement(verticalControlsList, {
				TextXAlignment = Enum.TextXAlignment.Right,
				Position = UDim2.new(0, -26, 0, 62),
				controls = ControlsModule.gamepadLabels.left
			}),
			RightControlsList = Roact.createElement(verticalControlsList, {
				TextXAlignment = Enum.TextXAlignment.Left,
				Position = UDim2.new(1, -7, 0, 62),
				controls = ControlsModule.gamepadLabels.right
			}),
			RightIconsControlslIst = Roact.createElement(verticalControlsList, {
				TextXAlignment = Enum.TextXAlignment.Left,
				Position = UDim2.new(1, 26, 0, YOffset),
				controls = ControlsModule.gamepadLabels.camera
			})
		})
	})
end