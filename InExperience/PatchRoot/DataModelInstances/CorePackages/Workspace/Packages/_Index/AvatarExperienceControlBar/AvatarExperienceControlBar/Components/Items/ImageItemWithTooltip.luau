local avatarExperienceControlBar = script:FindFirstAncestor("AvatarExperienceControlBar")
local parent = avatarExperienceControlBar.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local tooltipModule = require(avatarExperienceControlBar.Components.Tooltip)
local _ = require(avatarExperienceControlBar.ControlBarTypes)
local imageItemModule = require(script.Parent.ImageItem)

return reactModule.forwardRef(function(p1, p2)
	-- upvalues: focusNavigationUtilsModule (ref), reactModule (ref), tooltipModule (ref), imageItemModule (ref), foundationModule (ref)
	local var1 = focusNavigationUtilsModule.FocusNavigableSurfaceRegistry.useRegistryEntry(focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum.Auxiliary)
	local cloned = table.clone(p1.toolTipConfig)
	cloned.LayoutOrder = p1.LayoutOrder
	cloned.Visible = p1.Visible
	cloned.open = p1.Visible ~= false and cloned.open
	local var2 = reactModule.createElement(tooltipModule, cloned, reactModule.createElement(imageItemModule, {
		thumbnailUrl = p1.thumbnailUrl,
		isActive = p1.isActive,
		size = p1.size,
		onActivated = p1.onActivated,
		disabled = p1.disabled,
		enableFocusAnimation = p1.enableFocusAnimation,
		Visible = p1.Visible,
		LayoutOrder = p1.LayoutOrder,
		hideIndicator = p1.hideIndicator,
		ref = p2
	}))
	
	return if p1.toolTipConfig.compact and var1 then reactModule.createElement(foundationModule.OverlayProvider, { gui = var1, children = var2 }) else var2
end)