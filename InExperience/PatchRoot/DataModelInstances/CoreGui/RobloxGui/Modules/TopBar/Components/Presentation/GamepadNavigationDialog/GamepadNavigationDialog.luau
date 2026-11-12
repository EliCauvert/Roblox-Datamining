local CorePackages = game:GetService("CorePackages")
local UserInputService = game:GetService("UserInputService")
local _ = game:GetService("LocalizationService")
local ContextActionService = game:GetService("ContextActionService")
local ReactModule = require(CorePackages.Packages.React)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local FoundationModule = require(CorePackages.Packages.Foundation)
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local UseDesignTokensFunction = require(CorePackages.Workspace.Packages.Style).useDesignTokens
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local TopBar = script:FindFirstAncestor("TopBar")
local Default = require(TopBar.Analytics).default
local _ = require(TopBar.TokenMappers.MenuNavigationPromptTokenMapper)
local Button = UIBloxModule.App.Button.Button
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local config = {
	ButtonSelect = "CoreScripts.InGameMenu.Label.ViewButton",
	ButtonTouchpad = "CoreScripts.InGameMenu.Label.TouchpadButton",
	ButtonShare = "CoreScripts.InGameMenu.Label.ShareButton"
}

local function HeaderArea()
	-- upvalues: UseDesignTokensFunction (copy), UseLocalizationFunction (copy), ReactModule (copy), FoundationFontFaceMigration (copy), NormalizeFontFaceFunction (copy)
	local MenuNavigationPrompt = UseDesignTokensFunction().LuaApps.MenuNavigationPrompt
	local Typography = MenuNavigationPrompt.Typography
	local Space = MenuNavigationPrompt.Space
	
	return ReactModule.createElement("Frame", {
		LayoutOrder = 0,
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.XY
	}, {
		Header = ReactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			Text = UseLocalizationFunction({
				HeaderText = "CoreScripts.InGameMenu.EducationalPopup.UINavigation.Title"
			}).HeaderText,
			Font = if FoundationFontFaceMigration then nil else Typography.header.Font,
			FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(Typography.header.Font) else nil,
			TextSize = Typography.header.FontSize,
			TextColor3 = MenuNavigationPrompt.Color.textColor.Color3,
			Size = UDim2.fromOffset(0, 0),
			AutomaticSize = Enum.AutomaticSize.XY,
			TextXAlignment = Enum.TextXAlignment.Center,
			TextYAlignment = Enum.TextYAlignment.Center
		}),
		Padding = ReactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, Space.titlePadding),
			PaddingBottom = UDim.new(0, Space.titlePadding),
			PaddingLeft = UDim.new(0, Space.bodyPadding),
			PaddingRight = UDim.new(0, Space.bodyPadding)
		})
	})
end

local function GamepadImageArea()
	-- upvalues: UseDesignTokensFunction (copy), UserInputService (copy), config (copy), UseLocalizationFunction (copy), ReactModule (copy), FoundationFontFaceMigration (copy), NormalizeFontFaceFunction (copy)
	local MenuNavigationPrompt = UseDesignTokensFunction().LuaApps.MenuNavigationPrompt
	local Typography = MenuNavigationPrompt.Typography
	local Size = MenuNavigationPrompt.Size
	local Space = MenuNavigationPrompt.Space
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = 0,
		AutomaticSize = Enum.AutomaticSize.XY
	}, {
		Layout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, Space.iconPadding)
		}),
		ButtonLabelGroup = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 0,
			AutomaticSize = Enum.AutomaticSize.XY
		}, {
			Layout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				SortOrder = Enum.SortOrder.LayoutOrder,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				Padding = UDim.new(0, Space.iconPadding)
			}),
			Icon = ReactModule.createElement("ImageLabel", {
				LayoutOrder = 0,
				BackgroundTransparency = 1,
				Image = UserInputService:GetImageForKeyCode(Enum.KeyCode.ButtonSelect),
				Size = UDim2.fromOffset(Size.iconSize, Size.iconSize)
			}),
			ControllerButtonLabel = ReactModule.createElement("TextLabel", {
				LayoutOrder = 100,
				BackgroundTransparency = 1,
				Text = UseLocalizationFunction({
					ButtonLabelText = config[UserInputService:GetStringForKeyCode(Enum.KeyCode.ButtonSelect)] or "CoreScripts.InGameMenu.Label.ViewButton"
				}).ButtonLabelText,
				Font = if FoundationFontFaceMigration then nil else Typography.label.Font,
				FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(Typography.label.Font) else nil,
				TextSize = Typography.label.FontSize,
				TextColor3 = MenuNavigationPrompt.Color.textColor.Color3,
				Size = UDim2.fromOffset(0, 0),
				AutomaticSize = Enum.AutomaticSize.XY,
				TextXAlignment = Enum.TextXAlignment.Center,
				TextYAlignment = Enum.TextYAlignment.Center
			})
		}),
		ControllerImage = ReactModule.createElement("ImageLabel", {
			Image = "rbxasset://textures/ui/Gamepad/ControllerSelect.png",
			LayoutOrder = 100,
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1)
		}, {
			UIAspectRatioConstraint = ReactModule.createElement("UIAspectRatioConstraint", { AspectRatio = Size.imageWidth / Size.imageHeight }),
			UISizeConstraint = ReactModule.createElement("UISizeConstraint", {
				MaxSize = Vector2.new(Size.imageWidth, Size.imageHeight),
				MinSize = Vector2.new(Size.imageWidth * 0.5, Size.imageHeight * 0.5)
			})
		})
	})
