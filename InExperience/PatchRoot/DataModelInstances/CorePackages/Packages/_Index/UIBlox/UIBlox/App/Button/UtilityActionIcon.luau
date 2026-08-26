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

return reactModule.forwardRef(function(p1, p2)
	-- upvalues: cryoModule (ref), t (ref), useStyleModule (ref), UIBloxConfigModule (ref), reactModule (ref), withHoverTooltip (ref), tooltipOrientationModule (ref), stateLayerModule (ref), label (ref), statusIndicator (ref), migrateBadgeVariantModule (ref)
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
	local var2 = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_1000 else tokens.Global.Size_500
	local var3 = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_900 else tokens.Semantic.Icon.Size.Medium
	local var4 = if var1.iconColor then var1.iconColor elseif onMedia then if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Color.Extended.White.White_100 else tokens.Global.Color.White elseif UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Color.Content.Emphasis else tokens.Semantic.Color.Icon.Emphasis
	local var5 = if onMedia then "Darken" else "Standard"
	local vector2 = Vector2.new(0, 1)
	local uDim2 = UDim2.new(0.5, if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_50 else tokens.Global.Size_25, 0.5, -(if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_50 else tokens.Global.Size_25))
	local var6 = reactModule.useMemo(function()
		-- upvalues: disableOutset (ref), UIBloxConfigModule (copy), tokens (ref)
		return if disableOutset then nil else {
			top = UDim.new(0, if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_100 else tokens.Global.Size_50),
			right = UDim.new(0, if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_100 else tokens.Global.Size_50),
			bottom = UDim.new(0, if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_100 else tokens.Global.Size_50),
			left = UDim.new(0, if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_100 else tokens.Global.Size_50)
		}
	end, { disableOutset, tokens })
	local var7 = reactModule.useMemo(function()
		-- upvalues: var2 (ref), var6 (ref)
		local uDim = UDim.new(0, var2)
		
		return if var6 then UDim2.new(uDim + var6.left + var6.right, uDim + var6.top + var6.bottom) else UDim2.new(uDim, uDim)
	end, { var2, var6 })
	
	return withHoverTooltip({ bodyText = tooltipText }, {
		DisplayOrder = 10,
		disabled = if tooltipText then false else true,
		preferredOrientation = tooltipOrientationModule.Bottom,
		guiTarget = tooltipTarget,
		DEBUG_useTargetDirectly = var1._DEBUG_is_plugin
	}, function(p3, p4)
		-- upvalues: reactModule (copy), var7 (ref), anchorPoint (ref), position (ref), layoutOrder (ref), p2 (ref), onMedia (ref), var2 (ref), UIBloxConfigModule (copy), tokens (ref), stateLayerModule (copy), var5 (ref), var6 (ref), onActivated (ref), label (copy), var3 (ref), icon (ref), var4 (ref), badgeValue (ref), statusIndicator (copy), uDim2 (ref), vector2 (ref), migrateBadgeVariantModule (copy), badgeVariant (ref), var1 (ref)
		return reactModule.createElement("Frame", {
			Selectable = false,
			Size = var7,
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
				Size = UDim2.fromOffset(var2, var2),
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
				size = UDim2.fromOffset(var2, var2),
				anchorPoint = Vector2.new(0.5, 0.5),
				position = UDim2.fromScale(0.5, 0.5),
				cornerRadius = UDim.new(0, if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Radius.Circle else tokens.Semantic.Radius.Circle),
				stateStyle = var5,
				outset = var6,
				onStateChanged = p4,
				onActivated = onActivated
			}),
			Icon = reactModule.createElement(label, {
				Selectable = false,
				BackgroundTransparency = 1,
				ZIndex = 3,
				Size = UDim2.fromOffset(var3, var3),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5),
				Image = icon,
				ImageColor3 = var4.Color3,
				ImageTransparency = var4.Transparency
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
			}, var1.children)
		})
	end)
end)