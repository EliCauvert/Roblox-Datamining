local avatarExperienceProfilePictureEditor = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor")
local parent = avatarExperienceProfilePictureEditor.Parent
local reactModule = require(parent.React)
local roactNavigationModule = require(parent.RoactNavigation)
local foundationModule = require(parent.Foundation)
local view = foundationModule.View
local scrollView = foundationModule.ScrollView
local visibility = foundationModule.Enums.Visibility
local iconButton = foundationModule.IconButton
local buttonVariant = foundationModule.Enums.ButtonVariant
local iconName = foundationModule.Enums.IconName
local iconSize = foundationModule.Enums.IconSize
local useTokens = foundationModule.Hooks.useTokens
local focusNavigatorWrapperModule = require(script.Parent.FocusNavigatorWrapper)
local combinedCarouselsContentModule = require(script.Parent.CombinedCarouselsContent)
local expandedEmotesGridContentModule = require(script.Parent.ExpandedEmotesGridContent)
local assetGridScrollSectionModule = require(script.Parent.AssetGridScrollSection)
local editProfileImageFooterModule = require(script.Parent.EditProfileImageFooter)
local editProfileImageActionsContextModule = require(avatarExperienceProfilePictureEditor.Context.EditProfileImageActionsContext)
local useProfileCardWidth = require(parent.ProfilePlatformCommon).Hooks.useProfileCardWidth
local useGuiInset = require(avatarExperienceProfilePictureEditor.Hooks.useGuiInset).useGuiInset
local useEditProfileImageLayout = require(avatarExperienceProfilePictureEditor.Hooks.useEditProfileImageLayout).useEditProfileImageLayout
local useEditProfileImageViewModelModule = require(avatarExperienceProfilePictureEditor.Hooks.useEditProfileImageViewModel)
local framesPlusUpsellBarModule = require(script.Parent.FramesPlusUpsellBar)
local rotatableAvatarPreviewModule = require(script.Parent.RotatableAvatarPreview)
local _ = require(avatarExperienceProfilePictureEditor.Common.Enums)
local constantsModule = require(avatarExperienceProfilePictureEditor.Constants)
local fFlagAXEnableProfileTab = require(parent.SharedFlags).FFlagAXEnableProfileTab
local editProfileImageAnalyticsModule = require(avatarExperienceProfilePictureEditor.Analytics.EditProfileImageAnalytics)

local function createSplitLayout(p1, p2)
	-- upvalues: reactModule (ref), view (ref), constantsModule (ref)
	return {
		Preview = reactModule.createElement(view, {
			tag = "align-x-center position-top-right anchor-top-right",
			ZIndex = 0,
			Size = UDim2.new(1 - constantsModule.SplitControlsPaneWidthScale, 0, 0, p2)
		}, { AvatarPreview = p1.avatarPreview }),
		LeftPane = reactModule.createElement(view, {
			tag = "col size-full-full bg-surface-0",
			LayoutOrder = 1,
			ZIndex = 1,
			Size = UDim2.fromScale(constantsModule.SplitControlsPaneWidthScale, 1)
		}, {
			Options = reactModule.createElement(view, { tag = "col grow size-full-0", LayoutOrder = 1 }, { [p1.activeView] = p1.options }),
			Footer = p1.footer
		}),
		CloseButton = p1.closeButton
	}
end

local function createStackedLayout(p1, p2, p3)
	-- upvalues: reactModule (ref), view (ref), scrollView (ref), visibility (ref)
	return {
		StackedContent = reactModule.createElement(view, { tag = "col size-full-full" }, {
			Preview = reactModule.createElement(view, {
				tag = "col gap-medium size-full-0 auto-y",
				LayoutOrder = 1
			}, {
				ProfilePhotoRow = reactModule.createElement(view, {
					tag = "align-x-center size-full-0 auto-y",
					LayoutOrder = 1
				}, {
					PreviewClipHost = reactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						BorderSizePixel = 0,
						ClipsDescendants = true,
						Size = UDim2.fromOffset(p2, p3)
					}, { AvatarPreview = p1.avatarPreview })
				})
			}),
			ScrollBody = if p1.activeView == "emotes" then reactModule.createElement(view, {
				testId = "virtualized-emotes-body",
				tag = "col grow size-full-0",
				LayoutOrder = 2
			}, { Emotes = p1.options }) else reactModule.createElement(scrollView, {
				testId = "portrait-scroll-body",
				tag = "grow size-full-0",
				LayoutOrder = 2,
				scroll = {
					ScrollingDirection = Enum.ScrollingDirection.Y,
					AutomaticCanvasSize = Enum.AutomaticSize.Y,
					CanvasSize = UDim2.fromScale(0, 0),
					scrollBarVisibility = visibility.Auto
				}
			}, {
				Content = reactModule.createElement(view, { tag = "col size-full-0 auto-y" }, { [p1.activeView] = p1.options })
			}),
			Footer = p1.footer
		}),
		CloseButton = p1.closeButton
	}
