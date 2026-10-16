local AvatarExperienceProfilePictureEditor = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor")
local Parent = AvatarExperienceProfilePictureEditor.Parent
local ReactModule = require(Parent.React)
local RoactNavigationModule = require(Parent.RoactNavigation)
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local ScrollView = FoundationModule.ScrollView
local Visibility = FoundationModule.Enums.Visibility
local IconButton = FoundationModule.IconButton
local Text = FoundationModule.Text
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local IconName = FoundationModule.Enums.IconName
local IconSize = FoundationModule.Enums.IconSize
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local FocusNavigatorWrapperModule = require(script.Parent.FocusNavigatorWrapper)
local CombinedCarouselsContentModule = require(script.Parent.CombinedCarouselsContent)
local ExpandedEmotesGridContentModule = require(script.Parent.ExpandedEmotesGridContent)
local AssetGridScrollSectionModule = require(script.Parent.AssetGridScrollSection)
local EditProfileImageFooterModule = require(script.Parent.EditProfileImageFooter)
local EditProfileImageActionsContextModule = require(AvatarExperienceProfilePictureEditor.Context.EditProfileImageActionsContext)
local UseGuiInsetFunction = require(AvatarExperienceProfilePictureEditor.Hooks.useGuiInset).useGuiInset
local UseEditProfileImageLayoutFunction = require(AvatarExperienceProfilePictureEditor.Hooks.useEditProfileImageLayout).useEditProfileImageLayout
local UseEditProfileImageViewModelModule = require(AvatarExperienceProfilePictureEditor.Hooks.useEditProfileImageViewModel)
local FramesPlusUpsellBarModule = require(script.Parent.FramesPlusUpsellBar)
local RobloxPlusUpsellBanner = require(Parent.RobloxSubscriptionPurchaseApp).Components.RobloxPlusUpsellBanner
local FFlagProfileFramesUpsellFreeTrialModule = require(AvatarExperienceProfilePictureEditor.Flags.FFlagProfileFramesUpsellFreeTrial)
local RotatableAvatarPreviewModule = require(script.Parent.RotatableAvatarPreview)
local EnumsModule = require(AvatarExperienceProfilePictureEditor.Common.Enums)
local ConstantsModule = require(AvatarExperienceProfilePictureEditor.Constants)
local TextKeysModule = require(AvatarExperienceProfilePictureEditor.Common.TextKeys)
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagAXEnableProfileTab = SharedFlagsModule.FFlagAXEnableProfileTab
local FFlagEditProfileImageR15UpgradePrompt = SharedFlagsModule.FFlagEditProfileImageR15UpgradePrompt
local EditProfileImageAnalyticsModule = require(AvatarExperienceProfilePictureEditor.Analytics.EditProfileImageAnalytics)

local function renderFramesPlusUpsellBanner(Frame) --[[ Line: 44 ]]
	-- upvalues: ReactModule (copy), FramesPlusUpsellBarModule (copy)
	return ReactModule.createElement(FramesPlusUpsellBarModule, {
		layoutOrder = Frame.LayoutOrder,
		actionText = Frame.actionText,
		onSubscribeActivated = Frame.onActivated
	})
end

local function createSplitLayout(p1, YOffset) --[[ Line: 85 ]]
	-- upvalues: ReactModule (copy), View (copy), ConstantsModule (copy)
	return {
		Preview = ReactModule.createElement(View, {
			tag = "align-x-center position-top-right anchor-top-right",
			ZIndex = 0,
			Size = UDim2.new(1 - ConstantsModule.SplitControlsPaneWidthScale, 0, 0, YOffset)
		}, { AvatarPreview = p1.avatarPreview }),
		LeftPane = ReactModule.createElement(View, {
			tag = "col size-full-full bg-surface-0",
			LayoutOrder = 1,
			ZIndex = 1,
			Size = UDim2.fromScale(ConstantsModule.SplitControlsPaneWidthScale, 1)
		}, {
			Header = p1.header,
			Options = ReactModule.createElement(View, { tag = "col grow size-full-0", LayoutOrder = 2 }, { [p1.activeView] = p1.options }),
			Footer = p1.footer
		}),
		CloseButton = if p1.header then nil else p1.closeButton
	}
