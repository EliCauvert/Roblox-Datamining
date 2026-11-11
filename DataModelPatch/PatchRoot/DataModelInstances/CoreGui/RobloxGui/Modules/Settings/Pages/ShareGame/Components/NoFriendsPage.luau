local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local ShareGame = RobloxGui.Modules.Settings.Pages.ShareGame
local RoactModule = require(game:GetService("CorePackages").Packages.Roact)
local ConstantsModule = require(ShareGame.Constants)
local ShareGameIconsModule = require(ShareGame.Spritesheets.ShareGameIcons)
local FriendsFrame = ShareGameIconsModule:GetFrame("friends")
local ImagePath = ShareGameIconsModule:GetImagePath()
local ThemeModule = require(RobloxGui.Modules.Settings.Theme)
local Translator = require(ShareGame.getTranslator)()
local NoFriendsPage = RoactModule.PureComponent:extend("NoFriendsPage")

function NoFriendsPage.render(p1)
	-- upvalues: RoactModule (copy), ImagePath (copy), FriendsFrame (copy), Translator (copy), ConstantsModule (copy), ThemeModule (copy)
	local ZIndex = p1.props.ZIndex
	local LayoutOrder = 0
	
	local function _(): number
		-- upvalues: LayoutOrder (ref)
		LayoutOrder += 1
		
		return LayoutOrder
	end
	
	LayoutOrder += 1
	local ImageLabel = RoactModule.createElement("ImageLabel", {
		BackgroundTransparency = 1,
		Image = ImagePath,
		ImageRectOffset = FriendsFrame.offset,
		ImageRectSize = FriendsFrame.size,
		Size = UDim2.new(0, 72, 0, 72),
		LayoutOrder = LayoutOrder,
		ZIndex = ZIndex
	})
	LayoutOrder += 1
	local config = {
		BackgroundTransparency = 1,
		Size = UDim2.new(0, 0, 0, 34),
		LayoutOrder = LayoutOrder,
		ZIndex = ZIndex
	}
	LayoutOrder += 1
	local config1 = {
		BackgroundTransparency = 1,
		TextTransparency = 0.22,
		TextWrapped = true,
		Text = Translator:FormatByKey("Feature.SettingsHub.Label.NoFriendsScreen"),
		TextColor3 = ConstantsModule.Color.GRAY5,
		TextSize = ThemeModule.textSize(21),
		Font = ThemeModule.font(Enum.Font.SourceSans),
		LayoutOrder = LayoutOrder,
		Size = UDim2.new(0, 280, 0, 42),
		TextYAlignment = Enum.TextYAlignment.Top,
		ZIndex = ZIndex
	}
	LayoutOrder += 1
	
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 1, 0),
		LayoutOrder = p1.props.LayoutOrder,
		ZIndex = ZIndex,
		Position = p1.props.Position
	}, {
		listLayout = RoactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		friendsIcon = ImageLabel,
		iconToSubtitleSpacer = RoactModule.createElement("Frame", config),
		subtitle = RoactModule.createElement("TextLabel", config1),
		bottomSpacer = RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(0, 0, 0, 120),
			LayoutOrder = LayoutOrder,
			ZIndex = ZIndex
		})
	})
end

return NoFriendsPage