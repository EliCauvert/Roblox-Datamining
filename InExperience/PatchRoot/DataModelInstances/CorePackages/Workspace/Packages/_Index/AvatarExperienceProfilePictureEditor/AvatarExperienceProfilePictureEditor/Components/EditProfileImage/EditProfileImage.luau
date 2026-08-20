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

local function createSplitLayout(p0, p1) --[[ line: 62 ]]
	-- upvalues: reactModule (ref), view (ref), constantsModule (ref)
	return {
		Preview = reactModule.createElement(view, {
			tag = "align-x-center position-top-right anchor-top-right",
			ZIndex = 0,
			Size = UDim2.new(1 - constantsModule.SplitControlsPaneWidthScale, 0, 0, p1)
		}, { AvatarPreview = p0.avatarPreview }),
		LeftPane = reactModule.createElement(view, {
			tag = "col size-full-full bg-surface-0",
			LayoutOrder = 1,
			ZIndex = 1,
			Size = UDim2.fromScale(constantsModule.SplitControlsPaneWidthScale, 1)
		}, {
			Options = reactModule.createElement(view, { tag = "col grow size-full-0", LayoutOrder = 1 }, { [p0.activeView] = p0.options }),
			Footer = p0.footer
		}),
		CloseButton = p0.closeButton
	}
end

local function createStackedLayout(p2, p3, p4) --[[ line: 95 ]]
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
						Size = UDim2.fromOffset(p3, p4)
					}, { AvatarPreview = p2.avatarPreview })
				})
			}),
			ScrollBody = if p2.activeView == "emotes" then reactModule.createElement(view, {
				testId = "virtualized-emotes-body",
				tag = "col grow size-full-0",
				LayoutOrder = 2
			}, { Emotes = p2.options }) else reactModule.createElement(scrollView, {
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
				Content = reactModule.createElement(view, { tag = "col size-full-0 auto-y" }, { [p2.activeView] = p2.options })
			}),
			Footer = p2.footer
		}),
		CloseButton = p2.closeButton
	}
end

