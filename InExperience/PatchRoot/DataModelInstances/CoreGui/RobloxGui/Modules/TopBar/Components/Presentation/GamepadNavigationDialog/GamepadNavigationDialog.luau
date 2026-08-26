local corePackagesService = game:GetService("CorePackages")
local userInputService = game:GetService("UserInputService")
local _ = game:GetService("LocalizationService")
local contextActionService = game:GetService("ContextActionService")
local reactModule = require(corePackagesService.Packages.React)
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local useDesignTokens = require(corePackagesService.Workspace.Packages.Style).useDesignTokens
local useLocalization = require(corePackagesService.Workspace.Packages.Localization).Hooks.useLocalization
local topBar = script:FindFirstAncestor("TopBar")
local default = require(topBar.Analytics).default
local _ = require(topBar.TokenMappers.MenuNavigationPromptTokenMapper)
local button = UIBloxModule.App.Button.Button
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local t = {
	ButtonSelect = "CoreScripts.InGameMenu.Label.ViewButton",
	ButtonTouchpad = "CoreScripts.InGameMenu.Label.TouchpadButton",
	ButtonShare = "CoreScripts.InGameMenu.Label.ShareButton"
}

local function HeaderArea()
	-- upvalues: useDesignTokens (ref), useLocalization (ref), reactModule (ref)
	local menuNavigationPrompt = useDesignTokens().LuaApps.MenuNavigationPrompt
	local typography = menuNavigationPrompt.Typography
	local space = menuNavigationPrompt.Space
	
	return reactModule.createElement("Frame", {
		LayoutOrder = 0,
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.XY
	}, {
		Header = reactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			Text = useLocalization({
				HeaderText = "CoreScripts.InGameMenu.EducationalPopup.UINavigation.Title"
			}).HeaderText,
			Font = typography.header.Font,
			TextSize = typography.header.FontSize,
			TextColor3 = menuNavigationPrompt.Color.textColor.Color3,
			Size = UDim2.fromOffset(0, 0),
			AutomaticSize = Enum.AutomaticSize.XY,
			TextXAlignment = Enum.TextXAlignment.Center,
			TextYAlignment = Enum.TextYAlignment.Center
		}),
		Padding = reactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, space.titlePadding),
			PaddingBottom = UDim.new(0, space.titlePadding),
			PaddingLeft = UDim.new(0, space.bodyPadding),
			PaddingRight = UDim.new(0, space.bodyPadding)
		})
	})
end

local function GamepadImageArea()
	-- upvalues: useDesignTokens (ref), userInputService (ref), t (ref), useLocalization (ref), reactModule (ref)
	local menuNavigationPrompt = useDesignTokens().LuaApps.MenuNavigationPrompt
	local typography = menuNavigationPrompt.Typography
	local color = menuNavigationPrompt.Color
	local size = menuNavigationPrompt.Size
	local space = menuNavigationPrompt.Space
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = 0,
		AutomaticSize = Enum.AutomaticSize.XY
	}, {
		Layout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, space.iconPadding)
		}),
		ButtonLabelGroup = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 0,
			AutomaticSize = Enum.AutomaticSize.XY
		}, {
			Layout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				SortOrder = Enum.SortOrder.LayoutOrder,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				Padding = UDim.new(0, space.iconPadding)
			}),
			Icon = reactModule.createElement("ImageLabel", {
				LayoutOrder = 0,
				BackgroundTransparency = 1,
				Image = userInputService:GetImageForKeyCode(Enum.KeyCode.ButtonSelect),
				Size = UDim2.fromOffset(size.iconSize, size.iconSize)
			}),
			ControllerButtonLabel = reactModule.createElement("TextLabel", {
				LayoutOrder = 100,
				BackgroundTransparency = 1,
				Text = useLocalization({
					ButtonLabelText = t[userInputService:GetStringForKeyCode(Enum.KeyCode.ButtonSelect)] or "CoreScripts.InGameMenu.Label.ViewButton"
				}).ButtonLabelText,
				Font = typography.label.Font,
				TextSize = typography.label.FontSize,
				TextColor3 = color.textColor.Color3,
				Size = UDim2.fromOffset(0, 0),
				AutomaticSize = Enum.AutomaticSize.XY,
				TextXAlignment = Enum.TextXAlignment.Center,
				TextYAlignment = Enum.TextYAlignment.Center
			})
		}),
		ControllerImage = reactModule.createElement("ImageLabel", {
			Image = "rbxasset://textures/ui/Gamepad/ControllerSelect.png",
			LayoutOrder = 100,
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1)
		}, {
			UIAspectRatioConstraint = reactModule.createElement("UIAspectRatioConstraint", { AspectRatio = size.imageWidth / size.imageHeight }),
			UISizeConstraint = reactModule.createElement("UISizeConstraint", {
				MaxSize = Vector2.new(size.imageWidth, size.imageHeight),
				MinSize = Vector2.new(size.imageWidth * 0.5, size.imageHeight * 0.5)
			})
		})
	})
