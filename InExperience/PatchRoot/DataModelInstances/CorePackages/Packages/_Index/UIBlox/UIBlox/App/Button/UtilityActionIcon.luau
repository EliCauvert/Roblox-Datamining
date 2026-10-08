local coreGuiService = game:GetService("CoreGui")
local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local cryoModule = require(parent_1.Cryo)
local foundationModule = require(parent_1.Foundation)
local label = require(parent.Core.ImageSet.ImageSetComponent).Label
local useStyleModule = require(parent.Core.Style.useStyle)
local _ = require(parent.App.ImageSet.ImagesTypes)
local _ = require(parent.App.Style.StyleTypes)
local withHoverTooltip = require(parent.App.Dialog.TooltipV2.Controllers).withHoverTooltip
local tooltipOrientationModule = require(parent.App.Dialog.Tooltip.Enum.TooltipOrientation)
local stateLayerModule = require(parent.Core.Control.StateLayer)
local badgeVariantModule = require(parent.App.Indicator.Enum.BadgeVariant)
local migrateBadgeVariantModule = require(parent.Utility.migrateBadgeVariant)
local statusIndicator = foundationModule.StatusIndicator
local t = {
	disableOutset = false,
	onMedia = false,
	badgeVariant = badgeVariantModule.Alert,
	tooltipTarget = coreGuiService
}

return reactModule.forwardRef(function(p1, p2)
	-- upvalues: cryoModule (ref), t (ref), useStyleModule (ref), reactModule (ref), withHoverTooltip (ref), tooltipOrientationModule (ref), stateLayerModule (ref), label (ref), statusIndicator (ref), migrateBadgeVariantModule (ref)
	local var1 = cryoModule.Dictionary.join(t, p1)
	local anchorPoint = var1.anchorPoint
	local position = var1.position
	local layoutOrder = var1.layoutOrder
	local icon = var1.icon
	local badgeValue = var1.badgeValue
	local badgeVariant = var1.badgeVariant
	local tooltipText = var1.tooltipText
	local tooltipTarget = var1.tooltipTarget
	local disableOutset = var1.disableOutset
	local onMedia = var1.onMedia
	local onActivated = var1.onActivated
	local tokens = useStyleModule().Tokens
	local size1000 = tokens.Size.Size_1000
	local size900 = tokens.Size.Size_900
	local var2 = if var1.iconColor then var1.iconColor elseif onMedia then tokens.Color.Extended.White.White_100 else tokens.Color.Content.Emphasis
	local var3 = if onMedia then "Darken" else "Standard"
	local vector2 = Vector2.new(0, 1)
	local uDim2 = UDim2.new(0.5, tokens.Size.Size_50, 0.5, -tokens.Size.Size_50)
	local var4 = reactModule.useMemo(function()
		-- upvalues: disableOutset (ref), tokens (ref)
		return if disableOutset then nil else {
			top = UDim.new(0, tokens.Size.Size_100),
			right = UDim.new(0, tokens.Size.Size_100),
			bottom = UDim.new(0, tokens.Size.Size_100),
			left = UDim.new(0, tokens.Size.Size_100)
		}
	end, { disableOutset, tokens })
	local var5 = reactModule.useMemo(function()
		-- upvalues: size1000 (ref), var4 (ref)
		local uDim = UDim.new(0, size1000)
		
		return if var4 then UDim2.new(uDim + var4.left + var4.right, uDim + var4.top + var4.bottom) else UDim2.new(uDim, uDim)
	end, { size1000, var4 })
	
	return withHoverTooltip({ bodyText = tooltipText }, {
		DisplayOrder = 10,
		disabled = if tooltipText then false else true,
		preferredOrientation = tooltipOrientationModule.Bottom,
		guiTarget = tooltipTarget,
		DEBUG_useTargetDirectly = var1._DEBUG_is_plugin
	}, function(p3, p4)
		-- upvalues: reactModule (copy), var5 (ref), anchorPoint (ref), position (ref), layoutOrder (ref), p2 (ref), onMedia (ref), size1000 (ref), tokens (ref), stateLayerModule (copy), var3 (ref), var4 (ref), onActivated (ref), label (copy), size900 (ref), icon (ref), var2 (ref), badgeValue (ref), statusIndicator (copy), uDim2 (ref), vector2 (ref), migrateBadgeVariantModule (copy), badgeVariant (ref), var1 (ref)
		return reactModule.createElement("Frame", {
			Selectable = false,
			Size = var5,
			AnchorPoint = anchorPoint,
			Position = position,
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			LayoutOrder = layoutOrder,
			[reactModule.Change.AbsoluteSize] = p3,
			[reactModule.Change.AbsolutePosition] = p3,
			ref = p2
		}, {
			Background = if onMedia then reactModule.createElement("Frame", {
				Selectable = false,
				BorderSizePixel = 0,
				BackgroundTransparency = 0.5,
				ZIndex = 1,
				Size = UDim2.fromOffset(size1000, size1000),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5),
				BackgroundColor3 = tokens.Color.Extended.Black.Black_100.Color3
			}, {
				UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, tokens.Radius.Circle) })
			}) else nil,
			StateLayer = reactModule.createElement(stateLayerModule, {
				zIndex = 2,
				size = UDim2.fromOffset(size1000, size1000),
				anchorPoint = Vector2.new(0.5, 0.5),
				position = UDim2.fromScale(0.5, 0.5),
				cornerRadius = UDim.new(0, tokens.Radius.Circle),
				stateStyle = var3,
				outset = var4,
				onStateChanged = p4,
				onActivated = onActivated
			}),
			Icon = reactModule.createElement(label, {
				Selectable = false,
				BackgroundTransparency = 1,
				ZIndex = 3,
				Size = UDim2.fromOffset(size900, size900),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5),
				Image = icon,
				ImageColor3 = var2.Color3,
				ImageTransparency = var2.Transparency
			}, {
				UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, tokens.Radius.Circle) }),
				Badge = if badgeValue then reactModule.createElement(statusIndicator, {
					Position = uDim2,
					AnchorPoint = vector2,
					value = tonumber(badgeValue),
					variant = migrateBadgeVariantModule(badgeVariant),
					max = if tonumber(badgeValue) then 99 else nil
				}) else nil
			}, var1.children)
		})
	end)
end)