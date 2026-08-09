local coreGuiService = game:GetService("CoreGui")
local corePackagesService = game:GetService("CorePackages")
local cryoModule = require(corePackagesService.Packages.Cryo)
local reactModule = require(corePackagesService.Packages.React)
local dependenciesModule = require(coreGuiService:WaitForChild("RobloxGui").Modules.ContactList.dependencies)
local UIBlox = dependenciesModule.UIBlox
local colors = UIBlox.App.Style.Colors
local images = UIBlox.App.ImageSet.Images
local imageSetLabel = UIBlox.Core.ImageSet.ImageSetLabel
local useStyle = UIBlox.Core.Style.useStyle
local useLocalization = dependenciesModule.Hooks.useLocalization
local t = { searchBarHeight = 36, searchText = "" }

return function(p0) --[[ line: 35 ]]
	-- upvalues: cryoModule (ref), t (ref), useStyle (ref), reactModule (ref), useLocalization (ref), colors (ref), imageSetLabel (ref), images (ref)
	local var6 = cryoModule.Dictionary.join(t, p0)
	local var7 = useStyle()
	local font = var7.Font
	local theme = var7.Theme
	local var8, var9 = reactModule.useState(false)
	
	return reactModule.createElement("Frame", {
		Size = UDim2.new(1, -48, 0, var6.searchBarHeight),
		BackgroundColor3 = theme.UIMuted.Color,
		BackgroundTransparency = theme.UIMuted.Transparency,
		LayoutOrder = var6.layoutOrder
	}, {
		UIListLayout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, 4)
		}),
		UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) }),
		UIPadding = reactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, 12),
			PaddingRight = UDim.new(0, 12)
		}),
		UIStroke = reactModule.createElement("UIStroke", { Thickness = 1, Color = colors.Pumice }),
		SearchImage = reactModule.createElement(imageSetLabel, {
			LayoutOrder = 1,
			BackgroundTransparency = 1,
			Image = images["icons/common/search_small"],
			ImageColor3 = if var8 then colors.White else Color3.fromHex("#696A6B"),
			Size = UDim2.fromOffset(16, 16)
		}),
		TextBox = reactModule.createElement("TextBox", {
			Size = UDim2.new(1, -20, 1, 0),
			BackgroundTransparency = 1,
			ClearTextOnFocus = false,
			ClipsDescendants = true,
			Font = font.Body.Font,
			LayoutOrder = 2,
			PlaceholderColor3 = Color3.fromHex("#696A6B"),
			PlaceholderText = useLocalization({ searchFriendsLabel = "Feature.Call.Prompt.SearchFriends" }).searchFriendsLabel,
			Text = var6.searchText,
			TextColor3 = colors.White,
			TextSize = font.BaseSize * font.Body.RelativeSize,
			TextXAlignment = Enum.TextXAlignment.Left,
			[reactModule.Event.Changed] = reactModule.useCallback(function(p1, p2) --[[ line: 43 ]]
				-- upvalues: var6 (ref)
				if p2 == "Text" then
					var6.onSearchChanged(p1.Text)
				end
			end, { var6.onSearchChanged }),
			[reactModule.Event.Focused] = function() --[[ line: 98 ]]
				-- upvalues: var9 (ref), var6 (ref)
				var9(true)
				var6.onFocused()
			end,
			[reactModule.Event.FocusLost] = function() --[[ line: 102 ]]
				-- upvalues: var9 (ref)
				var9(false)
			end
		})
	})
end