end

local function createStackedLayout(p1, XOffset, YOffset) --[[ Line: 119 ]]
	-- upvalues: ReactModule (copy), View (copy), ScrollView (copy), Visibility (copy)
	return {
		StackedContent = ReactModule.createElement(View, { tag = "col size-full-full" }, {
			TitleHeader = p1.header,
			Preview = ReactModule.createElement(View, {
				tag = "col gap-medium size-full-0 auto-y",
				LayoutOrder = 2
			}, {
				ProfilePhotoRow = ReactModule.createElement(View, {
					tag = "align-x-center size-full-0 auto-y",
					LayoutOrder = 1
				}, {
					PreviewClipHost = ReactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						BorderSizePixel = 0,
						ClipsDescendants = true,
						Size = UDim2.fromOffset(XOffset, YOffset)
					}, { AvatarPreview = p1.avatarPreview })
				})
			}),
			ScrollBody = if p1.activeView == "emotes" then ReactModule.createElement(View, {
				testId = "virtualized-emotes-body",
				tag = "col grow size-full-0",
				LayoutOrder = 3
			}, { Emotes = p1.options }) else ReactModule.createElement(ScrollView, {
				testId = "portrait-scroll-body",
				tag = "grow size-full-0",
				LayoutOrder = 3,
				selection = { Selectable = false },
				scroll = {
					ScrollingDirection = Enum.ScrollingDirection.Y,
					AutomaticCanvasSize = Enum.AutomaticSize.Y,
					CanvasSize = UDim2.fromScale(0, 0),
					scrollBarVisibility = Visibility.Auto
				}
			}, {
				Content = ReactModule.createElement(View, { tag = "col size-full-0 auto-y" }, { [p1.activeView] = p1.options })
			}),
			Footer = p1.footer
		}),
		CloseButton = p1.closeButton
	}
end

