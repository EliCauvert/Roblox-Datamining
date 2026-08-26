local parent = script:FindFirstAncestor("GameCollections").Parent
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local images = UIBloxModule.App.ImageSet.Images
local useCursor = UIBloxModule.App.SelectionCursor.useCursor
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useDesignTokens = require(parent.Style).useDesignTokens
local pushRight = images["icons/navigation/pushRight"]

function SeeAllTile(p1)
	-- upvalues: useDesignTokens (ref), useLocalization (ref), useCursor (ref), pushRight (ref), reactModule (ref), imageSetLabel (ref)
	local size = p1.size
	local layoutOrder = p1.layoutOrder
	local var1 = useDesignTokens()
	local var2 = useLocalization({ seeAll = "Feature.Home.ActionSeeAll" })
	local uDim = UDim.new(0, var1.Size.Size_200)
	local var3 = useCursor(uDim)
	local titleLarge = var1.Typography.TitleLarge
	local size900 = var1.Size.Size_900
	
	return reactModule.createElement("TextButton", {
		AutoButtonColor = false,
		Text = "",
		Size = size,
		LayoutOrder = layoutOrder,
		BackgroundTransparency = var1.Color.Surface.Surface_300.Transparency,
		BackgroundColor3 = var1.Color.Surface.Surface_300.Color3,
		[reactModule.Event.Activated] = p1.onActivated,
		SelectionImageObject = var3
	}, {
		UICorner = reactModule.createElement("UICorner", { CornerRadius = uDim }),
		UIListLayout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, var1.Size.Size_100)
		}),
		Icon = reactModule.createElement(imageSetLabel, {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Size = UDim2.fromOffset(size900, size900),
			Image = p1.icon or pushRight,
			ImageColor3 = var1.Color.Content.Emphasis.Color3,
			ImageTransparency = var1.Color.Content.Emphasis.Transparency
		}),
		Title = reactModule.createElement("TextLabel", {
			LayoutOrder = 2,
			BackgroundTransparency = 1,
			Text = p1.title or var2.seeAll,
			Size = UDim2.new(1, 0, 0, titleLarge.FontSize),
			TextXAlignment = Enum.TextXAlignment.Center,
			Font = titleLarge.Font,
			TextSize = titleLarge.FontSize,
			TextColor3 = var1.Color.Content.Emphasis.Color3,
			TextTruncate = Enum.TextTruncate.AtEnd
		})
	})
end

return SeeAllTile