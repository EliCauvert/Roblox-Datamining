local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local appCompositionModule = require(parent.AppComposition)
local foundationModule = require(parent.Foundation)
local momentsCommonModule = require(parent.MomentsCommon)
local _ = require(parent.MomentsTypes)
local reactModule = require(parent.React)
local reactUtilsModule = require(parent.ReactUtils)
local sharedFlagsModule = require(parent.SharedFlags)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local text = foundationModule.Text
local view = foundationModule.View
local useCompositionLayout = appCompositionModule.useCompositionLayout
local useDeviceInsets = momentsCommonModule.Hooks.useDeviceInsets
local useTokens = foundationModule.Hooks.useTokens
local gradientBackdrop = momentsCommonModule.Components.GradientBackdrop
local momentLayoutModule = require(script.Parent.momentLayout)
local momentContextModule = require(script.Parent.MomentContext)
local momentImpressionMemoryModule = require(script.Parent.MomentImpressionMemory)
local useMomentsHost = require(moments.MomentsHostContext).useMomentsHost
local avatarActionBarModule = require(script.Parent.AvatarActionBar)
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
local fFlagMomentsFeedAboveNavBarModule = require(moments.Flags.FFlagMomentsFeedAboveNavBar)
local fFlagMomentsImmersiveChromeModule = require(moments.Flags.FFlagMomentsImmersiveChrome)
local getFFlagMomentsRenderPostAssetsModule = require(parent.MomentsCommon.GetFFlagMomentsRenderPostAssets)
local fFlagMomentsAvatarLookTryOn = require(parent.SharedFlags).FFlagMomentsAvatarLookTryOn
local getFFlagMomentsDisplayWakeLockModule = require(moments.Flags.GetFFlagMomentsDisplayWakeLock)
local fFlagMomentsFixOverlayRemountImpressionsModule = require(moments.Flags.FFlagMomentsFixOverlayRemountImpressions)
local useDisplayWakeLockModule = require(moments.Hooks.useDisplayWakeLock)
local useIsPlayingModule = require(moments.Hooks.useIsPlaying)
local useMomentsSession = require(moments.Stores.GetMomentsStore.MomentsSessionContext).useMomentsSession
local deriveMomentFromPostModule = require(moments.Utils.deriveMomentFromPost)
local momentsGetPostAssetStoreModule = require(parent.DataHydration.MomentsGetPostAssetStore)
local fFlagMomentsComments = sharedFlagsModule.FFlagMomentsComments
local var1 = if fFlagMomentsComments then require(script.Parent.VideoLift.VideoLiftContainer) else nil
local var2 = if fFlagMomentsComments then require(script.Parent.useCommentsChromeTransparency) else nil
local var3 = if fFlagMomentsComments then require(moments.Components.Comments.useCommentsEvents) else nil

local function DisplayWakeLockEffect()
	-- upvalues: useIsPlayingModule (ref), useDisplayWakeLockModule (ref)
	useDisplayWakeLockModule(useIsPlayingModule())
	
	return nil
end

local function OverlayInfoFrame(p1)
	-- upvalues: useTokens (ref), momentOverlayInsetContextModule (ref), fFlagMomentsFeedAboveNavBarModule (ref), reactModule (ref), view (ref)
	local var4 = useTokens()
	local var5 = momentOverlayInsetContextModule.useMomentOverlayInset()
	local horizontalPadding = p1.horizontalPadding
	local verticalPadding = p1.verticalPadding
	local safeAreaInsets = p1.safeAreaInsets
	local var6 = if fFlagMomentsFeedAboveNavBarModule then 0 else var5
	
	return reactModule.createElement(view, {
		tag = "col align-x-center align-y-bottom gap-large position-bottom-center anchor-bottom-center size-full-0 auto-y",
		testId = "--moments-info-frame-overlay",
		ZIndex = 2,
		padding = {
			top = UDim.new(0, verticalPadding),
			left = UDim.new(0, math.max(horizontalPadding, if safeAreaInsets ~= nil then 0 else safeAreaInsets.left)),
			right = UDim.new(0, math.max(horizontalPadding, if safeAreaInsets ~= nil then 0 else safeAreaInsets.right)),
			bottom = UDim.new(0, if var5 > 0 then var4.Padding.Medium + var6 else math.max(verticalPadding, if safeAreaInsets ~= nil then 0 else safeAreaInsets.bottom) + var6)
		},
		sizeConstraint = { MaxSize = p1.maxSize },
		onAbsoluteSizeChanged = p1.onAbsoluteSizeChanged
	}, p1.children)
end

