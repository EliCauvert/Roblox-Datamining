local AvatarExperienceControlBar = script:FindFirstAncestor("AvatarExperienceControlBar")
local Parent = AvatarExperienceControlBar.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local TooltipModule = require(AvatarExperienceControlBar.Components.Tooltip)
local _ = require(AvatarExperienceControlBar.ControlBarTypes)
local ImageItemModule = require(script.Parent.ImageItem)

return ReactModule.forwardRef(function(Frame: Frame, Ref) --[[ Line: 15 | Named "ImageItemWithTooltip" ]]
	-- upvalues: FocusNavigationUtilsModule (copy), ReactModule (copy), TooltipModule (copy), ImageItemModule (copy), FoundationModule (copy)
	local UseRegistryEntryResult = FocusNavigationUtilsModule.FocusNavigableSurfaceRegistry.useRegistryEntry(FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum.Auxiliary)
	local Copy = table.clone(Frame.toolTipConfig)
	Copy.LayoutOrder = Frame.LayoutOrder
	Copy.Visible = Frame.Visible
	Copy.open = Frame.Visible ~= false and Copy.open
	local Element = ReactModule.createElement(TooltipModule, Copy, ReactModule.createElement(ImageItemModule, {
		thumbnailUrl = Frame.thumbnailUrl,
		isActive = Frame.isActive,
		size = Frame.size,
		onActivated = Frame.onActivated,
		disabled = Frame.disabled,
		enableFocusAnimation = Frame.enableFocusAnimation,
		Visible = Frame.Visible,
		LayoutOrder = Frame.LayoutOrder,
		hideIndicator = Frame.hideIndicator,
		ref = Ref
	}))
	
	return if Frame.toolTipConfig.compact and UseRegistryEntryResult then ReactModule.createElement(FoundationModule.OverlayProvider, { gui = UseRegistryEntryResult, children = Element }) else Element
end)