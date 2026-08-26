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

return reactModule.forwardRef(function(p1, p2)
	-- upvalues: useTokens (ref), reactOtterModule (ref), reactModule (ref), foundationModule (ref), t (ref), fFlagAXSlotBasedEditorCategoryTooltip (ref), itemCard (ref), itemCardHeader (ref), view (ref), AXTooltip (ref), AXSlotBasedEditorCategoryTooltipKey (ref), slotItemCardFooterModule (ref)
	local var1 = useTokens()
	local var2, var3 = reactOtterModule.useAnimatedBinding(1)
	local var4, var5 = reactModule.useState(false)
	local var6 = reactModule.useCallback(function(p3)
		-- upvalues: foundationModule (copy), var5 (ref)
		if p3 == foundationModule.Enums.ControlState.Default then
			var5(false)
			
			return
		elseif p3 == foundationModule.Enums.ControlState.Hover then
			var5(true)
		end
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var4 (ref), var1 (ref), var3 (ref), reactOtterModule (copy), t (copy)
		var3(reactOtterModule.spring(if var4 then var1.Color.Stroke.Emphasis.Transparency else 1, t))
	end, { var4 })
	local var7 = nil
	local var8 = nil
	
	if fFlagAXSlotBasedEditorCategoryTooltip then
		var7 = reactModule.createRef()
		var8 = reactModule.useCallback(function()
			-- upvalues: var7 (write), p1 (ref)
			if var7.current then
				var7.current()
			end
			if p1.onActivated then
				p1.onActivated()
			end
		end, { p1.onActivated })
	end
	return reactModule.createElement(itemCard, {
		Size = p1.Size or UDim2.fromOffset(var1.Size.Size_2500, 0),
		LayoutOrder = p1.LayoutOrder,
		AutomaticSize = Enum.AutomaticSize.Y,
		onActivated = if fFlagAXSlotBasedEditorCategoryTooltip then var8 else p1.onActivated,
		ref = p2,
		headerSlot = reactModule.createElement(itemCardHeader, { LayoutOrder = 1, BackgroundTransparency = 1 }, reactModule.createElement(view, {
			onStateChanged = var6,
			stateLayer = {
				affordance = foundationModule.Enums.StateLayerAffordance.None
			},
			onActivated = if fFlagAXSlotBasedEditorCategoryTooltip then var8 else p1.onActivated,
			Size = UDim2.fromScale(1, 1),
			backgroundStyle = { Transparency = 1 },
			selection = { Selectable = false },
			padding = {
				top = UDim.new(0, var1.Padding.XXSmall),
				bottom = UDim.new(0, var1.Padding.XXSmall),
				left = UDim.new(0, var1.Padding.XXSmall),
				right = UDim.new(0, var1.Padding.XXSmall)
			}
		}, {
			CornerRadius = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, var1.Radius.Medium) }),
			HeaderSlot = p1.renderHeaderSlot(),
			HoverFrame = reactModule.createElement("Frame", {
				ZIndex = 2,
				Size = UDim2.fromScale(1, 1),
				BackgroundTransparency = var2
			}, {
				CornerRadius = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, var1.Radius.Medium) })
			}),
			BorderFrame = reactModule.createElement("Frame", {
				Size = UDim2.fromScale(1, 1),
				BackgroundColor3 = var1.Color.Surface.Surface_200.Color3,
				BackgroundTransparency = p1.BackgroundTransparency or 0
			}, {
				CornerRadius = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, var1.Radius.Medium) }),
				Stroke = reactModule.createElement("UIStroke", {
					Color = var1.Color.Stroke.Default.Color3,
					Transparency = if p1.isActive then var1.Color.Selection.End.Transparency else var1.Color.State.Press.Transparency,
					Thickness = var1.Stroke.Thick
				})
			}),
			AXTooltip = fFlagAXSlotBasedEditorCategoryTooltip and reactModule.createElement(AXTooltip, {
				popoverSide = "Top",
				tooltipLocalizationKey = "Feature.Avatar.Tooltip.CustomizeOverhaulSubcategories",
				tooltipStorageKey = AXSlotBasedEditorCategoryTooltipKey,
				dismissTooltipRef = var7,
				showTooltip = p1.showSecondCategoryTooltip
			})
		})),
		footerSlot = reactModule.createElement(slotItemCardFooterModule, {
			LayoutOrder = 2,
			title = p1.title,
			TextXAlignment = Enum.TextXAlignment.Center
		})
	})
end)