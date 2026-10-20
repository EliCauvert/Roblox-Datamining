local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local ReactModule = require(CorePackages.Packages.React)
local DependenciesModule = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.ContactList.dependencies)
local UIBlox = DependenciesModule.UIBlox
local Colors = UIBlox.App.Style.Colors
local Images = UIBlox.App.ImageSet.Images
local ImageSetLabel = UIBlox.Core.ImageSet.ImageSetLabel
local UseStyleFunction = UIBlox.Core.Style.useStyle
local UseLocalizationFunction = DependenciesModule.Hooks.useLocalization
local config = { searchBarHeight = 36, searchText = "" }

return function(p1)
	-- upvalues: CryoModule (copy), config (copy), UseStyleFunction (copy), ReactModule (copy), UseLocalizationFunction (copy), Colors (copy), ImageSetLabel (copy), Images (copy)
	local JoinResult = CryoModule.Dictionary.join(config, p1)
	local UseStyleResult = UseStyleFunction()
	local UseStyleResultFont = UseStyleResult.Font
	local Theme = UseStyleResult.Theme
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	
	return ReactModule.createElement("Frame", {
		Size = UDim2.new(1, -48, 0, JoinResult.searchBarHeight),
		BackgroundColor3 = Theme.UIMuted.Color,
		BackgroundTransparency = Theme.UIMuted.Transparency,
		LayoutOrder = JoinResult.layoutOrder
	}, {
		UIListLayout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, 4)
		}),
		UICorner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) }),
		UIPadding = ReactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, 12),
			PaddingRight = UDim.new(0, 12)
		}),
		UIStroke = ReactModule.createElement("UIStroke", { Thickness = 1, Color = Colors.Pumice }),
		SearchImage = ReactModule.createElement(ImageSetLabel, {
			LayoutOrder = 1,
			BackgroundTransparency = 1,
			Image = Images["icons/common/search_small"],
			ImageColor3 = if UseStateResult then Colors.White else Color3.fromHex("#696A6B"),
			Size = UDim2.fromOffset(16, 16)
		}),
		TextBox = ReactModule.createElement("TextBox", {
			Size = UDim2.new(1, -20, 1, 0),
			BackgroundTransparency = 1,
			ClearTextOnFocus = false,
			ClipsDescendants = true,
			Font = UseStyleResultFont.Body.Font,
			LayoutOrder = 2,
			PlaceholderColor3 = Color3.fromHex("#696A6B"),
			PlaceholderText = UseLocalizationFunction({ searchFriendsLabel = "Feature.Call.Prompt.SearchFriends" }).searchFriendsLabel,
			Text = JoinResult.searchText,
			TextColor3 = Colors.White,
			TextSize = UseStyleResultFont.BaseSize * UseStyleResultFont.Body.RelativeSize,
			TextXAlignment = Enum.TextXAlignment.Left,
			[ReactModule.Event.Changed] = ReactModule.useCallback(function(p2, p3)
				-- upvalues: JoinResult (copy)
				if p3 == "Text" then
					JoinResult.onSearchChanged(p2.Text)
				end
			end, { JoinResult.onSearchChanged }),
			[ReactModule.Event.Focused] = function()
				-- upvalues: UseStateResult2 (copy), JoinResult (copy)
				UseStateResult2(true)
				JoinResult.onFocused()
			end,
			[ReactModule.Event.FocusLost] = function()
				-- upvalues: UseStateResult2 (copy)
				UseStateResult2(false)
			end
		})
	})
end