local Parent = script:FindFirstAncestor("AvatarExperienceSlotBasedEditor").Parent
local ReactModule = require(Parent.React)
local AXTooltip = require(Parent.AXCommon).Components.AXTooltip
local AvatarExperienceUIKitModule = require(Parent.AvatarExperienceUIKit)
local ItemCard = AvatarExperienceUIKitModule.ItemCardComponents.ItemCard
local ItemCardHeader = AvatarExperienceUIKitModule.ItemCardComponents.ItemCardHeader
local SlotItemCardFooterModule = require(script.Parent.SlotItemCardFooter)
local FoundationModule = require(Parent.Foundation)
local FFlagRenameDeprecatedUIBloxTokens = require(Parent.SharedFlags).FFlagRenameDeprecatedUIBloxTokens
local View = FoundationModule.View
local UseTokensFunction = FoundationModule.Hooks.useTokens
local ReactOtterModule = require(Parent.ReactOtter)
local FFlagAXSlotBasedEditorCategoryTooltip = require(Parent.AvatarExperienceFlags).FFlagAXSlotBasedEditorCategoryTooltip
local AXSlotBasedEditorCategoryTooltipKey = game:DefineFastString("AXSlotBasedEditorCategoryTooltipKey", "SlotEditorSecondCategory")
local config = { dampingRatio = 1, frequency = 1 }

return (ReactModule.forwardRef(function(Frame: Frame, Ref)
	-- upvalues: UseTokensFunction (copy), ReactOtterModule (copy), ReactModule (copy), FoundationModule (copy), config (copy), FFlagAXSlotBasedEditorCategoryTooltip (copy), ItemCard (copy), ItemCardHeader (copy), View (copy), FFlagRenameDeprecatedUIBloxTokens (copy), AXTooltip (copy), AXSlotBasedEditorCategoryTooltipKey (copy), SlotItemCardFooterModule (copy)
	local UseTokensResult = UseTokensFunction()
	local UseAnimatedBindingResult, UseAnimatedBindingResult2 = ReactOtterModule.useAnimatedBinding(1)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseResult = ReactModule.useCallback(function(Default)
		-- upvalues: FoundationModule (upval), UseStateResult2 (copy)
		if Default == FoundationModule.Enums.ControlState.Default then
			UseStateResult2(false)
			
			return
		end
		if Default == FoundationModule.Enums.ControlState.Hover then
			UseStateResult2(true)
		end
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult (copy), UseTokensResult (copy), UseAnimatedBindingResult2 (copy), ReactOtterModule (upval), config (upval)
		UseAnimatedBindingResult2(ReactOtterModule.spring(if UseStateResult then UseTokensResult.Color.Stroke.Emphasis.Transparency else 1, config))
	end, { UseStateResult })
	local Ref1 = nil
	local UseResult1 = nil
	
	if FFlagAXSlotBasedEditorCategoryTooltip then
		Ref1 = ReactModule.createRef()
		UseResult1 = ReactModule.useCallback(function()
			-- upvalues: Ref1 (ref), Frame (copy)
			if Ref1.current then
				Ref1.current()
			end
			if Frame.onActivated then
				Frame.onActivated()
			end
		end, { Frame.onActivated })
	end
	return ReactModule.createElement(ItemCard, {
		Size = Frame.Size or UDim2.fromOffset(UseTokensResult.Size.Size_2500, 0),
		LayoutOrder = Frame.LayoutOrder,
		AutomaticSize = Enum.AutomaticSize.Y,
		onActivated = if FFlagAXSlotBasedEditorCategoryTooltip then UseResult1 else Frame.onActivated,
		ref = Ref,
		headerSlot = ReactModule.createElement(ItemCardHeader, { LayoutOrder = 1, BackgroundTransparency = 1 }, ReactModule.createElement(View, {
			onStateChanged = UseResult,
			stateLayer = {
				affordance = FoundationModule.Enums.StateLayerAffordance.None
			},
			onActivated = if FFlagAXSlotBasedEditorCategoryTooltip then UseResult1 else Frame.onActivated,
			Size = UDim2.fromScale(1, 1),
			backgroundStyle = { Transparency = 1 },
			selection = { Selectable = false },
			padding = {
				top = UDim.new(0, UseTokensResult.Padding.XXSmall),
				bottom = UDim.new(0, UseTokensResult.Padding.XXSmall),
				left = UDim.new(0, UseTokensResult.Padding.XXSmall),
				right = UDim.new(0, UseTokensResult.Padding.XXSmall)
			}
		}, {
			CornerRadius = ReactModule.createElement("UICorner", {
				CornerRadius = UDim.new(0, if FFlagRenameDeprecatedUIBloxTokens then UseTokensResult.Radius.Medium else UseTokensResult.Semantic.Radius.Medium)
			}),
			HeaderSlot = Frame.renderHeaderSlot(),
			HoverFrame = ReactModule.createElement("Frame", {
				ZIndex = 2,
				Size = UDim2.fromScale(1, 1),
				BackgroundTransparency = UseAnimatedBindingResult
			}, {
				CornerRadius = ReactModule.createElement("UICorner", {
					CornerRadius = UDim.new(0, if FFlagRenameDeprecatedUIBloxTokens then UseTokensResult.Radius.Medium else UseTokensResult.Semantic.Radius.Medium)
				})
			}),
			BorderFrame = ReactModule.createElement("Frame", {
				Size = UDim2.fromScale(1, 1),
				BackgroundColor3 = UseTokensResult.Color.Surface.Surface_200.Color3,
				BackgroundTransparency = Frame.BackgroundTransparency or 0
			}, {
				CornerRadius = ReactModule.createElement("UICorner", {
					CornerRadius = UDim.new(0, if FFlagRenameDeprecatedUIBloxTokens then UseTokensResult.Radius.Medium else UseTokensResult.Semantic.Radius.Medium)
				}),
				Stroke = ReactModule.createElement("UIStroke", {
					Color = UseTokensResult.Color.Stroke.Default.Color3,
					Transparency = if Frame.isActive then UseTokensResult.Color.Selection.End.Transparency else UseTokensResult.Color.State.Press.Transparency,
					Thickness = UseTokensResult.Stroke.Thick
				})
			}),
			AXTooltip = FFlagAXSlotBasedEditorCategoryTooltip and ReactModule.createElement(AXTooltip, {
				popoverSide = "Top",
				tooltipLocalizationKey = "Feature.Avatar.Tooltip.CustomizeOverhaulSubcategories",
				tooltipStorageKey = AXSlotBasedEditorCategoryTooltipKey,
				dismissTooltipRef = Ref1,
				showTooltip = Frame.showSecondCategoryTooltip
			})
		})),
		footerSlot = ReactModule.createElement(SlotItemCardFooterModule, {
			LayoutOrder = 2,
			title = Frame.title,
			TextXAlignment = Enum.TextXAlignment.Center
		})
	})
end))