local parent = script:FindFirstAncestor("GameCollections").Parent
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local fFlagRenameDeprecatedUIBloxTokens = require(parent.SharedFlags).FFlagRenameDeprecatedUIBloxTokens
local images = UIBloxModule.App.ImageSet.Images
local useCursor = UIBloxModule.App.SelectionCursor.useCursor
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useDesignTokens = require(parent.Style).useDesignTokens
local pushRight = images["icons/navigation/pushRight"]

function SeeAllTile(p0) --[[ line: 29 ]]
	-- upvalues: useDesignTokens (ref), useLocalization (ref), fFlagRenameDeprecatedUIBloxTokens (ref), useCursor (ref), pushRight (ref), reactModule (ref), imageSetLabel (ref)
	local size = p0.size
	local layoutOrder = p0.layoutOrder
	local var2 = useDesignTokens()
	local var3 = useLocalization({ seeAll = "Feature.Home.ActionSeeAll" })
	local uDim = UDim.new(0, if fFlagRenameDeprecatedUIBloxTokens then var2.Size.Size_200 else var2.Global.Space_100)
	local var5 = useCursor(uDim)
	local var6 = if fFlagRenameDeprecatedUIBloxTokens then var2.Typography.TitleLarge else var2.Semantic.Typography.Subheader
	local var7 = if fFlagRenameDeprecatedUIBloxTokens then var2.Size.Size_900 else var2.Semantic.Icon.Size.Medium
	
	return reactModule.createElement("TextButton", {
		AutoButtonColor = false,
		Text = "",
		Size = size,
		LayoutOrder = layoutOrder,
		BackgroundTransparency = (if fFlagRenameDeprecatedUIBloxTokens then var2.Color.Surface.Surface_300 else var2.Semantic.Color.BackgroundUi.Default).Transparency,
		BackgroundColor3 = (if fFlagRenameDeprecatedUIBloxTokens then var2.Color.Surface.Surface_300 else var2.Semantic.Color.BackgroundUi.Default).Color3,
		[reactModule.Event.Activated] = p0.onActivated,
		SelectionImageObject = var5
	}, {
		UICorner = reactModule.createElement("UICorner", { CornerRadius = uDim }),
		UIListLayout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, if fFlagRenameDeprecatedUIBloxTokens then var2.Size.Size_100 else var2.Global.Space_50)
		}),
		Icon = reactModule.createElement(imageSetLabel, {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Size = UDim2.fromOffset(var7, var7),
			Image = p0.icon or pushRight,
			ImageColor3 = (if fFlagRenameDeprecatedUIBloxTokens then var2.Color.Content.Emphasis else var2.Semantic.Color.Icon.Emphasis).Color3,
			ImageTransparency = (if fFlagRenameDeprecatedUIBloxTokens then var2.Color.Content.Emphasis else var2.Semantic.Color.Icon.Emphasis).Transparency
		}),
		Title = reactModule.createElement("TextLabel", {
			LayoutOrder = 2,
			BackgroundTransparency = 1,
			Text = p0.title or var3.seeAll,
			Size = UDim2.new(1, 0, 0, var6.FontSize),
			TextXAlignment = Enum.TextXAlignment.Center,
			Font = var6.Font,
			TextSize = var6.FontSize,
			TextColor3 = (if fFlagRenameDeprecatedUIBloxTokens then var2.Color.Content.Emphasis else var2.Semantic.Color.Text.Emphasis).Color3,
			TextTruncate = Enum.TextTruncate.AtEnd
		})
	})
end

return SeeAllTile