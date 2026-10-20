local AvatarExperienceSearch = script:FindFirstAncestor("AvatarExperienceSearch")
local Parent = AvatarExperienceSearch.Parent
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local FFlagRenameDeprecatedUIBloxTokens = require(Parent.SharedFlags).FFlagRenameDeprecatedUIBloxTokens
local UseDesignTokensFunction = require(Parent.Style).useDesignTokens
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local WasLastInputGamepadFunction = require(Parent.RoactUtils).wasLastInputGamepad
local FlexLayoutModule = require(AvatarExperienceSearch.Components.FlexLayout)
local Images = UIBloxModule.App.ImageSet.Images
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local ImageSetButton = UIBloxModule.Core.ImageSet.ImageSetButton
local UseSelectionCursorFunction = UIBloxModule.App.SelectionImage.useSelectionCursor
local CursorKind = UIBloxModule.App.SelectionImage.CursorKind
local Focusable = require(Parent.RoactGamepad).Focusable
local AXRecentlyViewedSearchItemsIXPTest = require(Parent.AXCommon).Experiments.AXRecentlyViewedSearchItemsIXPTest
local AXFixConditionalUseRefSearchBar = game:DefineFastFlag("AXFixConditionalUseRefSearchBar", false)
local config = {
	clear = Images["icons/actions/edit/clear_small"],
	search = Images["icons/common/search_small"]
}
local config1 = {
	cancelButtonText = "Feature.Catalog.Action.Cancel",
	placeholder = "Feature.Catalog.Search.Placeholder"
}

local function mapTokens(p1)
	-- upvalues: FFlagRenameDeprecatedUIBloxTokens (copy)
	return {
		borderRadius = if FFlagRenameDeprecatedUIBloxTokens then p1.Radius.Medium else p1.Semantic.Radius.Medium,
		cancelButtonPadding = if FFlagRenameDeprecatedUIBloxTokens then p1.Size.Size_200 else p1.Global.Space_100,
		defaultHeight = if FFlagRenameDeprecatedUIBloxTokens then p1.Size.Size_1000 else p1.Global.Size_500,
		font = if FFlagRenameDeprecatedUIBloxTokens then p1.Typography.BodyLarge.Font else p1.Semantic.Typography.Body.Font,
		iconAndTextInputMargin = if FFlagRenameDeprecatedUIBloxTokens then p1.Size.Size_400 else p1.Global.Space_200,
		iconOffsetX = if FFlagRenameDeprecatedUIBloxTokens then p1.Size.Size_300 else p1.Global.Size_150,
		iconSize = if FFlagRenameDeprecatedUIBloxTokens then p1.Size.Size_400 else p1.Global.Size_200,
		inputAndCancelButtonMargin = if FFlagRenameDeprecatedUIBloxTokens then p1.Size.Size_200 else p1.Global.Space_100,
		inputBackgroundColor = (if FFlagRenameDeprecatedUIBloxTokens then p1.Color.Surface.Surface_100 else p1.Semantic.Color.Background.Contrast).Color3,
		textIconColor = (if FFlagRenameDeprecatedUIBloxTokens then p1.Color.Content.Emphasis else p1.Semantic.Color.Text.Emphasis).Color3,
		textIconTransparency = (if FFlagRenameDeprecatedUIBloxTokens then p1.Color.Content.Emphasis else p1.Semantic.Color.Text.Emphasis).Transparency,
		textSize = if FFlagRenameDeprecatedUIBloxTokens then p1.Typography.BodyLarge.FontSize else p1.Semantic.Typography.Body.FontSize
	}
end

