local coreGuiService = game:GetService("CoreGui")
local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local UIBloxConfigModule = require(parent.UIBloxConfig)
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

return reactModule.forwardRef(function(p0, p1) --[[ line: 61 | named "UtilityActionIcon" ]]
	-- upvalues: cryoModule (ref), t (ref), useStyleModule (ref), UIBloxConfigModule (ref), reactModule (ref), withHoverTooltip (ref), tooltipOrientationModule (ref), stateLayerModule (ref), label (ref), statusIndicator (ref), migrateBadgeVariantModule (ref)
	local var11 = cryoModule.Dictionary.join(t, p0)
	local anchorPoint = var11.anchorPoint
	local position = var11.position
	local layoutOrder = var11.layoutOrder
	local icon = var11.icon
	local badgeValue = var11.badgeValue
	local badgeVariant = var11.badgeVariant
	local tooltipText = var11.tooltipText
	local tooltipTarget = var11.tooltipTarget
	local disableOutset = var11.disableOutset
	local onMedia = var11.onMedia
	local onActivated = var11.onActivated
	local tokens = useStyleModule().Tokens
	local var12 = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_1000 else tokens.Global.Size_500
	local var13 = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_900 else tokens.Semantic.Icon.Size.Medium
	local var14 = if var11.iconColor then var11.iconColor elseif onMedia then if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Color.Extended.White.White_100 else tokens.Global.Color.White elseif UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Color.Content.Emphasis else tokens.Semantic.Color.Icon.Emphasis
	local var15 = if onMedia then "Darken" else "Standard"
	local vector2 = Vector2.new(0, 1)
	local uDim2 = UDim2.new(0.5, if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_50 else tokens.Global.Size_25, 0.5, -(if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_50 else tokens.Global.Size_25))
	local var18 = reactModule.useMemo(function() --[[ line: 102 ]]
		-- upvalues: disableOutset (ref), UIBloxConfigModule (copy), tokens (ref)
		return if disableOutset then nil else {
			top = UDim.new(0, if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_100 else tokens.Global.Size_50),
			right = UDim.new(0, if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_100 else tokens.Global.Size_50),
			bottom = UDim.new(0, if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_100 else tokens.Global.Size_50),
			left = UDim.new(0, if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_100 else tokens.Global.Size_50)
		}
	end, { disableOutset, tokens })
	local var19 = reactModule.useMemo(function() --[[ line: 133 ]]
		-- upvalues: var12 (ref), var18 (ref)
		local uDim = UDim.new(0, var12)
		
		return if var18 then UDim2.new(uDim + var18.left + var18.right, uDim + var18.top + var18.bottom) else UDim2.new(uDim, uDim)
	end, { var12, var18 })
	
	return withHoverTooltip({ bodyText = tooltipText }, {
		DisplayOrder = 10,
		disabled = if tooltipText then false else true,
		preferredOrientation = tooltipOrientationModule.Bottom,
		guiTarget = tooltipTarget,
		DEBUG_useTargetDirectly = var11._DEBUG_is_plugin
	}, function(p2, p3) --[[ line: 148 ]]
		-- upvalues: reactModule (copy), var19 (ref), anchorPoint (ref), position (ref), layoutOrder (ref), p1 (ref), onMedia (ref), var12 (ref), UIBloxConfigModule (copy), tokens (ref), stateLayerModule (copy), var15 (ref), var18 (ref), onActivated (ref), label (copy), var13 (ref), icon (ref), var14 (ref), badgeValue (ref), statusIndicator (copy), uDim2 (ref), vector2 (ref), migrateBadgeVariantModule (copy), badgeVariant (ref), var11 (ref)
		return reactModule.createElement("Frame", {
			Selectable = false,
			Size = var19,
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
				Size = UDim2.fromOffset(var12, var12),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5),
				BackgroundColor3 = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Color.Extended.Black.Black_100.Color3 else tokens.Global.Color.Black.Color3
			}, {
				UICorner = reactModule.createElement("UICorner", {
					CornerRadius = UDim.new(0, if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Radius.Circle else tokens.Semantic.Radius.Circle)
				})
			}) else nil,
			StateLayer = reactModule.createElement(stateLayerModule, {
				zIndex = 2,
				size = UDim2.fromOffset(var12, var12),
				anchorPoint = Vector2.new(0.5, 0.5),
				position = UDim2.fromScale(0.5, 0.5),
				cornerRadius = UDim.new(0, if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Radius.Circle else tokens.Semantic.Radius.Circle),
				stateStyle = var15,
				outset = var18,
				onStateChanged = p3,
				onActivated = onActivated
			}),
			Icon = reactModule.createElement(label, {
				Selectable = false,
				BackgroundTransparency = 1,
				ZIndex = 3,
				Size = UDim2.fromOffset(var13, var13),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5),
				Image = icon,
				ImageColor3 = var14.Color3,
				ImageTransparency = var14.Transparency
			}, {
				UICorner = reactModule.createElement("UICorner", {
					CornerRadius = UDim.new(0, if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Radius.Circle else tokens.Semantic.Radius.Circle)
				}),
				Badge = if badgeValue then reactModule.createElement(statusIndicator, {
					Position = uDim2,
					AnchorPoint = vector2,
					value = tonumber(badgeValue),
					variant = migrateBadgeVariantModule(badgeVariant),
					max = if tonumber(badgeValue) then 99 else nil
				}) else nil
			}, var11.children)
		})
	end)
end)