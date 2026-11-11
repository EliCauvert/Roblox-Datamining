local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local ShareGame = RobloxGui.Modules.Settings.Pages.ShareGame
local RoactModule = require(game:GetService("CorePackages").Packages.Roact)
local ConstantsModule = require(ShareGame.Constants)
local ThemeModule = require(RobloxGui.Modules.Settings.Theme)
local Translator = require(ShareGame.getTranslator)()
local FriendsErrorPage = RoactModule.PureComponent:extend("FriendsErrorPage")

function FriendsErrorPage.render(p1)
	-- upvalues: RoactModule (copy), Translator (copy), ConstantsModule (copy), ThemeModule (copy)
	local ZIndex = p1.props.ZIndex
	local Count = 0
	
	local function _(): number
		-- upvalues: Count (ref)
		Count += 1
		
		return Count
	end
	
	Count += 1
	
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 1, 0),
		LayoutOrder = p1.props.LayoutOrder,
		ZIndex = ZIndex
	}, {
		listLayout = RoactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		subtitle = RoactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			TextTransparency = 0.22,
			TextWrapped = true,
			Text = Translator:FormatByKey("Feature.SettingsHub.Label.LoadingFriendsListFailed"),
			TextColor3 = ConstantsModule.Color.GRAY5,
			TextSize = ThemeModule.textSize(21),
			Font = ThemeModule.font(Enum.Font.SourceSans),
			LayoutOrder = Count,
			Size = UDim2.new(0, 280, 0, 42),
			TextYAlignment = Enum.TextYAlignment.Top,
			ZIndex = ZIndex
		})
	})
end

return FriendsErrorPage