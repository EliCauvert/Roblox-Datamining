local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local appCompositionModule = require(parent.AppComposition)
local foundationModule = require(parent.Foundation)
local momentsCommonModule = require(parent.MomentsCommon)
local _ = require(parent.MomentsTypes)
local reactModule = require(parent.React)
local reactUtilsModule = require(parent.ReactUtils)
local text = foundationModule.Text
local view = foundationModule.View
local useCompositionLayout = appCompositionModule.useCompositionLayout
local useDeviceInsets = momentsCommonModule.Hooks.useDeviceInsets
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
local momentPushedFeedSafeAreaContextModule = require(script.Parent.MomentPushedFeedSafeAreaContext)
local reactionEffectsContextModule = require(script.Parent.Reactions.ReactionEffectsContext)
local momentGestureLayerModule = require(script.Parent.Reactions.MomentGestureLayer)
local reactionExplosionLayerModule = require(script.Parent.Reactions.ReactionExplosionLayer)
local fFlagMomentsImmersiveChromeModule = require(moments.Flags.FFlagMomentsImmersiveChrome)
local fFlagMomentsUseCompositionLibraryModule = require(moments.Flags.FFlagMomentsUseCompositionLibrary)
local getFFlagMomentsPushedFeedSafeAreaModule = require(moments.Flags.GetFFlagMomentsPushedFeedSafeArea)

local function OverlayInfoFrame(p1)
	-- upvalues: useTokens (ref), momentOverlayInsetContextModule (ref), fFlagMomentsUseCompositionLibraryModule (ref), reactModule (ref), view (ref)
	local var1 = useTokens()
	local var2 = momentOverlayInsetContextModule.useMomentOverlayInset()
	local horizontalPadding = p1.horizontalPadding
	local verticalPadding = p1.verticalPadding
	local safeAreaInsets = p1.safeAreaInsets
	
	return reactModule.createElement(view, {
		tag = "col align-x-center align-y-bottom gap-large position-bottom-center anchor-bottom-center size-full-0 auto-y",
		testId = "--moments-info-frame-overlay",
		ZIndex = 2,
		padding = {
			top = UDim.new(0, verticalPadding),
			left = UDim.new(0, math.max(horizontalPadding, if safeAreaInsets ~= nil then 0 else safeAreaInsets.left)),
			right = UDim.new(0, math.max(horizontalPadding, if safeAreaInsets ~= nil then 0 else safeAreaInsets.right)),
			bottom = UDim.new(0, if fFlagMomentsUseCompositionLibraryModule and var2 > 0 then var1.Padding.Medium + var2 else math.max(verticalPadding, if safeAreaInsets ~= nil then 0 else safeAreaInsets.bottom) + var2)
		},
		sizeConstraint = { MaxSize = p1.maxSize },
		onAbsoluteSizeChanged = p1.onAbsoluteSizeChanged
	}, p1.children)
end

