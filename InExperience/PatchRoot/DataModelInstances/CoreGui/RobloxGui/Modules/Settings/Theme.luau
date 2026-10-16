local CorePackages = game:GetService("CorePackages")
local UserInputService = game:GetService("UserInputService")
local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local IsEnabled = require(RobloxGui.Modules.TenFootInterface):IsEnabled()
local AppFonts = require(CorePackages.Workspace.Packages.Style).AppFonts
local DarkTheme = require(CorePackages.Workspace.Packages.Style).Themes.DarkTheme
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local Images = UIBloxModule.App.ImageSet.Images
local GetIconSize = UIBloxModule.App.ImageSet.getIconSize
local IconSize = UIBloxModule.App.ImageSet.Enum.IconSize
local GetUIScaleFunction = require(CorePackages.Workspace.Packages.Display).GetDisplayStore(false).getUIScale
local IsInExperienceUIVREnabled = require(CorePackages.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled
local FFlagRelocateMobileMenuButtonsModule = require(RobloxGui.Modules.Settings.Flags.FFlagRelocateMobileMenuButtons)
local FIntRelocateMobileMenuButtonsVariantModule = require(RobloxGui.Modules.Settings.Flags.FIntRelocateMobileMenuButtonsVariant)
local config = {
	[Enum.FontSize.Size14] = Enum.FontSize.Size11,
	[Enum.FontSize.Size18] = Enum.FontSize.Size14,
	[Enum.FontSize.Size24] = Enum.FontSize.Size18,
	[Enum.FontSize.Size36] = Enum.FontSize.Size28,
	[Enum.FontSize.Size48] = Enum.FontSize.Size36
}
local _Color3 = Color3.fromRGB(0, 0, 0)
local Default = AppFonts.default:getDefault()
local Entry = config[Enum.FontSize.Size24]
local config1 = {
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
local config2 = {
	Confirmation_Font = {
		TextSize = 28.584000000000003,
		Font = AppFonts.default:getBold(),
		RelativeSize = config[Enum.FontSize.Size36]
	},
	Button_Font = {
		TextSize = 17.468,
		Font = AppFonts.default:getMedium(),
		RelativeSize = config[Enum.FontSize.Size24]
	},
	Username = {
		RelativeSize = if IsEnabled then config[Enum.FontSize.Size24] else config[Enum.FontSize.Size18]
	},
	DisplayName = {
		RelativeSize = if IsEnabled then Enum.FontSize.Size24 else Enum.FontSize.Size18,
		Font = AppFonts.default:getMedium()
	},
	Settings_Font = { Font = AppFonts.default:getDefault() },
	Help_Title_Font = {
		Font = AppFonts.default:getMedium(),
		RelativeSize = config[Enum.FontSize.Size18]
	},
	Help_Text_Font = {
		TextSize = 14.292000000000002,
		Font = AppFonts.default:getDefault(),
		RelativeSize = config[Enum.FontSize.Size18]
	},
	Help_Gamepad_Font = { Font = AppFonts.default:getMedium() },
	Help_Touch_Font = {
		Font = AppFonts.default:getBold(),
		RelativeSize = config[Enum.FontSize.Size14]
	},
	Game_Settings_Font = {
		Font = AppFonts.default:getDefault(),
		RelativeSize = config[Enum.FontSize.Size24]
	},
	Conversation_Details_Font = { TextSize = 12.704, Font = AppFonts.default:getDefault() },
	Utility_Text_Font = { TextSize = 17.468, Font = AppFonts.default:getDefault() },
	Utility_Text_Small_Font = { TextSize = 12.704, Font = AppFonts.default:getDefault() },
	Utility_Row_Small_Font = { TextSize = 12.704, Font = AppFonts.default:getDefault() },
	Utility_Row_Font = {
		Font = AppFonts.default:getMedium(),
		TextSize = if game:DefineFastFlag("IncreaseUtilityRowTextSizeConsole", false) and IsEnabled then 19.056 else 12.704
	},
	Back_Button_Font = { TextSize = 19.056, Font = AppFonts.default:getSemibold() },
	Semibold_Font = { Font = AppFonts.default:getSemibold() },
	Bold_Font = { Font = AppFonts.default:getMedium() }
}
setmetatable(config1, {
	__index = function(_, p1) --[[ Line: 163 ]]
		-- upvalues: DarkTheme (copy)
		return DarkTheme[p1]
	end
})
local config3 = {
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

local function getViewportSize() --[[ Line: 235 ]]
	return if _G.__TESTEZ_RUNNING_TEST__ then Vector2.new(1024, 1024) elseif workspace.CurrentCamera then if workspace.CurrentCamera.ViewportSize == Vector2.new(0, 0) or workspace.CurrentCamera.ViewportSize == Vector2.new(1, 1) then nil else workspace.CurrentCamera.ViewportSize else nil
end

local ViewportSize = getViewportSize()
local IsYBelow: boolean = ViewportSize and (UserInputService.TouchEnabled and (ViewportSize.Y < 500 or ViewportSize.X < 700))
local config4 = {
	PaddingTop = UDim.new(0, 0),
	PaddingLeft = UDim.new(0, 20),
	PaddingRight = UDim.new(0, 20),
	PaddingBottom = UDim.new(0, 14)
}
local config5 = {
	PaddingTop = UDim.new(0, 0),
	PaddingLeft = UDim.new(0, 12),
	PaddingRight = UDim.new(0, 12),
	PaddingBottom = if FFlagRelocateMobileMenuButtonsModule and (FIntRelocateMobileMenuButtonsVariantModule == 1 or FIntRelocateMobileMenuButtonsVariantModule == 3) then UDim.new(0, 24) else UDim.new(0, 12)
}
local config6 = {
	AnchorPoint = Vector2.new(0.5, 0.5),
	Position = UDim2.new(0.5, 0, 0.5, 10),
	Size = UDim2.new(0, 0, 0, 0),
	AutomaticSize = Enum.AutomaticSize.XY
}
local config7 = {
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
	AlwaysShowBottomBar = function(): boolean --[[ Line: 292 ]]
		-- upvalues: IsYBelow (ref)
		return not IsYBelow
	end,
	UseInspectAndBuyPanel = function() --[[ Line: 296 ]]
		-- upvalues: IsYBelow (ref)
		return IsYBelow
	end,
	HubPadding = function() --[[ Line: 300 ]]
		-- upvalues: FFlagRelocateMobileMenuButtonsModule (copy), FIntRelocateMobileMenuButtonsVariantModule (copy), getViewportSize (copy), UserInputService (copy), config5 (copy), config4 (copy), IsYBelow (ref)
		if FFlagRelocateMobileMenuButtonsModule and FIntRelocateMobileMenuButtonsVariantModule ~= 0 then
			local function _(): boolean --[[ Line: 303 ]]
				-- upvalues: getViewportSize (upval), UserInputService (upval)
				local ViewportSize = getViewportSize()
				
				return ViewportSize and (UserInputService.TouchEnabled and (ViewportSize.Y < 500 or ViewportSize.X < 700))
			end
			
			local ViewportSize = getViewportSize()
			local IsYBelow1: boolean = ViewportSize and (UserInputService.TouchEnabled and (ViewportSize.Y < 500 or ViewportSize.X < 700))
			
			return if IsYBelow1 then config5 else config4
		else
			return if IsYBelow then config5 else config4
		end
	end,
	MenuContainerPosition = function(p1) --[[ Line: 323 ]]
		-- upvalues: IsInExperienceUIVREnabled (copy), IsYBelow (ref), config7 (copy), config6 (copy)
		if IsInExperienceUIVREnabled and p1 then
			local MenuContainerPositionOverride = p1:getMenuContainerPositionOverride()
			
			if MenuContainerPositionOverride then
				return MenuContainerPositionOverride
			end
		end
		return if IsYBelow then config7 else config6
	end,
	Images = Images,
	getIconSize = GetIconSize,
	IconSize = IconSize,
	SHIELD_INACTIVE_POSITION = UDim2.new(0, 0, 1, 36),
	viewportResized = function() --[[ Line: 344 ]]
		-- upvalues: ViewportSize (ref), getViewportSize (copy), IsYBelow (ref), UserInputService (copy)
		ViewportSize = getViewportSize()
		IsYBelow = ViewportSize and (UserInputService.TouchEnabled and (ViewportSize.Y < 500 or ViewportSize.X < 700))
	end,
	color = function(p1, p2) --[[ Line: 350 ]]
		-- upvalues: config3 (copy), config1 (copy), _Color3 (copy)
		local Entry = config3[p1] or p1
		
		return if config1[Entry] then config1[Entry].Color else p2 or _Color3
	end,
	transparency = function(p1, p2) --[[ Line: 354 ]]
		-- upvalues: config3 (copy), config1 (copy)
		local Entry = config3[p1] or p1
		
		return if config1[Entry] then config1[Entry].Transparency else p2 or 0
	end,
	font = function(p1, p2) --[[ Line: 358 ]]
		-- upvalues: Default (copy), config3 (copy), config2 (copy)
		if p2 then
			local Entry = config3[p2] or p2
			
			return if config2[Entry] then config2[Entry].Font else p1 or Default
		else
			return Default
		end
	end,
	fontSize = function(p1, p2) --[[ Line: 365 ]]
		-- upvalues: config (copy), config3 (copy), config2 (copy), Entry (copy)
		if p2 then
			local Entry1 = config3[p2] or p2
			
			return if config2[Entry1] then config2[Entry1].RelativeSize else p1 or Entry
		else
			return config[p1]
		end
	end,
	textSize = function(p1: number, p2: string) --[[ Line: 372 ]]
		-- upvalues: GetUIScaleFunction (copy), IsYBelow (ref), config3 (copy), config2 (copy)
		local UIScale = GetUIScaleFunction(false)
		
		if not p2 then
			return p1 * 0.794 * UIScale
		end
		if IsYBelow and p2 == "UtilityRow" then
			p2 = "UtilityRowSmall"
		elseif IsYBelow and p2 == "UtilityText" then
			p2 = "UtilityTextSmall"
		end
		local Entry = config3[p2] or p2
		
		return if p1 == nil then if config2[Entry] and config2[Entry].TextSize then config2[Entry].TextSize else p1 * 0.794 or 19 elseif config2[Entry] and config2[Entry].TextSize then config2[Entry].TextSize * UIScale else p1 * 0.794 * UIScale
	end,
	hydrateLabel = function(Label, p1, p2) --[[ Line: 393 ]]
		-- upvalues: config3 (copy), config1 (copy), config2 (copy)
		local Entry = config3[p1] or p1
		
		if config1[Entry] then
			local Entry1 = config1[Entry]
			Label.TextColor3 = Entry1.Color
			Label.TextTransparency = Entry1.Transparency
		end
		if config2[p2] then
			local Entry2 = config2[Entry]
			Label.Font = Entry2.RelativeSize * 19.2
			Label.TextSize = Entry2.TextSize
		end
	end,
	platformNameIconSize = UDim2.fromOffset(36, 36),
	selectionCursor = config1.SelectionCursor
}