local corePackagesService = game:GetService("CorePackages")
local userInputService = game:GetService("UserInputService")
local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local var1 = require(robloxGui.Modules.TenFootInterface):IsEnabled()
local appFonts = require(corePackagesService.Workspace.Packages.Style).AppFonts
local darkTheme = require(corePackagesService.Workspace.Packages.Style).Themes.DarkTheme
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local images = UIBloxModule.App.ImageSet.Images
local getIconSize = UIBloxModule.App.ImageSet.getIconSize
local iconSize = UIBloxModule.App.ImageSet.Enum.IconSize
local getUIScale = require(corePackagesService.Workspace.Packages.Display).GetDisplayStore(false).getUIScale
local increaseUtilityRowTextSizeConsole = game:DefineFastFlag("IncreaseUtilityRowTextSizeConsole", false)
local isInExperienceUIVREnabled = require(corePackagesService.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled
local fFlagRelocateMobileMenuButtonsModule = require(robloxGui.Modules.Settings.Flags.FFlagRelocateMobileMenuButtons)
local fIntRelocateMobileMenuButtonsVariantModule = require(robloxGui.Modules.Settings.Flags.FIntRelocateMobileMenuButtonsVariant)
local t = {
	[Enum.FontSize.Size14] = Enum.FontSize.Size11,
	[Enum.FontSize.Size18] = Enum.FontSize.Size14,
	[Enum.FontSize.Size24] = Enum.FontSize.Size18,
	[Enum.FontSize.Size36] = Enum.FontSize.Size28,
	[Enum.FontSize.Size48] = Enum.FontSize.Size36
}
local color = Color3.fromRGB(0, 0, 0)
local default = appFonts.default:getDefault()
local size24 = t[Enum.FontSize.Size24]
local t_1 = {
	MenuContainer = { Transparency = 0.2, Color = Color3.new(0, 0, 0) },
	IGM_TabSelection = { Transparency = 0, Color = Color3.new(1, 1, 1) },
	White = { Transparency = 0, Color = Color3.new(1, 1, 1) },
	IGM_Background = { Transparency = 1, Color = Color3.fromRGB(0, 0, 0) },
	IGM_Button = { Transparency = 1, Color = Color3.fromRGB(0, 0, 0) },
	IGM_ButtonNonInteractable = { Transparency = 0, Color = Color3.fromRGB(100, 100, 100) },
	IGM_ButtonHover = { Transparency = 0, Color = Color3.fromRGB(56, 57, 59) },
	IGM_Stroke = {
		Transparency = 0,
		Color = Color3.new(0.776, 0.776, 0.776)
	},
	IGM_Selected = { Transparency = 0, Color = Color3.fromRGB(217, 217, 217) },
	Player_RowSelection = {
		Transparency = 0.9,
		Color = Color3.new(0.396, 0.4, 0.408)
	}
}
local t_2 = {
	Confirmation_Font = {
		TextSize = 28.584,
		Font = appFonts.default:getBold(),
		RelativeSize = t[Enum.FontSize.Size36]
	},
	Button_Font = {
		TextSize = 17.468,
		Font = appFonts.default:getMedium(),
		RelativeSize = t[Enum.FontSize.Size24]
	},
	Username = {
		RelativeSize = if var1 then t[Enum.FontSize.Size24] else t[Enum.FontSize.Size18]
	},
	DisplayName = {
		RelativeSize = if var1 then Enum.FontSize.Size24 else Enum.FontSize.Size18,
		Font = appFonts.default:getMedium()
	},
	Settings_Font = { Font = appFonts.default:getDefault() },
	Help_Title_Font = {
		Font = appFonts.default:getMedium(),
		RelativeSize = t[Enum.FontSize.Size18]
	},
	Help_Text_Font = {
		TextSize = 14.292,
		Font = appFonts.default:getDefault(),
		RelativeSize = t[Enum.FontSize.Size18]
	},
	Help_Gamepad_Font = { Font = appFonts.default:getMedium() },
	Help_Touch_Font = {
		Font = appFonts.default:getBold(),
		RelativeSize = t[Enum.FontSize.Size14]
	},
	Game_Settings_Font = {
		Font = appFonts.default:getDefault(),
		RelativeSize = t[Enum.FontSize.Size24]
	},
	Conversation_Details_Font = { TextSize = 12.704, Font = appFonts.default:getDefault() },
	Utility_Text_Font = { TextSize = 17.468, Font = appFonts.default:getDefault() },
	Utility_Text_Small_Font = { TextSize = 12.704, Font = appFonts.default:getDefault() },
	Utility_Row_Small_Font = { TextSize = 12.704, Font = appFonts.default:getDefault() },
	Utility_Row_Font = {
		Font = appFonts.default:getMedium(),
		TextSize = if increaseUtilityRowTextSizeConsole and var1 then 19.056 else 12.704
	},
	Back_Button_Font = { TextSize = 19.056, Font = appFonts.default:getSemibold() },
	Semibold_Font = { Font = appFonts.default:getSemibold() },
	Bold_Font = { Font = appFonts.default:getMedium() }
}
setmetatable(t_1, {
	__index = function(_, p1)
		-- upvalues: darkTheme (ref)
		return darkTheme[p1]
	end
})
local t_3 = {
	SETTINGS_SHIELD = "IGM_Background",
	SETTINGS_SHIELD_TRANSPARENCY = "IGM_Background",
	SELECTION_TEXT_COLOR_NORMAL = "White",
	SELECTION_TEXT_COLOR_HIGHLIGHTED = "White",
	HubBarContainer = "IGM_Background",
	HubBarContainerTransparency = "IGM_Background",
	HubBarContainerHover = "IGM_Background",
	DarkenBackground = "Overlay",
	PlayerRowFrame = "BackgroundDefault",
	PlayerRowSelection = "Player_RowSelection",
	TabSelection = "IGM_TabSelection",
	DefaultButton = "IGM_Button",
	DefaultButtonHover = "IGM_ButtonHover",
	DefaultButtonStroke = "SecondaryDefault",
	WhiteButtonText = "SecondaryContent",
	MenuContainer = "BackgroundUIContrast",
	ControlInputText = "SystemPrimaryDefault",
	ControlInputStroke = "Divider",
	ControlInputBackground = "BackgroundDefault",
	ControlInputFocusedStroke = "IGM_TabSelection",
	InputActionBackground = "BackgroundUIDefault",
	IconButton = "UIDefault",
	IconButtonHover = "BackgroundOnHover",
	ImageButton = "Divider",
	RowFrameBackground = "BackgroundDefault",
	DropdownListBg = "BackgroundUIDefault",
	DropdownListFocusBg = "UIDefault",
	SELECTED_COLOR = "IGM_Selected",
	NON_SELECTED_COLOR = "BackgroundUIDefault",
	NotInteractableSelection = "UIEmphasis",
	Confirmation = "Confirmation_Font",
	Button = "Button_Font",
	SettingsHub = "Settings_Font",
	HelpTitle = "Help_Title_Font",
	HelpText = "Help_Text_Font",
	HelpGamepad = "Help_Gamepad_Font",
	HelpTouch = "Help_Touch_Font",
	GameSettings = "Game_Settings_Font",
	ConversationDetails = "Conversation_Details_Font",
	UtilityText = "Utility_Text_Font",
	UtilityRow = "Utility_Row_Font",
	UtilityRowSmall = "Utility_Row_Small_Font",
	UtilityTextSmall = "Utility_Text_Small_Font",
	BackButton = "Back_Button_Font",
	Semibold = "Semibold_Font",
	Bold = "Bold_Font",
	ShareLinkTitle = "Utility_Text_Font",
	ButtonNonInteractable = "IGM_ButtonNonInteractable"
}

local function getViewportSize()
	return if _G.__TESTEZ_RUNNING_TEST__ then Vector2.new(1024, 1024) elseif workspace.CurrentCamera then if workspace.CurrentCamera.ViewportSize == Vector2.new(0, 0) or workspace.CurrentCamera.ViewportSize == Vector2.new(1, 1) then nil else workspace.CurrentCamera.ViewportSize else nil
end

local var2 = getViewportSize()
local var3 = var2 and (userInputService.TouchEnabled and (if var2.Y >= 500 then var2.X < 700 else true))
local t_4 = {
	PaddingTop = UDim.new(0, 0),
	PaddingLeft = UDim.new(0, 20),
	PaddingRight = UDim.new(0, 20),
	PaddingBottom = UDim.new(0, 14)
}
local t_5 = {
	PaddingTop = UDim.new(0, 0),
	PaddingLeft = UDim.new(0, 12),
	PaddingRight = UDim.new(0, 12),
	PaddingBottom = if fFlagRelocateMobileMenuButtonsModule and (fIntRelocateMobileMenuButtonsVariantModule == 1 or fIntRelocateMobileMenuButtonsVariantModule == 3) then UDim.new(0, 24) else UDim.new(0, 12)
}
local t_6 = {
	AnchorPoint = Vector2.new(0.5, 0.5),
	Position = UDim2.new(0.5, 0, 0.5, 10),
	Size = UDim2.new(0, 0, 0, 0),
	AutomaticSize = Enum.AutomaticSize.XY
}
local t_7 = {
	AnchorPoint = Vector2.new(0.5, 1),
	Position = UDim2.new(0.5, 0, 1, 8),
	Size = UDim2.new(0, 0, 0, 0),
	AutomaticSize = Enum.AutomaticSize.XY
}

return {
	DefaultScrollBarThickness = 1,
	DefaultStokeThickness = 1,
	TabHeaderIconPadding = 5,
	ExtraHubBottomPaddingMobile = 12,
	ExtraPageBottomPaddingMobile = 48,
	ButtonHeight = 36,
	LargeButtonHeight = 48,
	SelectorArrowButtonWidth = 32,
	platformNameTextSize = 18,
	DefaultCornerRadius = UDim.new(0, 8),
	MenuContainerCornerRadius = UDim.new(0, 10),
	AlwaysShowBottomBar = function()
		-- upvalues: var3 (write)
		return not var3
	end,
	UseInspectAndBuyPanel = function()
		-- upvalues: var3 (write)
		return var3
	end,
	HubPadding = function()
		-- upvalues: fFlagRelocateMobileMenuButtonsModule (ref), fIntRelocateMobileMenuButtonsVariantModule (ref), getViewportSize (ref), userInputService (ref), t_5 (ref), t_4 (ref), var3 (write)
		if fFlagRelocateMobileMenuButtonsModule and fIntRelocateMobileMenuButtonsVariantModule ~= 0 then
			local _ = function()
				-- upvalues: getViewportSize (copy), userInputService (copy)
				local var4 = getViewportSize()
				
				return var4 and (userInputService.TouchEnabled and (if var4.Y >= 500 then var4.X < 700 else true))
			end
			
			local var4 = getViewportSize()
			
			return if var4 and (userInputService.TouchEnabled and (if var4.Y >= 500 then var4.X < 700 else true)) then t_5 else t_4
		end
		return if var3 then t_5 else t_4
	end,
	MenuContainerPosition = function(p1)
		-- upvalues: isInExperienceUIVREnabled (ref), var3 (write), t_7 (ref), t_6 (ref)
		if isInExperienceUIVREnabled and p1 then
			local menuContainerPositionOverride = p1:getMenuContainerPositionOverride()
			
			return menuContainerPositionOverride or (if var3 then t_7 else t_6)
		end
	end,
	Images = images,
	getIconSize = getIconSize,
	IconSize = iconSize,
	SHIELD_INACTIVE_POSITION = UDim2.new(0, 0, 1, 36),
	viewportResized = function()
		-- upvalues: var2 (write), getViewportSize (ref), var3 (write), userInputService (ref)
		var2 = getViewportSize()
		var3 = var2 and (userInputService.TouchEnabled and (if var2.Y >= 500 then var2.X < 700 else true))
	end,
	color = function(p1, p2)
		-- upvalues: t_3 (ref), t_1 (ref), color (ref)
		p1 = t_3[p1] or p1
		
		return if t_1[p1] then t_1[p1].Color else p2 or color
	end,
	transparency = function(p1, p2)
		-- upvalues: t_3 (ref), t_1 (ref)
		p1 = t_3[p1] or p1
		
		return if t_1[p1] then t_1[p1].Transparency else p2 or 0
	end,
	font = function(p1, p2)
		-- upvalues: default (ref), t_3 (ref), t_2 (ref)
		if not p2 then
			return default
		end
		p2 = t_3[p2] or p2
		
		return if t_2[p2] then t_2[p2].Font else p1 or default
	end,
	fontSize = function(p1, p2)
		-- upvalues: t (ref), t_3 (ref), t_2 (ref), size24 (ref)
		if not p2 then
			return t[p1]
		end
		p2 = t_3[p2] or p2
		
		return if t_2[p2] then t_2[p2].RelativeSize else p1 or size24
	end,
	textSize = function(p1, p2)
		-- upvalues: getUIScale (ref), var3 (write), t_3 (ref), t_2 (ref)
		local var4 = getUIScale(false)
		
		if not p2 then
			return p1 * 0.794 * var4
		elseif var3 and p2 == "UtilityRow" then
			p2 = "UtilityRowSmall"
		elseif var3 and p2 == "UtilityText" then
			p2 = "UtilityTextSmall"
		end
		p2 = t_3[p2] or p2
		
		return if p1 == nil then if t_2[p2] and t_2[p2].TextSize then t_2[p2].TextSize else p1 * 0.794 or 19 elseif t_2[p2] and t_2[p2].TextSize then t_2[p2].TextSize * var4 else p1 * 0.794 * var4
	end,
	hydrateLabel = function(p1, p2, p3)
		-- upvalues: t_3 (ref), t_1 (ref), t_2 (ref)
		p2 = t_3[p2] or p2
		
		if t_1[p2] then
			local var4 = t_1[p2]
			p1.TextColor3 = var4.Color
			p1.TextTransparency = var4.Transparency
		end
		if t_2[p3] then
			local var5 = t_2[p2]
			p1.Font = var5.RelativeSize * 19.2
			p1.TextSize = var5.TextSize
		end
	end,
	platformNameIconSize = UDim2.fromOffset(36, 36),
	selectionCursor = t_1.SelectionCursor
}