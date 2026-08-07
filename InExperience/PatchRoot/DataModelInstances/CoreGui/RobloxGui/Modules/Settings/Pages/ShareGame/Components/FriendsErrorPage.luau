local corePackagesService = game:GetService("CorePackages")
local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local shareGame = robloxGui.Modules.Settings.Pages.ShareGame
local roactModule = require(corePackagesService.Packages.Roact)
local constantsModule = require(shareGame.Constants)
local themeModule = require(robloxGui.Modules.Settings.Theme)
local var5 = require(shareGame.getTranslator)()
local friendsErrorPage = roactModule.PureComponent:extend("FriendsErrorPage")

function friendsErrorPage.render(p0) --[[ line: 17 ]]
	-- upvalues: roactModule (ref), var5 (ref), constantsModule (ref), themeModule (ref)
	local layoutOrder = p0.props.LayoutOrder
	local zIndex = p0.props.ZIndex
	local var7 = 0
	
	local function _() --[[ line: 22 | named "incrementLayoutOrder" ]]
		-- upvalues: var7 (write)
		var7 += 1
		
		return var7
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
			Text = var5:FormatByKey("Feature.SettingsHub.Label.LoadingFriendsListFailed"),
			TextColor3 = constantsModule.Color.GRAY5,
			TextSize = themeModule.textSize(21),
			Font = themeModule.font(Enum.Font.SourceSans),
			LayoutOrder = var7 + 1,
			Size = UDim2.new(0, 280, 0, 42),
			TextYAlignment = Enum.TextYAlignment.Top,
			ZIndex = zIndex
		})
	})
end

return friendsErrorPage