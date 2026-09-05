local avatarExperienceUIKit = script:FindFirstAncestor("AvatarExperienceUIKit")
local parent = avatarExperienceUIKit.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useTokens = foundationModule.Hooks.useTokens
local view = foundationModule.View
local UIBloxModule = require(parent.UIBlox)
local useSelectionCursor = UIBloxModule.App.SelectionImage.useSelectionCursor
local cursorKind = UIBloxModule.App.SelectionImage.CursorKind
local _ = require(avatarExperienceUIKit.BackgroundLayers.BackgroundLayers)
local itemCardBackgroundsWrapperModule = require(script.Parent.ItemCardBackgroundsWrapper)
local avatarExperienceFlagsModule = require(parent.AvatarExperienceFlags)
local fFlagAXMISEnableMultiShopping = avatarExperienceFlagsModule.FFlagAXMISEnableMultiShopping
local fFlagAXSelectedBorderWrapsBackground = avatarExperienceFlagsModule.FFlagAXSelectedBorderWrapsBackground

return reactModule.forwardRef(function(p1, p2)
	-- upvalues: useSelectionCursor (ref), cursorKind (ref), useTokens (ref), reactModule (ref), fFlagAXMISEnableMultiShopping (ref), itemCardBackgroundsWrapperModule (ref), fFlagAXSelectedBorderWrapsBackground (ref), view (ref)
	return reactModule.createElement("TextButton", {
		Selectable = if fFlagAXMISEnableMultiShopping then p1.Selectable else nil,
		SelectionImageObject = useSelectionCursor(cursorKind.RoundedRect),
		Text = "",
		AutoButtonColor = false,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		[reactModule.Event.Activated] = if p1.isDisabled then nil else p1.onActivated,
		ref = p2,
		Size = p1.Size,
		AutomaticSize = p1.AutomaticSize,
		LayoutOrder = p1.LayoutOrder,
		SelectionGroup = true,
		[reactModule.Tag] = p1.tag
	}, if p1.backgroundLayers == nil or #p1.backgroundLayers <= 0 then {
		ItemCardListLayout = reactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			Padding = UDim.new(0, useTokens().Gap.Small)
		}),
		ItemCardHeaderSlot = p1.headerSlot,
		ItemCardFooterSlot = p1.footerSlot
	} else {
		BackgroundsWrapper = reactModule.createElement(itemCardBackgroundsWrapperModule, {
			backgroundLayers = p1.backgroundLayers,
			imageScaleType = p1.imageScaleType,
			headerSlot = p1.headerSlot,
			footerSlot = p1.footerSlot
		}),
		SelectedBorder = if fFlagAXSelectedBorderWrapsBackground and p1.showSelectionBorderWithBackground then reactModule.createElement(view, {
			tag = "size-full stroke-standard stroke-system-contrast radius-medium",
			testId = "card-selection-stroke",
			ZIndex = 2
		}) else nil
	})
end)