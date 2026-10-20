local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local BuilderIconsModule = require(Parent.BuilderIcons)
local FoundationModule = require(Parent.Foundation)
local MomentsCommonModule = require(Parent.MomentsCommon)
local ReactModule = require(Parent.React)
local ReactOtterModule = require(Parent.ReactOtter)
local FFlagMomentsCommentRowRedesignModule = require(Moments.Flags.FFlagMomentsCommentRowRedesign)
local GetColorStyleWithTransparencyModule = require(Moments.Utils.getColorStyleWithTransparency)
local Icon = FoundationModule.Icon
local Text = FoundationModule.Text
local View = FoundationModule.View
local IconSize = FoundationModule.Enums.IconSize
local UseTokensFunction = FoundationModule.Hooks.useTokens
local Reaction = MomentsCommonModule.Components.Reaction
local ReactionAssets = MomentsCommonModule.Components.ReactionAssets
local ReactionSize = MomentsCommonModule.Enums.ReactionSize
local ReactionType = MomentsCommonModule.Enums.ReactionType
local config = { Transparency = 0, Color3 = Color3.new(1, 1, 1) }
local config1 = { frequency = 5, dampingRatio = 0.5 }
local config2 = { frequency = 6, dampingRatio = 1 }

return ReactModule.memo(function(Frame)
	-- upvalues: UseTokensFunction (copy), ReactOtterModule (copy), ReactModule (copy), config1 (copy), config2 (copy), FFlagMomentsCommentRowRedesignModule (copy), GetColorStyleWithTransparencyModule (copy), config (copy), ReactionAssets (copy), ReactionSize (copy), View (copy), Icon (copy), BuilderIconsModule (copy), IconSize (copy), Reaction (copy), ReactionType (copy), Text (copy)
	local UseTokensResult = UseTokensFunction()
	local ReactionName: string = `moments-comment-reaction-button-{Frame.commentId}`
	local UseAnimatedBindingResult, UseAnimatedBindingResult2 = ReactOtterModule.useAnimatedBinding(if Frame.isReactionSelected then 1 else 0)
	local UseRefResult = ReactModule.useRef({
		commentId = Frame.commentId,
		isReactionSelected = Frame.isReactionSelected
	})
	ReactModule.useLayoutEffect(function()
		-- upvalues: UseRefResult (copy), Frame (copy), UseAnimatedBindingResult2 (copy), ReactOtterModule (upval), config1 (upval), config2 (upval)
		local Current = UseRefResult.current
		UseRefResult.current = {
			commentId = Frame.commentId,
			isReactionSelected = Frame.isReactionSelected
		}
		local v1: number = if Frame.isReactionSelected then 1 else 0
		
		if Current.commentId ~= Frame.commentId then
			UseAnimatedBindingResult2((ReactOtterModule.instant(v1)))
			
			return
		end
		if Current.isReactionSelected ~= Frame.isReactionSelected then
			UseAnimatedBindingResult2(ReactOtterModule.spring(v1, if Frame.isReactionSelected then config1 else config2))
		end
	end, { Frame.commentId, Frame.isReactionSelected })
	local Emphasis = if FFlagMomentsCommentRowRedesignModule then UseTokensResult.Color.Content.Emphasis else UseTokensResult.Color.Content.Default
	local SizeRatio = if FFlagMomentsCommentRowRedesignModule then UseTokensResult.Size.Size_400 / ReactionAssets.getSizePixels(ReactionSize.XSmall) else 1
	local Small = UseTokensResult.Padding.Small
	local SmallDelta = if FFlagMomentsCommentRowRedesignModule then Small - (UseTokensResult.Size.Size_600 - UseTokensResult.Size.Size_400) / 2 else Small
	
	return ReactModule.createElement(View, {
		tag = {
			["size-0-600 auto-x"] = FFlagMomentsCommentRowRedesignModule,
			["auto-xy"] = not FFlagMomentsCommentRowRedesignModule
		},
		LayoutOrder = Frame.LayoutOrder,
		testId = `moments-comment-reaction-{Frame.commentId}`
	}, {
		PaddedContent = ReactModule.createElement(View, {
			tag = "auto-xy",
			AnchorPoint = if FFlagMomentsCommentRowRedesignModule then Vector2.new(0, 0.5) else nil,
			Position = if FFlagMomentsCommentRowRedesignModule then UDim2.new(0, 0, 0.5, -1) else nil,
			padding = {
				right = UDim.new(0, Small),
				bottom = if FFlagMomentsCommentRowRedesignModule then nil else UDim.new(0, Small)
			}
		}, {
			Content = ReactModule.createElement(View, {
				tag = "row align-y-center gap-xsmall auto-xy",
				testId = `moments-comment-reaction-content-{Frame.commentId}`,
				GroupTransparency = if Frame.isReactionDisabled then 0.5 else nil
			}, {
				IconSlot = ReactModule.createElement(View, {
					LayoutOrder = 1,
					tag = {
						["size-400-400"] = FFlagMomentsCommentRowRedesignModule,
						["size-500-500"] = not FFlagMomentsCommentRowRedesignModule
					},
					testId = `moments-comment-reaction-icon-slot-{Frame.commentId}`
				}, {
					Thumb = ReactModule.createElement(View, {
						tag = "position-center-center anchor-center-center size-full",
						scale = UseAnimatedBindingResult:map(function(Value: number): number
							return (math.lerp(1, 0.6, (math.clamp(Value, 0, 1))))
						end)
					}, {
						Icon = ReactModule.createElement(Icon, {
							name = BuilderIconsModule.Icon.ThumbUp,
							size = if FFlagMomentsCommentRowRedesignModule then IconSize.Small else IconSize.Medium,
							style = UseAnimatedBindingResult:map(function(Value: number)
								-- upvalues: GetColorStyleWithTransparencyModule (upval), Emphasis (copy)
								return GetColorStyleWithTransparencyModule(Emphasis, (math.clamp(Value, 0, 1)))
							end),
							AnchorPoint = Vector2.new(0.5, 0.5),
							Position = UDim2.fromScale(0.5, 0.5),
							testId = `{ReactionName}--icon`
						})
					}),
					Reacted = ReactModule.createElement(Reaction, {
						reactionType = ReactionType.ThumbsUp,
						size = ReactionSize.XSmall,
						imageStyle = UseAnimatedBindingResult:map(function(Value: number)
							-- upvalues: GetColorStyleWithTransparencyModule (upval), config (upval)
							return GetColorStyleWithTransparencyModule(config, 1 - math.clamp(Value, 0, 1))
						end),
						scale = UseAnimatedBindingResult:map(function(Alpha: number)
							-- upvalues: SizeRatio (copy)
							return math.lerp(0.6, 1, Alpha) * SizeRatio
						end),
						AnchorPoint = Vector2.new(0.5, 0.5),
						Position = UDim2.fromScale(0.5, 0.5),
						testId = `{ReactionName}--image`
					})
				}),
				Count = if Frame.isReactionCountHidden then nil else ReactModule.createElement(Text, {
					LayoutOrder = 2,
					tag = {
						["auto-xy"] = true,
						["text-label-small content-emphasis"] = FFlagMomentsCommentRowRedesignModule,
						["text-title-small content-emphasis"] = not FFlagMomentsCommentRowRedesignModule and Frame.isReactionSelected,
						["text-body-small content-default"] = not FFlagMomentsCommentRowRedesignModule and not Frame.isReactionSelected
					},
					Text = Frame.reactionCountLabel,
					testId = `moments-comment-reaction-count-{Frame.commentId}`
				})
			})
		}),
		HitArea = ReactModule.createElement(View, {
			tag = "radius-medium",
			ZIndex = 2,
			Position = UDim2.fromOffset(-Small, -SmallDelta),
			Size = if FFlagMomentsCommentRowRedesignModule then UDim2.new(1, Small, 1, 2 * SmallDelta) else UDim2.new(1, Small, 1, Small),
			cursor = ReactModule.useMemo(function()
				-- upvalues: UseTokensResult (copy)
				return {
					offset = 0,
					radius = UDim.new(0, UseTokensResult.Radius.Medium),
					borderWidth = UseTokensResult.Stroke.Thicker
				}
			end, { UseTokensResult }),
			isDisabled = Frame.isReactionDisabled,
			onActivated = if Frame.isReactionDisabled then nil else Frame.onReactionActivated,
			selection = { Selectable = not Frame.isReactionDisabled },
			testId = ReactionName
		})
	})
end)