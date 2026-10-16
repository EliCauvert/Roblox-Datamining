local AvatarExperienceControlBar = script:FindFirstAncestor("AvatarExperienceControlBar")
local Parent = AvatarExperienceControlBar.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local ColorGradientCircle = require(Parent.AvatarExperienceCommon).Components.ColorGradientCircle
local UseSemanticTokensModule = require(AvatarExperienceControlBar.Hooks.useSemanticTokens)
local UseHoverBindingModule = require(AvatarExperienceControlBar.Hooks.useHoverBinding)
local StateLayer = {
	affordance = FoundationModule.Enums.StateLayerAffordance.None
}

local function getHoverTransparency(p1): number --[[ Line: 17 ]]
	return if p1 then 0 else 0.2
end

return ReactModule.forwardRef(function(Frame, Ref) --[[ Line: 32 | Named "ColorItem" ]]
	-- upvalues: UseSemanticTokensModule (copy), UseHoverBindingModule (copy), ReactModule (copy), FoundationModule (copy), StateLayer (copy), getHoverTransparency (copy), ColorGradientCircle (copy)
	local UseSemanticTokensModuleResult = UseSemanticTokensModule()
	local UseHoverBindingModuleResult, UseHoverBindingModuleResult2 = UseHoverBindingModule()
	local Size = if Frame.size then Frame.size else UseSemanticTokensModuleResult.defaultIconContainerSize
	local ColorSize = if Frame.colorSize then Frame.colorSize else Size
	
	return ReactModule.createElement(FoundationModule.View, {
		ref = Ref,
		LayoutOrder = Frame.LayoutOrder,
		stateLayer = StateLayer,
		onStateChanged = if Frame.disabled then nil else UseHoverBindingModuleResult2,
		onActivated = Frame.onActivated,
		AutomaticSize = Enum.AutomaticSize.XY,
		disabled = Frame.disabled,
		selection = { Selectable = Frame.Selectable or false }
	}, {
		HoverHandler = ReactModule.createElement(FoundationModule.View, {
			tag = "padding-small radius-circle clip auto-xy",
			Size = UDim2.fromOffset(Size, Size),
			GroupTransparency = UseHoverBindingModuleResult:map(getHoverTransparency),
			backgroundStyle = UseHoverBindingModuleResult:map(function(p1) --[[ Line: 51 ]]
				-- upvalues: UseSemanticTokensModuleResult (copy), Frame (copy)
				return if p1 then UseSemanticTokensModuleResult.hoverIconBackgroundStyle elseif Frame.isActive then UseSemanticTokensModuleResult.activeIconBackgroundStyle else {
					Transparency = 1,
					Color3 = UseSemanticTokensModuleResult.hoverIconBackgroundStyle.Color3
				}
			end)
		}, {
			ColorGradientCircle = ReactModule.createElement(ColorGradientCircle, {
				Colors = Frame.colors,
				Size = UDim2.fromOffset(ColorSize, ColorSize),
				Position = UDim2.fromScale(0.5, 0.5),
				AnchorPoint = Vector2.new(0.5, 0.5)
			})
		})
	})
end)