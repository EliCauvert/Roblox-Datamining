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

local function OverlayInfoFrame(p0) --[[ line: 99 ]]
	-- upvalues: useTokens (ref), momentOverlayInsetContextModule (ref), fFlagMomentsUseCompositionLibraryModule (ref), reactModule (ref), view (ref)
	local var22 = useTokens()
	local var23 = momentOverlayInsetContextModule.useMomentOverlayInset()
	local horizontalPadding = p0.horizontalPadding
	local verticalPadding = p0.verticalPadding
	local safeAreaInsets = p0.safeAreaInsets
	
	return reactModule.createElement(view, {
		tag = "col align-x-center align-y-bottom gap-large position-bottom-center anchor-bottom-center size-full-0 auto-y",
		testId = "--moments-info-frame-overlay",
		ZIndex = 2,
		padding = {
			top = UDim.new(0, verticalPadding),
			left = UDim.new(0, math.max(horizontalPadding, if safeAreaInsets ~= nil then 0 else safeAreaInsets.left)),
			right = UDim.new(0, math.max(horizontalPadding, if safeAreaInsets ~= nil then 0 else safeAreaInsets.right)),
			bottom = UDim.new(0, if fFlagMomentsUseCompositionLibraryModule and var23 > 0 then var22.Padding.Medium + var23 else math.max(verticalPadding, if safeAreaInsets ~= nil then 0 else safeAreaInsets.bottom) + var23)
		},
		sizeConstraint = { MaxSize = p0.maxSize },
		onAbsoluteSizeChanged = p0.onAbsoluteSizeChanged
	}, p0.children)
end

return function(p1) --[[ line: 137 | named "MomentItem" ]]
	-- upvalues: useTokens (ref), fFlagMomentsUseCompositionLibraryModule (ref), useCompositionLayout (ref), useDeviceInsets (ref), useFormFactor (ref), reactUtilsModule (ref), momentPushedFeedSafeAreaContextModule (ref), getFFlagMomentsPushedFeedSafeAreaModule (ref), fFlagMomentsImmersiveChromeModule (ref), reactModule (ref), topContentModule (ref), scrubberModule (ref), callToActionModule (ref), momentLayoutModule (ref), formFactor (ref), OverlayInfoFrame (ref), view (ref), momentContextModule (ref), text (ref), videoScrimModule (ref), momentGestureLayerModule (ref), gradientBackdrop (ref), playbackToggleIndicatorModule (ref), reactionExplosionLayerModule (ref), reactionEffectsContextModule (ref)
	local var24 = useTokens()
	local var25 = nil
	local var26 = nil
	
	if fFlagMomentsUseCompositionLibraryModule then
		var25 = useCompositionLayout()
		var26 = useDeviceInsets()
	end
	local var27 = if not fFlagMomentsUseCompositionLibraryModule then useFormFactor() else nil
	local var28 = reactUtilsModule.createNextOrder()
	local var29 = momentPushedFeedSafeAreaContextModule.useMomentPushedFeedSafeArea()
	local var30 = if getFFlagMomentsPushedFeedSafeAreaModule() and var29 ~= nil then var29 else var26
	local var31 = if var25 ~= nil then var24.Padding.XLarge else var25.margin
	local var32, var33 = reactModule.useBinding(UDim2.fromScale(1, 0))
	local var34 = 2 * var24.Padding.XLarge
	local var35 = reactModule.useCallback(function(p2) --[[ line: 167 ]]
		-- upvalues: var33 (ref), var34 (ref)
		var33(UDim2.new(1, 0, 0, p2.AbsoluteSize.Y + var34))
	end, { var34 })
	local t = {
		TopContent = reactModule.createElement(topContentModule, { LayoutOrder = var28(), moment = p1.moment }),
		Scrubber = reactModule.createElement(scrubberModule, { LayoutOrder = var28() }),
		CallToAction = reactModule.createElement(callToActionModule, { LayoutOrder = var28() })
	}
	local var37 = if fFlagMomentsUseCompositionLibraryModule then momentLayoutModule.BOTTOM_UI_MAX_SIZE elseif var27 ~= formFactor.Wide then momentLayoutModule.BOTTOM_UI_MAX_SIZE else nil
	
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
					color3 = var24.Color.Common.Scrim.Color3,
					size = var32
				}),
				InfoFrame = if fFlagMomentsImmersiveChromeModule then reactModule.createElement(OverlayInfoFrame, {
					horizontalPadding = var31,
					verticalPadding = var24.Padding.XLarge,
					safeAreaInsets = var30,
					maxSize = var37,
					onAbsoluteSizeChanged = var35
				}, t) elseif var30 ~= nil then reactModule.createElement(view, {
					tag = "col align-x-center align-y-bottom gap-large position-bottom-center anchor-bottom-center size-full-0 auto-y",
					testId = "--moments-info-frame-inset",
					ZIndex = 2,
					padding = {
						top = UDim.new(0, var24.Padding.XLarge),
						left = UDim.new(0, var31),
						right = UDim.new(0, var31),
						bottom = UDim.new(0, var24.Padding.XLarge)
					},
					sizeConstraint = { MaxSize = var37 },
					onAbsoluteSizeChanged = var35
				}, t) else reactModule.createElement(view, {
					tag = "col align-x-center align-y-bottom gap-large position-bottom-center anchor-bottom-center size-full-0 auto-y",
					testId = "--moments-info-frame-inset",
					ZIndex = 2,
					padding = {
						top = UDim.new(0, var24.Padding.XLarge),
						left = UDim.new(0, math.max(var31, var30.left)),
						right = UDim.new(0, math.max(var31, var30.right)),
						bottom = UDim.new(0, math.max(var24.Padding.XLarge, var30.bottom))
					},
					sizeConstraint = { MaxSize = var37 },
					onAbsoluteSizeChanged = var35
				}, t)
			}),
			PlaybackIndicator = reactModule.createElement(playbackToggleIndicatorModule),
			ReactionExplosionLayer = reactModule.createElement(reactionExplosionLayerModule)
		})
	}))
end