local function EditProfileImageBody(p5) --[[ line: 168 ]]
	-- upvalues: useTokens (ref), useGuiInset (ref), fFlagAXEnableProfileTab (ref), useProfileCardWidth (ref), useEditProfileImageLayout (ref), useEditProfileImageViewModelModule (ref), reactModule (ref), editProfileImageAnalyticsModule (ref), framesPlusUpsellBarModule (ref), constantsModule (ref), assetGridScrollSectionModule (ref), iconName (ref), view (ref), expandedEmotesGridContentModule (ref), combinedCarouselsContentModule (ref), editProfileImageFooterModule (ref), rotatableAvatarPreviewModule (ref), iconButton (ref), iconSize (ref), buttonVariant (ref), createSplitLayout (ref), createStackedLayout (ref), focusNavigatorWrapperModule (ref), roactNavigationModule (ref)
	local var18 = useTokens()
	local var19 = useGuiInset()
	local var20 = fFlagAXEnableProfileTab and p5.fullBleed == true
	local var21 = p5.showCloseButton ~= false
	local var22 = useProfileCardWidth()
	local var23 = useEditProfileImageLayout({ guiInset = var19 })
	local cutoutFieldOfViewDeg = var23.cutoutFieldOfViewDeg
	local var24 = useEditProfileImageViewModelModule({
		mode = p5.mode,
		onClose = p5.onClose,
		onSaveSuccess = p5.onSaveSuccess,
		cutoutFieldOfViewDeg = cutoutFieldOfViewDeg
	})
	local navigation = var24.navigation
	local emotes = var24.emotes
	local frames = var24.frames
	local preview = var24.preview
	local footer = var24.footer
	local activeView = navigation.activeView
	reactModule.useEffect(function() --[[ line: 194 ]]
		-- upvalues: editProfileImageAnalyticsModule (copy), p5 (ref)
		editProfileImageAnalyticsModule.logPageView({ mode = p5.mode })
	end, { p5.mode })
	local var25 = reactModule.useCallback(function() --[[ line: 198 ]]
		-- upvalues: editProfileImageAnalyticsModule (copy), p5 (ref), activeView (ref), navigation (ref)
		editProfileImageAnalyticsModule.logClose({ mode = p5.mode, activeView = activeView })
		navigation.onLeaveScreen()
	end, { p5.mode, activeView, navigation.onLeaveScreen })
	local onTitleBack = navigation.onTitleBack
	local var26 = if frames.shouldShowUpsell then reactModule.createElement(framesPlusUpsellBarModule, {
		onSubscribeActivated = function() --[[ line: 210 ]]
			-- upvalues: frames (ref)
			frames.onOpenSubscriptionUpsell("banner")
		end
	}) else nil
	local cutoutTopOffset = var23.cutoutTopOffset
	local cutoutSize = var23.cutoutSize
	local previewHeight = var23.previewHeight
	local visiblePreviewHeight = var23.visiblePreviewHeight
	local previewWidth = var23.previewWidth
	local isSplit = var23.mode == "split"
	local var20_1 = var20 or isSplit
	local var29 = if isSplit then math.floor(var23.safeWidth * constantsModule.SplitControlsPaneWidthScale + 0.5) else var22
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
		closeButton = if var21 then reactModule.createElement(view, {
			tag = "position-top-left auto-xy",
			ZIndex = 10,
			Position = if isSplit then UDim2.fromScale(constantsModule.SplitControlsPaneWidthScale, 0) else nil,
			ref = navigation.closeButtonRef,
			padding = {
				top = UDim.new(0, var23.closeButtonTopOffset),
				left = UDim.new(0, var18.Padding.XLarge)
			}
		}, {
			Button = reactModule.createElement(iconButton, {
				isCircular = true,
				icon = iconName.X,
				size = iconSize.Medium,
				variant = buttonVariant.Utility,
				onActivated = var25
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
			renderRecommendedEmotePurchaseFooter = p5.renderRecommendedEmotePurchaseFooter
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
				bannerComponent = var26,
				selectedId = frames.selectedFrameId,
				onSelect = frames.onSelect,
				containerWidth = var29
			}
		}) else reactModule.createElement(view, { tag = "size-full-0", LayoutOrder = 3 }) elseif activeView == "emotes" then reactModule.createElement(expandedEmotesGridContentModule, {
			layoutOrder = 3,
			tileSize = 96,
			containerWidth = var29,
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
			framesBannerComponent = var26
		})
	}
	
	return reactModule.createElement(focusNavigatorWrapperModule, { onClose = navigation.onBack }, {
		NavigationEvents = reactModule.createElement(roactNavigationModule.NavigationEvents, { onDidFocus = navigation.onDidFocus }),
		Root = reactModule.createElement(view, {
			tag = if fFlagAXEnableProfileTab then {
				["bg-surface-0"] = not isSplit,
				["size-full-full"] = true
			} elseif isSplit then "size-full-full" else "size-full-full bg-surface-0",
			Size = if var20_1 then nil else UDim2.new(0, var22, 1, 0)
		}, if isSplit then createSplitLayout(t, previewHeight) else createStackedLayout(t, previewWidth, visiblePreviewHeight))
	})
end

return function(p6) --[[ line: 385 | named "EditProfileImage" ]]
	-- upvalues: reactModule (ref), editProfileImageActionsContextModule (ref), EditProfileImageBody (ref)
	return reactModule.createElement(editProfileImageActionsContextModule.Provider, {
		value = reactModule.useMemo(function() --[[ line: 387 ]]
			-- upvalues: p6 (ref)
			return {
				onOpenEmoteDetails = p6.onOpenEmoteDetails,
				onPrepareRecommendedEmotePurchase = p6.onPrepareRecommendedEmotePurchase,
				onShopForMoreEmotes = p6.onShopForMoreEmotes
			}
		end, {
			p6.onOpenEmoteDetails,
			p6.onPrepareRecommendedEmotePurchase,
			p6.onShopForMoreEmotes
		})
	}, reactModule.createElement(EditProfileImageBody, {
		mode = p6.mode,
		fullBleed = p6.fullBleed,
		showCloseButton = p6.showCloseButton,
		onClose = p6.onClose,
		onSaveSuccess = p6.onSaveSuccess,
		renderRecommendedEmotePurchaseFooter = p6.renderRecommendedEmotePurchaseFooter
	}))
end