return ReactModule.forwardRef(function(p1, p2)
	-- upvalues: UseLocalizationFunction (copy), config1 (copy), UseDesignTokensFunction (copy), mapTokens (copy), UseSelectionCursorFunction (copy), CursorKind (copy), ReactModule (copy), AXRecentlyViewedSearchItemsIXPTest (copy), AXFixConditionalUseRefSearchBar (copy), WasLastInputGamepadFunction (copy), FlexLayoutModule (copy), ImageSetLabel (copy), config (copy), Focusable (copy), ImageSetButton (copy)
	local UseLocalizationResult = UseLocalizationFunction(config1)
	local UseDesignTokensResult = UseDesignTokensFunction(mapTokens)
	local UseSelectionCursorResult = UseSelectionCursorFunction(CursorKind.InputFields)
	local UseSelectionCursorResult1 = UseSelectionCursorFunction(CursorKind.RoundedRect)
	local UseSelectionCursorResult2 = UseSelectionCursorFunction(CursorKind.RoundedRectNoInset)
	local UseStateResult, UseStateResult2 = ReactModule.useState(p1.text and p1.text ~= "")
	local P2 = if AXRecentlyViewedSearchItemsIXPTest.isEnabled() or AXFixConditionalUseRefSearchBar then p2 else p2 or ReactModule.useRef(nil)
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseRefResult2 = ReactModule.useRef(false)
	local Height = p1.height or UseDesignTokensResult.defaultHeight
	local Placeholder = p1.placeholder or UseLocalizationResult.placeholder
	local NewIconSize = UseDesignTokensResult.iconSize + 2 * UseDesignTokensResult.iconOffsetX
	local XOffset = -NewIconSize + (if UseStateResult then -NewIconSize else 0)
	local Negated = -(UseDesignTokensResult.iconSize + UseDesignTokensResult.iconOffsetX)
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), AXFixConditionalUseRefSearchBar (upval), P2 (copy), UseRefResult2 (copy), WasLastInputGamepadFunction (upval)
		if p1.autofocus and ((not AXFixConditionalUseRefSearchBar or P2) and P2.current and not UseRefResult2.current and not WasLastInputGamepadFunction()) then
			UseRefResult2.current = true
			P2.current:CaptureFocus()
		end
	end, { p1.autofocus })
	
	local function v31()
		-- upvalues: AXFixConditionalUseRefSearchBar (upval), P2 (copy), p1 (copy)
		if (not AXFixConditionalUseRefSearchBar or P2) and P2.current then
			if p1.onClear then
				p1.onClear(P2.current.Text or "")
			end
			P2.current.Text = ""
			P2.current:CaptureFocus()
		end
	end
	
	return ReactModule.createElement(FlexLayoutModule, {
		margin = UseDesignTokensResult.inputAndCancelButtonMargin,
		flexSlot = ReactModule.createElement("Frame", {
			BackgroundTransparency = 0,
			BorderSizePixel = 0,
			BackgroundColor3 = UseDesignTokensResult.inputBackgroundColor,
			Size = UDim2.new(1, 0, 0, Height)
		}, {
			UICorner = ReactModule.createElement("UICorner", {
				CornerRadius = UDim.new(0, UseDesignTokensResult.borderRadius)
			}),
			SearchIcon = ReactModule.createElement(ImageSetLabel, {
				BackgroundTransparency = 1,
				AnchorPoint = Vector2.new(0, 0.5),
				Image = config.search,
				ImageColor3 = UseDesignTokensResult.textIconColor,
				ImageTransparency = UseDesignTokensResult.textIconTransparency,
				Position = UDim2.new(0, UseDesignTokensResult.iconOffsetX, 0.5, 0),
				Size = UDim2.fromOffset(UseDesignTokensResult.iconSize, UseDesignTokensResult.iconSize)
			}),
			SearchBox = ReactModule.createElement(Focusable.TextBox, {
				AnchorPoint = Vector2.new(0, 0.5),
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ClearTextOnFocus = false,
				ClipsDescendants = true,
				Font = UseDesignTokensResult.font,
				OverlayNativeInput = true,
				PlaceholderColor3 = UseDesignTokensResult.textIconColor,
				PlaceholderText = Placeholder,
				Position = UDim2.new(0, NewIconSize, 0.5, 0),
				ReturnKeyType = Enum.ReturnKeyType.Search,
				RichText = false,
				Size = UDim2.new(1, XOffset, 1, 0),
				Text = p1.text or "",
				TextColor3 = UseDesignTokensResult.textIconColor,
				TextInputType = Enum.TextInputType.NoSuggestions,
				TextSize = UseDesignTokensResult.textSize,
				TextTransparency = UseDesignTokensResult.textIconTransparency,
				TextWrapped = false,
				TextXAlignment = Enum.TextXAlignment.Left,
				[ReactModule.Change.Text] = function(p3)
					-- upvalues: p1 (copy), UseStateResult2 (copy)
					if p1.onChange then
						p1.onChange(p3.Text or "")
					end
					UseStateResult2(p3.Text ~= "")
				end,
				[ReactModule.Event.Focused] = function(p3)
					-- upvalues: p1 (copy)
					if p1.onFocus then
						p1.onFocus(p3)
					end
				end,
				[ReactModule.Event.FocusLost] = function(p3, p4, _)
					-- upvalues: p1 (copy)
					if p4 and p1.onSubmit then
						p1.onSubmit(p3.Text or "")
					end
				end,
				[ReactModule.Event.ReturnPressedFromOnScreenKeyboard] = function(p3)
					-- upvalues: p1 (copy)
					if p1.onSubmit then
						p1.onSubmit(p3.Text or "")
					end
				end,
				[ReactModule.Tag] = "data-testid=AvatarExperienceSearch_SearchBar_TextBox",
				ref = P2,
				SelectionImageObject = UseSelectionCursorResult,
				NextSelectionDown = p1.nextSelectionDown,
				NextSelectionUp = p1.nextSelectionUp,
				NextSelectionRight = if UseStateResult then UseRefResult elseif p1.showCancelButton then UseRefResult1 else nil
			}),
			ClearSearchButton = UseStateResult and ReactModule.createElement(Focusable[ImageSetButton], {
				AnchorPoint = Vector2.new(0, 0.5),
				BackgroundTransparency = 1,
				Image = config.clear,
				ImageColor3 = UseDesignTokensResult.textIconColor,
				ImageTransparency = UseDesignTokensResult.textIconTransparency,
				Position = UDim2.new(1, Negated, 0.5, 0),
				Size = UDim2.fromOffset(UseDesignTokensResult.iconSize, UseDesignTokensResult.iconSize),
				[ReactModule.Event.Activated] = v31,
				[ReactModule.Tag] = "data-testid=AvatarExperienceSearch_SearchBar_ClearButton",
				SelectionImageObject = UseSelectionCursorResult1,
				NextSelectionDown = p1.nextSelectionDown,
				NextSelectionUp = p1.nextSelectionUp,
				NextSelectionLeft = P2,
				NextSelectionRight = if p1.showCancelButton then UseRefResult1 else nil
			})
		}),
		rigidSlot = if p1.showCancelButton then ReactModule.createElement(Focusable.TextButton, {
			AutomaticSize = Enum.AutomaticSize.X,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Font = UseDesignTokensResult.font,
			Size = UDim2.new(0, 0, 0, Height),
			Text = UseLocalizationResult.cancelButtonText,
			TextColor3 = UseDesignTokensResult.textIconColor,
			TextSize = UseDesignTokensResult.textSize,
			TextTransparency = UseDesignTokensResult.textIconTransparency,
			TextXAlignment = Enum.TextXAlignment.Center,
			[ReactModule.Event.Activated] = p1.onCancel,
			[ReactModule.Tag] = "data-testid=AvatarExperienceSearch_SearchBar_CancelButton",
			SelectionImageObject = UseSelectionCursorResult2,
			NextSelectionDown = p1.nextSelectionDown,
			NextSelectionUp = p1.nextSelectionUp,
			NextSelectionLeft = if UseStateResult then UseRefResult else P2
		}, {
			Padding = ReactModule.createElement("UIPadding", {
				PaddingRight = UDim.new(0, UseDesignTokensResult.cancelButtonPadding),
				PaddingLeft = UDim.new(0, UseDesignTokensResult.cancelButtonPadding)
			})
		}) else nil
	})
end)