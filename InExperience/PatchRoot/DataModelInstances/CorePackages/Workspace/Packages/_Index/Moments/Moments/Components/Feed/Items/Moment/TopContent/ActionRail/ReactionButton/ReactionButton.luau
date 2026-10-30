local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local FoundationModule = require(Parent.Foundation)
local MomentsCommonModule = require(Parent.MomentsCommon)
local ReactModule = require(Parent.React)
local ReactOtterModule = require(Parent.ReactOtter)
local FFlagMomentsUseSharedReactionsModule = require(Moments.Flags.FFlagMomentsUseSharedReactions)
local Icon = FoundationModule.Icon
local View = FoundationModule.View
local Popover = FoundationModule.Popover
local IconSize = FoundationModule.Enums.IconSize
local PopoverAlign = FoundationModule.Enums.PopoverAlign
local PopoverSide = FoundationModule.Enums.PopoverSide
local Radius = FoundationModule.Enums.Radius
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local ReactionModule = if FFlagMomentsUseSharedReactionsModule then require(Parent.Reactions.Reaction) else MomentsCommonModule.Components.Reaction
local ReactionPickerPopoverModule = if FFlagMomentsUseSharedReactionsModule then require(Parent.Reactions.ReactionPickerPopover) else nil
local ReactionSize = MomentsCommonModule.Enums.ReactionSize
local ReactionType = MomentsCommonModule.Enums.ReactionType
local RailItemModule = require(script.Parent.Parent.RailItem)
local ReactionPickerModule = require(script.Parent.ReactionPicker)
local UsePickerReactionsModule = require(script.Parent.usePickerReactions)
local MomentContextModule = require(script.Parent.Parent.Parent.Parent.MomentContext)
local UseReactionCommitModule = require(script.Parent.Parent.Parent.Parent.Reactions.useReactionCommit)
local UseMomentGesturesModule = require(script.Parent.Parent.Parent.Parent.Reactions.useMomentGestures)
local GetColorStyleWithTransparencyModule = require(Moments.Utils.getColorStyleWithTransparency)
local UsePreferredInputModule = require(Moments.Hooks.usePreferredInput)
local FFlagLuaSupportMicroGamepadPreferredInput = require(Parent.SharedFlags).FFlagLuaSupportMicroGamepadPreferredInput
local ThumbUp = require(Parent.BuilderIcons).Icon.ThumbUp
local config = { Transparency = 0, Color3 = Color3.new(1, 1, 1) }

local function v29() end

