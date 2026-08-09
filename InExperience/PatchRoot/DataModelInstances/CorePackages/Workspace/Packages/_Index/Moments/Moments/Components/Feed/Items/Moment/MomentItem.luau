local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local foundationModule = require(parent.Foundation)
local momentsCommonModule = require(parent.MomentsCommon)
local _ = require(parent.MomentsTypes)
local reactModule = require(parent.React)
local reactUtilsModule = require(parent.ReactUtils)
local text = foundationModule.Text
local view = foundationModule.View
local useFormFactor = momentsCommonModule.Hooks.useFormFactor
local useTokens = foundationModule.Hooks.useTokens
local formFactor = momentsCommonModule.Enums.FormFactor
local gradientBackdrop = momentsCommonModule.Components.GradientBackdrop
local momentLayoutModule = require(script.Parent.momentLayout)
local momentContextModule = require(script.Parent.MomentContext)
local callToActionModule = require(script.Parent.CallToAction)
local scrubberModule = require(script.Parent.Scrubber)
local topContentModule = require(script.Parent.TopContent)
local videoScrimModule = require(script.Parent.VideoScrim)
local playbackToggleIndicatorModule = require(script.Parent.PlaybackToggleIndicator)
local momentOverlayInsetContextModule = require(script.Parent.MomentOverlayInsetContext)
local reactionEffectsContextModule = require(script.Parent.Reactions.ReactionEffectsContext)
local momentGestureLayerModule = require(script.Parent.Reactions.MomentGestureLayer)
local reactionExplosionLayerModule = require(script.Parent.Reactions.ReactionExplosionLayer)
local useChromeRatioModule = require(moments.Hooks.useChromeRatio)
local getFFlagMomentsImmersiveChromeModule = require(moments.Flags.GetFFlagMomentsImmersiveChrome)
local getFFlagMomentsImmersiveResizeViewportModule = require(moments.Flags.GetFFlagMomentsImmersiveResizeViewport)

local function OverlayInfoFrame(p0) --[[ line: 93 ]]
	-- upvalues: momentOverlayInsetContextModule (ref), useChromeRatioModule (ref), reactModule (ref), view (ref)
	local var20 = momentOverlayInsetContextModule.useMomentOverlayInset()
	local inlinePadding = p0.inlinePadding
	
	return reactModule.createElement(view, {
		tag = "col align-x-center align-y-bottom gap-large position-bottom-center anchor-bottom-center size-full-0 auto-y",
		ZIndex = 2,
		padding = {
			top = UDim.new(0, inlinePadding),
			left = UDim.new(0, inlinePadding),
			right = UDim.new(0, inlinePadding),
			bottom = useChromeRatioModule():map(function(p1) --[[ line: 104 ]]
				-- upvalues: inlinePadding (ref), var20 (ref)
				return UDim.new(0, inlinePadding + math.round(var20 * p1))
			end)
		},
		sizeConstraint = { MaxSize = p0.maxSize },
		onAbsoluteSizeChanged = p0.onAbsoluteSizeChanged
	}, p0.children)
end

return function(p2) --[[ line: 119 | named "MomentItem" ]]
	-- upvalues: useTokens (ref), useFormFactor (ref), reactUtilsModule (ref), getFFlagMomentsImmersiveChromeModule (ref), getFFlagMomentsImmersiveResizeViewportModule (ref), reactModule (ref), topContentModule (ref), scrubberModule (ref), callToActionModule (ref), formFactor (ref), momentLayoutModule (ref), OverlayInfoFrame (ref), view (ref), momentContextModule (ref), text (ref), videoScrimModule (ref), momentGestureLayerModule (ref), gradientBackdrop (ref), playbackToggleIndicatorModule (ref), reactionExplosionLayerModule (ref), reactionEffectsContextModule (ref)
	local var21 = useTokens()
	local var22 = useFormFactor()
	local var23 = reactUtilsModule.createNextOrder()
	local var24 = getFFlagMomentsImmersiveChromeModule() and not getFFlagMomentsImmersiveResizeViewportModule()
	local var25, var26 = reactModule.useBinding(UDim2.fromScale(1, 0))
	local var27 = 2 * var21.Padding.XLarge
	local var28 = reactModule.useCallback(function(p3) --[[ line: 135 ]]
		-- upvalues: var26 (ref), var27 (ref)
		var26(UDim2.new(1, 0, 0, p3.AbsoluteSize.Y + var27))
	end, { var27 })
	local t = {
		TopContent = reactModule.createElement(topContentModule, { LayoutOrder = var23(), moment = p2.moment }),
		Scrubber = reactModule.createElement(scrubberModule, { LayoutOrder = var23() }),
		CallToAction = reactModule.createElement(callToActionModule, { LayoutOrder = var23() })
	}
	local var30 = if var22 ~= formFactor.Wide then momentLayoutModule.BOTTOM_UI_MAX_SIZE else nil
	
	return reactModule.createElement(reactionEffectsContextModule.Provider, nil, reactModule.createElement(momentContextModule.Provider, { data = p2.data }, {
		Root = reactModule.createElement(view, {
			tag = "size-full clip bg-surface-0",
			LayoutOrder = p2.layoutOrder
		}, {
			Video = reactModule.createElement(view, { tag = "size-full", ZIndex = 1 }, {
				Surface = if p2.mediaSurface ~= nil then reactModule.createElement(view, { tag = "size-full bg-surface-100" }, {
					Label = reactModule.createElement(text, {
						tag = "size-full text-body-large text-align-x-center text-align-y-center content-emphasis",
						Text = "[ video ]"
					})
				}) else p2.mediaSurface,
				Scrim = reactModule.createElement(videoScrimModule, { ZIndex = 2 }),
				GestureLayer = reactModule.createElement(momentGestureLayerModule, { ZIndex = 3 })
			}),
			Overlay = reactModule.createElement(view, {
				tag = "position-bottom-center anchor-bottom-center size-full-0 auto-y",
				ZIndex = 2
			}, {
				Backdrop = reactModule.createElement(gradientBackdrop, {
					rotation = 270,
					color3 = var21.Color.Common.Scrim.Color3,
					size = var25
				}),
				InfoFrame = if var24 then reactModule.createElement(OverlayInfoFrame, {
					inlinePadding = var21.Padding.XLarge,
					maxSize = var30,
					onAbsoluteSizeChanged = var28
				}, t) else reactModule.createElement(view, {
					tag = "col align-x-center align-y-bottom gap-large position-bottom-center anchor-bottom-center size-full-0 auto-y padding-xlarge",
					ZIndex = 2,
					sizeConstraint = { MaxSize = var30 },
					onAbsoluteSizeChanged = var28
				}, t)
			}),
			PlaybackIndicator = reactModule.createElement(playbackToggleIndicatorModule),
			ReactionExplosionLayer = reactModule.createElement(reactionExplosionLayerModule)
		})
	}))
end