local AvatarExperienceSearch = script:FindFirstAncestor("AvatarExperienceSearch")
local Parent = AvatarExperienceSearch.Parent
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local FFlagRenameDeprecatedUIBloxTokens = require(Parent.SharedFlags).FFlagRenameDeprecatedUIBloxTokens
local UseDesignTokensFunction = require(Parent.Style).useDesignTokens
local FlexLayoutModule = require(AvatarExperienceSearch.Components.FlexLayout)
local SuggestedItemTypeEnumModule = require(AvatarExperienceSearch.Enums.SuggestedItemTypeEnum)
local StyledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local Images = UIBloxModule.App.ImageSet.Images
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local ImageSetButton = UIBloxModule.Core.ImageSet.ImageSetButton
local UseSelectionCursorFunction = UIBloxModule.App.SelectionImage.useSelectionCursor
local CursorKind = UIBloxModule.App.SelectionImage.CursorKind

local function mapTokens(p1)
	-- upvalues: FFlagRenameDeprecatedUIBloxTokens (copy)
	return {
		barBackgroundColor = (if FFlagRenameDeprecatedUIBloxTokens then p1.Color.Surface.Surface_0 else p1.Semantic.Color.Background.Default).Color3,
		barBackgroundTransparency = (if FFlagRenameDeprecatedUIBloxTokens then p1.Color.Surface.Surface_0 else p1.Semantic.Color.Background.Default).Transparency,
		barHeight = if FFlagRenameDeprecatedUIBloxTokens then p1.Size.Size_1400 else p1.Global.Size_700,
		iconAndTextInputMargin = if FFlagRenameDeprecatedUIBloxTokens then p1.Size.Size_400 else p1.Global.Space_200,
		iconOffsetX = if FFlagRenameDeprecatedUIBloxTokens then p1.Size.Size_100 else p1.Global.Space_50,
		iconContainerSize = if FFlagRenameDeprecatedUIBloxTokens then p1.Size.Size_800 else p1.Global.Size_400,
		textColorGroup = if FFlagRenameDeprecatedUIBloxTokens then p1.Color.Content.Emphasis else p1.Semantic.Color.Text.Emphasis,
		textFontGroup = if FFlagRenameDeprecatedUIBloxTokens then p1.Typography.BodyLarge else p1.Semantic.Typography.Body,
		textIconColor = (if FFlagRenameDeprecatedUIBloxTokens then p1.Color.Content.Emphasis else p1.Semantic.Color.Text.Emphasis).Color3,
		textIconTransparency = (if FFlagRenameDeprecatedUIBloxTokens then p1.Color.Content.Emphasis else p1.Semantic.Color.Text.Emphasis).Transparency,
		textSize = if FFlagRenameDeprecatedUIBloxTokens then p1.Typography.BodyLarge.FontSize else p1.Semantic.Typography.Body.FontSize,
		trailingIconSize = if FFlagRenameDeprecatedUIBloxTokens then p1.Size.Size_400 else p1.Global.Size_200,
		autocompleteIconSize = if FFlagRenameDeprecatedUIBloxTokens then p1.Size.Size_600 else p1.Global.Size_300,
		recentIconSize = if FFlagRenameDeprecatedUIBloxTokens then p1.Size.Size_800 else p1.Global.Size_400
	}
end

local function getIconMap(p1)
	-- upvalues: Images (copy)
	return {
		recent = {
			icon = Images["icons/menu/recent"],
			size = p1.recentIconSize
		},
		autocomplete = {
			icon = Images["icons/common/search"],
			size = p1.autocompleteIconSize
		}
	}
end

local function _(Autocomplete, p1)
	-- upvalues: getIconMap (copy), SuggestedItemTypeEnumModule (copy)
	local IconMap = getIconMap(p1)
	local Icon = nil
	local Size = nil
	local Flag = false
	
	if Autocomplete == SuggestedItemTypeEnumModule.Recent then
		Icon = IconMap.recent.icon
		Size = IconMap.recent.size
		Flag = true
		
		return Icon, Size, Flag
	end
	if Autocomplete == SuggestedItemTypeEnumModule.Autocomplete then
		Icon = IconMap.autocomplete.icon
		Size = IconMap.autocomplete.size
	end
	return Icon, Size, Flag
end

