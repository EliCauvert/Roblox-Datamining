local serverDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local parent = serverDrivenUi.Parent
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local tModule = require(parent.t)
local collectionItemSize = require(parent.CollectionViews).CollectionViewTypes.CollectionItemSize
local itemHeightModeModule = require(serverDrivenUi.Content.Collections.ItemHeightMode)
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local sduiComponentType = sduiCoreSystemModule.SduiComponentType
local sduiParsers = sduiCoreSystemModule.SduiParsers
local getSduiComponentRegistry = sduiCoreSystemModule.getSduiComponentRegistry
local fFlagSduiExperienceDetailsSupport = require(parent.SharedFlags).FFlagSduiExperienceDetailsSupport
local fFlagLuaAppResetHoverOnSduiPlayButtonActivation = require(parent.SharedFlags).FFlagLuaAppResetHoverOnSduiPlayButtonActivation
local fFlagSduiGlobalRegistryFallback = require(parent.SharedFlags).FFlagSduiGlobalRegistryFallback
local fFlagLuaAppRespectClipAncestorImpressions = require(parent.SharedFlags).FFlagLuaAppRespectClipAncestorImpressions
local parseCallbackProp = sduiParsers.parseCallbackProp_
local parseUiComponentProp = sduiParsers.parseUiComponentProp_
local parseLazyUiComponentProp = sduiParsers.parseLazyUiComponentProp_
local parseIntegerProp = sduiParsers.parseIntegerProp_
local parseNumberProp = sduiParsers.parseNumberProp_
local parseUDim2Prop = sduiParsers.parseUDim2Prop_
local parseUDimProp = sduiParsers.parseUDimProp_
local parseImageStringProp = sduiParsers.parseImageStringProp_
local parseVector2Prop = sduiParsers.parseVector2Prop_
local parseColor3Prop = sduiParsers.parseColor3Prop_
local parseBooleanProp = sduiParsers.parseBooleanProp_
local parseGradientProp = sduiParsers.parseGradientProp_
local parseIconProp = sduiParsers.parseIconProp_
local parseTypographyTokenProp = sduiParsers.parseTypographyTokenProp_
local parseColorTokenProp = sduiParsers.parseColorTokenProp_
local parseImageSetOrImageProp = sduiParsers.parseImageSetOrImageProp_
local parseStringProp = sduiParsers.parseStringProp_
local parseFocusNavActionsProp = sduiParsers.parseFocusNavActionsProp_
local getArrayMetatableParser = sduiParsers.getArrayMetatableParser
local getEngineEnumParser = sduiParsers.getEngineEnumParser
local getLuaTableEnumParser = sduiParsers.getLuaTableEnumParser
local sduiBadgeComponent = game:DefineFastFlag("SduiBadgeComponent", false)
local fFlagSduiTileDisableLegacyHover = require(serverDrivenUi.Flags).FFlagSduiTileDisableLegacyHover
local fFlagSduiEnableHeroUnitBottomRow = require(serverDrivenUi.Flags).FFlagSduiEnableHeroUnitBottomRow
local fFlagSduiEnableAssociatedItemsRow = require(parent.SharedFlags).FFlagSduiEnableAssociatedItemsRow
local fFlagSduiAttributionRowV2 = require(parent.SharedFlags).FFlagSduiAttributionRowV2
local fFlagSduiExperienceDetailsSocialProof = require(parent.SharedFlags).FFlagSduiExperienceDetailsSocialProof
local fFlagSduiChipAccessoryProps = require(parent.SharedFlags).FFlagSduiChipAccessoryProps
local fFlagSduiCollectionCarouselOverrides = require(parent.SharedFlags).FFlagSduiCollectionCarouselOverrides
local fFlagSduiChartsSupport = require(parent.SharedFlags).FFlagSduiChartsSupport
local fFlagLuaAppDismissUnlockUpsell = require(parent.SharedFlags).FFlagLuaAppDismissUnlockUpsell
local fFlagSduiTileBottomButton = require(parent.SharedFlags).FFlagSduiTileBottomButton
local fFlagSduiTileHoldAction = require(parent.SharedFlags).FFlagSduiTileHoldAction
local fFlagLuaAppSduiPlaceholderSupport = require(parent.SharedFlags).FFlagLuaAppSduiPlaceholderSupport
local fFlagSduiOptionSelectorCollection = require(parent.SharedFlags).FFlagSduiOptionSelectorCollection
local fFlagSduiCollectionCarouselPlaceholderItem = require(parent.SharedFlags).FFlagSduiCollectionCarouselPlaceholderItem
local t = {}
local t_1 = {}
t_1.__index = t_1

