local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local FoundationModule = require(Parent.Foundation)
local MomentsCommonModule = require(Parent.MomentsCommon)
local _ = require(Parent.MomentsTypes)
local ReactModule = require(Parent.React)
local ReactUtilsModule = require(Parent.ReactUtils)
local SharedFlagsModule = require(Parent.SharedFlags)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local Text = FoundationModule.Text
local View = FoundationModule.View
local UseCompositionLayoutFunction = require(Parent.AppComposition).useCompositionLayout
local UseDeviceInsetsFunction = MomentsCommonModule.Hooks.useDeviceInsets
local UseTokensFunction = FoundationModule.Hooks.useTokens
local GradientBackdrop = MomentsCommonModule.Components.GradientBackdrop
local MomentLayoutModule = require(script.Parent.momentLayout)
local MomentContextModule = require(script.Parent.MomentContext)
local MomentImpressionMemoryModule = require(script.Parent.MomentImpressionMemory)
local UseMomentsHostFunction = require(Moments.MomentsHostContext).useMomentsHost
local AvatarActionBarModule = require(script.Parent.AvatarActionBar)
local CallToActionModule = require(script.Parent.CallToAction)
local ScrubberModule = require(script.Parent.Scrubber)
local TopContentModule = require(script.Parent.TopContent)
local VideoScrimModule = require(script.Parent.VideoScrim)
local PlaybackToggleIndicatorModule = require(script.Parent.PlaybackToggleIndicator)
local MomentOverlayInsetContextModule = require(script.Parent.MomentOverlayInsetContext)
local MomentPushedFeedSafeAreaContextModule = require(script.Parent.MomentPushedFeedSafeAreaContext)
local ReactionEffectsContextModule = require(script.Parent.Reactions.ReactionEffectsContext)
local MomentGestureLayerModule = require(script.Parent.Reactions.MomentGestureLayer)
local ReactionExplosionLayerModule = require(script.Parent.Reactions.ReactionExplosionLayer)
local FFlagMomentsFeedAboveNavBarModule = require(Moments.Flags.FFlagMomentsFeedAboveNavBar)
local GetFFlagMomentsRenderPostAssetsModule = require(Parent.MomentsCommon.GetFFlagMomentsRenderPostAssets)
local FFlagMomentsAvatarLookTryOn = require(Parent.SharedFlags).FFlagMomentsAvatarLookTryOn
local FFlagMomentsRenderAvatarPostsInFeed = SharedFlagsModule.FFlagMomentsRenderAvatarPostsInFeed
local GetFFlagMomentsDisplayWakeLockModule = require(Moments.Flags.GetFFlagMomentsDisplayWakeLock)
local FFlagMomentsFixOverlayRemountImpressionsModule = require(Moments.Flags.FFlagMomentsFixOverlayRemountImpressions)
local UseDisplayWakeLockModule = require(Moments.Hooks.useDisplayWakeLock)
local UseIsPlayingModule = require(Moments.Hooks.useIsPlaying)
local UseMomentsSessionFunction = require(Moments.Stores.GetMomentsStore.MomentsSessionContext).useMomentsSession
local DeriveMomentFromPostModule = require(Moments.Utils.deriveMomentFromPost)
local MomentsGetPostAssetStoreModule = require(Parent.DataHydration.MomentsGetPostAssetStore)
local FFlagMomentsComments = SharedFlagsModule.FFlagMomentsComments
local VideoLiftContainerModule = if FFlagMomentsComments then require(script.Parent.VideoLift.VideoLiftContainer) else nil
local UseCommentsChromeTransparencyModule = if FFlagMomentsComments then require(script.Parent.useCommentsChromeTransparency) else nil
local UseCommentsEventsModule = if FFlagMomentsComments then require(Moments.Components.Comments.useCommentsEvents) else nil

local function DisplayWakeLockEffect()
	-- upvalues: UseIsPlayingModule (copy), UseDisplayWakeLockModule (copy)
	UseDisplayWakeLockModule((UseIsPlayingModule()))
	
	return nil
end