local function EditProfileImageBody(p1) --[[ Line: 197 ]]
	-- upvalues: UseTokensFunction (copy), UseGuiInsetFunction (copy), TextKeysModule (copy), FFlagProfileFramesUpsellFreeTrialModule (copy), UseLocalizationFunction (copy), UseEditProfileImageLayoutFunction (copy), UseEditProfileImageViewModelModule (copy), FFlagEditProfileImageR15UpgradePrompt (copy), ReactModule (copy), EditProfileImageAnalyticsModule (copy), EnumsModule (copy), RobloxPlusUpsellBanner (copy), renderFramesPlusUpsellBanner (copy), FramesPlusUpsellBarModule (copy), ConstantsModule (copy), AssetGridScrollSectionModule (copy), IconName (copy), View (copy), ExpandedEmotesGridContentModule (copy), CombinedCarouselsContentModule (copy), EditProfileImageFooterModule (copy), RotatableAvatarPreviewModule (copy), IconButton (copy), IconSize (copy), ButtonVariant (copy), FoundationModule (copy), Text (copy), createSplitLayout (copy), createStackedLayout (copy), FocusNavigatorWrapperModule (copy), RoactNavigationModule (copy), FFlagAXEnableProfileTab (copy)
	local UseTokensResult = UseTokensFunction()
	local UseGuiInsetResult = UseGuiInsetFunction()
	local config = { editProfilePicture = TextKeysModule.EditProfilePicture }
	
	if FFlagProfileFramesUpsellFreeTrialModule then
		config.profileFramesUnlockBanner = TextKeysModule.ProfileFramesUnlockBanner
		config.subscribe = TextKeysModule.Subscribe
		config.tryItForFree = TextKeysModule.TryItForFree
	end
	local UseLocalizationResult = UseLocalizationFunction(config)
	local IsShowCloseButton = p1.showCloseButton ~= false
	local UseEditProfileImageLayoutResult = UseEditProfileImageLayoutFunction({ guiInset = UseGuiInsetResult })
	local CutoutFieldOfViewDeg = UseEditProfileImageLayoutResult.cutoutFieldOfViewDeg
	local UseEditProfileImageViewModelModuleResult = UseEditProfileImageViewModelModule({
		mode = p1.mode,
		initialFrameAssetId = p1.initialFrameAssetId,
		initialFrameSelectionRequestId = p1.initialFrameSelectionRequestId,
		onClose = p1.onClose,
		onSaveSuccess = p1.onSaveSuccess,
		cutoutFieldOfViewDeg = CutoutFieldOfViewDeg
	})
	local Navigation = UseEditProfileImageViewModelModuleResult.navigation
	local Emotes = UseEditProfileImageViewModelModuleResult.emotes
	local Frames = UseEditProfileImageViewModelModuleResult.frames
	local Preview = UseEditProfileImageViewModelModuleResult.preview
	local Footer = UseEditProfileImageViewModelModuleResult.footer
	local ActiveView = Navigation.activeView
	local OnSelect = Emotes.onSelect
	
	if FFlagEditProfileImageR15UpgradePrompt then
		local AccountRigType = p1.accountRigType
		OnSelect = ReactModule.useCallback(function(SelectedEmoteId) --[[ Line: 235 ]]
			-- upvalues: p1 (copy), AccountRigType (copy), Emotes (copy)
			local OnPromptR15UpgradeFunction: (any) -> () = p1.onPromptR15Upgrade
			
			if AccountRigType == Enum.HumanoidRigType.R6 and SelectedEmoteId ~= Emotes.selectedEmoteId and OnPromptR15UpgradeFunction then
				OnPromptR15UpgradeFunction(function() --[[ Line: 242 ]]
					-- upvalues: Emotes (upval), SelectedEmoteId (copy)
					Emotes.onSelect(SelectedEmoteId)
				end)
				
				return
			else
				Emotes.onSelect(SelectedEmoteId)
			end
		end, {
			AccountRigType,
			Emotes.selectedEmoteId,
			Emotes.onSelect,
			p1.onPromptR15Upgrade
		})
	end
	ReactModule.useEffect(function() --[[ Line: 258 ]]
		-- upvalues: EditProfileImageAnalyticsModule (upval), p1 (copy)
		EditProfileImageAnalyticsModule.logPageView({ mode = p1.mode })
	end, { p1.mode })
	local UseResult = ReactModule.useCallback(function() --[[ Line: 262 ]]
		-- upvalues: EditProfileImageAnalyticsModule (upval), p1 (copy), ActiveView (copy), Navigation (copy)
		EditProfileImageAnalyticsModule.logClose({ mode = p1.mode, activeView = ActiveView })
		Navigation.onLeaveScreen()
	end, { p1.mode, ActiveView, Navigation.onLeaveScreen })
	local IsModeMatch = p1.mode == EnumsModule.EditProfileImageMode.FramesOnly
	local Element = if Frames.shouldShowUpsell then if FFlagProfileFramesUpsellFreeTrialModule then ReactModule.createElement(RobloxPlusUpsellBanner, {
		showPlusIcon = true,
		testId = "FramesPlusUpsellBar",
		message = UseLocalizationResult.profileFramesUnlockBanner,
		subscribeText = UseLocalizationResult.subscribe,
		freeTrialText = UseLocalizationResult.tryItForFree,
		onActivated = function() --[[ Line: 278 ]]
			-- upvalues: Frames (copy)
			Frames.onOpenSubscriptionUpsell("banner")
		end,
		renderBanner = renderFramesPlusUpsellBanner
	}) else ReactModule.createElement(FramesPlusUpsellBarModule, {
		onSubscribeActivated = function() --[[ Line: 286 ]]
			-- upvalues: Frames (copy)
			Frames.onOpenSubscriptionUpsell("banner")
		end
	}) else nil
	local PreviewHeight = UseEditProfileImageLayoutResult.previewHeight
	local VisiblePreviewHeight = UseEditProfileImageLayoutResult.visiblePreviewHeight
	local PreviewWidth = UseEditProfileImageLayoutResult.previewWidth
	local IsSplit = UseEditProfileImageLayoutResult.mode == "split"
	local Floored = if IsSplit then math.floor(UseEditProfileImageLayoutResult.safeWidth * ConstantsModule.SplitControlsPaneWidthScale + 0.5) else UseEditProfileImageLayoutResult.safeWidth
	local CloseButtonTopOffset = UseEditProfileImageLayoutResult.closeButtonTopOffset
	local UseResult1 = if IsModeMatch then if IsSplit then UseResult else nil else Navigation.onTitleBack
	local NoOnTitleBack: boolean = not IsModeMatch and not Navigation.onTitleBack
	local NoOnTitleBack1: boolean = IsShowCloseButton and (not IsSplit and (NoOnTitleBack or IsModeMatch))
	local Element1 = ReactModule.createElement(IconButton, {
		isCircular = true,
		icon = if IsModeMatch then IconName.ChevronLargeLeft else IconName.X,
		size = IconSize.Medium,
		variant = ButtonVariant.Utility,
		onActivated = UseResult
	})
	local HeaderBar = FoundationModule.HeaderBar
	local config1 = {
		activeView = ActiveView,
		avatarPreview = ReactModule.createElement(RotatableAvatarPreviewModule, {
			fillContainer = false,
			userId = Preview.localUserId or "",
			width = PreviewWidth,
			height = PreviewHeight,
			cutoutSize = UseEditProfileImageLayoutResult.cutoutSize,
			cutoutTopOffset = UseEditProfileImageLayoutResult.cutoutTopOffset,
			isCameraControlBarDisabled = not IsSplit,
			fieldOfViewDeg = ConstantsModule.CameraFieldOfViewDeg,
			fieldOfViewForDistanceScaleDeg = CutoutFieldOfViewDeg,
			distanceScale = Preview.distanceScale,
			committedYRotDeg = Preview.yRotDeg,
			emoteAssetId = Emotes.selectedEmoteId,
			rigTypeOverride = if FFlagEditProfileImageR15UpgradePrompt then p1.accountRigType else nil,
			frameImage = Frames.selectedImage,
			onYRotDegChanged = Preview.onYRotDegChanged,
			onDistanceScaleChanged = Preview.onDistanceScaleChanged
		}),
		closeButton = if NoOnTitleBack1 then ReactModule.createElement(View, {
			tag = "position-top-left auto-xy",
			ZIndex = 10,
			Position = if IsSplit then UDim2.fromScale(ConstantsModule.SplitControlsPaneWidthScale, 0) else nil,
			ref = Navigation.closeButtonRef,
			padding = {
				top = UDim.new(0, CloseButtonTopOffset),
				left = UDim.new(0, UseTokensResult.Padding.XLarge)
			}
		}, { Button = Element1 }) else nil,
		header = if IsSplit and NoOnTitleBack and IsShowCloseButton then ReactModule.createElement(View, {
			tag = "size-full-0 auto-y",
			LayoutOrder = 1,
			ref = Navigation.closeButtonRef
		}, {
			Bar = ReactModule.createElement(HeaderBar.Root, nil, {
				Leading = ReactModule.createElement(HeaderBar.Leading, nil, {
					Actions = ReactModule.createElement(HeaderBar.Actions, {
						actions = {
							{ id = "close", icon = IconName.X, onActivated = UseResult }
						}
					}),
					Title = ReactModule.createElement(Text, {
						tag = "auto-xy text-heading-small content-emphasis",
						Text = UseLocalizationResult.editProfilePicture
					})
				})
			})
		}) else nil,
		footer = ReactModule.createElement(EditProfileImageFooterModule, {
			layoutOrder = 4,
			footerCta = Footer.cta,
			isSaving = Footer.isSaving,
			localizedSubscribeLabel = Footer.subscribeLabel,
			localizedSaveLabel = Footer.saveLabel,
			selectedEmoteId = Emotes.selectedEmoteId,
			onSave = Footer.onSave,
			onOpenProfileFramesSubscriptionUpsell = Frames.onOpenSubscriptionUpsell,
			renderRecommendedEmotePurchaseFooter = p1.renderRecommendedEmotePurchaseFooter
		}),
		options = if ActiveView == "frames" then if Frames.show then ReactModule.createElement(AssetGridScrollSectionModule, {
			layoutOrder = 3,
			title = Frames.localizedTitle,
			titleLeadingIconName = IconName.RobloxPlus,
			onTitleBack = UseResult1,
			useInternalScroll = IsSplit,
			gridProps = {
				tileSize = 96,
				items = Frames.items,
				isLoading = Frames.isLoading,
				hasError = Frames.hasError,
				onRetry = Frames.onRetry,
				bannerComponent = Element,
				selectedId = Frames.selectedFrameId,
				onSelect = Frames.onSelect,
				containerWidth = Floored
			}
		}) else ReactModule.createElement(View, { tag = "size-full-0", LayoutOrder = 3 }) elseif ActiveView == "emotes" then ReactModule.createElement(ExpandedEmotesGridContentModule, {
			layoutOrder = 3,
			tileSize = 96,
			containerWidth = Floored,
			onTitleBack = UseResult1,
			useInternalScroll = IsSplit,
			ownedEmoteItems = Emotes.ownedItems,
			recommendedEmoteItems = Emotes.recommendedItems,
			emotesLoading = Emotes.isLoading,
			emotesError = Emotes.hasError,
			hasMoreEmotes = Emotes.hasMore,
			isLoadingMoreEmotes = Emotes.isLoadingMore,
			hasLoadMoreEmotesError = Emotes.hasLoadMoreError,
			onMoreEmotes = Emotes.onMore,
			onRetryEmotes = Emotes.onRetry,
			selectedEmoteId = Emotes.selectedEmoteId,
			onSelectEmote = OnSelect
		}) else ReactModule.createElement(CombinedCarouselsContentModule, {
			layoutOrder = 3,
			tileSize = 96,
			showFrames = Frames.show,
			useInternalScroll = IsSplit,
			emoteItems = Emotes.items,
			emotesLoading = Emotes.isLoading,
			emotesError = Emotes.hasError,
			onRetryEmotes = Emotes.onRetry,
			selectedEmoteId = Emotes.selectedEmoteId,
			onSelectEmote = OnSelect,
			onExpandEmotes = Navigation.onExpandEmotes,
			frameItems = Frames.items,
			framesLoading = Frames.isLoading,
			framesError = Frames.hasError,
			onRetryFrames = Frames.onRetry,
			selectedFrameId = Frames.selectedFrameId,
			onSelectFrame = Frames.onSelect,
			onExpandFrames = Navigation.onExpandFrames,
			framesBannerComponent = Element
		})
	}
	
	return ReactModule.createElement(FocusNavigatorWrapperModule, { onClose = Navigation.onBack }, {
		NavigationEvents = ReactModule.createElement(RoactNavigationModule.NavigationEvents, { onDidFocus = Navigation.onDidFocus }),
		Root = ReactModule.createElement(View, {
			tag = if FFlagAXEnableProfileTab then {
				["bg-surface-0"] = not IsSplit,
				["size-full-full"] = true
			} elseif IsSplit then "size-full-full" else "size-full-full bg-surface-0"
		}, if IsSplit then createSplitLayout(config1, PreviewHeight) else createStackedLayout(config1, PreviewWidth, VisiblePreviewHeight))
	})
end

return function(p1) --[[ Line: 499 | Named "EditProfileImage" ]]
	-- upvalues: ReactModule (copy), EditProfileImageActionsContextModule (copy), EditProfileImageBody (copy)
	return ReactModule.createElement(EditProfileImageActionsContextModule.Provider, {
		value = ReactModule.useMemo(function() --[[ Line: 501 ]]
			-- upvalues: p1 (copy)
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
	}, ReactModule.createElement(EditProfileImageBody, {
		mode = p1.mode,
		initialFrameAssetId = p1.initialFrameAssetId,
		initialFrameSelectionRequestId = p1.initialFrameSelectionRequestId,
		showCloseButton = p1.showCloseButton,
		onClose = p1.onClose,
		onSaveSuccess = p1.onSaveSuccess,
		onPromptR15Upgrade = p1.onPromptR15Upgrade,
		accountRigType = p1.accountRigType,
		renderRecommendedEmotePurchaseFooter = p1.renderRecommendedEmotePurchaseFooter
	}))
end