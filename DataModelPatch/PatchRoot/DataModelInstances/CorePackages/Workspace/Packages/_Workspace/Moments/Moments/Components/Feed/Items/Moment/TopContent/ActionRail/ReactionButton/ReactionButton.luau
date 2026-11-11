local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local FoundationModule = require(Parent.Foundation)
local MomentsCommonModule = require(Parent.MomentsCommon)
local ReactModule = require(Parent.React)
local ReactOtterModule = require(Parent.ReactOtter)
local Icon = FoundationModule.Icon
local View = FoundationModule.View
local Popover = FoundationModule.Popover
local IconSize = FoundationModule.Enums.IconSize
local PopoverAlign = FoundationModule.Enums.PopoverAlign
local PopoverSide = FoundationModule.Enums.PopoverSide
local Radius = FoundationModule.Enums.Radius
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local Reaction = MomentsCommonModule.Components.Reaction
local ReactionType = MomentsCommonModule.Enums.ReactionType
local RailItemModule = require(script.Parent.Parent.RailItem)
local ReactionPickerModule = require(script.Parent.ReactionPicker)
local MomentContextModule = require(script.Parent.Parent.Parent.Parent.MomentContext)
local UseReactionCommitModule = require(script.Parent.Parent.Parent.Parent.Reactions.useReactionCommit)
local UseMomentGesturesModule = require(script.Parent.Parent.Parent.Parent.Reactions.useMomentGestures)
local GetColorStyleWithTransparencyModule = require(Moments.Utils.getColorStyleWithTransparency)
local UsePreferredInputModule = require(Moments.Hooks.usePreferredInput)
local ThumbUp = require(Parent.BuilderIcons).Icon.ThumbUp
local config = { Transparency = 0, Color3 = Color3.new(1, 1, 1) }

local function v24() end

return ReactModule.memo(function(Frame)
	-- upvalues: UseTokensFunction (copy), UsePreferredInputModule (copy), MomentContextModule (copy), UseReactionCommitModule (copy), UseSignalStateFunction (copy), ReactModule (copy), ReactOtterModule (copy), ReactionType (copy), UseMomentGesturesModule (copy), GetColorStyleWithTransparencyModule (copy), config (copy), Popover (copy), RailItemModule (copy), v24 (copy), View (copy), Icon (copy), ThumbUp (copy), IconSize (copy), Reaction (copy), PopoverSide (copy), PopoverAlign (copy), Radius (copy), ReactionPickerModule (copy)
	local UseTokensResult = UseTokensFunction()
	local IsUsePreferredInputModuleResultMatch = UsePreferredInputModule() == Enum.PreferredInput.Gamepad
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
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: Store (copy), UseReactionCommitModuleResult (copy)
		if Store.getIsReacted(false) then
			UseReactionCommitModuleResult("tapButton", nil, nil)
		end
		Store.setReactionPickerOpen(true)
	end, { Store, UseReactionCommitModuleResult })
	
	return ReactModule.createElement(Popover.Root, { isOpen = UseSignalStateResult }, {
		Anchor = ReactModule.createElement(Popover.Anchor, nil, {
			ReactButton = ReactModule.createElement(RailItemModule, {
				animationRatio = Frame.animationRatio,
				isDisabled = Frame.isDisabled,
				onActivated = if IsUsePreferredInputModuleResultMatch then UseResult1 else v24,
				LayoutOrder = Frame.LayoutOrder,
				nativeRef = UseMomentGesturesModule(not IsUsePreferredInputModuleResultMatch and not Frame.isDisabled, { onTap = UseResult1 }).ref,
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
					Reacted = ReactModule.createElement(Reaction, {
						reactionType = UseSignalStateResult1 or UseRefResult.current,
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
		}),
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
end)