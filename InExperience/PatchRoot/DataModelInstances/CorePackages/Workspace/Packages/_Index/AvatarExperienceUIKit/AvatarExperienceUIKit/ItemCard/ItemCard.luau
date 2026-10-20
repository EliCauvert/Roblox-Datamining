local AvatarExperienceUIKit = script:FindFirstAncestor("AvatarExperienceUIKit")
local Parent = AvatarExperienceUIKit.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local View = FoundationModule.View
local UIBloxModule = require(Parent.UIBlox)
local UseSelectionCursorFunction = UIBloxModule.App.SelectionImage.useSelectionCursor
local CursorKind = UIBloxModule.App.SelectionImage.CursorKind
local _ = require(AvatarExperienceUIKit.BackgroundLayers.BackgroundLayers)
local ItemCardBackgroundsWrapperModule = require(script.Parent.ItemCardBackgroundsWrapper)

return (ReactModule.forwardRef(function(Frame: Frame, Ref)
	-- upvalues: UseSelectionCursorFunction (copy), CursorKind (copy), UseTokensFunction (copy), ReactModule (copy), ItemCardBackgroundsWrapperModule (copy), View (copy)
	local UseSelectionCursorResult = UseSelectionCursorFunction(CursorKind.RoundedRect)
	local UseTokensResult = UseTokensFunction()
	
	return ReactModule.createElement("TextButton", {
		Selectable = Frame.Selectable,
		SelectionImageObject = UseSelectionCursorResult,
		Text = "",
		AutoButtonColor = false,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		[ReactModule.Event.Activated] = if Frame.isDisabled then nil else Frame.onActivated,
		ref = Ref,
		Size = Frame.Size,
		AutomaticSize = Frame.AutomaticSize,
		LayoutOrder = Frame.LayoutOrder,
		SelectionGroup = true,
		[ReactModule.Change.AbsoluteSize] = Frame.onAbsoluteSizeChanged,
		[ReactModule.Tag] = Frame.tag
	}, if Frame.backgroundLayers == nil or #Frame.backgroundLayers <= 0 then {
		ItemCardListLayout = ReactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			Padding = UDim.new(0, UseTokensResult.Gap.Small)
		}),
		ItemCardHeaderSlot = Frame.headerSlot,
		ItemCardFooterSlot = Frame.footerSlot
	} else {
		BackgroundsWrapper = ReactModule.createElement(ItemCardBackgroundsWrapperModule, {
			backgroundLayers = Frame.backgroundLayers,
			imageScaleType = Frame.imageScaleType,
			headerSlot = Frame.headerSlot,
			footerSlot = Frame.footerSlot
		}),
		SelectedBorder = if Frame.showSelectionBorderWithBackground then ReactModule.createElement(View, {
			tag = "size-full stroke-standard stroke-system-contrast radius-medium",
			testId = "card-selection-stroke",
			ZIndex = 2
		}) else nil
	})
end))