return function(p1)
	-- upvalues: useTokens (ref), useCompositionLayout (ref), useDeviceInsets (ref), reactUtilsModule (ref), momentPushedFeedSafeAreaContextModule (ref), getFFlagMomentsRenderPostAssetsModule (ref), reactModule (ref), signalsModule (ref), momentsGetPostAssetStoreModule (ref), signalsReactModule (ref), deriveMomentFromPostModule (ref), fFlagMomentsAvatarLookTryOn (ref), useMomentsHost (ref), fFlagMomentsComments (ref), var1 (ref), var2 (ref), var3 (ref), useMomentsSession (ref), fFlagMomentsImmersiveChromeModule (ref), topContentModule (ref), scrubberModule (ref), avatarActionBarModule (ref), callToActionModule (ref), momentLayoutModule (ref), OverlayInfoFrame (ref), view (ref), momentContextModule (ref), text (ref), videoScrimModule (ref), momentGestureLayerModule (ref), gradientBackdrop (ref), playbackToggleIndicatorModule (ref), reactionExplosionLayerModule (ref), getFFlagMomentsDisplayWakeLockModule (ref), DisplayWakeLockEffect (ref), fFlagMomentsFixOverlayRemountImpressionsModule (ref), momentImpressionMemoryModule (ref), reactionEffectsContextModule (ref)
	local var4 = useTokens()
	local var5 = useCompositionLayout()
	local var6 = useDeviceInsets()
	local var7 = reactUtilsModule.createNextOrder()
	local var8 = momentPushedFeedSafeAreaContextModule.useMomentPushedFeedSafeArea()
	local var9 = if var8 ~= nil then var6 else var8
	local margin = var5.margin
	local moment = p1.moment
	local data = p1.data
	local var10 = nil
	local mediaSurface = p1.mediaSurface
	
	if getFFlagMomentsRenderPostAssetsModule() then
		local var11 = if p1.moment == nil or p1.moment.postAsset == nil then nil else p1.moment.postAsset.postAssetId
		local var12 = signalsReactModule.useSignalState(reactModule.useMemo(function()
			-- upvalues: signalsModule (copy), var11 (ref), momentsGetPostAssetStoreModule (copy)
			return signalsModule.createComputed(function(p2)
				-- upvalues: var11 (copy), momentsGetPostAssetStoreModule (copy)
				return if var11 == nil then nil else momentsGetPostAssetStoreModule(false).getCachedPostAsset(var11).data(p2)
			end)
		end, { var11 or false }))
		local var13 = reactModule.useMemo(function()
			-- upvalues: p1 (ref), var12 (ref), deriveMomentFromPostModule (copy)
			return if p1.moment == nil or var12 == nil then nil else deriveMomentFromPostModule(p1.moment, var12)
		end, { p1.moment, var12 or false })
		moment = var13 or p1.moment
		
		if moment ~= nil and p1.renderMediaSurface ~= nil then
			mediaSurface = p1.renderMediaSurface(moment)
		end
		data = reactModule.useMemo(function()
			-- upvalues: var13 (ref), p1 (ref), fFlagMomentsAvatarLookTryOn (copy)
			if var13 == nil then
				return p1.data
			end
			local cloned = table.clone(p1.data)
			cloned.description = var13.metadata.description or cloned.description
			
			if cloned.kind == "experience" then
				cloned.placeId = var13.metadata.placeId or cloned.placeId
				cloned.universeId = var13.metadata.universeId or cloned.universeId
				
				if fFlagMomentsAvatarLookTryOn then
					cloned.outfitId = var13.metadata.outfitId or cloned.outfitId
				end
				if var13.metadata.hasAuthoritativePartnerUploadType then
					cloned.isSponsored = var13.metadata.partnerUploadType == "influencer"
				end
			end
			return if if cloned.description == p1.data.description then cloned.kind == "experience" and (p1.data.kind == "experience" and (if cloned.placeId == p1.data.placeId then if cloned.universeId == p1.data.universeId then if cloned.isSponsored == p1.data.isSponsored then fFlagMomentsAvatarLookTryOn and cloned.outfitId ~= p1.data.outfitId else true else true else true)) else true then cloned else p1.data
		end, { p1.data, var12 or false })
		var10 = if data ~= p1.data then nil else `post:{var11}`
	end
	local var14 = false
	
	if fFlagMomentsAvatarLookTryOn then
		local var15 = if data.kind == "experience" then data.outfitId else nil
		var14 = useMomentsHost().openAvatarLookTryOn ~= nil and (var15 ~= nil and var15 > 0)
	end
	if fFlagMomentsComments and var1 ~= nil and mediaSurface ~= nil then
		mediaSurface = reactModule.createElement(var1, { feedItemId = data.feedItemId }, mediaSurface)
	end
	local var16 = if fFlagMomentsComments and var2 ~= nil then var2(data.feedItemId) else nil
	local var17 = if fFlagMomentsComments and var3 ~= nil then var3(if moment ~= nil then nil else moment.recommendationMetadata, useMomentsSession().getMomentsSessionId) else nil
	local var18, var19 = reactModule.useBinding(UDim2.fromScale(1, 0))
	local var20 = 2 * var4.Padding.XLarge
	local var21 = reactModule.useCallback(function(p2)
		-- upvalues: var19 (ref), var20 (ref)
		var19(UDim2.new(1, 0, 0, p2.AbsoluteSize.Y + var20))
	end, { var20 })
	local t = {
		TopContent = reactModule.createElement(topContentModule, {
			LayoutOrder = var7(),
			moment = moment,
			onOpenComments = var17
		}),
		Scrubber = reactModule.createElement(scrubberModule, { LayoutOrder = var7() }),
		CallToAction = reactModule.createElement(if var14 then avatarActionBarModule else callToActionModule, { LayoutOrder = var7() })
	}
	local BOTTOM_UI_MAX_SIZE = momentLayoutModule.BOTTOM_UI_MAX_SIZE
	local var22 = reactModule.createElement(momentContextModule.Provider, { data = data, dataVersion = var10 }, {
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
				Surface = if mediaSurface ~= nil then reactModule.createElement(view, { tag = "size-full bg-surface-100" }, {
					Label = reactModule.createElement(text, {
						tag = "size-full text-body-large text-align-x-center text-align-y-center content-emphasis",
						Text = "[ video ]"
					})
				}) else mediaSurface,
				Scrim = reactModule.createElement(videoScrimModule, { ZIndex = 2 }),
				GestureLayer = reactModule.createElement(momentGestureLayerModule, { ZIndex = 3 })
			}),
			Overlay = reactModule.createElement(view, {
				tag = "position-bottom-center anchor-bottom-center size-full-0 auto-y",
				testId = "--moments-item-overlay",
				ZIndex = 2,
				GroupTransparency = var16
			}, {
				Backdrop = reactModule.createElement(gradientBackdrop, {
					rotation = 270,
					color3 = var4.Color.Common.Scrim.Color3,
					size = var18
				}),
				InfoFrame = if fFlagMomentsImmersiveChromeModule then reactModule.createElement(OverlayInfoFrame, {
					horizontalPadding = margin,
					verticalPadding = var4.Padding.XLarge,
					safeAreaInsets = var9,
					maxSize = BOTTOM_UI_MAX_SIZE,
					onAbsoluteSizeChanged = var21
				}, t) elseif var9 ~= nil then reactModule.createElement(view, {
					tag = "col align-x-center align-y-bottom gap-large position-bottom-center anchor-bottom-center size-full-0 auto-y",
					testId = "--moments-info-frame-inset",
					ZIndex = 2,
					padding = {
						top = UDim.new(0, var4.Padding.XLarge),
						left = UDim.new(0, margin),
						right = UDim.new(0, margin),
						bottom = UDim.new(0, var4.Padding.XLarge)
					},
					sizeConstraint = { MaxSize = BOTTOM_UI_MAX_SIZE },
					onAbsoluteSizeChanged = var21
				}, t) else reactModule.createElement(view, {
					tag = "col align-x-center align-y-bottom gap-large position-bottom-center anchor-bottom-center size-full-0 auto-y",
					testId = "--moments-info-frame-inset",
					ZIndex = 2,
					padding = {
						top = UDim.new(0, var4.Padding.XLarge),
						left = UDim.new(0, math.max(margin, var9.left)),
						right = UDim.new(0, math.max(margin, var9.right)),
						bottom = UDim.new(0, math.max(var4.Padding.XLarge, var9.bottom))
					},
					sizeConstraint = { MaxSize = BOTTOM_UI_MAX_SIZE },
					onAbsoluteSizeChanged = var21
				}, t)
			}),
			PlaybackIndicator = reactModule.createElement(playbackToggleIndicatorModule),
			ReactionExplosionLayer = reactModule.createElement(reactionExplosionLayerModule)
		}),
		DisplayWakeLock = if getFFlagMomentsDisplayWakeLockModule() then reactModule.createElement(DisplayWakeLockEffect) else nil
	})
	
	if fFlagMomentsFixOverlayRemountImpressionsModule then
		var22 = reactModule.createElement(momentImpressionMemoryModule.Provider, nil, var22)
	end
	return reactModule.createElement(reactionEffectsContextModule.Provider, nil, var22)
end