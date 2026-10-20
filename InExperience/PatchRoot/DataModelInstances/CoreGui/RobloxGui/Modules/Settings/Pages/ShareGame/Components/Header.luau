local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local RoactModule = require(game:GetService("CorePackages").Packages.Roact)
local ShareGame = RobloxGui.Modules.Settings.Pages.ShareGame
local ThemeModule = require(RobloxGui.Modules.Settings.Theme)
local ConstantsModule = require(ShareGame.Constants)
local BackButtonModule = require(ShareGame.Components.BackButton)
local SearchAreaModule = require(ShareGame.Components.SearchArea)
local Translator = require(ShareGame.getTranslator)()
local Header = RoactModule.PureComponent:extend("Header")

function Header.render(p1)
	-- upvalues: ConstantsModule (copy), BackButtonModule (copy), RoactModule (copy), Translator (copy), ThemeModule (copy), SearchAreaModule (copy)
	local DeviceLayout = p1.props.deviceLayout
	local ZIndex = p1.props.zIndex
	local SearchAreaActive = p1.props.searchAreaActive
	local ToggleSearchIcon = p1.props.toggleSearchIcon
	local IconType = p1.props.iconType
	local LayoutSpecificEntry = ConstantsModule.LayoutSpecific[DeviceLayout]
	local IsDeviceLayoutMatch = DeviceLayout == ConstantsModule.DeviceLayout.DESKTOP
	local BACKBUTTONWIDTH = if IconType == BackButtonModule.IconType.None then LayoutSpecificEntry.BACK_BUTTON_WIDTH else LayoutSpecificEntry.BACK_BUTTON_MODAL_WIDTH
	
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = p1.props.size,
		AnchorPoint = Vector2.new(0, 1),
		LayoutOrder = p1.props.layoutOrder,
		ZIndex = ZIndex,
		Position = UDim2.new(0, 0, 0, 4)
	}, {
		Title = RoactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			Visible = not (ToggleSearchIcon and SearchAreaActive),
			Position = UDim2.new(0.5, 0, 0.5, 0),
			Text = Translator:FormatByKey("Feature.SettingsHub.Heading.InviteFriends"),
			TextSize = ThemeModule.textSize(LayoutSpecificEntry.PAGE_TITLE_TEXT_SIZE),
			TextColor3 = ConstantsModule.Color.WHITE,
			Font = ThemeModule.font(Enum.Font.SourceSansSemibold, "Semibold"),
			ZIndex = ZIndex
		}),
		BackButton = RoactModule.createElement(BackButtonModule, {
			visible = true,
			iconType = IconType,
			position = UDim2.new(0, 0, 0.5, 0),
			size = UDim2.new(0, BACKBUTTONWIDTH or LayoutSpecificEntry.BACK_BUTTON_WIDTH, 0, LayoutSpecificEntry.BACK_BUTTON_HEIGHT),
			anchorPoint = Vector2.new(0, 0.5),
			zIndex = ZIndex,
			onClick = p1.props.closePage
		}),
		SearchArea = RoactModule.createElement(SearchAreaModule, {
			fullWidthSearchBar = ToggleSearchIcon or not IsDeviceLayoutMatch,
			searchBoxMargin = LayoutSpecificEntry.SEARCH_BOX_MARGIN,
			anchorPoint = Vector2.new(1, 0.5),
			position = UDim2.new(1, 0, 0.5, 0),
			size = UDim2.new(1, -BACKBUTTONWIDTH, 1, 0),
			zIndex = ZIndex,
			analytics = p1.props.analytics
		})
	})
end

return Header