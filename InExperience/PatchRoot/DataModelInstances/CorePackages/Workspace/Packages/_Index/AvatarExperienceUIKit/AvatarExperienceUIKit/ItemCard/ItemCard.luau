local avatarExperienceUIKit = script:FindFirstAncestor("AvatarExperienceUIKit")
local parent = avatarExperienceUIKit.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useTokens = foundationModule.Hooks.useTokens
local view = foundationModule.View
local UIBloxModule = require(parent.UIBlox)
local useSelectionCursor = UIBloxModule.App.SelectionImage.useSelectionCursor
local cursorKind = UIBloxModule.App.SelectionImage.CursorKind
local fFlagAXMigrateAXToGlobalAutofocus = require(parent.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus
local _ = require(avatarExperienceUIKit.BackgroundLayers.BackgroundLayers)
local itemCardBackgroundsWrapperModule = require(script.Parent.ItemCardBackgroundsWrapper)
local avatarExperienceFlagsModule = require(parent.AvatarExperienceFlags)
local fFlagAXMISEnableMultiShopping = avatarExperienceFlagsModule.FFlagAXMISEnableMultiShopping
local fFlagAXSelectedBorderWrapsBackground = avatarExperienceFlagsModule.FFlagAXSelectedBorderWrapsBackground

return reactModule.forwardRef(function(p0, p1)
	-- upvalues: fFlagAXMigrateAXToGlobalAutofocus (ref), useSelectionCursor (ref), cursorKind (ref), useTokens (ref), reactModule (ref), fFlagAXMISEnableMultiShopping (ref), itemCardBackgroundsWrapperModule (ref), fFlagAXSelectedBorderWrapsBackground (ref), view (ref)
	return reactModule.createElement("TextButton", {
		Selectable = if fFlagAXMISEnableMultiShopping then p0.Selectable else nil,
		SelectionImageObject = if fFlagAXMigrateAXToGlobalAutofocus then useSelectionCursor(cursorKind.RoundedRect) else nil,
		Text = "",
		AutoButtonColor = false,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		[reactModule.Event.Activated] = if p0.isDisabled then nil else p0.onActivated,
		ref = p1,
		Size = p0.Size,
		AutomaticSize = p0.AutomaticSize,
		LayoutOrder = p0.LayoutOrder,
		SelectionGroup = true,
		[reactModule.Tag] = p0.tag
	}, if p0.backgroundLayers == nil or #p0.backgroundLayers <= 0 then {
		ItemCardListLayout = reactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			Padding = UDim.new(0, useTokens().Gap.Small)
		}),
		ItemCardHeaderSlot = p0.headerSlot,
		ItemCardFooterSlot = p0.footerSlot
	} else {
		BackgroundsWrapper = reactModule.createElement(itemCardBackgroundsWrapperModule, {
			backgroundLayers = p0.backgroundLayers,
			imageScaleType = p0.imageScaleType,
			headerSlot = p0.headerSlot,
			footerSlot = p0.footerSlot
		}),
		SelectedBorder = if fFlagAXSelectedBorderWrapsBackground and p0.showSelectionBorderWithBackground then reactModule.createElement(view, {
			tag = "size-full stroke-standard stroke-system-contrast radius-medium",
			testId = "card-selection-stroke",
			ZIndex = 2
		}) else nil
	})
end)