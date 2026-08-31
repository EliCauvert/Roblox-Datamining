local avatarExperienceProfilePictureEditor = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor")
local parent = avatarExperienceProfilePictureEditor.Parent
local reactModule = require(parent.React)
local roactNavigationModule = require(parent.RoactNavigation)
local foundationModule = require(parent.Foundation)
local view = foundationModule.View
local scrollView = foundationModule.ScrollView
local visibility = foundationModule.Enums.Visibility
local iconButton = foundationModule.IconButton
local text = foundationModule.Text
local buttonVariant = foundationModule.Enums.ButtonVariant
local iconName = foundationModule.Enums.IconName
local iconSize = foundationModule.Enums.IconSize
local useTokens = foundationModule.Hooks.useTokens
local useLocalization = require(parent.Localization).Hooks.useLocalization
local focusNavigatorWrapperModule = require(script.Parent.FocusNavigatorWrapper)
local combinedCarouselsContentModule = require(script.Parent.CombinedCarouselsContent)
local expandedEmotesGridContentModule = require(script.Parent.ExpandedEmotesGridContent)
local assetGridScrollSectionModule = require(script.Parent.AssetGridScrollSection)
local editProfileImageFooterModule = require(script.Parent.EditProfileImageFooter)
local editProfileImageActionsContextModule = require(avatarExperienceProfilePictureEditor.Context.EditProfileImageActionsContext)
local useGuiInset = require(avatarExperienceProfilePictureEditor.Hooks.useGuiInset).useGuiInset
local useEditProfileImageLayout = require(avatarExperienceProfilePictureEditor.Hooks.useEditProfileImageLayout).useEditProfileImageLayout
local useEditProfileImageViewModelModule = require(avatarExperienceProfilePictureEditor.Hooks.useEditProfileImageViewModel)
local framesPlusUpsellBarModule = require(script.Parent.FramesPlusUpsellBar)
local rotatableAvatarPreviewModule = require(script.Parent.RotatableAvatarPreview)
local enumsModule = require(avatarExperienceProfilePictureEditor.Common.Enums)
local constantsModule = require(avatarExperienceProfilePictureEditor.Constants)
local textKeysModule = require(avatarExperienceProfilePictureEditor.Common.TextKeys)
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
			Header = p1.header,
			Options = reactModule.createElement(view, { tag = "col grow size-full-0", LayoutOrder = 2 }, { [p1.activeView] = p1.options }),
			Footer = p1.footer
		}),
		CloseButton = if not p1.header then p1.closeButton else nil
	}
end

