local corePackagesService = game:GetService("CorePackages")
local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local shareGame = robloxGui.Modules.Settings.Pages.ShareGame
local roactModule = require(corePackagesService.Packages.Roact)
local constantsModule = require(shareGame.Constants)
local shareGameIconsModule = require(shareGame.Spritesheets.ShareGameIcons)
local friendsFrame = shareGameIconsModule:GetFrame("friends")
local imagePath = shareGameIconsModule:GetImagePath()
local themeModule = require(robloxGui.Modules.Settings.Theme)
local var8 = require(shareGame.getTranslator)()
local noFriendsPage = roactModule.PureComponent:extend("NoFriendsPage")

function noFriendsPage.render(p0) --[[ line: 23 ]]
	-- upvalues: roactModule (ref), imagePath (ref), friendsFrame (ref), var8 (ref), constantsModule (ref), themeModule (ref)
	local layoutOrder = p0.props.LayoutOrder
	local zIndex = p0.props.ZIndex
	local position = p0.props.Position
	local var10 = 0
	
	local function _() --[[ line: 29 | named "incrementLayoutOrder" ]]
		-- upvalues: var10 (write)
		var10 += 1
		
		return var10
	end
	
	local createElement = roactModule.createElement
	local var11 = "Frame"
	local t = {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 1, 0),
		LayoutOrder = layoutOrder,
		ZIndex = zIndex,
		Position = position
	}
	local t_1 = {
		listLayout = roactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder
		})
	}
	local createElement_1 = roactModule.createElement
	local var14 = "ImageLabel"
	local t_2 = {
		BackgroundTransparency = 1,
		Image = imagePath,
		ImageRectOffset = friendsFrame.offset,
		ImageRectSize = friendsFrame.size,
		Size = UDim2.new(0, 72, 0, 72),
		LayoutOrder = var10,
		ZIndex = zIndex
	}
	var10 += 1
	t_1.friendsIcon = createElement_1(var14, t_2)
	local createElement_2 = roactModule.createElement
	local var16 = "Frame"
	local t_3 = {
		BackgroundTransparency = 1,
		Size = UDim2.new(0, 0, 0, 34),
		LayoutOrder = var10,
		ZIndex = zIndex
	}
	var10 += 1
	t_1.iconToSubtitleSpacer = createElement_2(var16, t_3)
	local createElement_3 = roactModule.createElement
	local var18 = "TextLabel"
	local t_4 = {
		BackgroundTransparency = 1,
		TextTransparency = 0.22,
		TextWrapped = true,
		Text = var8:FormatByKey("Feature.SettingsHub.Label.NoFriendsScreen"),
		TextColor3 = constantsModule.Color.GRAY5,
		TextSize = themeModule.textSize(21),
		Font = themeModule.font(Enum.Font.SourceSans),
		LayoutOrder = var10,
		Size = UDim2.new(0, 280, 0, 42),
		TextYAlignment = Enum.TextYAlignment.Top,
		ZIndex = zIndex
	}
	var10 += 1
	t_1.subtitle = createElement_3(var18, t_4)
	t_1.bottomSpacer = roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(0, 0, 0, 120),
		LayoutOrder = var10 + 1,
		ZIndex = zIndex
	})
	
	return createElement(var11, t, t_1)
end

return noFriendsPage