return ReactModule.forwardRef(function(p1, Ref)
	-- upvalues: UseDesignTokensFunction (copy), mapTokens (copy), getIconMap (copy), SuggestedItemTypeEnumModule (copy), UseSelectionCursorFunction (copy), CursorKind (copy), ReactModule (copy), FlexLayoutModule (copy), ImageSetLabel (copy), StyledTextLabel (copy), ImageSetButton (copy), Images (copy)
	local UseDesignTokensResult = UseDesignTokensFunction(mapTokens)
	local Height = p1.height or UseDesignTokensResult.barHeight
	local Text = p1.text
	local Type = p1.type
	local IconMap = getIconMap(UseDesignTokensResult)
	local Icon = nil
	local XOffset = nil
	local Flag = false
	
	if Type == SuggestedItemTypeEnumModule.Recent then
		Icon = IconMap.recent.icon
		XOffset = IconMap.recent.size
		Flag = true
	elseif Type == SuggestedItemTypeEnumModule.Autocomplete then
		Icon = IconMap.autocomplete.icon
		XOffset = IconMap.autocomplete.size
	end
	local UseSelectionCursorResult = UseSelectionCursorFunction(CursorKind.RoundedRect)
	
	local function onTrailingButtonActivate()
		-- upvalues: p1 (copy)
		if p1.onTrailingButtonActivate then
			p1.onTrailingButtonActivate()
		end
	end
	
	return ReactModule.createElement(FlexLayoutModule, {
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 0, Height),
		AnchorPoint = Vector2.new(0, 0),
		Position = UDim2.new(0, 0, 0, 0),
		BackgroundColor3 = UseDesignTokensResult.barBackgroundColor,
		BackgroundTransparency = UseDesignTokensResult.barBackgroundTransparency,
		LayoutOrder = p1.layoutOrder,
		margin = UseDesignTokensResult.iconOffsetX,
		flexSlot = ReactModule.createElement("ImageButton", {
			Size = UDim2.new(1, 0, 0, 0),
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.Y,
			BorderSizePixel = 0,
			AutoButtonColor = false,
			[ReactModule.Event.Activated] = function()
				-- upvalues: p1 (copy)
				p1.onActivate()
			end,
			[ReactModule.Tag] = "data-testid=AvatarExperienceSearch_SuggestedItem_ImageButton",
			SelectionImageObject = UseSelectionCursorFunction(CursorKind.RoundedRectNoInset),
			ref = Ref
		}, {
			ButtonChildren = ReactModule.createElement(FlexLayoutModule, {
				reverse = true,
				margin = UseDesignTokensResult.iconOffsetX,
				rigidSlot = ReactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					AnchorPoint = Vector2.new(0, 0.5),
					Size = UDim2.fromOffset(UseDesignTokensResult.iconContainerSize, UseDesignTokensResult.iconContainerSize),
					Position = UDim2.new(0, 0, 0.5, 0)
				}, {
					SuggestedItemLeadingIcon = ReactModule.createElement(ImageSetLabel, {
						BackgroundTransparency = 1,
						AnchorPoint = Vector2.new(0.5, 0.5),
						Image = Icon,
						ImageColor3 = UseDesignTokensResult.textIconColor,
						ImageTransparency = UseDesignTokensResult.textIconTransparency,
						Position = UDim2.new(0.5, 0, 0.5, 0),
						Size = UDim2.fromOffset(XOffset, XOffset)
					})
				}),
				flexSlot = ReactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, Height)
				}, {
					UIListLayout = ReactModule.createElement("UIListLayout", { VerticalAlignment = Enum.VerticalAlignment.Center }),
					TextLabel = ReactModule.createElement(StyledTextLabel, {
						textWrapped = false,
						fontStyle = UseDesignTokensResult.textFontGroup,
						colorStyle = UseDesignTokensResult.textColorGroup,
						text = Text or "",
						textTruncate = Enum.TextTruncate.AtEnd,
						textXAlignment = Enum.TextXAlignment.Left,
						textYAlignment = Enum.TextYAlignment.Top,
						automaticSize = Enum.AutomaticSize.X,
						size = UDim2.new(1, 0, 0, UseDesignTokensResult.textFontGroup.FontSize)
					})
				})
			})
		}),
		rigidSlot = if Flag then ReactModule.createElement(ImageSetButton, {
			AnchorPoint = Vector2.new(0, 0.5),
			Image = Images["icons/navigation/close_small"],
			ImageColor3 = UseDesignTokensResult.textIconColor,
			ImageTransparency = UseDesignTokensResult.textIconTransparency,
			BackgroundTransparency = 1,
			Position = UDim2.new(0, 0, 0.5, 0),
			Size = UDim2.fromOffset(UseDesignTokensResult.trailingIconSize, UseDesignTokensResult.trailingIconSize),
			[ReactModule.Event.Activated] = onTrailingButtonActivate,
			[ReactModule.Tag] = "data-testid=AvatarExperienceSearch_SuggestedItem_TrailingButton",
			SelectionImageObject = UseSelectionCursorResult
		}) else nil
	})
end)