function t_1.new() --[[ line: 89 ]]
	-- upvalues: parseVector2Prop (ref), getEngineEnumParser (ref), parseColor3Prop (ref), parseNumberProp (ref), parseIntegerProp (ref), parseUDim2Prop (ref), cryoModule (ref), parseBooleanProp (ref), parseStringProp (ref), sduiComponentType (ref), parent (ref), fFlagSduiAttributionRowV2 (ref), parseCallbackProp (ref), parseUiComponentProp (ref), parseTypographyTokenProp (ref), parseColorTokenProp (ref), getLuaTableEnumParser (ref), foundationModule (ref), parseImageStringProp (ref), tModule (ref), parseIconProp (ref), parseUDimProp (ref), serverDrivenUi (ref), collectionItemSize (ref), itemHeightModeModule (ref), fFlagSduiCollectionCarouselOverrides (ref), fFlagLuaAppRespectClipAncestorImpressions (ref), getArrayMetatableParser (ref), parseLazyUiComponentProp (ref), fFlagLuaAppSduiPlaceholderSupport (ref), fFlagSduiCollectionCarouselPlaceholderItem (ref), fFlagSduiOptionSelectorCollection (ref), parseFocusNavActionsProp (ref), reactModule (ref), parseGradientProp (ref), fFlagSduiExperienceDetailsSupport (ref), fFlagLuaAppResetHoverOnSduiPlayButtonActivation (ref), parseImageSetOrImageProp (ref), fFlagSduiTileDisableLegacyHover (ref), fFlagSduiTileBottomButton (ref), fFlagSduiTileHoldAction (ref), fFlagSduiEnableHeroUnitBottomRow (ref), fFlagSduiChipAccessoryProps (ref), fFlagSduiEnableAssociatedItemsRow (ref), fFlagSduiExperienceDetailsSocialProof (ref), fFlagSduiChartsSupport (ref), sduiBadgeComponent (ref), fFlagLuaAppDismissUnlockUpsell (ref), t_1 (ref)
	local t = {
		anchorPoint = parseVector2Prop,
		automaticSize = getEngineEnumParser(Enum.AutomaticSize),
		backgroundColor3 = parseColor3Prop,
		backgroundTransparency = parseNumberProp,
		layoutOrder = parseIntegerProp,
		position = parseUDim2Prop,
		size = parseUDim2Prop,
		zIndex = parseNumberProp
	}
	local t_2 = {
		columnGap = parseNumberProp,
		sideMargin = parseNumberProp,
		numColumns = parseNumberProp,
		fractionalItemAmount = parseNumberProp,
		loadMoreThreshold = parseNumberProp,
		verticalGap = parseNumberProp
	}
	local t_3 = {
		_registeredComponents = {
			[sduiComponentType.AttributionRow] = {
				component = require(parent.SduiSharedContent).SduiAttributionRow,
				propParsers = {
					layoutOrder = parseIntegerProp,
					position = parseUDim2Prop,
					size = if fFlagSduiAttributionRowV2 then parseUDim2Prop else nil,
					onActivated = parseCallbackProp,
					rightButtonContent = parseUiComponentProp,
					title = if fFlagSduiAttributionRowV2 then parseStringProp else nil,
					titleFontStyle = if fFlagSduiAttributionRowV2 then parseTypographyTokenProp else nil,
					titleTextColor = if fFlagSduiAttributionRowV2 then parseColorTokenProp else nil,
					subtitle = if fFlagSduiAttributionRowV2 then parseStringProp else nil,
					subtitleFontStyle = if fFlagSduiAttributionRowV2 then parseTypographyTokenProp else nil,
					subtitleTextColor = if fFlagSduiAttributionRowV2 then parseColor3Prop else nil,
					subtitleIconName = if fFlagSduiAttributionRowV2 then getLuaTableEnumParser(foundationModule.Enums.IconName, "string") else nil,
					subtitleIconSize = if fFlagSduiAttributionRowV2 then getLuaTableEnumParser(foundationModule.Enums.IconSize, "string") else nil,
					subtitleIconStyle = if fFlagSduiAttributionRowV2 then parseColorTokenProp else nil,
					subtitleIconVariant = if fFlagSduiAttributionRowV2 then getLuaTableEnumParser(foundationModule.Enums.IconVariant, "string") else nil,
					subtitleBackgroundIconName = if fFlagSduiAttributionRowV2 then getLuaTableEnumParser(foundationModule.Enums.IconName, "string") else nil,
					subtitleBackgroundIconStyle = if fFlagSduiAttributionRowV2 then parseColorTokenProp else nil,
					subtitleOnActivated = if fFlagSduiAttributionRowV2 then parseCallbackProp else nil,
					caption = if fFlagSduiAttributionRowV2 then parseStringProp else nil,
					captionTextColor = if fFlagSduiAttributionRowV2 then parseColorTokenProp else nil,
					captionFontStyle = if fFlagSduiAttributionRowV2 then parseTypographyTokenProp else nil,
					textContainerSize = if fFlagSduiAttributionRowV2 then parseUDim2Prop else nil,
					image = parseImageStringProp,
					imageSize = if fFlagSduiAttributionRowV2 then parseUDim2Prop else nil
				},
				propInterface = if fFlagSduiAttributionRowV2 then { title = tModule.string, subtitle = tModule.string } else nil
			},
			[sduiComponentType.Button] = {
				component = require(parent.SduiSharedContent).SduiButton,
				propParsers = {
					anchorPoint = parseVector2Prop,
					cursorType = getLuaTableEnumParser(foundationModule.Enums.CursorType, "string"),
					fillBehavior = getLuaTableEnumParser(foundationModule.Enums.FillBehavior, "string"),
					icon = parseIconProp,
					inputDelay = parseNumberProp,
					isDisabled = parseBooleanProp,
					isLoading = parseBooleanProp,
					layoutOrder = parseIntegerProp,
					onActivated = parseCallbackProp,
					position = parseUDim2Prop,
					selectable = parseBooleanProp,
					size = getLuaTableEnumParser(foundationModule.Enums.InputSize, "string"),
					tag = parseStringProp,
					testId = parseStringProp,
					text = parseStringProp,
					variant = getLuaTableEnumParser(foundationModule.Enums.ButtonVariant, "string"),
					visible = parseBooleanProp,
					width = parseUDimProp,
					zIndex = parseNumberProp
				}
			},
			[sduiComponentType.CollectionCarousel] = {
				component = require(serverDrivenUi.Content.Collections.SduiCollectionCarousel),
				propParsers = {
					anchorPoint = parseVector2Prop,
					position = parseUDim2Prop,
					size = parseUDim2Prop,
					collectionItemSize = getLuaTableEnumParser(collectionItemSize, "string"),
					itemHeightFromWidth = parseUDimProp,
					headerComponent = parseUiComponentProp,
					itemHeightMode = getLuaTableEnumParser(itemHeightModeModule, "string"),
					layoutOverrides = t_2,
					numColumnsOverride = if fFlagSduiCollectionCarouselOverrides then parseNumberProp else nil,
					scrollingEnabledOverride = parseBooleanProp,
					maxItemsToShow = parseNumberProp,
					shouldUseFrameBoundsForImpressions = parseBooleanProp,
					respectClipAncestors = if fFlagLuaAppRespectClipAncestorImpressions then parseBooleanProp else nil,
					backgroundMuralUrl = parseImageStringProp,
					onScrollToEnd = parseCallbackProp,
					scrollThresholdFromEnd = parseNumberProp,
					itemTemplateKey = parseStringProp,
					focusNavActionsComponent = parseUiComponentProp,
					disableSelectionOrder = parseBooleanProp,
					numItemsToRenderOffScreen = parseNumberProp,
					items = getArrayMetatableParser(parseLazyUiComponentProp),
					impressionEventName = parseStringProp,
					skipItemImpressionsLog = parseBooleanProp,
					enableHoverOverflow = parseBooleanProp
				}
			},
			[sduiComponentType.VariableItemWidthCarousel] = {
				component = require(serverDrivenUi.Content.Collections.SduiVariableItemWidthCarousel)
			},
			[sduiComponentType.CollectionCarouselPlaceholder] = if fFlagLuaAppSduiPlaceholderSupport then {
				component = require(serverDrivenUi.Content.Collections.SduiCollectionCarouselPlaceholder)
			} else nil,
			[sduiComponentType.PlaceholderTile] = if fFlagSduiCollectionCarouselPlaceholderItem then {
				component = require(parent.SduiSharedContent).SduiPlaceholderTile
			} else nil,
			[sduiComponentType.OptionSelectorCollection] = if fFlagSduiOptionSelectorCollection then {
				component = require(serverDrivenUi.Content.Collections.SduiOptionSelectorCollection)
			} else nil,
			[sduiComponentType.CollectionGrid] = {
				component = require(serverDrivenUi.Content.Collections.SduiCollectionGrid),
				propParsers = {
					anchorPoint = parseVector2Prop,
					position = parseUDim2Prop,
					size = parseUDim2Prop,
					bufferRowsBelowScreen = parseNumberProp,
					bufferRowsAboveScreen = parseNumberProp,
					collectionItemSize = getLuaTableEnumParser(collectionItemSize, "string"),
					disableRelativeGap = parseBooleanProp,
					focusNavActionsComponent = parseUiComponentProp,
					headerComponent = parseUiComponentProp,
					itemHeightFromWidth = parseUDimProp,
					itemTemplateKey = parseStringProp,
					layoutOverrides = t_2,
					maxNumRows = parseNumberProp,
					shouldUseFrameBoundsForImpressions = parseBooleanProp,
					disableSelectionOrder = parseBooleanProp,
					items = getArrayMetatableParser(parseLazyUiComponentProp),
					thresholdRowsFromBottom = parseNumberProp,
					onReachedThresholdFromEnd = parseCallbackProp,
					impressionEventName = parseStringProp,
					skipItemImpressionsLog = parseBooleanProp
				},
				propInterface = { itemHeightFromWidth = tModule.UDim }
			},
			[sduiComponentType.Dialog] = {
				component = require(serverDrivenUi.Content.SduiDialog),
				propParsers = {
					size = getLuaTableEnumParser(foundationModule.Enums.DialogSize, "string"),
					image = parseStringProp,
					imageAspectRatio = parseNumberProp,
					titleText = parseStringProp,
					bodyText = parseStringProp,
					bodyComponent = parseUiComponentProp,
					actionsLabel = parseStringProp,
					actionsOrientation = getLuaTableEnumParser(foundationModule.Enums.Orientation, "string"),
					primaryButtonAction = parseCallbackProp,
					primaryButtonText = parseStringProp,
					primaryButtonIcon = parseIconProp,
					primaryButtonInputDelay = parseNumberProp,
					primaryButtonSideEffectAction = parseCallbackProp,
					secondaryButtonAction = parseCallbackProp,
					secondaryButtonText = parseStringProp,
					secondaryButtonIcon = parseIconProp,
					secondaryButtonInputDelay = parseNumberProp,
					secondaryButtonSideEffectAction = parseCallbackProp,
					onClose = parseCallbackProp,
					disablePortal = parseBooleanProp,
					hasBackdrop = parseBooleanProp
				}
			},
			[sduiComponentType.Divider] = {
				component = require(serverDrivenUi.Content.SduiDivider),
				propParsers = {
					anchorPoint = parseVector2Prop,
					backgroundColor3 = parseColor3Prop,
					position = parseUDim2Prop,
					size = parseUDim2Prop
				}
			},
			[sduiComponentType.FocusNavActions] = {
				component = require(serverDrivenUi.FocusNavigation.SduiFocusNavActions),
				propParsers = { focusNavActions = parseFocusNavActionsProp },
				propInterface = { focusNavActions = tModule.table }
			},
			[sduiComponentType.Fragment] = { component = reactModule.Fragment },
			[sduiComponentType.GameTileActiveFriendsFooter] = {
				component = require(serverDrivenUi.Content.SduiGameTileActiveFriendsFooter),
				propParsers = {
					anchorPoint = parseVector2Prop,
					automaticSize = getEngineEnumParser(Enum.AutomaticSize),
					backgroundColor3 = parseColor3Prop,
					layoutOrder = parseIntegerProp,
					position = parseUDim2Prop,
					size = parseUDim2Prop,
					zIndex = parseNumberProp,
					universeId = parseStringProp,
					iconWidth = parseNumberProp,
					maxAvatars = parseNumberProp,
					onActivated = parseCallbackProp
				},
				propInterface = {
					universeId = tModule.union(tModule.string, tModule.number)
				}
			},
			[sduiComponentType.HeroUnit] = {
				component = require(serverDrivenUi.Content.SduiHeroUnit),
				propParsers = {
					backgroundComponent = parseUiComponentProp,
					bottomRowComponent = parseUiComponentProp,
					ctaButtonComponent = parseUiComponentProp,
					gradient = parseGradientProp,
					headerComponent = parseUiComponentProp,
					onActivated = parseCallbackProp,
					overlayComponent = parseUiComponentProp,
					backgroundImage = parseImageStringProp,
					foregroundImage = parseImageStringProp,
					titleImage = parseImageStringProp
				}
			},
			[sduiComponentType.HoldToPlay] = {
				component = require(serverDrivenUi.FocusNavigation.SduiHoldToPlay),
				propParsers = { universeId = parseStringProp, placeId = parseStringProp },
				propInterface = {
					universeId = tModule.union(tModule.string, tModule.number)
				}
			},
			[sduiComponentType.Image] = {
				component = require(parent.SduiSharedContent).SduiImage,
				propParsers = {
					anchorPoint = parseVector2Prop,
					aspectRatio = parseNumberProp,
					automaticSize = getEngineEnumParser(Enum.AutomaticSize),
					backgroundStyle = parseColorTokenProp,
					clipsDescendants = parseBooleanProp,
					cornerRadius = parseUDimProp,
					cursorType = getLuaTableEnumParser(foundationModule.Enums.CursorType, "string"),
					image = parseImageStringProp,
					imageStyle = parseColorTokenProp,
					layoutOrder = parseIntegerProp,
					onActivated = parseCallbackProp,
					position = parseUDim2Prop,
					resampleMode = getEngineEnumParser(Enum.ResamplerMode),
					scaleType = getEngineEnumParser(Enum.ScaleType),
					size = parseUDim2Prop,
					sizeConstraint = getEngineEnumParser(Enum.SizeConstraint),
					tag = parseStringProp,
					tileSize = parseUDim2Prop,
					visible = parseBooleanProp,
					zIndex = parseNumberProp
				}
			},
			[sduiComponentType.SingleItemCollection] = {
				component = require(serverDrivenUi.Content.SduiSingleItemCollection),
				propParsers = {
					anchorPoint = parseVector2Prop,
					automaticSize = getEngineEnumParser(Enum.AutomaticSize),
					position = parseUDim2Prop,
					size = parseUDim2Prop,
					item = parseLazyUiComponentProp,
					impressionEventName = parseStringProp,
					skipItemImpressionsLog = parseBooleanProp
				}
			},
			[sduiComponentType.PlayButton] = {
				component = require(parent.SduiSharedContent).SduiPlayButton,
				propParsers = {
					anchorPoint = parseVector2Prop,
					layoutOrder = parseIntegerProp,
					position = parseUDim2Prop,
					tag = if fFlagSduiExperienceDetailsSupport then parseStringProp else nil,
					width = parseUDimProp,
					onActivatedEffect = if fFlagLuaAppResetHoverOnSduiPlayButtonActivation then parseCallbackProp else nil
				},
				propInterface = {
					universeId = tModule.union(tModule.string, tModule.number)
				}
			},
			[sduiComponentType.SectionHeader] = {
				component = require(serverDrivenUi.Content.SduiSectionHeader),
				propParsers = {
					anchorPoint = parseVector2Prop,
					automaticSize = getEngineEnumParser(Enum.AutomaticSize),
					layoutOrder = parseIntegerProp,
					position = parseUDim2Prop,
					size = parseUDim2Prop,
					zIndex = parseNumberProp,
					iconComponent = parseUiComponentProp,
					infoText = parseStringProp,
					onTitleActivated = parseCallbackProp,
					onSubtitleActivated = parseCallbackProp,
					onInfoIconActivated = parseCallbackProp,
					subtitleColor = parseColor3Prop,
					subtitleComponent = parseUiComponentProp,
					subtitleIcon = parseIconProp,
					subtitleIconWidth = parseNumberProp,
					subtitleFontStyle = parseTypographyTokenProp,
					subtitleGap = parseNumberProp,
					subtitleText = parseStringProp,
					titleColor = parseColor3Prop,
					titleComponent = parseUiComponentProp,
					titleGap = parseNumberProp,
					titleIcon = parseIconProp,
					titleIconWidth = parseNumberProp,
					titleFontStyle = parseTypographyTokenProp,
					titleText = parseStringProp,
					verticalGap = parseNumberProp,
					allowInteractionForDirectionalInput = parseBooleanProp
				}
			},
			[sduiComponentType.SeeAllTile] = {
				component = require(parent.GameCollections).SeeAllTile,
				propParsers = {
					layoutOrder = parseNumberProp,
					size = parseUDim2Prop,
					onActivated = parseCallbackProp,
					icon = parseIconProp,
					title = parseStringProp
				}
			},
			[sduiComponentType.SlotOverlay] = {
				component = require(serverDrivenUi.Content.SduiSlotOverlay),
				propParsers = {
					anchorPoint = parseVector2Prop,
					automaticSize = getEngineEnumParser(Enum.AutomaticSize),
					layoutOrder = parseIntegerProp,
					position = parseUDim2Prop,
					size = parseUDim2Prop,
					zIndex = parseNumberProp,
					topLeftSlot = parseUiComponentProp,
					topMiddleSlot = parseUiComponentProp,
					topRightSlot = parseUiComponentProp,
					centerLeftSlot = parseUiComponentProp,
					centerMiddleSlot = parseUiComponentProp,
					centerRightSlot = parseUiComponentProp,
					bottomLeftSlot = parseUiComponentProp,
					bottomMiddleSlot = parseUiComponentProp,
					bottomRightSlot = parseUiComponentProp,
					padding = parseNumberProp
				}
			},
			[sduiComponentType.Text] = {
				component = require(parent.SduiSharedContent).SduiText,
				propParsers = {
					anchorPoint = parseVector2Prop,
					aspectRatio = parseNumberProp,
					automaticSize = getEngineEnumParser(Enum.AutomaticSize),
					backgroundStyle = parseColorTokenProp,
					children = parseUiComponentProp,
					cornerRadius = parseUDimProp,
					cursorType = getLuaTableEnumParser(foundationModule.Enums.CursorType, "string"),
					fontStyle = parseTypographyTokenProp,
					isDisabled = parseBooleanProp,
					layoutOrder = parseIntegerProp,
					onActivated = parseCallbackProp,
					onSecondaryActivated = parseCallbackProp,
					padding = parseNumberProp,
					position = parseUDim2Prop,
					richText = parseBooleanProp,
					rotation = parseNumberProp,
					scale = parseNumberProp,
					selectable = parseBooleanProp,
					size = parseUDim2Prop,
					sizeConstraint = getEngineEnumParser(Enum.SizeConstraint),
					tag = parseStringProp,
					testId = parseStringProp,
					text = parseStringProp,
					textStyle = parseColorTokenProp,
					textTruncate = getEngineEnumParser(Enum.TextTruncate),
					textWrapped = parseBooleanProp,
					textXAlignment = getEngineEnumParser(Enum.TextXAlignment),
					textYAlignment = getEngineEnumParser(Enum.TextYAlignment),
					visible = parseBooleanProp,
					zIndex = parseNumberProp
				}
			},
			[sduiComponentType.TextIconRow] = {
				component = require(serverDrivenUi.Content.SduiTextIconRow),
				propParsers = {
					anchorPoint = parseVector2Prop,
					automaticSize = getEngineEnumParser(Enum.AutomaticSize),
					layoutOrder = parseIntegerProp,
					position = parseUDim2Prop,
					selectable = parseBooleanProp,
					size = parseUDim2Prop,
					zIndex = parseNumberProp,
					iconFirst = parseBooleanProp,
					onActivated = parseCallbackProp,
					text = parseStringProp,
					textColor = parseColor3Prop,
					fontStyle = parseTypographyTokenProp,
					gap = parseNumberProp,
					icon = parseIconProp,
					iconWidth = parseNumberProp,
					iconColor = parseColor3Prop,
					textOverrides = cryoModule.Dictionary.union({
						richText = parseBooleanProp,
						text = parseStringProp,
						textTruncate = getEngineEnumParser(Enum.TextTruncate),
						textWrapped = parseBooleanProp,
						textXAlignment = getEngineEnumParser(Enum.TextXAlignment),
						textYAlignment = getEngineEnumParser(Enum.TextYAlignment)
					}, t),
					iconOverrides = t,
					textFlexMode = getEngineEnumParser(Enum.UIFlexMode),
					backgroundStyle = parseColorTokenProp,
					cornerRadius = parseUDimProp
				}
			},
			[sduiComponentType.TextPill] = {
				component = require(serverDrivenUi.Content.SduiTextPill),
				propParsers = {
					anchorPoint = parseVector2Prop,
					backgroundColor3 = parseColor3Prop,
					position = parseUDim2Prop,
					size = parseUDim2Prop,
					textColor3 = parseColor3Prop,
					fontStyle = parseTypographyTokenProp
				}
			},
			[sduiComponentType.Tile] = {
				component = require(serverDrivenUi.Content.SduiTile),
				propParsers = {
					anchorPoint = parseVector2Prop,
					automaticSize = getEngineEnumParser(Enum.AutomaticSize),
					backgroundColor3 = parseColor3Prop,
					layoutOrder = parseNumberProp,
					position = parseUDim2Prop,
					selectionOrder = parseNumberProp,
					size = parseUDim2Prop,
					zIndex = parseNumberProp,
					backgroundImage = parseImageSetOrImageProp,
					backgroundImageComponent = parseUiComponentProp,
					backgroundStyle = if fFlagSduiExperienceDetailsSupport then parseColorTokenProp else nil,
					containmentPadding = parseNumberProp,
					cornerRadius = parseNumberProp,
					ctaButtonComponent = parseUiComponentProp,
					footerComponent = parseUiComponentProp,
					image = parseImageStringProp,
					imageAspectRatio = parseNumberProp,
					imageComponent = parseUiComponentProp,
					isContained = parseBooleanProp,
					onActivated = parseCallbackProp,
					thumbnailBackgroundStyle = parseColorTokenProp,
					thumbnailOverlayComponent = parseUiComponentProp,
					titleComponent = parseUiComponentProp,
					titleFont = parseTypographyTokenProp,
					titleLines = parseIntegerProp,
					titleText = parseStringProp,
					enableLegacyHoverState = if fFlagSduiTileDisableLegacyHover then nil else parseBooleanProp,
					focusNavActionsComponent = parseUiComponentProp,
					bottomButtonComponent = if fFlagSduiTileBottomButton then parseUiComponentProp else nil,
					bottomButtonGap = if fFlagSduiTileBottomButton then parseNumberProp else nil,
					holdActionConfig = if fFlagSduiTileHoldAction then {
						onHoldCompleted = parseCallbackProp,
						focusNavigationEventName = parseStringProp,
						keyCode = getEngineEnumParser(Enum.KeyCode)
					} else nil
				}
			},
			[sduiComponentType.TileFooter] = {
				component = require(serverDrivenUi.Content.SduiTileFooter),
				propParsers = {
					anchorPoint = parseVector2Prop,
					automaticSize = getEngineEnumParser(Enum.AutomaticSize),
					layoutOrder = parseIntegerProp,
					position = parseUDim2Prop,
					selectable = parseBooleanProp,
					size = parseUDim2Prop,
					zIndex = parseNumberProp,
					sectionGap = parseNumberProp,
					textIconGap = parseNumberProp,
					fontStyle = parseTypographyTokenProp,
					iconColor = parseColor3Prop,
					iconWidth = parseNumberProp,
					leftIcon = parseIconProp,
					leftIconComponent = parseUiComponentProp,
					leftText = parseStringProp,
					leftTextFlexMode = getEngineEnumParser(Enum.UIFlexMode),
					onActivated = parseCallbackProp,
					rightIcon = parseIconProp,
					rightIconComponent = parseUiComponentProp,
					rightText = parseStringProp,
					rightTextFlexMode = getEngineEnumParser(Enum.UIFlexMode),
					textColor = parseColor3Prop
				}
			},
			[sduiComponentType.View] = {
				component = require(parent.SduiSharedContent).SduiView,
				propParsers = {
					anchorPoint = parseVector2Prop,
					aspectRatio = parseNumberProp,
					automaticSize = getEngineEnumParser(Enum.AutomaticSize),
					backgroundStyle = parseColorTokenProp,
					children = parseUiComponentProp,
					clipsDescendants = parseBooleanProp,
					cornerRadius = parseUDimProp,
					cursorType = getLuaTableEnumParser(foundationModule.Enums.CursorType, "string"),
					groupTransparency = parseNumberProp,
					isDisabled = parseBooleanProp,
					layoutOrder = parseIntegerProp,
					onActivated = parseCallbackProp,
					onSecondaryActivated = parseCallbackProp,
					padding = parseNumberProp,
					position = parseUDim2Prop,
					rotation = parseNumberProp,
					scale = parseNumberProp,
					selectable = parseBooleanProp,
					selectionGroup = parseBooleanProp,
					size = parseUDim2Prop,
					sizeConstraint = getEngineEnumParser(Enum.SizeConstraint),
					tag = parseStringProp,
					testId = parseStringProp,
					visible = parseBooleanProp,
					zIndex = parseNumberProp
				}
			}
		}
	}
	t_3._registeredComponents[sduiComponentType.CountdownTextIconRow] = {
		component = require(serverDrivenUi.Content.SduiCountdownTextIconRow),
		propParsers = cryoModule.Dictionary.join(t_3._registeredComponents[sduiComponentType.TextIconRow], {
			endTimestamp = parseNumberProp,
			formatStringHoursMinutes = parseStringProp,
			defaultString = parseStringProp
		})
	}
	t_3._registeredComponents[sduiComponentType.GameTile] = {
		component = require(serverDrivenUi.Content.SduiGameTile),
		propParsers = cryoModule.Dictionary.join(t_3._registeredComponents[sduiComponentType.Tile].propParsers, {
			universeId = parseStringProp,
			placeId = parseStringProp,
			disableHoldToPlay = parseBooleanProp,
			ratingText = parseStringProp,
			playerCount = parseNumberProp
		}),
		propInterface = {
			universeId = tModule.union(tModule.string, tModule.number),
			placeId = tModule.union(tModule.string, tModule.number)
		}
	}
	
	if fFlagSduiEnableHeroUnitBottomRow then
		t_3._registeredComponents[sduiComponentType.HeroUnitBottomRow] = {
			component = require(serverDrivenUi.Content.SduiHeroUnitBottomRow),
			propParsers = {
				layoutOrder = parseIntegerProp,
				position = parseUDim2Prop,
				zIndex = parseNumberProp,
				ctaButton = parseUiComponentProp,
				labelText = parseStringProp,
				rightLabelContent = parseUiComponentProp
			}
		}
	end
	t_3._registeredComponents[sduiComponentType.Chip] = {
		component = require(parent.SduiSharedContent).SduiChip,
		propParsers = {
			anchorPoint = parseVector2Prop,
			layoutOrder = parseIntegerProp,
			position = parseUDim2Prop,
			text = parseStringProp,
			leadingIconName = parseStringProp,
			leadingIconVariant = getLuaTableEnumParser(foundationModule.Enums.IconVariant, "string"),
			leadingIsCircular = parseBooleanProp,
			leadingOnActivated = parseCallbackProp,
			trailingIconName = parseStringProp,
			trailingIconVariant = getLuaTableEnumParser(foundationModule.Enums.IconVariant, "string"),
			trailingIsCircular = parseBooleanProp,
			trailingOnActivated = parseCallbackProp,
			onActivated = parseCallbackProp,
			isChecked = parseBooleanProp,
			size = getLuaTableEnumParser(foundationModule.Enums.ChipSize, "string")
		},
		propInterface = if fFlagSduiChipAccessoryProps then {
			leading = tModule.optional(tModule.table),
			trailing = tModule.optional(tModule.table)
		} else nil
	}
	t_3._registeredComponents[sduiComponentType.DualActionChip] = {
		component = require(parent.SduiSharedContent).SduiDualActionChip,
		propParsers = {
			anchorPoint = parseVector2Prop,
			layoutOrder = parseIntegerProp,
			position = parseUDim2Prop,
			text = parseStringProp,
			leadingIconName = parseStringProp,
			leadingIconVariant = getLuaTableEnumParser(foundationModule.Enums.IconVariant, "string"),
			leadingOnActivated = parseCallbackProp,
			trailingIconName = parseStringProp,
			trailingIconVariant = getLuaTableEnumParser(foundationModule.Enums.IconVariant, "string"),
			trailingOnActivated = parseCallbackProp
		}
	}
	
	if fFlagSduiEnableAssociatedItemsRow then
		t_3._registeredComponents[sduiComponentType.AssociatedItemsRow] = {
			component = require(serverDrivenUi.Content.SduiAssociatedItemsRow),
			propParsers = {
				layoutOrder = parseIntegerProp,
				items = getArrayMetatableParser(parseLazyUiComponentProp),
				footerComponent = if fFlagSduiExperienceDetailsSupport then parseUiComponentProp else nil
			}
		}
	end
	t_3._registeredComponents[sduiComponentType.ExperienceAssociatedItemsRow] = {
		component = require(serverDrivenUi.Content.ExperienceDetails.ExperienceAssociatedItemsRow),
		propParsers = {
			layoutOrder = parseIntegerProp,
			items = getArrayMetatableParser(parseLazyUiComponentProp),
			universeId = parseStringProp
		},
		propInterface = { universeId = tModule.string }
	}
	t_3._registeredComponents[sduiComponentType.ExperienceDetailsVoteChip] = {
		component = require(serverDrivenUi.Content.ExperienceDetails.ExperienceDetailsVoteChip),
		propParsers = {
			layoutOrder = parseIntegerProp,
			universeId = parseStringProp
		},
		propInterface = { universeId = tModule.string }
	}
	t_3._registeredComponents[sduiComponentType.ExperienceDetailsFavoriteChip] = {
		component = require(serverDrivenUi.Content.ExperienceDetails.ExperienceDetailsFavoriteChip),
		propParsers = {
			layoutOrder = parseIntegerProp,
			universeId = parseStringProp
		},
		propInterface = { universeId = tModule.string }
	}
	t_3._registeredComponents[sduiComponentType.ExperienceDetailsNotifyChip] = {
		component = require(serverDrivenUi.Content.ExperienceDetails.ExperienceDetailsNotifyChip),
		propParsers = {
			layoutOrder = parseIntegerProp,
			universeId = parseStringProp
		},
		propInterface = { universeId = tModule.string }
	}
	t_3._registeredComponents[sduiComponentType.ExperienceDetailsActiveChip] = {
		component = require(serverDrivenUi.Content.ExperienceDetails.ExperienceDetailsActiveChip),
		propParsers = {
			layoutOrder = parseIntegerProp,
			universeId = parseStringProp
		},
		propInterface = { universeId = tModule.string }
	}
	t_3._registeredComponents[sduiComponentType.ExperienceDetailsShareChip] = {
		component = require(serverDrivenUi.Content.ExperienceDetails.ExperienceDetailsShareChip),
		propParsers = {
			layoutOrder = parseIntegerProp,
			universeId = parseStringProp
		},
		propInterface = { universeId = tModule.string }
	}
	t_3._registeredComponents[sduiComponentType.ExperienceDetailsReportChip] = {
		component = require(serverDrivenUi.Content.ExperienceDetails.ExperienceDetailsReportChip),
		propParsers = {
			layoutOrder = parseIntegerProp,
			universeId = parseStringProp
		},
		propInterface = { universeId = tModule.string }
	}
	
	if fFlagSduiExperienceDetailsSocialProof then
		t_3._registeredComponents[sduiComponentType.ExperienceDetailsConnectionsPlayedChip] = {
			component = require(serverDrivenUi.Content.ExperienceDetails.ExperienceDetailsConnectionsPlayedChip),
			propParsers = {
				layoutOrder = parseIntegerProp,
				universeId = parseStringProp
			},
			propInterface = { universeId = tModule.string }
		}
		t_3._registeredComponents[sduiComponentType.ExperienceDetailsConnectionsPlayedTextRow] = {
			component = require(serverDrivenUi.Content.ExperienceDetails.ExperienceDetailsConnectionsPlayedTextRow),
			propParsers = {
				layoutOrder = parseIntegerProp,
				universeId = parseStringProp,
				name = parseStringProp
			},
			propInterface = {
				universeId = tModule.string,
				name = tModule.optional(tModule.string)
			}
		}
	end
	t_3._registeredComponents[sduiComponentType.VerticalFeed] = {
		component = require(parent.SduiSharedContent).SduiVerticalFeed,
		propParsers = {
			layoutOrder = parseIntegerProp,
			feedItems = getArrayMetatableParser(parseLazyUiComponentProp),
			gapBetweenFeedItems = parseNumberProp,
			thresholdFromEnd = parseNumberProp,
			onScrollToEnd = parseCallbackProp,
			onRefresh = if fFlagSduiChartsSupport then parseCallbackProp else nil,
			stickyItems = if fFlagSduiChartsSupport then getArrayMetatableParser(parseUiComponentProp) else nil,
			gapAfterStickyItems = if fFlagSduiChartsSupport then parseIntegerProp else nil,
			gapBetweenStickyItems = if fFlagSduiChartsSupport then parseIntegerProp else nil,
			stickyPaddingTop = if fFlagSduiChartsSupport then parseIntegerProp else nil,
			stickyPaddingBottom = if fFlagSduiChartsSupport then parseIntegerProp else nil,
			stickyBackgroundStyle = if fFlagSduiChartsSupport then parseColorTokenProp else nil,
			stickyContentTag = if fFlagSduiChartsSupport then parseStringProp else nil,
			backgroundStyle = parseColorTokenProp
		}
	}
	t_3._registeredComponents[sduiComponentType.BadgeTile] = {
		component = require(serverDrivenUi.Content.SduiBadgeTile),
		propParsers = cryoModule.Dictionary.join(t_3._registeredComponents[sduiComponentType.Tile].propParsers, {
			imageCornerRadius = parseNumberProp,
			imagePadding = parseNumberProp
		})
	}
	
	if sduiBadgeComponent then
		t_3._registeredComponents[sduiComponentType.Badge] = {
			component = require(parent.SduiSharedContent).SduiBadge,
			propParsers = {
				anchorPoint = parseVector2Prop,
				layoutOrder = parseIntegerProp,
				position = parseUDim2Prop,
				visible = parseBooleanProp,
				zIndex = parseNumberProp,
				text = parseStringProp,
				icon = parseStringProp,
				variant = getLuaTableEnumParser(foundationModule.Enums.BadgeVariant, "string")
			}
		}
	end
	if fFlagSduiExperienceDetailsSupport then
		t_3._registeredComponents[sduiComponentType.SongTile] = { component = require(serverDrivenUi.Content.SduiSongTile) }
	end
	t_3._registeredComponents[sduiComponentType.InfoTable] = {
		component = require(parent.SduiSharedContent).SduiInfoTable,
		propParsers = {
			layoutOrder = parseIntegerProp,
			gridTag = parseStringProp,
			items = getArrayMetatableParser(parseLazyUiComponentProp),
			numColumns = parseIntegerProp,
			tag = if fFlagSduiExperienceDetailsSupport then parseStringProp else nil
		},
		propInterface = { items = tModule.array(tModule.table) }
	}
	t_3._registeredComponents[sduiComponentType.InfoTableCell] = {
		component = require(parent.AppBlox).InfoTableCell,
		propParsers = {
			labelComponent = parseUiComponentProp,
			isLastInSingleColumn = parseBooleanProp,
			numColumns = parseIntegerProp,
			onActivated = parseCallbackProp,
			valueComponent = parseUiComponentProp
		},
		propInterface = {
			labelComponent = tModule.table,
			valueComponent = tModule.table,
			isLastInSingleColumn = tModule.optional(tModule.boolean)
		}
	}
	t_3._registeredComponents[sduiComponentType.ExpandableText] = {
		component = require(parent.SduiSharedContent).SduiExpandableText,
		propParsers = {
			layoutOrder = parseIntegerProp,
			text = parseStringProp,
			compactNumberOfLines = parseIntegerProp,
			fontStyle = parseTypographyTokenProp,
			textStyle = parseColorTokenProp,
			pressedTextStyle = parseColorTokenProp,
			expandedInitially = parseBooleanProp,
			avoidBlankLineClip = parseBooleanProp,
			onExpandChanged = parseCallbackProp,
			headerComponent = if fFlagSduiExperienceDetailsSupport then parseUiComponentProp else nil
		},
		propInterface = { text = tModule.string }
	}
	t_3._registeredComponents[sduiComponentType.OverflowMenu] = {
		component = require(parent.SduiSharedContent).SduiOverflowMenu,
		propParsers = {
			anchorPoint = parseVector2Prop,
			layoutOrder = parseIntegerProp,
			position = parseUDim2Prop,
			zIndex = parseNumberProp,
			buttonVariant = getLuaTableEnumParser(foundationModule.Enums.ButtonVariant, "string"),
			buttonSize = getLuaTableEnumParser(foundationModule.Enums.InputSize, "string"),
			buttonIcon = getLuaTableEnumParser(foundationModule.Enums.IconName, "string"),
			buttonIconBackgroundStyle = parseColorTokenProp,
			menuItemSize = getLuaTableEnumParser(foundationModule.Enums.InputSize, "string"),
			popoverAlign = getLuaTableEnumParser(foundationModule.Enums.PopoverAlign, "string"),
			popoverSide = getLuaTableEnumParser(foundationModule.Enums.PopoverSide, "string"),
			menuWidth = parseUDimProp
		},
		propInterface = {
			items = if fFlagSduiExperienceDetailsSupport then tModule.table else tModule.array(tModule.table)
		}
	}
	
	if fFlagLuaAppDismissUnlockUpsell then
		t_3._registeredComponents[sduiComponentType.AgeCheckUpsellRow] = {
			component = require(serverDrivenUi.Content.SduiAgeCheckUpsellRow),
			propParsers = {
				leading = parseUiComponentProp,
				content = parseUiComponentProp,
				trailing = parseUiComponentProp,
				onActivated = parseCallbackProp,
				tag = parseStringProp,
				leadingTag = parseStringProp,
				contentTag = parseStringProp,
				trailingTag = parseStringProp,
				layoutOrder = parseIntegerProp,
				position = parseUDim2Prop,
				zIndex = parseNumberProp,
				testId = parseStringProp
			}
		}
	end
	setmetatable(t_3, t_1)
	
	return t_3
