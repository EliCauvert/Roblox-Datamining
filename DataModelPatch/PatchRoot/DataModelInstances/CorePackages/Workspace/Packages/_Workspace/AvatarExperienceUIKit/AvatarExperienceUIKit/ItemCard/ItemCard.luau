local AvatarExperienceUIKit = script:FindFirstAncestor("AvatarExperienceUIKit")
local Parent = AvatarExperienceUIKit.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local View = FoundationModule.View
local UIBloxModule = require(Parent.UIBlox)
local UseSelectionCursorFunction = UIBloxModule.App.SelectionImage.useSelectionCursor
local CursorKind = UIBloxModule.App.SelectionImage.CursorKind
local FFlagAXMigrateAXToGlobalAutofocus = require(Parent.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus
local _ = require(AvatarExperienceUIKit.BackgroundLayers.BackgroundLayers)
local ItemCardBackgroundsWrapperModule = require(script.Parent.ItemCardBackgroundsWrapper)
local AvatarExperienceFlagsModule = require(Parent.AvatarExperienceFlags)
local FFlagAXMISEnableMultiShopping = AvatarExperienceFlagsModule.FFlagAXMISEnableMultiShopping
local FFlagAXLookAndFeelBackgrounds = AvatarExperienceFlagsModule.FFlagAXLookAndFeelBackgrounds
local FFlagAXSelectedBorderWrapsBackground = AvatarExperienceFlagsModule.FFlagAXSelectedBorderWrapsBackground

return (ReactModule.forwardRef(function(Frame: Frame, Ref)
	-- upvalues: FFlagAXMigrateAXToGlobalAutofocus (copy), UseSelectionCursorFunction (copy), CursorKind (copy), UseTokensFunction (copy), ReactModule (copy), FFlagAXMISEnableMultiShopping (copy), FFlagAXLookAndFeelBackgrounds (copy), ItemCardBackgroundsWrapperModule (copy), FFlagAXSelectedBorderWrapsBackground (copy), View (copy)
	local UseTokensResult = UseTokensFunction()
	
	return ReactModule.createElement("TextButton", {
		Selectable = if FFlagAXMISEnableMultiShopping then Frame.Selectable else nil,
		SelectionImageObject = if FFlagAXMigrateAXToGlobalAutofocus then UseSelectionCursorFunction(CursorKind.RoundedRect) else nil,
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
		[ReactModule.Tag] = Frame.tag
	}, if FFlagAXLookAndFeelBackgrounds and Frame.backgroundLayers ~= nil and #Frame.backgroundLayers > 0 then {
		BackgroundsWrapper = ReactModule.createElement(ItemCardBackgroundsWrapperModule, {
			backgroundLayers = Frame.backgroundLayers,
			imageScaleType = Frame.imageScaleType,
			headerSlot = Frame.headerSlot,
			footerSlot = Frame.footerSlot
		}),
		SelectedBorder = if FFlagAXSelectedBorderWrapsBackground and Frame.showSelectionBorderWithBackground then ReactModule.createElement(View, {
			tag = "size-full stroke-standard stroke-system-contrast radius-medium",
			testId = "card-selection-stroke",
			ZIndex = 2
		}) else nil
	} else {
		ItemCardListLayout = ReactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			Padding = UDim.new(0, UseTokensResult.Gap.Small)
		}),
		ItemCardHeaderSlot = Frame.headerSlot,
		ItemCardFooterSlot = Frame.footerSlot
	})
end))