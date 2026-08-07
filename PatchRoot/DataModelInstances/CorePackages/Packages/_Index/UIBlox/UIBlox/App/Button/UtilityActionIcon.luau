-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:51 2026 Pacific Standard Time.

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

return reactModule.forwardRef(function(p0, p1) --[[ line: 60 | named "UtilityActionIcon" ]]
	-- upvalues: cryoModule (ref), t (ref), useStyleModule (ref), reactModule (ref), withHoverTooltip (ref), tooltipOrientationModule (ref), stateLayerModule (ref), label (ref), statusIndicator (ref), migrateBadgeVariantModule (ref)
	local var10 = cryoModule.Dictionary.join(t, p0)
	local anchorPoint = var10.anchorPoint
	local position = var10.position
	local layoutOrder = var10.layoutOrder
	local icon = var10.icon
	local badgeValue = var10.badgeValue
	local badgeVariant = var10.badgeVariant
	local tooltipText = var10.tooltipText
	local tooltipTarget = var10.tooltipTarget
	local disableOutset = var10.disableOutset
	local onMedia = var10.onMedia
	local onActivated = var10.onActivated
	local tokens = useStyleModule().Tokens
	local size500 = tokens.Global.Size_500
	local medium = tokens.Semantic.Icon.Size.Medium
	local var11 = if var10.iconColor then var10.iconColor elseif onMedia then tokens.Global.Color.White else tokens.Semantic.Color.Icon.Emphasis
	local var12 = if onMedia then "Darken" else "Standard"
	local vector2 = Vector2.new(0, 1)
	local uDim2 = UDim2.new(0.5, tokens.Global.Size_25, 0.5, -tokens.Global.Size_25)
	local var15 = reactModule.useMemo(function() --[[ line: 86 ]]
		-- upvalues: disableOutset (ref), tokens (ref)
		return if disableOutset then nil else {
			top = UDim.new(0, tokens.Global.Size_50),
			right = UDim.new(0, tokens.Global.Size_50),
			bottom = UDim.new(0, tokens.Global.Size_50),
			left = UDim.new(0, tokens.Global.Size_50)
		}
	end, { disableOutset, tokens })
	local var16 = reactModule.useMemo(function() --[[ line: 97 ]]
		-- upvalues: size500 (ref), var15 (ref)
		local uDim = UDim.new(0, size500)
		
		return if var15 then UDim2.new(uDim + var15.left + var15.right, uDim + var15.top + var15.bottom) else UDim2.new(uDim, uDim)
	end, { size500, var15 })
	
	return withHoverTooltip({ bodyText = tooltipText }, {
		DisplayOrder = 10,
		disabled = if tooltipText then false else true,
		preferredOrientation = tooltipOrientationModule.Bottom,
		guiTarget = tooltipTarget,
		DEBUG_useTargetDirectly = var10._DEBUG_is_plugin
	}, function(p2, p3) --[[ line: 112 ]]
		-- upvalues: reactModule (copy), var16 (ref), anchorPoint (ref), position (ref), layoutOrder (ref), p1 (ref), onMedia (ref), size500 (ref), tokens (ref), stateLayerModule (copy), var12 (ref), var15 (ref), onActivated (ref), label (copy), medium (ref), icon (ref), var11 (ref), badgeValue (ref), statusIndicator (copy), uDim2 (ref), vector2 (ref), migrateBadgeVariantModule (copy), badgeVariant (ref), var10 (ref)
		return reactModule.createElement("Frame", {
			Selectable = false,
			Size = var16,
			AnchorPoint = anchorPoint,
			Position = position,
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			LayoutOrder = layoutOrder,
			[reactModule.Change.AbsoluteSize] = p2,
			[reactModule.Change.AbsolutePosition] = p2,
			ref = p1
		}, {
			Background = if onMedia then reactModule.createElement("Frame", {
				Selectable = false,
				BorderSizePixel = 0,
				BackgroundTransparency = 0.5,
				ZIndex = 1,
				Size = UDim2.fromOffset(size500, size500),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5),
				BackgroundColor3 = tokens.Global.Color.Black.Color3
			}, {
				UICorner = reactModule.createElement("UICorner", {
					CornerRadius = UDim.new(0, tokens.Semantic.Radius.Circle)
				})
			}) else nil,
			StateLayer = reactModule.createElement(stateLayerModule, {
				zIndex = 2,
				size = UDim2.fromOffset(size500, size500),
				anchorPoint = Vector2.new(0.5, 0.5),
				position = UDim2.fromScale(0.5, 0.5),
				cornerRadius = UDim.new(0, tokens.Semantic.Radius.Circle),
				stateStyle = var12,
				outset = var15,
				onStateChanged = p3,
				onActivated = onActivated
			}),
			Icon = reactModule.createElement(label, {
				Selectable = false,
				BackgroundTransparency = 1,
				ZIndex = 3,
				Size = UDim2.fromOffset(medium, medium),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5),
				Image = icon,
				ImageColor3 = var11.Color3,
				ImageTransparency = var11.Transparency
			}, {
				UICorner = reactModule.createElement("UICorner", {
					CornerRadius = UDim.new(0, tokens.Semantic.Radius.Circle)
				}),
				Badge = if badgeValue then reactModule.createElement(statusIndicator, {
					Position = uDim2,
					AnchorPoint = vector2,
					value = tonumber(badgeValue),
					variant = migrateBadgeVariantModule(badgeVariant),
					max = if tonumber(badgeValue) then 99 else nil
				}) else nil
			}, var10.children)
		})
	end)
end)