return ReactModule.memo(function(Frame)
	-- upvalues: UseTokensFunction (copy), UsePreferredInputModule (copy), FFlagLuaSupportMicroGamepadPreferredInput (copy), MomentContextModule (copy), UseReactionCommitModule (copy), UseSignalStateFunction (copy), ReactModule (copy), ReactOtterModule (copy), ReactionType (copy), UseMomentGesturesModule (copy), FFlagMomentsUseSharedReactionsModule (copy), UsePickerReactionsModule (copy), GetColorStyleWithTransparencyModule (copy), config (copy), RailItemModule (copy), v29 (copy), View (copy), Icon (copy), ThumbUp (copy), IconSize (copy), ReactionModule (copy), ReactionPickerPopoverModule (copy), ReactionSize (copy), PopoverSide (copy), PopoverAlign (copy), Popover (copy), Radius (copy), ReactionPickerModule (copy)
	local UseTokensResult = UseTokensFunction()
	local UsePreferredInputModuleResult = UsePreferredInputModule()
	local IsUsePreferredInputModuleResultMatch: boolean = UsePreferredInputModuleResult == Enum.PreferredInput.Gamepad or FFlagLuaSupportMicroGamepadPreferredInput and UsePreferredInputModuleResult == Enum.PreferredInput.MicroGamepad
	local Store = MomentContextModule.useMoment().store
	local UseReactionCommitModuleResult = UseReactionCommitModule()
	local UseSignalStateResult = UseSignalStateFunction(Store.getIsReactionPickerOpen)
	local UseSignalStateResult1 = UseSignalStateFunction(Store.getSelectedReaction)
	local HasUseSignalStateResult = UseSignalStateResult1 ~= nil
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: Store (copy)
		Store.setReactionPickerOpen(false)
	end, { Store })
	local UseAnimatedBindingResult, UseAnimatedBindingResult2 = ReactOtterModule.useAnimatedBinding(if HasUseSignalStateResult then 1 else 0)
	ReactModule.useEffect(function()
		-- upvalues: UseAnimatedBindingResult2 (copy), ReactOtterModule (upval), HasUseSignalStateResult (copy)
		UseAnimatedBindingResult2(ReactOtterModule.spring(if HasUseSignalStateResult then 1 else 0, { frequency = 6, dampingRatio = 1 }))
	end, { HasUseSignalStateResult })
	local UseRefResult = ReactModule.useRef(ReactionType.ThumbsUp)
	
	if UseSignalStateResult1 ~= nil then
		UseRefResult.current = UseSignalStateResult1
	end
	local UseSignalStateResult1_1 = UseSignalStateResult1 or UseRefResult.current
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: Store (copy), UseReactionCommitModuleResult (copy)
		if Store.getIsReacted(false) then
			UseReactionCommitModuleResult("tapButton", nil, nil)
		end
		Store.setReactionPickerOpen(true)
	end, { Store, UseReactionCommitModuleResult })
	local NoIsDisabled: boolean = not IsUsePreferredInputModuleResultMatch and not Frame.isDisabled
	local UseMomentGesturesModuleResult = UseMomentGesturesModule(not FFlagMomentsUseSharedReactionsModule and NoIsDisabled, { onTap = UseResult1 })
	local UseRefResult1 = nil
	local Reactions = nil
	local UseResult2 = nil
	local UseResult3 = nil
	local UseMemoResult = nil
	
	if FFlagMomentsUseSharedReactionsModule then
		UseRefResult1 = ReactModule.useRef(nil)
		Reactions = UsePickerReactionsModule()
		UseResult2 = ReactModule.useCallback(function()
			-- upvalues: Store (copy)
			Store.setReactionPickerOpen(true)
		end, { Store })
		UseResult3 = ReactModule.useCallback(function(p1, p2)
			-- upvalues: UseReactionCommitModuleResult (copy), Store (copy)
			UseReactionCommitModuleResult("pickerSelect", p2, p1)
			Store.setReactionPickerOpen(false)
		end, { Store, UseReactionCommitModuleResult })
		UseMemoResult = ReactModule.useMemo(function()
			-- upvalues: UseSignalStateResult1 (copy)
			return if UseSignalStateResult1 == nil then nil else { [UseSignalStateResult1] = true }
		end, { UseSignalStateResult1 })
	end
	local Element = ReactModule.createElement(RailItemModule, {
		animationRatio = Frame.animationRatio,
		isDisabled = Frame.isDisabled,
		onActivated = if IsUsePreferredInputModuleResultMatch then UseResult1 else v29,
		LayoutOrder = Frame.LayoutOrder,
		nativeRef = if FFlagMomentsUseSharedReactionsModule then UseRefResult1 else UseMomentGesturesModuleResult.ref,
		slot = ReactModule.createElement(View, { tag = "size-800-800" }, {
			Thumb = ReactModule.createElement(Icon, {
				name = ThumbUp,
				size = IconSize.Large,
				style = ReactModule.joinBindings({
					transition = UseAnimatedBindingResult,
					scrub = Frame.animationRatio
				}):map(function(p1)
					-- upvalues: GetColorStyleWithTransparencyModule (upval), UseTokensResult (copy)
					return GetColorStyleWithTransparencyModule(UseTokensResult.Color.Content.Emphasis, 1 - (1 - p1.transition) * (1 - p1.scrub))
				end),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5)
			}),
			Reacted = ReactModule.createElement(ReactionModule, {
				reactionType = UseSignalStateResult1_1,
				size = IconSize.Medium,
				imageStyle = ReactModule.joinBindings({
					transition = UseAnimatedBindingResult,
					scrub = Frame.animationRatio
				}):map(function(p1)
					-- upvalues: GetColorStyleWithTransparencyModule (upval), config (upval)
					return GetColorStyleWithTransparencyModule(config, 1 - p1.transition * (1 - p1.scrub))
				end),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5)
			})
		})
	})
	
	if FFlagMomentsUseSharedReactionsModule then
		assert(ReactionPickerPopoverModule ~= nil, "expected ReactionPickerPopover when FFlagMomentsUseSharedReactions is on")
		assert(UseRefResult1 ~= nil and UseResult3 ~= nil, "expected the shared picker hooks when FFlagMomentsUseSharedReactions is on")
		
		return ReactModule.createElement(ReactModule.Fragment, nil, {
			ReactButton = Element,
			Picker = ReactModule.createElement(ReactionPickerPopoverModule, {
				isOpen = UseSignalStateResult,
				anchorRef = UseRefResult1,
				onReactionSelected = UseResult3,
				onDismiss = UseResult,
				onOpen = if NoIsDisabled then UseResult2 else nil,
				onTap = if NoIsDisabled then UseResult1 else nil,
				reactions = Reactions,
				reactionSize = ReactionSize.Medium,
				selectedReactions = UseMemoResult,
				side = { offset = 8, position = PopoverSide.Top },
				align = PopoverAlign.End,
				backgroundStyle = UseTokensResult.Color.OverMedia.OverMedia_100
			})
		})
	else
		return ReactModule.createElement(Popover.Root, { isOpen = UseSignalStateResult }, {
			Anchor = ReactModule.createElement(Popover.Anchor, nil, { ReactButton = Element }),
			Content = ReactModule.createElement(Popover.Content, {
				hasArrow = false,
				side = { offset = 8, position = PopoverSide.Top },
				align = PopoverAlign.End,
				radius = Radius.Circle,
				backgroundStyle = UseTokensResult.Color.OverMedia.OverMedia_100,
				onPressedOutside = UseResult
			}, {
				ReactionPicker = ReactModule.createElement(ReactionPickerModule)
			})
		})
	end
end)