local function createStackedLayout(p1, p2, p3)
	-- upvalues: reactModule (ref), view (ref), scrollView (ref), visibility (ref)
	return {
		StackedContent = reactModule.createElement(view, { tag = "col size-full-full" }, {
			TitleHeader = p1.header,
			Preview = reactModule.createElement(view, {
				tag = "col gap-medium size-full-0 auto-y",
				LayoutOrder = 2
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
				LayoutOrder = 3
			}, { Emotes = p1.options }) else reactModule.createElement(scrollView, {
				testId = "portrait-scroll-body",
				tag = "grow size-full-0",
				LayoutOrder = 3,
				selection = { Selectable = false },
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
	-- upvalues: useTokens (ref), useGuiInset (ref), useLocalization (ref), textKeysModule (ref), useEditProfileImageLayout (ref), useEditProfileImageViewModelModule (ref), reactModule (ref), editProfileImageAnalyticsModule (ref), enumsModule (ref), framesPlusUpsellBarModule (ref), constantsModule (ref), assetGridScrollSectionModule (ref), iconName (ref), view (ref), expandedEmotesGridContentModule (ref), combinedCarouselsContentModule (ref), editProfileImageFooterModule (ref), rotatableAvatarPreviewModule (ref), iconButton (ref), iconSize (ref), buttonVariant (ref), foundationModule (ref), text (ref), createSplitLayout (ref), createStackedLayout (ref), focusNavigatorWrapperModule (ref), roactNavigationModule (ref), fFlagAXEnableProfileTab (ref)
	local var1 = useTokens()
	local var2 = useGuiInset()
	local var3 = useLocalization({ editProfilePicture = textKeysModule.EditProfilePicture })
	local var4 = p1.showCloseButton ~= false
	local var5 = useEditProfileImageLayout({ guiInset = var2 })
	local cutoutFieldOfViewDeg = var5.cutoutFieldOfViewDeg
	local var6 = useEditProfileImageViewModelModule({
		mode = p1.mode,
		onClose = p1.onClose,
		onSaveSuccess = p1.onSaveSuccess,
		cutoutFieldOfViewDeg = cutoutFieldOfViewDeg
	})
	local navigation = var6.navigation
	local emotes = var6.emotes
	local frames = var6.frames
	local preview = var6.preview
	local footer = var6.footer
	local activeView = navigation.activeView
	reactModule.useEffect(function()
		-- upvalues: editProfileImageAnalyticsModule (copy), p1 (ref)
		editProfileImageAnalyticsModule.logPageView({ mode = p1.mode })
	end, { p1.mode })
	local var7 = reactModule.useCallback(function()
		-- upvalues: editProfileImageAnalyticsModule (copy), p1 (ref), activeView (ref), navigation (ref)
		editProfileImageAnalyticsModule.logClose({ mode = p1.mode, activeView = activeView })
		navigation.onLeaveScreen()
	end, { p1.mode, activeView, navigation.onLeaveScreen })
	local var8 = p1.mode == enumsModule.EditProfileImageMode.FramesOnly
	local var9 = if frames.shouldShowUpsell then reactModule.createElement(framesPlusUpsellBarModule, {
		onSubscribeActivated = function()
			-- upvalues: frames (ref)
			frames.onOpenSubscriptionUpsell("banner")
		end
	}) else nil
	local cutoutTopOffset = var5.cutoutTopOffset
	local cutoutSize = var5.cutoutSize
	local previewHeight = var5.previewHeight
	local visiblePreviewHeight = var5.visiblePreviewHeight
	local previewWidth = var5.previewWidth
	local isSplit = var5.mode == "split"
	local var10 = if isSplit then math.floor(var5.safeWidth * constantsModule.SplitControlsPaneWidthScale + 0.5) else var5.safeWidth
	local closeButtonTopOffset = var5.closeButtonTopOffset
	local var11 = if var8 then if isSplit then var7 else nil else navigation.onTitleBack
	local var12 = if activeView == "frames" then if frames.show then reactModule.createElement(assetGridScrollSectionModule, {
		layoutOrder = 3,
		title = frames.localizedTitle,
		titleLeadingIconName = iconName.RobloxPlus,
		onTitleBack = var11,
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
			containerWidth = var10
		}
	}) else reactModule.createElement(view, { tag = "size-full-0", LayoutOrder = 3 }) elseif activeView == "emotes" then reactModule.createElement(expandedEmotesGridContentModule, {
		layoutOrder = 3,
		tileSize = 96,
		containerWidth = var10,
		onTitleBack = var11,
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
	local var13 = reactModule.createElement(editProfileImageFooterModule, {
		layoutOrder = 4,
		footerCta = footer.cta,
		isSaving = footer.isSaving,
		localizedSubscribeLabel = footer.subscribeLabel,
		localizedSaveLabel = footer.saveLabel,
		selectedEmoteId = emotes.selectedEmoteId,
		onSave = footer.onSave,
		onOpenProfileFramesSubscriptionUpsell = frames.onOpenSubscriptionUpsell,
		renderRecommendedEmotePurchaseFooter = p1.renderRecommendedEmotePurchaseFooter
	})
	local var14 = reactModule.createElement(rotatableAvatarPreviewModule, {
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
	})
	local var15 = not var8 and not navigation.onTitleBack
	local headerBar = foundationModule.HeaderBar
	local t = {
		activeView = activeView,
		avatarPreview = var14,
		closeButton = if var4 and (not isSplit and (var15 or var8)) then reactModule.createElement(view, {
			tag = "position-top-left auto-xy",
			ZIndex = 10,
			Position = if isSplit then UDim2.fromScale(constantsModule.SplitControlsPaneWidthScale, 0) else nil,
			ref = navigation.closeButtonRef,
			padding = {
				top = UDim.new(0, closeButtonTopOffset),
				left = UDim.new(0, var1.Padding.XLarge)
			}
		}, {
			Button = reactModule.createElement(iconButton, {
				isCircular = true,
				icon = if var8 then iconName.ChevronLargeLeft else iconName.X,
				size = iconSize.Medium,
				variant = buttonVariant.Utility,
				onActivated = var7
			})
		}) else nil,
		header = if isSplit and var15 and var4 then reactModule.createElement(view, {
			tag = "size-full-0 auto-y",
			LayoutOrder = 1,
			ref = navigation.closeButtonRef
		}, {
			Bar = reactModule.createElement(headerBar.Root, nil, {
				Leading = reactModule.createElement(headerBar.Leading, nil, {
					Actions = reactModule.createElement(headerBar.Actions, {
						actions = { { id = "close", icon = iconName.X, onActivated = var7 } }
					}),
					Title = reactModule.createElement(text, {
						tag = "auto-xy text-heading-small content-emphasis",
						Text = var3.editProfilePicture
					})
				})
			})
		}) else nil,
		footer = var13,
		options = var12
	}
	
	return reactModule.createElement(focusNavigatorWrapperModule, { onClose = navigation.onBack }, {
		NavigationEvents = reactModule.createElement(roactNavigationModule.NavigationEvents, { onDidFocus = navigation.onDidFocus }),
		Root = reactModule.createElement(view, {
			tag = if fFlagAXEnableProfileTab then {
				["bg-surface-0"] = not isSplit,
				["size-full-full"] = true
			} elseif isSplit then "size-full-full" else "size-full-full bg-surface-0"
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
		showCloseButton = p1.showCloseButton,
		onClose = p1.onClose,
		onSaveSuccess = p1.onSaveSuccess,
		renderRecommendedEmotePurchaseFooter = p1.renderRecommendedEmotePurchaseFooter
	}))
end