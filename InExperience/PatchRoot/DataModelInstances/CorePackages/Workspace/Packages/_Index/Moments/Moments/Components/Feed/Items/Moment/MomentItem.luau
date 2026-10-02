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
local getFFlagMomentsRenderPostAssetsModule = require(parent.MomentsCommon.GetFFlagMomentsRenderPostAssets)
local getFFlagMomentsDisplayWakeLockModule = require(moments.Flags.GetFFlagMomentsDisplayWakeLock)
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
	-- upvalues: useTokens (ref), momentOverlayInsetContextModule (ref), fFlagMomentsUseCompositionLibraryModule (ref), reactModule (ref), view (ref)
	local var4 = useTokens()
	local var5 = momentOverlayInsetContextModule.useMomentOverlayInset()
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
			bottom = UDim.new(0, if fFlagMomentsUseCompositionLibraryModule and var5 > 0 then var4.Padding.Medium + var5 else math.max(verticalPadding, if safeAreaInsets ~= nil then 0 else safeAreaInsets.bottom) + var5)
		},
		sizeConstraint = { MaxSize = p1.maxSize },
		onAbsoluteSizeChanged = p1.onAbsoluteSizeChanged
	}, p1.children)
end

return function(p1)
	-- upvalues: useTokens (ref), fFlagMomentsUseCompositionLibraryModule (ref), useCompositionLayout (ref), useDeviceInsets (ref), useFormFactor (ref), reactUtilsModule (ref), momentPushedFeedSafeAreaContextModule (ref), getFFlagMomentsRenderPostAssetsModule (ref), reactModule (ref), signalsModule (ref), momentsGetPostAssetStoreModule (ref), signalsReactModule (ref), deriveMomentFromPostModule (ref), fFlagMomentsComments (ref), var1 (ref), var2 (ref), var3 (ref), useMomentsSession (ref), fFlagMomentsImmersiveChromeModule (ref), topContentModule (ref), scrubberModule (ref), callToActionModule (ref), momentLayoutModule (ref), formFactor (ref), OverlayInfoFrame (ref), view (ref), momentContextModule (ref), text (ref), videoScrimModule (ref), momentGestureLayerModule (ref), gradientBackdrop (ref), playbackToggleIndicatorModule (ref), reactionExplosionLayerModule (ref), getFFlagMomentsDisplayWakeLockModule (ref), DisplayWakeLockEffect (ref), reactionEffectsContextModule (ref)
	local var4 = useTokens()
	local var5 = nil
	local var6 = nil
	
	if fFlagMomentsUseCompositionLibraryModule then
		var5 = useCompositionLayout()
		var6 = useDeviceInsets()
	end
	local var7 = if not fFlagMomentsUseCompositionLibraryModule then useFormFactor() else nil
	local var8 = reactUtilsModule.createNextOrder()
	local var9 = momentPushedFeedSafeAreaContextModule.useMomentPushedFeedSafeArea()
	local var10 = if var9 ~= nil then var6 else var9
	local var11 = if var5 ~= nil then var4.Padding.XLarge else var5.margin
	local moment = p1.moment
	local data = p1.data
	local var12 = nil
	local mediaSurface = p1.mediaSurface
	
	if getFFlagMomentsRenderPostAssetsModule() then
		local var13 = if p1.moment == nil or p1.moment.postAsset == nil then nil else p1.moment.postAsset.postAssetId
		local var14 = signalsReactModule.useSignalState(reactModule.useMemo(function()
			-- upvalues: signalsModule (copy), var13 (ref), momentsGetPostAssetStoreModule (copy)
			return signalsModule.createComputed(function(p2)
				-- upvalues: var13 (copy), momentsGetPostAssetStoreModule (copy)
				return if var13 == nil then nil else momentsGetPostAssetStoreModule(false).getCachedPostAsset(var13).data(p2)
			end)
		end, { var13 or false }))
		local var15 = reactModule.useMemo(function()
			-- upvalues: p1 (ref), var14 (ref), deriveMomentFromPostModule (copy)
			return if p1.moment == nil or var14 == nil then nil else deriveMomentFromPostModule(p1.moment, var14)
		end, { p1.moment, var14 or false })
		moment = var15 or p1.moment
		
		if moment ~= nil and p1.renderMediaSurface ~= nil then
			mediaSurface = p1.renderMediaSurface(moment)
		end
		data = reactModule.useMemo(function()
			-- upvalues: var15 (ref), p1 (ref)
			if var15 == nil then
				return p1.data
			end
			local cloned = table.clone(p1.data)
			cloned.description = var15.metadata.description or cloned.description
			
			if cloned.kind == "experience" then
				cloned.placeId = var15.metadata.placeId or cloned.placeId
				cloned.universeId = var15.metadata.universeId or cloned.universeId
				
				if var15.metadata.hasAuthoritativePartnerUploadType then
					cloned.isSponsored = var15.metadata.partnerUploadType == "influencer"
				end
			end
			return if if cloned.description == p1.data.description then cloned.kind == "experience" and (p1.data.kind == "experience" and (if cloned.placeId == p1.data.placeId then if cloned.universeId == p1.data.universeId then cloned.isSponsored ~= p1.data.isSponsored else true else true)) else true then cloned else p1.data
		end, { p1.data, var14 or false })
		var12 = if data ~= p1.data then nil else `post:{var13}`
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
			LayoutOrder = var8(),
			moment = moment,
			onOpenComments = var17
		}),
		Scrubber = reactModule.createElement(scrubberModule, { LayoutOrder = var8() }),
		CallToAction = reactModule.createElement(callToActionModule, { LayoutOrder = var8() })
	}
	local var22 = if fFlagMomentsUseCompositionLibraryModule then momentLayoutModule.BOTTOM_UI_MAX_SIZE elseif var7 ~= formFactor.Wide then momentLayoutModule.BOTTOM_UI_MAX_SIZE else nil
	
	return reactModule.createElement(reactionEffectsContextModule.Provider, nil, reactModule.createElement(momentContextModule.Provider, { data = data, dataVersion = var12 }, {
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
					horizontalPadding = var11,
					verticalPadding = var4.Padding.XLarge,
					safeAreaInsets = var10,
					maxSize = var22,
					onAbsoluteSizeChanged = var21
				}, t) elseif var10 ~= nil then reactModule.createElement(view, {
					tag = "col align-x-center align-y-bottom gap-large position-bottom-center anchor-bottom-center size-full-0 auto-y",
					testId = "--moments-info-frame-inset",
					ZIndex = 2,
					padding = {
						top = UDim.new(0, var4.Padding.XLarge),
						left = UDim.new(0, var11),
						right = UDim.new(0, var11),
						bottom = UDim.new(0, var4.Padding.XLarge)
					},
					sizeConstraint = { MaxSize = var22 },
					onAbsoluteSizeChanged = var21
				}, t) else reactModule.createElement(view, {
					tag = "col align-x-center align-y-bottom gap-large position-bottom-center anchor-bottom-center size-full-0 auto-y",
					testId = "--moments-info-frame-inset",
					ZIndex = 2,
					padding = {
						top = UDim.new(0, var4.Padding.XLarge),
						left = UDim.new(0, math.max(var11, var10.left)),
						right = UDim.new(0, math.max(var11, var10.right)),
						bottom = UDim.new(0, math.max(var4.Padding.XLarge, var10.bottom))
					},
					sizeConstraint = { MaxSize = var22 },
					onAbsoluteSizeChanged = var21
				}, t)
			}),
			PlaybackIndicator = reactModule.createElement(playbackToggleIndicatorModule),
			ReactionExplosionLayer = reactModule.createElement(reactionExplosionLayerModule)
		}),
		DisplayWakeLock = if getFFlagMomentsDisplayWakeLockModule() then reactModule.createElement(DisplayWakeLockEffect) else nil
	}))
end