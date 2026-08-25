local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local roactModule = require(game:GetService("CorePackages").Packages.Roact)
local shareGame = robloxGui.Modules.Settings.Pages.ShareGame
local themeModule = require(robloxGui.Modules.Settings.Theme)
local constantsModule = require(shareGame.Constants)
local backButtonModule = require(shareGame.Components.BackButton)
local searchAreaModule = require(shareGame.Components.SearchArea)
local var6 = require(shareGame.getTranslator)()
local header = roactModule.PureComponent:extend("Header")

function header.render(p0)
	-- upvalues: constantsModule (ref), backButtonModule (ref), roactModule (ref), var6 (ref), themeModule (ref), searchAreaModule (ref)
	local deviceLayout = p0.props.deviceLayout
	local size = p0.props.size
	local layoutOrder = p0.props.layoutOrder
	local zIndex = p0.props.zIndex
	local closePage = p0.props.closePage
	local searchAreaActive = p0.props.searchAreaActive
	local analytics = p0.props.analytics
	local toggleSearchIcon = p0.props.toggleSearchIcon
	local iconType = p0.props.iconType
	local var8 = constantsModule.LayoutSpecific[deviceLayout]
	local var9 = if iconType == backButtonModule.IconType.None then var8.BACK_BUTTON_WIDTH else var8.BACK_BUTTON_MODAL_WIDTH
	
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = size,
		AnchorPoint = Vector2.new(0, 1),
		LayoutOrder = layoutOrder,
		ZIndex = zIndex,
		Position = UDim2.new(0, 0, 0, 4)
	}, {
		Title = roactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			Visible = not (toggleSearchIcon and searchAreaActive),
			Position = UDim2.new(0.5, 0, 0.5, 0),
			Text = var6:FormatByKey("Feature.SettingsHub.Heading.InviteFriends"),
			TextSize = themeModule.textSize(var8.PAGE_TITLE_TEXT_SIZE),
			TextColor3 = constantsModule.Color.WHITE,
			Font = themeModule.font(Enum.Font.SourceSansSemibold, "Semibold"),
			ZIndex = zIndex
		}),
		BackButton = roactModule.createElement(backButtonModule, {
			visible = true,
			iconType = iconType,
			position = UDim2.new(0, 0, 0.5, 0),
			size = UDim2.new(0, var9 or var8.BACK_BUTTON_WIDTH, 0, var8.BACK_BUTTON_HEIGHT),
			anchorPoint = Vector2.new(0, 0.5),
			zIndex = zIndex,
			onClick = closePage
		}),
		SearchArea = roactModule.createElement(searchAreaModule, {
			fullWidthSearchBar = toggleSearchIcon or not (deviceLayout == constantsModule.DeviceLayout.DESKTOP),
			searchBoxMargin = var8.SEARCH_BOX_MARGIN,
			anchorPoint = Vector2.new(1, 0.5),
			position = UDim2.new(1, 0, 0.5, 0),
			size = UDim2.new(1, -var9, 1, 0),
			zIndex = zIndex,
			analytics = analytics
		})
	})
end

return header