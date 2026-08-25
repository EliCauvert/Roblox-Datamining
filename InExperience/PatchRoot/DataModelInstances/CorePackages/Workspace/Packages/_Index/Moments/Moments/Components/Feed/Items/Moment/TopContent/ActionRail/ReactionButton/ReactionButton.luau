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
local thumbUp = builderIconsModule.Icon.ThumbUp
local t = { Transparency = 0, Color3 = Color3.new(1, 1, 1) }

local var15 = function() end

return reactModule.memo(function(p0)
	-- upvalues: useTokens (ref), usePreferredInputModule (ref), momentContextModule (ref), useReactionCommitModule (ref), useSignalState (ref), reactModule (ref), reactOtterModule (ref), reactionType (ref), useMomentGesturesModule (ref), getColorStyleWithTransparencyModule (ref), t (ref), popover (ref), railItemModule (ref), var15 (ref), view (ref), icon (ref), thumbUp (ref), iconSize (ref), reaction (ref), popoverSide (ref), popoverAlign (ref), radius (ref), reactionPickerModule (ref)
	local var16 = useTokens()
	local var17 = usePreferredInputModule() == Enum.PreferredInput.Gamepad
	local store = momentContextModule.useMoment().store
	local var18 = useReactionCommitModule()
	local var19 = useSignalState(store.getIsReactionPickerOpen)
	local var20 = useSignalState(store.getSelectedReaction)
	local var21 = var20 ~= nil
	local var22 = reactModule.useCallback(function()
		-- upvalues: store (ref)
		store.setReactionPickerOpen(false)
	end, { store })
	local var23, var24 = reactOtterModule.useAnimatedBinding(if var21 then 1 else 0)
	reactModule.useEffect(function()
		-- upvalues: var24 (ref), reactOtterModule (copy), var21 (ref)
		var24(reactOtterModule.spring(if var21 then 1 else 0, { frequency = 6, dampingRatio = 1 }))
	end, { var21 })
	local var25 = reactModule.useRef(reactionType.ThumbsUp)
	
	if var20 ~= nil then
		var25.current = var20
	end
	local var26 = reactModule.useCallback(function()
		-- upvalues: store (ref), var18 (ref)
		if store.getIsReacted(false) then
			var18("tapButton", nil, nil)
		end
		store.setReactionPickerOpen(true)
	end, { store, var18 })
	
	return reactModule.createElement(popover.Root, { isOpen = var19 }, {
		Anchor = reactModule.createElement(popover.Anchor, nil, {
			ReactButton = reactModule.createElement(railItemModule, {
				animationRatio = p0.animationRatio,
				isDisabled = p0.isDisabled,
				onActivated = if var17 then var26 else var15,
				LayoutOrder = p0.LayoutOrder,
				nativeRef = useMomentGesturesModule(not var17 and not p0.isDisabled, { onTap = var26 }).ref,
				slot = reactModule.createElement(view, { tag = "size-800-800" }, {
					Thumb = reactModule.createElement(icon, {
						name = thumbUp,
						size = iconSize.Large,
						style = reactModule.joinBindings({ transition = var23, scrub = p0.animationRatio }):map(function(p1)
							-- upvalues: getColorStyleWithTransparencyModule (copy), var16 (ref)
							return getColorStyleWithTransparencyModule(var16.Color.Content.Emphasis, 1 - (1 - p1.transition) * (1 - p1.scrub))
						end),
						AnchorPoint = Vector2.new(0.5, 0.5),
						Position = UDim2.fromScale(0.5, 0.5)
					}),
					Reacted = reactModule.createElement(reaction, {
						reactionType = var20 or var25.current,
						size = iconSize.Medium,
						imageStyle = reactModule.joinBindings({ transition = var23, scrub = p0.animationRatio }):map(function(p2)
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
			backgroundStyle = var16.Color.OverMedia.OverMedia_100,
			onPressedOutside = var22
		}, {
			ReactionPicker = reactModule.createElement(reactionPickerModule)
		})
	})
end)