local parent = script:FindFirstAncestor("AvatarExperienceSlotBasedEditor").Parent
local reactModule = require(parent.React)
local AXTooltip = require(parent.AXCommon).Components.AXTooltip
local avatarExperienceUIKitModule = require(parent.AvatarExperienceUIKit)
local itemCard = avatarExperienceUIKitModule.ItemCardComponents.ItemCard
local itemCardHeader = avatarExperienceUIKitModule.ItemCardComponents.ItemCardHeader
local slotItemCardFooterModule = require(script.Parent.SlotItemCardFooter)
local foundationModule = require(parent.Foundation)
local view = foundationModule.View
local useTokens = foundationModule.Hooks.useTokens
local reactOtterModule = require(parent.ReactOtter)
local fFlagAXSlotBasedEditorCategoryTooltip = require(parent.AvatarExperienceFlags).FFlagAXSlotBasedEditorCategoryTooltip
local AXSlotBasedEditorCategoryTooltipKey = game:DefineFastString("AXSlotBasedEditorCategoryTooltipKey", "SlotEditorSecondCategory")
local t = { dampingRatio = 1, frequency = 1 }

return reactModule.forwardRef(function(p0, p1)
	-- upvalues: useTokens (ref), reactOtterModule (ref), reactModule (ref), foundationModule (ref), t (ref), fFlagAXSlotBasedEditorCategoryTooltip (ref), itemCard (ref), itemCardHeader (ref), view (ref), AXTooltip (ref), AXSlotBasedEditorCategoryTooltipKey (ref), slotItemCardFooterModule (ref)
	local var7 = useTokens()
	local var8, var9 = reactOtterModule.useAnimatedBinding(1)
	local var10, var11 = reactModule.useState(false)
	local var12 = reactModule.useCallback(function(p2)
		-- upvalues: foundationModule (copy), var11 (ref)
		if p2 == foundationModule.Enums.ControlState.Default then
			var11(false)
			
			return
		elseif p2 == foundationModule.Enums.ControlState.Hover then
			var11(true)
		end
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var10 (ref), var7 (ref), var9 (ref), reactOtterModule (copy), t (copy)
		var9(reactOtterModule.spring(if var10 then var7.Color.Stroke.Emphasis.Transparency else 1, t))
	end, { var10 })
	local var13 = nil
	local var14 = nil
	
	if fFlagAXSlotBasedEditorCategoryTooltip then
		var13 = reactModule.createRef()
		var14 = reactModule.useCallback(function()
			-- upvalues: var13 (write), p0 (ref)
			if var13.current then
				var13.current()
			end
			if p0.onActivated then
				p0.onActivated()
			end
		end, { p0.onActivated })
	end
	return reactModule.createElement(itemCard, {
		Size = p0.Size or UDim2.fromOffset(var7.Size.Size_2500, 0),
		LayoutOrder = p0.LayoutOrder,
		AutomaticSize = Enum.AutomaticSize.Y,
		onActivated = if fFlagAXSlotBasedEditorCategoryTooltip then var14 else p0.onActivated,
		ref = p1,
		headerSlot = reactModule.createElement(itemCardHeader, { LayoutOrder = 1, BackgroundTransparency = 1 }, reactModule.createElement(view, {
			onStateChanged = var12,
			stateLayer = {
				affordance = foundationModule.Enums.StateLayerAffordance.None
			},
			onActivated = if fFlagAXSlotBasedEditorCategoryTooltip then var14 else p0.onActivated,
			Size = UDim2.fromScale(1, 1),
			backgroundStyle = { Transparency = 1 },
			selection = { Selectable = false },
			padding = {
				top = UDim.new(0, var7.Padding.XXSmall),
				bottom = UDim.new(0, var7.Padding.XXSmall),
				left = UDim.new(0, var7.Padding.XXSmall),
				right = UDim.new(0, var7.Padding.XXSmall)
			}
		}, {
			CornerRadius = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, var7.Radius.Medium) }),
			HeaderSlot = p0.renderHeaderSlot(),
			HoverFrame = reactModule.createElement("Frame", {
				ZIndex = 2,
				Size = UDim2.fromScale(1, 1),
				BackgroundTransparency = var8
			}, {
				CornerRadius = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, var7.Radius.Medium) })
			}),
			BorderFrame = reactModule.createElement("Frame", {
				Size = UDim2.fromScale(1, 1),
				BackgroundColor3 = var7.Color.Surface.Surface_200.Color3,
				BackgroundTransparency = p0.BackgroundTransparency or 0
			}, {
				CornerRadius = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, var7.Radius.Medium) }),
				Stroke = reactModule.createElement("UIStroke", {
					Color = var7.Color.Stroke.Default.Color3,
					Transparency = if p0.isActive then var7.Color.Selection.End.Transparency else var7.Color.State.Press.Transparency,
					Thickness = var7.Stroke.Thick
				})
			}),
			AXTooltip = fFlagAXSlotBasedEditorCategoryTooltip and reactModule.createElement(AXTooltip, {
				popoverSide = "Top",
				tooltipLocalizationKey = "Feature.Avatar.Tooltip.CustomizeOverhaulSubcategories",
				tooltipStorageKey = AXSlotBasedEditorCategoryTooltipKey,
				dismissTooltipRef = var13,
				showTooltip = p0.showSecondCategoryTooltip
			})
		})),
		footerSlot = reactModule.createElement(slotItemCardFooterModule, {
			LayoutOrder = 2,
			title = p0.title,
			TextXAlignment = Enum.TextXAlignment.Center
		})
	})
end)