end

local function Body(p1)
	-- upvalues: UseDesignTokensFunction (copy), UserInputService (copy), config (copy), UseLocalizationFunction (copy), ReactModule (copy), GamepadImageArea (copy), FoundationFontFaceMigration (copy), NormalizeFontFaceFunction (copy), Button (copy), ButtonType (copy)
	local MenuNavigationPrompt = UseDesignTokensFunction().LuaApps.MenuNavigationPrompt
	local Typography = MenuNavigationPrompt.Typography
	local Color = MenuNavigationPrompt.Color
	local Size = MenuNavigationPrompt.Size
	local Space = MenuNavigationPrompt.Space
	local _ = config[UserInputService:GetStringForKeyCode(Enum.KeyCode.ButtonSelect)] or "CoreScripts.InGameMenu.Label.ViewButton"
	local UseLocalizationResult = UseLocalizationFunction({
		OkText = "CoreScripts.InGameMenu.Ok",
		Description = "CoreScripts.InGameMenu.EducationalPopup.UINavigation.Description"
	})
	
	return ReactModule.createElement("Frame", {
		LayoutOrder = 200,
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.XY
	}, {
		Layout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, Space.bodyPadding)
		}),
		Padding = ReactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, Space.bodyPadding),
			PaddingRight = UDim.new(0, Space.bodyPadding),
			PaddingTop = UDim.new(0, Space.bodyPadding),
			PaddingBottom = UDim.new(0, Space.bodyPadding)
		}),
		GamepadImageArea = ReactModule.createElement(GamepadImageArea),
		ImageDescription = ReactModule.createElement("TextLabel", {
			LayoutOrder = 100,
			BackgroundTransparency = 1,
			TextWrapped = true,
			Text = UseLocalizationResult.Description,
			Font = if FoundationFontFaceMigration then nil else Typography.caption.Font,
			FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(Typography.caption.Font) else nil,
			TextSize = Typography.caption.FontSize,
			TextColor3 = Color.textColor.Color3,
			LineHeight = Typography.caption.LineHeight,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Center
		}),
		ConfirmationButton = ReactModule.createElement(Button, {
			layoutOrder = 200,
			buttonType = ButtonType.PrimarySystem,
			size = UDim2.new(1, 0, 0, Size.buttonHeight),
			text = UseLocalizationResult.OkText,
			onActivated = p1.onDismissed,
			icon = if p1.selectButtonDismissesGamepadNavigationDialog then UserInputService:GetImageForKeyCode(Enum.KeyCode.ButtonSelect) else nil
		})
	})
end

return function(p1)
	-- upvalues: UseDesignTokensFunction (copy), ReactModule (copy), Default (copy), ContextActionService (copy), HeaderArea (copy), Body (copy)
	local MenuNavigationPrompt = UseDesignTokensFunction().LuaApps.MenuNavigationPrompt
	local Color = MenuNavigationPrompt.Color
	local Size = MenuNavigationPrompt.Size
	local Space = MenuNavigationPrompt.Space
	local Radius = MenuNavigationPrompt.Radius
	ReactModule.useEffect(function()
		-- upvalues: Default (upval), ContextActionService (upval), p1 (copy)
		Default:onShowGamepadNavigationDialog()
		ContextActionService:BindCoreAction("ConfirmBindComponentMapperTokenModule", function(_, UserInputState, _)
			-- upvalues: p1 (upval)
			if UserInputState == Enum.UserInputState.End then
				p1.onDismissed()
			end
		end, false, if p1.selectButtonDismissesGamepadNavigationDialog then Enum.KeyCode.ButtonSelect else Enum.KeyCode.ButtonA)
		
		return function()
			-- upvalues: Default (upval), ContextActionService (upval)
			Default:onDismissGamepadNavigationDialog()
			ContextActionService:UnbindCoreAction("ConfirmBindComponentMapperTokenModule")
		end
	end)
	
	return ReactModule.createElement("Frame", {
		BackgroundColor3 = Color.backgroundUiColor.Color3,
		BackgroundTransparency = Color.backgroundUiColor.Transparency,
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.fromScale(Size.promptWidth / Size.displayWidth, 0),
		Position = UDim2.fromScale(0.5, 0.5),
		AnchorPoint = Vector2.new(0.5, 0.5)
	}, {
		Corner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, Radius.cornerRadius) }),
		Layout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Center
		}),
		HeaderArea = ReactModule.createElement(HeaderArea),
		Separator = ReactModule.createElement("Frame", {
			LayoutOrder = 100,
			BorderSizePixel = 0,
			Size = UDim2.new(1, -2 * Space.bodyPadding, 0, 1),
			BackgroundColor3 = Color.separatorColor.Color3,
			BackgroundTransparency = Color.separatorColor.Transparency
		}),
		Body = ReactModule.createElement(Body, p1),
		UISizeConstraint = ReactModule.createElement("UISizeConstraint", {
			MaxSize = Vector2.new(1e999, 1e999),
			MinSize = Vector2.new(Size.imageWidth + 2 * Space.bodyPadding, 1)
		})
	})
end