end

local function EditProfileImageBody(p1)
	-- upvalues: useTokens (ref), useGuiInset (ref), fFlagAXEnableProfileTab (ref), useProfileCardWidth (ref), useEditProfileImageLayout (ref), useEditProfileImageViewModelModule (ref), reactModule (ref), editProfileImageAnalyticsModule (ref), framesPlusUpsellBarModule (ref), constantsModule (ref), assetGridScrollSectionModule (ref), iconName (ref), view (ref), expandedEmotesGridContentModule (ref), combinedCarouselsContentModule (ref), editProfileImageFooterModule (ref), rotatableAvatarPreviewModule (ref), iconButton (ref), iconSize (ref), buttonVariant (ref), createSplitLayout (ref), createStackedLayout (ref), focusNavigatorWrapperModule (ref), roactNavigationModule (ref)
	local var1 = useTokens()
	local var2 = useGuiInset()
	local var3 = fFlagAXEnableProfileTab and p1.fullBleed == true
	local var4 = p1.showCloseButton ~= false
	local var5 = useProfileCardWidth()
	local var6 = useEditProfileImageLayout({ guiInset = var2 })
	local cutoutFieldOfViewDeg = var6.cutoutFieldOfViewDeg
	local var7 = useEditProfileImageViewModelModule({
		mode = p1.mode,
		onClose = p1.onClose,
		onSaveSuccess = p1.onSaveSuccess,
		cutoutFieldOfViewDeg = cutoutFieldOfViewDeg
	})
	local navigation = var7.navigation
	local emotes = var7.emotes
	local frames = var7.frames
	local preview = var7.preview
	local footer = var7.footer
	local activeView = navigation.activeView
	reactModule.useEffect(function()
		-- upvalues: editProfileImageAnalyticsModule (copy), p1 (ref)
		editProfileImageAnalyticsModule.logPageView({ mode = p1.mode })
	end, { p1.mode })
	local var8 = reactModule.useCallback(function()
		-- upvalues: editProfileImageAnalyticsModule (copy), p1 (ref), activeView (ref), navigation (ref)
		editProfileImageAnalyticsModule.logClose({ mode = p1.mode, activeView = activeView })
		navigation.onLeaveScreen()
	end, { p1.mode, activeView, navigation.onLeaveScreen })
	local onTitleBack = navigation.onTitleBack
	local var9 = if frames.shouldShowUpsell then reactModule.createElement(framesPlusUpsellBarModule, {
		onSubscribeActivated = function()
			-- upvalues: frames (ref)
			frames.onOpenSubscriptionUpsell("banner")
		end
	}) else nil
	local cutoutTopOffset = var6.cutoutTopOffset
	local cutoutSize = var6.cutoutSize
	local previewHeight = var6.previewHeight
	local visiblePreviewHeight = var6.visiblePreviewHeight
	local previewWidth = var6.previewWidth
	local isSplit = var6.mode == "split"
	local var10 = var3 or isSplit
	local var11 = if isSplit then math.floor(var6.safeWidth * constantsModule.SplitControlsPaneWidthScale + 0.5) else var5
	local t = {
		activeView = activeView,
		avatarPreview = reactModule.createElement(rotatableAvatarPreviewModule, {
			fillContainer = false,
			userId = preview.localUserId or "",
			width = previewWidth,
			height = previewHeight,
			cutoutSize = cutoutSize,
			cutoutTopOffset = cutoutTopOffset,
			fieldOfViewDeg = constantsModule.CameraFieldOfViewDeg,
			fieldOfViewForDistanceScaleDeg = cutoutFieldOfViewDeg,
			distanceScale = preview.distanceScale,
			committedYRotDeg = preview.yRotDeg,
			emoteAssetId = emotes.selectedEmoteId,
			frameImage = frames.selectedImage,
			onYRotDegChanged = preview.onYRotDegChanged,
			onDistanceScaleChanged = preview.onDistanceScaleChanged
		}),
		closeButton = if var4 then reactModule.createElement(view, {
			tag = "position-top-left auto-xy",
			ZIndex = 10,
			Position = if isSplit then UDim2.fromScale(constantsModule.SplitControlsPaneWidthScale, 0) else nil,
			ref = navigation.closeButtonRef,
			padding = {
				top = UDim.new(0, var6.closeButtonTopOffset),
				left = UDim.new(0, var1.Padding.XLarge)
			}
		}, {
			Button = reactModule.createElement(iconButton, {
				isCircular = true,
				icon = iconName.X,
				size = iconSize.Medium,
				variant = buttonVariant.Utility,
				onActivated = var8
			})
		}) else nil,
		footer = reactModule.createElement(editProfileImageFooterModule, {
			footerCta = footer.cta,
			isSaving = footer.isSaving,
			localizedSubscribeLabel = footer.subscribeLabel,
			localizedSaveLabel = footer.saveLabel,
			selectedEmoteId = emotes.selectedEmoteId,
			layoutOrder = if isSplit then 2 else 3,
			onSave = footer.onSave,
			onOpenProfileFramesSubscriptionUpsell = frames.onOpenSubscriptionUpsell,
			renderRecommendedEmotePurchaseFooter = p1.renderRecommendedEmotePurchaseFooter
		}),
		options = if activeView == "frames" then if frames.show then reactModule.createElement(assetGridScrollSectionModule, {
			layoutOrder = 3,
			title = frames.localizedTitle,
			titleLeadingIconName = iconName.RobloxPlus,
			onTitleBack = onTitleBack,
			useInternalScroll = isSplit,
			gridProps = {
				tileSize = 96,
				items = frames.items,
				isLoading = frames.isLoading,
				hasError = frames.hasError,
				onRetry = frames.onRetry,
				bannerComponent = var9,
				selectedId = frames.selectedFrameId,
				onSelect = frames.onSelect,
				containerWidth = var11
			}
		}) else reactModule.createElement(view, { tag = "size-full-0", LayoutOrder = 3 }) elseif activeView == "emotes" then reactModule.createElement(expandedEmotesGridContentModule, {
			layoutOrder = 3,
			tileSize = 96,
			containerWidth = var11,
			onTitleBack = onTitleBack,
			useInternalScroll = isSplit,
			ownedEmoteItems = emotes.ownedItems,
			recommendedEmoteItems = emotes.recommendedItems,
			emotesLoading = emotes.isLoading,
			emotesError = emotes.hasError,
			hasMoreEmotes = emotes.hasMore,
			isLoadingMoreEmotes = emotes.isLoadingMore,
			hasLoadMoreEmotesError = emotes.hasLoadMoreError,
			onMoreEmotes = emotes.onMore,
			onRetryEmotes = emotes.onRetry,
			selectedEmoteId = emotes.selectedEmoteId,
			onSelectEmote = emotes.onSelect
		}) else reactModule.createElement(combinedCarouselsContentModule, {
			layoutOrder = 3,
			tileSize = 96,
			showFrames = frames.show,
			useInternalScroll = isSplit,
			emoteItems = emotes.items,
			emotesLoading = emotes.isLoading,
			emotesError = emotes.hasError,
			onRetryEmotes = emotes.onRetry,
			selectedEmoteId = emotes.selectedEmoteId,
			onSelectEmote = emotes.onSelect,
			onExpandEmotes = navigation.onExpandEmotes,
			frameItems = frames.items,
			framesLoading = frames.isLoading,
			framesError = frames.hasError,
			onRetryFrames = frames.onRetry,
			selectedFrameId = frames.selectedFrameId,
			onSelectFrame = frames.onSelect,
			onExpandFrames = navigation.onExpandFrames,
			framesBannerComponent = var9
		})
	}
	
	return reactModule.createElement(focusNavigatorWrapperModule, { onClose = navigation.onBack }, {
		NavigationEvents = reactModule.createElement(roactNavigationModule.NavigationEvents, { onDidFocus = navigation.onDidFocus }),
		Root = reactModule.createElement(view, {
			tag = if fFlagAXEnableProfileTab then {
				["bg-surface-0"] = not isSplit,
				["size-full-full"] = true
			} elseif isSplit then "size-full-full" else "size-full-full bg-surface-0",
			Size = if var10 then nil else UDim2.new(0, var5, 1, 0)
		}, if isSplit then createSplitLayout(t, previewHeight) else createStackedLayout(t, previewWidth, visiblePreviewHeight))
	})
end

return function(p1)
	-- upvalues: reactModule (ref), editProfileImageActionsContextModule (ref), EditProfileImageBody (ref)
	return reactModule.createElement(editProfileImageActionsContextModule.Provider, {
		value = reactModule.useMemo(function()
			-- upvalues: p1 (ref)
			return {
				onOpenEmoteDetails = p1.onOpenEmoteDetails,
				onPrepareRecommendedEmotePurchase = p1.onPrepareRecommendedEmotePurchase,
				onShopForMoreEmotes = p1.onShopForMoreEmotes
			}
		end, {
			p1.onOpenEmoteDetails,
			p1.onPrepareRecommendedEmotePurchase,
			p1.onShopForMoreEmotes
		})
	}, reactModule.createElement(EditProfileImageBody, {
		mode = p1.mode,
		fullBleed = p1.fullBleed,
		showCloseButton = p1.showCloseButton,
		onClose = p1.onClose,
		onSaveSuccess = p1.onSaveSuccess,
		renderRecommendedEmotePurchaseFooter = p1.renderRecommendedEmotePurchaseFooter
	}))
end