return function(p1)
	-- upvalues: useTokens (ref), fFlagMomentsUseCompositionLibraryModule (ref), useCompositionLayout (ref), useDeviceInsets (ref), useFormFactor (ref), reactUtilsModule (ref), momentPushedFeedSafeAreaContextModule (ref), getFFlagMomentsPushedFeedSafeAreaModule (ref), fFlagMomentsImmersiveChromeModule (ref), reactModule (ref), topContentModule (ref), scrubberModule (ref), callToActionModule (ref), momentLayoutModule (ref), formFactor (ref), OverlayInfoFrame (ref), view (ref), momentContextModule (ref), text (ref), videoScrimModule (ref), momentGestureLayerModule (ref), gradientBackdrop (ref), playbackToggleIndicatorModule (ref), reactionExplosionLayerModule (ref), reactionEffectsContextModule (ref)
	local var1 = useTokens()
	local var2 = nil
	local var3 = nil
	
	if fFlagMomentsUseCompositionLibraryModule then
		var2 = useCompositionLayout()
		var3 = useDeviceInsets()
	end
	local var4 = if not fFlagMomentsUseCompositionLibraryModule then useFormFactor() else nil
	local var5 = reactUtilsModule.createNextOrder()
	local var6 = momentPushedFeedSafeAreaContextModule.useMomentPushedFeedSafeArea()
	local var7 = if getFFlagMomentsPushedFeedSafeAreaModule() and var6 ~= nil then var6 else var3
	local var8 = if var2 ~= nil then var1.Padding.XLarge else var2.margin
	local var9, var10 = reactModule.useBinding(UDim2.fromScale(1, 0))
	local var11 = 2 * var1.Padding.XLarge
	local var12 = reactModule.useCallback(function(p2)
		-- upvalues: var10 (ref), var11 (ref)
		var10(UDim2.new(1, 0, 0, p2.AbsoluteSize.Y + var11))
	end, { var11 })
	local t = {
		TopContent = reactModule.createElement(topContentModule, { LayoutOrder = var5(), moment = p1.moment }),
		Scrubber = reactModule.createElement(scrubberModule, { LayoutOrder = var5() }),
		CallToAction = reactModule.createElement(callToActionModule, { LayoutOrder = var5() })
	}
	local var13 = if fFlagMomentsUseCompositionLibraryModule then momentLayoutModule.BOTTOM_UI_MAX_SIZE elseif var4 ~= formFactor.Wide then momentLayoutModule.BOTTOM_UI_MAX_SIZE else nil
	
	return reactModule.createElement(reactionEffectsContextModule.Provider, nil, reactModule.createElement(momentContextModule.Provider, { data = p1.data }, {
		Root = reactModule.createElement(view, {
			tag = "size-full clip bg-surface-0",
			testId = "--moments-item-root",
			LayoutOrder = p1.layoutOrder
		}, {
			Video = reactModule.createElement(view, {
				tag = "size-full",
				testId = "--moments-item-video",
				ZIndex = 1
			}, {
				Surface = if p1.mediaSurface ~= nil then reactModule.createElement(view, { tag = "size-full bg-surface-100" }, {
					Label = reactModule.createElement(text, {
						tag = "size-full text-body-large text-align-x-center text-align-y-center content-emphasis",
						Text = "[ video ]"
					})
				}) else p1.mediaSurface,
				Scrim = reactModule.createElement(videoScrimModule, { ZIndex = 2 }),
				GestureLayer = reactModule.createElement(momentGestureLayerModule, { ZIndex = 3 })
			}),
			Overlay = reactModule.createElement(view, {
				tag = "position-bottom-center anchor-bottom-center size-full-0 auto-y",
				testId = "--moments-item-overlay",
				ZIndex = 2
			}, {
				Backdrop = reactModule.createElement(gradientBackdrop, {
					rotation = 270,
					color3 = var1.Color.Common.Scrim.Color3,
					size = var9
				}),
				InfoFrame = if fFlagMomentsImmersiveChromeModule then reactModule.createElement(OverlayInfoFrame, {
					horizontalPadding = var8,
					verticalPadding = var1.Padding.XLarge,
					safeAreaInsets = var7,
					maxSize = var13,
					onAbsoluteSizeChanged = var12
				}, t) elseif var7 ~= nil then reactModule.createElement(view, {
					tag = "col align-x-center align-y-bottom gap-large position-bottom-center anchor-bottom-center size-full-0 auto-y",
					testId = "--moments-info-frame-inset",
					ZIndex = 2,
					padding = {
						top = UDim.new(0, var1.Padding.XLarge),
						left = UDim.new(0, var8),
						right = UDim.new(0, var8),
						bottom = UDim.new(0, var1.Padding.XLarge)
					},
					sizeConstraint = { MaxSize = var13 },
					onAbsoluteSizeChanged = var12
				}, t) else reactModule.createElement(view, {
					tag = "col align-x-center align-y-bottom gap-large position-bottom-center anchor-bottom-center size-full-0 auto-y",
					testId = "--moments-info-frame-inset",
					ZIndex = 2,
					padding = {
						top = UDim.new(0, var1.Padding.XLarge),
						left = UDim.new(0, math.max(var8, var7.left)),
						right = UDim.new(0, math.max(var8, var7.right)),
						bottom = UDim.new(0, math.max(var1.Padding.XLarge, var7.bottom))
					},
					sizeConstraint = { MaxSize = var13 },
					onAbsoluteSizeChanged = var12
				}, t)
			}),
			PlaybackIndicator = reactModule.createElement(playbackToggleIndicatorModule),
			ReactionExplosionLayer = reactModule.createElement(reactionExplosionLayerModule)
		})
	}))
end