local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local roactModule = require(game:GetService("CorePackages").Packages.Roact)
local shareGame = robloxGui.Modules.Settings.Pages.ShareGame
local themeModule = require(robloxGui.Modules.Settings.Theme)
local constantsModule = require(shareGame.Constants)
local backButtonModule = require(shareGame.Components.BackButton)
local searchAreaModule = require(shareGame.Components.SearchArea)
local var1 = require(shareGame.getTranslator)()
local header = roactModule.PureComponent:extend("Header")

function header.render(p1)
	-- upvalues: constantsModule (ref), backButtonModule (ref), roactModule (ref), var1 (ref), themeModule (ref), searchAreaModule (ref)
	local deviceLayout = p1.props.deviceLayout
	local size = p1.props.size
	local layoutOrder = p1.props.layoutOrder
	local zIndex = p1.props.zIndex
	local closePage = p1.props.closePage
	local searchAreaActive = p1.props.searchAreaActive
	local analytics = p1.props.analytics
	local toggleSearchIcon = p1.props.toggleSearchIcon
	local iconType = p1.props.iconType
	local var2 = constantsModule.LayoutSpecific[deviceLayout]
	local var3 = if iconType == backButtonModule.IconType.None then var2.BACK_BUTTON_WIDTH else var2.BACK_BUTTON_MODAL_WIDTH
	
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
			Text = var1:FormatByKey("Feature.SettingsHub.Heading.InviteFriends"),
			TextSize = themeModule.textSize(var2.PAGE_TITLE_TEXT_SIZE),
			TextColor3 = constantsModule.Color.WHITE,
			Font = themeModule.font(Enum.Font.SourceSansSemibold, "Semibold"),
			ZIndex = zIndex
		}),
		BackButton = roactModule.createElement(backButtonModule, {
			visible = true,
			iconType = iconType,
			position = UDim2.new(0, 0, 0.5, 0),
			size = UDim2.new(0, var3 or var2.BACK_BUTTON_WIDTH, 0, var2.BACK_BUTTON_HEIGHT),
			anchorPoint = Vector2.new(0, 0.5),
			zIndex = zIndex,
			onClick = closePage
		}),
		SearchArea = roactModule.createElement(searchAreaModule, {
			fullWidthSearchBar = toggleSearchIcon or not (deviceLayout == constantsModule.DeviceLayout.DESKTOP),
			searchBoxMargin = var2.SEARCH_BOX_MARGIN,
			anchorPoint = Vector2.new(1, 0.5),
			position = UDim2.new(1, 0, 0.5, 0),
			size = UDim2.new(1, -var3, 1, 0),
			zIndex = zIndex,
			analytics = analytics
		})
	})
end

return header