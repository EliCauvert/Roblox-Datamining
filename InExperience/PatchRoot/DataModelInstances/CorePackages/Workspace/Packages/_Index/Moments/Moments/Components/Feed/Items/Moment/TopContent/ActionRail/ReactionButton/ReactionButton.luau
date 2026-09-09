local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local builderIconsModule = require(parent.BuilderIcons)
local foundationModule = require(parent.Foundation)
local momentsCommonModule = require(parent.MomentsCommon)
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local reactOtterModule = require(parent.ReactOtter)
local icon = foundationModule.Icon
local view = foundationModule.View
local popover = foundationModule.Popover
local iconSize = foundationModule.Enums.IconSize
local popoverAlign = foundationModule.Enums.PopoverAlign
local popoverSide = foundationModule.Enums.PopoverSide
local radius = foundationModule.Enums.Radius
local useTokens = foundationModule.Hooks.useTokens
local useSignalState = signalsReactModule.useSignalState
local reaction = momentsCommonModule.Components.Reaction
local reactionType = momentsCommonModule.Enums.ReactionType
local railItemModule = require(script.Parent.Parent.RailItem)
local reactionPickerModule = require(script.Parent.ReactionPicker)
local momentContextModule = require(script.Parent.Parent.Parent.Parent.MomentContext)
local useReactionCommitModule = require(script.Parent.Parent.Parent.Parent.Reactions.useReactionCommit)
local useMomentGesturesModule = require(script.Parent.Parent.Parent.Parent.Reactions.useMomentGestures)
local getColorStyleWithTransparencyModule = require(moments.Utils.getColorStyleWithTransparency)
local usePreferredInputModule = require(moments.Hooks.usePreferredInput)
local fFlagLuaSupportMicroGamepadPreferredInput = require(parent.SharedFlags).FFlagLuaSupportMicroGamepadPreferredInput
local thumbUp = builderIconsModule.Icon.ThumbUp
local t = { Transparency = 0, Color3 = Color3.new(1, 1, 1) }

local var1 = function() end

return reactModule.memo(function(p1)
	-- upvalues: useTokens (ref), usePreferredInputModule (ref), fFlagLuaSupportMicroGamepadPreferredInput (ref), momentContextModule (ref), useReactionCommitModule (ref), useSignalState (ref), reactModule (ref), reactOtterModule (ref), reactionType (ref), useMomentGesturesModule (ref), getColorStyleWithTransparencyModule (ref), t (ref), popover (ref), railItemModule (ref), var1 (ref), view (ref), icon (ref), thumbUp (ref), iconSize (ref), reaction (ref), popoverSide (ref), popoverAlign (ref), radius (ref), reactionPickerModule (ref)
	local var2 = useTokens()
	local var3 = usePreferredInputModule()
	local var4 = if var3 ~= Enum.PreferredInput.Gamepad then fFlagLuaSupportMicroGamepadPreferredInput and var3 == Enum.PreferredInput.MicroGamepad else true
	local store = momentContextModule.useMoment().store
	local var5 = useReactionCommitModule()
	local var6 = useSignalState(store.getIsReactionPickerOpen)
	local var7 = useSignalState(store.getSelectedReaction)
	local var8 = var7 ~= nil
	local var9 = reactModule.useCallback(function()
		-- upvalues: store (ref)
		store.setReactionPickerOpen(false)
	end, { store })
	local var10, var11 = reactOtterModule.useAnimatedBinding(if var8 then 1 else 0)
	reactModule.useEffect(function()
		-- upvalues: var11 (ref), reactOtterModule (copy), var8 (ref)
		var11(reactOtterModule.spring(if var8 then 1 else 0, { frequency = 6, dampingRatio = 1 }))
	end, { var8 })
	local var12 = reactModule.useRef(reactionType.ThumbsUp)
	
	if var7 ~= nil then
		var12.current = var7
	end
	local var13 = reactModule.useCallback(function()
		-- upvalues: store (ref), var5 (ref)
		if store.getIsReacted(false) then
			var5("tapButton", nil, nil)
		end
		store.setReactionPickerOpen(true)
	end, { store, var5 })
	
	return reactModule.createElement(popover.Root, { isOpen = var6 }, {
		Anchor = reactModule.createElement(popover.Anchor, nil, {
			ReactButton = reactModule.createElement(railItemModule, {
				animationRatio = p1.animationRatio,
				isDisabled = p1.isDisabled,
				onActivated = if var4 then var13 else var1,
				LayoutOrder = p1.LayoutOrder,
				nativeRef = useMomentGesturesModule(not var4 and not p1.isDisabled, { onTap = var13 }).ref,
				slot = reactModule.createElement(view, { tag = "size-800-800" }, {
					Thumb = reactModule.createElement(icon, {
						name = thumbUp,
						size = iconSize.Large,
						style = reactModule.joinBindings({ transition = var10, scrub = p1.animationRatio }):map(function(p2)
							-- upvalues: getColorStyleWithTransparencyModule (copy), var2 (ref)
							return getColorStyleWithTransparencyModule(var2.Color.Content.Emphasis, 1 - (1 - p2.transition) * (1 - p2.scrub))
						end),
						AnchorPoint = Vector2.new(0.5, 0.5),
						Position = UDim2.fromScale(0.5, 0.5)
					}),
					Reacted = reactModule.createElement(reaction, {
						reactionType = var7 or var12.current,
						size = iconSize.Medium,
						imageStyle = reactModule.joinBindings({ transition = var10, scrub = p1.animationRatio }):map(function(p2)
							-- upvalues: getColorStyleWithTransparencyModule (copy), t (copy)
							return getColorStyleWithTransparencyModule(t, 1 - p2.transition * (1 - p2.scrub))
						end),
						AnchorPoint = Vector2.new(0.5, 0.5),
						Position = UDim2.fromScale(0.5, 0.5)
					})
				})
			})
		}),
		Content = reactModule.createElement(popover.Content, {
			hasArrow = false,
			side = { offset = 8, position = popoverSide.Top },
			align = popoverAlign.End,
			radius = radius.Circle,
			backgroundStyle = var2.Color.OverMedia.OverMedia_100,
			onPressedOutside = var9
		}, {
			ReactionPicker = reactModule.createElement(reactionPickerModule)
		})
	})
end)