local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local builderIconsModule = require(parent.BuilderIcons)
local foundationModule = require(parent.Foundation)
local momentsCommonModule = require(parent.MomentsCommon)
local reactModule = require(parent.React)
local reactOtterModule = require(parent.ReactOtter)
local getColorStyleWithTransparencyModule = require(moments.Utils.getColorStyleWithTransparency)
local icon = foundationModule.Icon
local text = foundationModule.Text
local view = foundationModule.View
local iconSize = foundationModule.Enums.IconSize
local useTokens = foundationModule.Hooks.useTokens
local reaction = momentsCommonModule.Components.Reaction
local reactionSize = momentsCommonModule.Enums.ReactionSize
local reactionType = momentsCommonModule.Enums.ReactionType
local t = { Transparency = 0, Color3 = Color3.new(1, 1, 1) }
local t_1 = { frequency = 5, dampingRatio = 0.5 }
local t_2 = { frequency = 6, dampingRatio = 1 }

return reactModule.memo(function(p1)
	-- upvalues: useTokens (ref), reactOtterModule (ref), reactModule (ref), t_1 (ref), t_2 (ref), getColorStyleWithTransparencyModule (ref), t (ref), view (ref), icon (ref), builderIconsModule (ref), iconSize (ref), reaction (ref), reactionType (ref), reactionSize (ref), text (ref)
	local var1 = useTokens()
	local commentId = `moments-comment-reaction-button-{p1.commentId}`
	local var2, var3 = reactOtterModule.useAnimatedBinding(if p1.isReactionSelected then 1 else 0)
	reactModule.useEffect(function()
		-- upvalues: var3 (ref), reactOtterModule (copy), p1 (ref), t_1 (copy), t_2 (copy)
		var3(reactOtterModule.spring(if p1.isReactionSelected then 1 else 0, if p1.isReactionSelected then t_1 else t_2))
	end, { p1.isReactionSelected })
	local small = var1.Padding.Small
	
	return reactModule.createElement(view, {
		tag = "auto-xy",
		LayoutOrder = p1.LayoutOrder,
		testId = `moments-comment-reaction-{p1.commentId}`
	}, {
		PaddedContent = reactModule.createElement(view, {
			tag = "auto-xy",
			padding = { right = UDim.new(0, small), bottom = UDim.new(0, small) }
		}, {
			Content = reactModule.createElement(view, {
				tag = "row align-y-center gap-xsmall auto-xy",
				testId = `moments-comment-reaction-content-{p1.commentId}`,
				GroupTransparency = if p1.isReactionDisabled then 0.5 else nil
			}, {
				IconSlot = reactModule.createElement(view, {
					tag = "size-500-500",
					LayoutOrder = 1,
					testId = `moments-comment-reaction-icon-slot-{p1.commentId}`
				}, {
					Thumb = reactModule.createElement(view, {
						tag = "position-center-center anchor-center-center size-full",
						scale = var2:map(function(p2)
							return math.lerp(1, 0.6, math.clamp(p2, 0, 1))
						end)
					}, {
						Icon = reactModule.createElement(icon, {
							name = builderIconsModule.Icon.ThumbUp,
							size = iconSize.Medium,
							style = var2:map(function(p2)
								-- upvalues: getColorStyleWithTransparencyModule (copy), var1 (ref)
								return getColorStyleWithTransparencyModule(var1.Color.Content.Emphasis, math.clamp(p2, 0, 1))
							end),
							AnchorPoint = Vector2.new(0.5, 0.5),
							Position = UDim2.fromScale(0.5, 0.5),
							testId = `{commentId}--icon`
						})
					}),
					Reacted = reactModule.createElement(reaction, {
						reactionType = reactionType.ThumbsUp,
						size = reactionSize.XSmall,
						imageStyle = var2:map(function(p2)
							-- upvalues: getColorStyleWithTransparencyModule (copy), t (copy)
							return getColorStyleWithTransparencyModule(t, 1 - math.clamp(p2, 0, 1))
						end),
						scale = var2:map(function(p2)
							return math.lerp(0.6, 1, p2)
						end),
						AnchorPoint = Vector2.new(0.5, 0.5),
						Position = UDim2.fromScale(0.5, 0.5),
						testId = `{commentId}--image`
					})
				}),
				Count = reactModule.createElement(text, {
					tag = "auto-xy text-title-small content-emphasis",
					LayoutOrder = 2,
					Text = p1.reactionCountLabel,
					testId = `moments-comment-reaction-count-{p1.commentId}`
				})
			})
		}),
		HitArea = reactModule.createElement(view, {
			tag = "radius-medium",
			ZIndex = 2,
			Position = UDim2.fromOffset(-small, -small),
			Size = UDim2.new(1, small, 1, small),
			cursor = reactModule.useMemo(function()
				-- upvalues: var1 (ref)
				return {
					offset = 0,
					radius = UDim.new(0, var1.Radius.Medium),
					borderWidth = var1.Stroke.Thicker
				}
			end, { var1 }),
			isDisabled = p1.isReactionDisabled,
			onActivated = if p1.isReactionDisabled then nil else p1.onReactionActivated,
			selection = { Selectable = not p1.isReactionDisabled },
			testId = commentId
		})
	})
end)