end

local function Body(p1)
	-- upvalues: useDesignTokens (ref), userInputService (ref), t (ref), useLocalization (ref), reactModule (ref), GamepadImageArea (ref), button (ref), buttonType (ref)
	local menuNavigationPrompt = useDesignTokens().LuaApps.MenuNavigationPrompt
	local typography = menuNavigationPrompt.Typography
	local color = menuNavigationPrompt.Color
	local size = menuNavigationPrompt.Size
	local space = menuNavigationPrompt.Space
	local _ = t[userInputService:GetStringForKeyCode(Enum.KeyCode.ButtonSelect)] or "CoreScripts.InGameMenu.Label.ViewButton"
	local var1 = useLocalization({
		OkText = "CoreScripts.InGameMenu.Ok",
		Description = "CoreScripts.InGameMenu.EducationalPopup.UINavigation.Description"
	})
	
	return reactModule.createElement("Frame", {
		LayoutOrder = 200,
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.XY
	}, {
		Layout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, space.bodyPadding)
		}),
		Padding = reactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, space.bodyPadding),
			PaddingRight = UDim.new(0, space.bodyPadding),
			PaddingTop = UDim.new(0, space.bodyPadding),
			PaddingBottom = UDim.new(0, space.bodyPadding)
		}),
		GamepadImageArea = reactModule.createElement(GamepadImageArea),
		ImageDescription = reactModule.createElement("TextLabel", {
			LayoutOrder = 100,
			BackgroundTransparency = 1,
			TextWrapped = true,
			Text = var1.Description,
			Font = typography.caption.Font,
			TextSize = typography.caption.FontSize,
			TextColor3 = color.textColor.Color3,
			LineHeight = typography.caption.LineHeight,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Center
		}),
		ConfirmationButton = reactModule.createElement(button, {
			layoutOrder = 200,
			buttonType = buttonType.PrimarySystem,
			size = UDim2.new(1, 0, 0, size.buttonHeight),
			text = var1.OkText,
			onActivated = p1.onDismissed,
			icon = if p1.selectButtonDismissesGamepadNavigationDialog then userInputService:GetImageForKeyCode(Enum.KeyCode.ButtonSelect) else nil
		})
	})
end

return function(p1)
	-- upvalues: useDesignTokens (ref), reactModule (ref), default (ref), contextActionService (ref), HeaderArea (ref), Body (ref)
	local menuNavigationPrompt = useDesignTokens().LuaApps.MenuNavigationPrompt
	local color = menuNavigationPrompt.Color
	local size = menuNavigationPrompt.Size
	local space = menuNavigationPrompt.Space
	local radius = menuNavigationPrompt.Radius
	reactModule.useEffect(function()
		-- upvalues: default (copy), contextActionService (copy), p1 (ref)
		default:onShowGamepadNavigationDialog()
		contextActionService:BindCoreAction("ConfirmBindComponentMapperTokenModule", function(_, p2, _)
			-- upvalues: p1 (copy)
			if p2 == Enum.UserInputState.End then
				p1.onDismissed()
			end
		end, false, if p1.selectButtonDismissesGamepadNavigationDialog then Enum.KeyCode.ButtonSelect else Enum.KeyCode.ButtonA)
		
		return function()
			-- upvalues: default (copy), contextActionService (copy)
			default:onDismissGamepadNavigationDialog()
			contextActionService:UnbindCoreAction("ConfirmBindComponentMapperTokenModule")
		end
	end)
	
	return reactModule.createElement("Frame", {
		BackgroundColor3 = color.backgroundUiColor.Color3,
		BackgroundTransparency = color.backgroundUiColor.Transparency,
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.fromScale(size.promptWidth / size.displayWidth, 0),
		Position = UDim2.fromScale(0.5, 0.5),
		AnchorPoint = Vector2.new(0.5, 0.5)
	}, {
		Corner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, radius.cornerRadius) }),
		Layout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Center
		}),
		HeaderArea = reactModule.createElement(HeaderArea),
		Separator = reactModule.createElement("Frame", {
			LayoutOrder = 100,
			BorderSizePixel = 0,
			Size = UDim2.new(1, -2 * space.bodyPadding, 0, 1),
			BackgroundColor3 = color.separatorColor.Color3,
			BackgroundTransparency = color.separatorColor.Transparency
		}),
		Body = reactModule.createElement(Body, p1),
		UISizeConstraint = reactModule.createElement("UISizeConstraint", {
			MaxSize = Vector2.new(1e999, 1e999),
			MinSize = Vector2.new(size.imageWidth + 2 * space.bodyPadding, 1)
		})
	})
end