local function OverlayInfoFrame(p1)
	-- upvalues: UseTokensFunction (copy), MomentOverlayInsetContextModule (copy), FFlagMomentsFeedAboveNavBarModule (copy), ReactModule (copy), View (copy)
	local UseTokensResult = UseTokensFunction()
	local UseMomentOverlayInsetResult: number = MomentOverlayInsetContextModule.useMomentOverlayInset()
	local HorizontalPadding: number = p1.horizontalPadding
	local VerticalPadding: number = p1.verticalPadding
	local SafeAreaInsets = p1.safeAreaInsets
	local Bottom = if SafeAreaInsets == nil then 0 else SafeAreaInsets.bottom
	local UseMomentOverlayInsetResult1 = if FFlagMomentsFeedAboveNavBarModule then 0 else UseMomentOverlayInsetResult
	
	return ReactModule.createElement(View, {
		tag = "col align-x-center align-y-bottom gap-large position-bottom-center anchor-bottom-center size-full-0 auto-y",
		testId = "--moments-info-frame-overlay",
		ZIndex = 2,
		padding = {
			top = UDim.new(0, VerticalPadding),
			left = UDim.new(0, (math.max(HorizontalPadding, if SafeAreaInsets == nil then 0 else SafeAreaInsets.left))),
			right = UDim.new(0, (math.max(HorizontalPadding, if SafeAreaInsets == nil then 0 else SafeAreaInsets.right))),
			bottom = UDim.new(0, if UseMomentOverlayInsetResult > 0 then UseTokensResult.Padding.Medium + UseMomentOverlayInsetResult1 else math.max(VerticalPadding, Bottom) + UseMomentOverlayInsetResult1)
		},
		sizeConstraint = { MaxSize = p1.maxSize },
		onAbsoluteSizeChanged = p1.onAbsoluteSizeChanged
	}, p1.children)
end

