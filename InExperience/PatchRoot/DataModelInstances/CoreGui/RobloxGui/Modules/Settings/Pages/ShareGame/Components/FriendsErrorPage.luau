local corePackagesService = game:GetService("CorePackages")
local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local shareGame = robloxGui.Modules.Settings.Pages.ShareGame
local roactModule = require(corePackagesService.Packages.Roact)
local constantsModule = require(shareGame.Constants)
local themeModule = require(robloxGui.Modules.Settings.Theme)
local var1 = require(shareGame.getTranslator)()
local friendsErrorPage = roactModule.PureComponent:extend("FriendsErrorPage")

function friendsErrorPage.render(p1)
	-- upvalues: roactModule (ref), var1 (ref), constantsModule (ref), themeModule (ref)
	local layoutOrder = p1.props.LayoutOrder
	local zIndex = p1.props.ZIndex
	local var2 = 0
	
	local function _()
		-- upvalues: var2 (write)
		var2 += 1
		
		return var2
	end
	
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 1, 0),
		LayoutOrder = layoutOrder,
		ZIndex = zIndex
	}, {
		listLayout = roactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		subtitle = roactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			TextTransparency = 0.22,
			TextWrapped = true,
			Text = var1:FormatByKey("Feature.SettingsHub.Label.LoadingFriendsListFailed"),
			TextColor3 = constantsModule.Color.GRAY5,
			TextSize = themeModule.textSize(21),
			Font = themeModule.font(Enum.Font.SourceSans),
			LayoutOrder = var2 + 1,
			Size = UDim2.new(0, 280, 0, 42),
			TextYAlignment = Enum.TextYAlignment.Top,
			ZIndex = zIndex
		})
	})
end

return friendsErrorPage