end

function t_1:getComponentDefinition(p0) --[[ line: 964 ]]
	-- upvalues: fFlagSduiGlobalRegistryFallback (ref), getSduiComponentRegistry (ref)
	local var14 = self._registeredComponents[p0]
	
	if not var14 then
		if fFlagSduiGlobalRegistryFallback then
			return getSduiComponentRegistry().getComponentDefinition(p0)
		end
		var14 = nil
	end
	return var14
end

function t_1:doesComponentManageChildren(p1) --[[ line: 976 ]]
	local var15 = self:getComponentDefinition(p1)
	
	return if var15 then var15.doesManageChildren else false
end

function t_1:getComponent(p2) --[[ line: 984 ]]
	local var16 = self:getComponentDefinition(p2)
	
	return var16 and var16.component
end

function t_1:getPropParsers(p3) --[[ line: 989 ]]
	-- upvalues: t (ref)
	local var17 = self:getComponentDefinition(p3)
	
	return if var17 then var17.propParsers else t
end

function t_1:getPropInterface(p4) --[[ line: 997 ]]
	local var18 = self:getComponentDefinition(p4)
	
	return if var18 then var18.propInterface else nil
end

local t_2 = {
	[parseUiComponentProp] = true,
	[parseCallbackProp] = true,
	[parseFocusNavActionsProp] = true
}

function t_1.doesParserRequireRenderContext(_, p5) --[[ line: 1008 ]]
	-- upvalues: t_2 (ref)
	return if p5 and t_2[p5] then true else typeof(p5) == "table"
end

function t_1:registerComponent(p6, p7) --[[ line: 1023 ]]
	self._registeredComponents[p6] = p7
end

return t_1