return function(p1)
	-- upvalues: UseTokensFunction (copy), UseCompositionLayoutFunction (copy), UseDeviceInsetsFunction (copy), ReactUtilsModule (copy), MomentPushedFeedSafeAreaContextModule (copy), FFlagMomentsRenderAvatarPostsInFeed (copy), GetFFlagMomentsRenderPostAssetsModule (copy), ReactModule (copy), SignalsModule (copy), MomentsGetPostAssetStoreModule (copy), SignalsReactModule (copy), DeriveMomentFromPostModule (copy), FFlagMomentsAvatarLookTryOn (copy), UseMomentsHostFunction (copy), FFlagMomentsComments (copy), VideoLiftContainerModule (copy), UseCommentsChromeTransparencyModule (copy), UseCommentsEventsModule (copy), UseMomentsSessionFunction (copy), TopContentModule (copy), ScrubberModule (copy), AvatarActionBarModule (copy), CallToActionModule (copy), MomentLayoutModule (copy), OverlayInfoFrame (copy), MomentContextModule (copy), View (copy), Text (copy), VideoScrimModule (copy), MomentGestureLayerModule (copy), GradientBackdrop (copy), PlaybackToggleIndicatorModule (copy), ReactionExplosionLayerModule (copy), GetFFlagMomentsDisplayWakeLockModule (copy), DisplayWakeLockEffect (copy), FFlagMomentsFixOverlayRemountImpressionsModule (copy), MomentImpressionMemoryModule (copy), ReactionEffectsContextModule (copy)
	local UseTokensResult = UseTokensFunction()
	local UseCompositionLayoutResult = UseCompositionLayoutFunction()
	local UseDeviceInsetsResult = UseDeviceInsetsFunction()
	local NextOrder = ReactUtilsModule.createNextOrder()
	local UseMomentPushedFeedSafeAreaResult = MomentPushedFeedSafeAreaContextModule.useMomentPushedFeedSafeArea()
	local UseDeviceInsetsResult1 = if UseMomentPushedFeedSafeAreaResult == nil then UseDeviceInsetsResult else UseMomentPushedFeedSafeAreaResult
	local Margin = UseCompositionLayoutResult.margin
	local Moment = p1.moment
	local Data = p1.data
	local PostName = nil
	local MediaSurface = p1.mediaSurface
	local IsIsStaticMedia: boolean = FFlagMomentsRenderAvatarPostsInFeed and p1.isStaticMedia == true
	local IsIsWorkspaceRendered: boolean = FFlagMomentsRenderAvatarPostsInFeed and p1.isWorkspaceRendered == true
	
	if GetFFlagMomentsRenderPostAssetsModule() then
		local PostAssetId = if p1.moment == nil or p1.moment.postAsset == nil then nil else p1.moment.postAsset.postAssetId
		local UseSignalStateResult = SignalsReactModule.useSignalState((ReactModule.useMemo(function()
			-- upvalues: SignalsModule (upval), PostAssetId (copy), MomentsGetPostAssetStoreModule (upval)
			return SignalsModule.createComputed(function(p2)
				-- upvalues: PostAssetId (upval), MomentsGetPostAssetStoreModule (upval)
				return if PostAssetId == nil then nil else MomentsGetPostAssetStoreModule(false).getCachedPostAsset(PostAssetId).data(p2)
			end)
		end, { PostAssetId or false })))
		local UseMemoResult = ReactModule.useMemo(function()
			-- upvalues: p1 (copy), UseSignalStateResult (copy), DeriveMomentFromPostModule (upval)
			return if p1.moment == nil or UseSignalStateResult == nil then nil else DeriveMomentFromPostModule(p1.moment, UseSignalStateResult)
		end, { p1.moment, UseSignalStateResult or false })
		Moment = UseMemoResult or p1.moment
		
		if Moment ~= nil and p1.renderMediaSurface ~= nil then
			MediaSurface = p1.renderMediaSurface(Moment)
		end
		Data = ReactModule.useMemo(function()
			-- upvalues: UseMemoResult (copy), p1 (copy), FFlagMomentsAvatarLookTryOn (upval)
			if UseMemoResult == nil then
				return p1.data
			end
			local Copy = table.clone(p1.data)
			Copy.description = UseMemoResult.metadata.description or Copy.description
			
			if Copy.kind == "experience" then
				Copy.placeId = UseMemoResult.metadata.placeId or Copy.placeId
				Copy.universeId = UseMemoResult.metadata.universeId or Copy.universeId
				
				if FFlagMomentsAvatarLookTryOn then
					Copy.outfitId = UseMemoResult.metadata.outfitId or Copy.outfitId
				end
				if UseMemoResult.metadata.hasAuthoritativePartnerUploadType then
					Copy.isSponsored = UseMemoResult.metadata.partnerUploadType == "influencer"
				end
			end
			local IsNotDescriptionMatch: boolean = Copy.description ~= p1.data.description or Copy.kind == "experience" and p1.data.kind == "experience" and (Copy.placeId ~= p1.data.placeId or (Copy.universeId ~= p1.data.universeId or Copy.isSponsored ~= p1.data.isSponsored) or FFlagMomentsAvatarLookTryOn and Copy.outfitId ~= p1.data.outfitId)
			
			return if IsNotDescriptionMatch then Copy else p1.data
		end, { p1.data, UseSignalStateResult or false })
		PostName = if Data == p1.data then nil else `post:{PostAssetId}`
	end
	local v1 = false
	
	if FFlagMomentsAvatarLookTryOn then
		local OpenAvatarLookTryOn = UseMomentsHostFunction().openAvatarLookTryOn
		local OutfitId = if Data.kind == "experience" then Data.outfitId elseif FFlagMomentsRenderAvatarPostsInFeed and Data.kind == "avatar" and Data.outfit.source.type == "outfit" then Data.outfit.source.id else nil
		local Id = if FFlagMomentsRenderAvatarPostsInFeed and Data.kind == "avatar" and Data.outfit.source.type == "look" then Data.outfit.source.id else nil
		v1 = OpenAvatarLookTryOn ~= nil and (OutfitId ~= nil and OutfitId > 0) or OpenAvatarLookTryOn ~= nil and Id ~= nil
	end
	if FFlagMomentsComments and VideoLiftContainerModule ~= nil and MediaSurface ~= nil then
		MediaSurface = ReactModule.createElement(VideoLiftContainerModule, { feedItemId = Data.feedItemId }, MediaSurface)
	end
	local UseCommentsChromeTransparencyModuleResult = if FFlagMomentsComments and UseCommentsChromeTransparencyModule ~= nil then UseCommentsChromeTransparencyModule(Data.feedItemId) else nil
	local UseCommentsEventsModuleResult = if FFlagMomentsComments and UseCommentsEventsModule ~= nil then UseCommentsEventsModule(if Moment == nil then nil else Moment.recommendationMetadata, UseMomentsSessionFunction().getMomentsSessionId) else nil
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(UDim2.fromScale(1, 0))
	local ScaledXLarge = 2 * UseTokensResult.Padding.XLarge
	local Element = ReactModule.createElement(MomentContextModule.Provider, { data = Data, dataVersion = PostName }, {
		Root = ReactModule.createElement(View, {
			testId = "--moments-item-root",
			LayoutOrder = p1.layoutOrder,
			backgroundStyle = if IsIsWorkspaceRendered then { Transparency = 1 } else nil,
			tag = {
				["size-full clip"] = true,
				["bg-surface-0"] = not IsIsWorkspaceRendered
			}
		}, {
			Video = ReactModule.createElement(View, {
				tag = "size-full",
				testId = "--moments-item-video",
				ZIndex = 1
			}, {
				Surface = if MediaSurface == nil then ReactModule.createElement(View, { tag = "size-full bg-surface-100" }, {
					Label = ReactModule.createElement(Text, {
						tag = "size-full text-body-large text-align-x-center text-align-y-center content-emphasis",
						Text = "[ video ]"
					})
				}) else MediaSurface,
				Scrim = ReactModule.createElement(VideoScrimModule, { ZIndex = 2 }),
				GestureLayer = ReactModule.createElement(MomentGestureLayerModule, { ZIndex = 3 })
			}),
			Overlay = ReactModule.createElement(View, {
				tag = "position-bottom-center anchor-bottom-center size-full-0 auto-y",
				testId = "--moments-item-overlay",
				ZIndex = 2,
				GroupTransparency = UseCommentsChromeTransparencyModuleResult
			}, {
				Backdrop = ReactModule.createElement(GradientBackdrop, {
					rotation = 270,
					color3 = UseTokensResult.Color.Common.Scrim.Color3,
					size = UseBindingResult
				}),
				InfoFrame = ReactModule.createElement(OverlayInfoFrame, {
					horizontalPadding = Margin,
					verticalPadding = UseTokensResult.Padding.XLarge,
					safeAreaInsets = UseDeviceInsetsResult1,
					maxSize = MomentLayoutModule.BOTTOM_UI_MAX_SIZE,
					onAbsoluteSizeChanged = ReactModule.useCallback(function(Frame)
						-- upvalues: UseBindingResult2 (copy), ScaledXLarge (copy)
						UseBindingResult2(UDim2.new(1, 0, 0, Frame.AbsoluteSize.Y + ScaledXLarge))
					end, { ScaledXLarge })
				}, {
					TopContent = ReactModule.createElement(TopContentModule, {
						LayoutOrder = NextOrder(),
						moment = Moment,
						onOpenComments = UseCommentsEventsModuleResult
					}),
					Scrubber = if IsIsStaticMedia then nil else ReactModule.createElement(ScrubberModule, { LayoutOrder = NextOrder() }),
					CallToAction = if FFlagMomentsRenderAvatarPostsInFeed and Data.kind == "avatar" and not v1 then nil else ReactModule.createElement(if v1 then AvatarActionBarModule else CallToActionModule, { LayoutOrder = NextOrder() })
				})
			}),
			PlaybackIndicator = if IsIsStaticMedia then nil else ReactModule.createElement(PlaybackToggleIndicatorModule),
			ReactionExplosionLayer = ReactModule.createElement(ReactionExplosionLayerModule)
		}),
		DisplayWakeLock = if GetFFlagMomentsDisplayWakeLockModule() and not IsIsStaticMedia then ReactModule.createElement(DisplayWakeLockEffect) else nil
	})
	
	if FFlagMomentsFixOverlayRemountImpressionsModule then
		Element = ReactModule.createElement(MomentImpressionMemoryModule.Provider, nil, Element)
	end
	return ReactModule.createElement(ReactionEffectsContextModule.Provider, nil, Element)
end