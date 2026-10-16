local ServerDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local Parent = ServerDrivenUi.Parent
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local TModule = require(Parent.t)
local CollectionItemSize = require(Parent.CollectionViews).CollectionViewTypes.CollectionItemSize
local ItemHeightModeModule = require(ServerDrivenUi.Content.Collections.ItemHeightMode)
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local SduiComponentType = SduiCoreSystemModule.SduiComponentType
local SduiParsers = SduiCoreSystemModule.SduiParsers
local GetSduiComponentRegistryFunction = SduiCoreSystemModule.getSduiComponentRegistry
local FFlagLuaAppRespectClipAncestorImpressions = require(Parent.SharedFlags).FFlagLuaAppRespectClipAncestorImpressions
local ParseCallbackProp = SduiParsers.parseCallbackProp_
local ParseUiComponentProp = SduiParsers.parseUiComponentProp_
local ParseLazyUiComponentProp = SduiParsers.parseLazyUiComponentProp_
local ParseIntegerProp = SduiParsers.parseIntegerProp_
local ParseNumberProp = SduiParsers.parseNumberProp_
local ParseUDim2Prop = SduiParsers.parseUDim2Prop_
local ParseUDimProp = SduiParsers.parseUDimProp_
local ParseImageStringProp = SduiParsers.parseImageStringProp_
local ParseVector2Prop = SduiParsers.parseVector2Prop_
local ParseColor3Prop = SduiParsers.parseColor3Prop_
local ParseBooleanProp = SduiParsers.parseBooleanProp_
local ParseGradientProp = SduiParsers.parseGradientProp_
local ParseIconProp = SduiParsers.parseIconProp_
local ParseTypographyTokenProp = SduiParsers.parseTypographyTokenProp_
local ParseColorTokenProp = SduiParsers.parseColorTokenProp_
local ParseImageSetOrImageProp = SduiParsers.parseImageSetOrImageProp_
local ParseStringProp = SduiParsers.parseStringProp_
local ParseFocusNavActionsProp = SduiParsers.parseFocusNavActionsProp_
local GetArrayMetatableParserFunction = SduiParsers.getArrayMetatableParser
local GetEngineEnumParserFunction = SduiParsers.getEngineEnumParser
local GetLuaTableEnumParserFunction = SduiParsers.getLuaTableEnumParser
local FFlagSduiTileDisableLegacyHover = require(ServerDrivenUi.Flags).FFlagSduiTileDisableLegacyHover
local FFlagSduiEnableHeroUnitBottomRow = require(ServerDrivenUi.Flags).FFlagSduiEnableHeroUnitBottomRow
local FFlagSduiAttributionRowV2 = require(Parent.SharedFlags).FFlagSduiAttributionRowV2
local FFlagSduiExperienceDetailsSocialProof = require(Parent.SharedFlags).FFlagSduiExperienceDetailsSocialProof
local FFlagSduiChipAccessoryProps = require(Parent.SharedFlags).FFlagSduiChipAccessoryProps
local FFlagSduiCollectionCarouselOverrides = require(Parent.SharedFlags).FFlagSduiCollectionCarouselOverrides
local FFlagLuaAppDismissUnlockUpsell = require(Parent.SharedFlags).FFlagLuaAppDismissUnlockUpsell
local FFlagLuaAppSduiGameTileFeedback = require(Parent.SharedFlags).FFlagLuaAppSduiGameTileFeedback
local FFlagSduiGameTileDirectAction = require(Parent.SharedFlags).FFlagSduiGameTileDirectAction
local FFlagSduiOptionSelectorCollection = require(Parent.SharedFlags).FFlagSduiOptionSelectorCollection
local FFlagSduiCollectionCarouselPlaceholderItem = require(Parent.SharedFlags).FFlagSduiCollectionCarouselPlaceholderItem
local FFlagSduiCollectionGridRevealRows = require(Parent.SharedFlags).FFlagSduiCollectionGridRevealRows
local FFlagSduiIndividualFeedItemSpacing = require(Parent.SharedFlags).FFlagSduiIndividualFeedItemSpacing
local t = {}
local SduiComponentDefinitionsModule = {}
SduiComponentDefinitionsModule.__index = SduiComponentDefinitionsModule

function SduiComponentDefinitionsModule.new() --[[ Line: 81 ]]
	-- upvalues: ParseVector2Prop (copy), GetEngineEnumParserFunction (copy), ParseColor3Prop (copy), ParseNumberProp (copy), ParseIntegerProp (copy), ParseUDim2Prop (copy), CryoModule (copy), ParseBooleanProp (copy), ParseStringProp (copy), SduiComponentType (copy), Parent (copy), FFlagSduiAttributionRowV2 (copy), ParseCallbackProp (copy), ParseUiComponentProp (copy), ParseTypographyTokenProp (copy), ParseColorTokenProp (copy), GetLuaTableEnumParserFunction (copy), FoundationModule (copy), ParseImageStringProp (copy), TModule (copy), ParseIconProp (copy), ParseUDimProp (copy), ServerDrivenUi (copy), CollectionItemSize (copy), ItemHeightModeModule (copy), FFlagSduiCollectionCarouselOverrides (copy), FFlagLuaAppRespectClipAncestorImpressions (copy), GetArrayMetatableParserFunction (copy), ParseLazyUiComponentProp (copy), FFlagSduiCollectionCarouselPlaceholderItem (copy), FFlagSduiOptionSelectorCollection (copy), FFlagSduiCollectionGridRevealRows (copy), ParseFocusNavActionsProp (copy), ReactModule (copy), ParseGradientProp (copy), ParseImageSetOrImageProp (copy), FFlagSduiTileDisableLegacyHover (copy), FFlagLuaAppSduiGameTileFeedback (copy), FFlagSduiGameTileDirectAction (copy), FFlagSduiEnableHeroUnitBottomRow (copy), FFlagSduiChipAccessoryProps (copy), FFlagSduiExperienceDetailsSocialProof (copy), FFlagSduiIndividualFeedItemSpacing (copy), FFlagLuaAppDismissUnlockUpsell (copy), SduiComponentDefinitionsModule (copy)
	local IconOverrides = {
		anchorPoint = ParseVector2Prop,
		automaticSize = GetEngineEnumParserFunction(Enum.AutomaticSize),
		backgroundColor3 = ParseColor3Prop,
		backgroundTransparency = ParseNumberProp,
		layoutOrder = ParseIntegerProp,
		position = ParseUDim2Prop,
		size = ParseUDim2Prop,
		zIndex = ParseNumberProp
	}
	local LayoutOverrides = {
		columnGap = ParseNumberProp,
		sideMargin = ParseNumberProp,
		numColumns = ParseNumberProp,
		fractionalItemAmount = ParseNumberProp,
		loadMoreThreshold = ParseNumberProp,
		verticalGap = ParseNumberProp
	}
	local config = {
		_registeredComponents = {
			[SduiComponentType.AttributionRow] = {
				component = require(Parent.SduiSharedContent).SduiAttributionRow,
				propParsers = {
					layoutOrder = ParseIntegerProp,
					position = ParseUDim2Prop,
					size = if FFlagSduiAttributionRowV2 then ParseUDim2Prop else nil,
					onActivated = ParseCallbackProp,
					rightButtonContent = ParseUiComponentProp,
					title = if FFlagSduiAttributionRowV2 then ParseStringProp else nil,
					titleFontStyle = if FFlagSduiAttributionRowV2 then ParseTypographyTokenProp else nil,
					titleTextColor = if FFlagSduiAttributionRowV2 then ParseColorTokenProp else nil,
					subtitle = if FFlagSduiAttributionRowV2 then ParseStringProp else nil,
					subtitleFontStyle = if FFlagSduiAttributionRowV2 then ParseTypographyTokenProp else nil,
					subtitleTextColor = if FFlagSduiAttributionRowV2 then ParseColor3Prop else nil,
					subtitleIconName = if FFlagSduiAttributionRowV2 then GetLuaTableEnumParserFunction(FoundationModule.Enums.IconName, "string") else nil,
					subtitleIconSize = if FFlagSduiAttributionRowV2 then GetLuaTableEnumParserFunction(FoundationModule.Enums.IconSize, "string") else nil,
					subtitleIconStyle = if FFlagSduiAttributionRowV2 then ParseColorTokenProp else nil,
					subtitleIconVariant = if FFlagSduiAttributionRowV2 then GetLuaTableEnumParserFunction(FoundationModule.Enums.IconVariant, "string") else nil,
					subtitleBackgroundIconName = if FFlagSduiAttributionRowV2 then GetLuaTableEnumParserFunction(FoundationModule.Enums.IconName, "string") else nil,
					subtitleBackgroundIconStyle = if FFlagSduiAttributionRowV2 then ParseColorTokenProp else nil,
					subtitleOnActivated = if FFlagSduiAttributionRowV2 then ParseCallbackProp else nil,
					caption = if FFlagSduiAttributionRowV2 then ParseStringProp else nil,
					captionTextColor = if FFlagSduiAttributionRowV2 then ParseColorTokenProp else nil,
					captionFontStyle = if FFlagSduiAttributionRowV2 then ParseTypographyTokenProp else nil,
					textContainerSize = if FFlagSduiAttributionRowV2 then ParseUDim2Prop else nil,
					image = ParseImageStringProp,
					imageSize = if FFlagSduiAttributionRowV2 then ParseUDim2Prop else nil
				},
				propInterface = if FFlagSduiAttributionRowV2 then { title = TModule.string, subtitle = TModule.string } else nil
			},
			[SduiComponentType.Button] = {
				component = require(Parent.SduiSharedContent).SduiButton,
				propParsers = {
					anchorPoint = ParseVector2Prop,
					cursorType = GetLuaTableEnumParserFunction(FoundationModule.Enums.CursorType, "string"),
					fillBehavior = GetLuaTableEnumParserFunction(FoundationModule.Enums.FillBehavior, "string"),
					icon = ParseIconProp,
					inputDelay = ParseNumberProp,
					isDisabled = ParseBooleanProp,
					isLoading = ParseBooleanProp,
					layoutOrder = ParseIntegerProp,
					onActivated = ParseCallbackProp,
					position = ParseUDim2Prop,
					selectable = ParseBooleanProp,
					size = GetLuaTableEnumParserFunction(FoundationModule.Enums.InputSize, "string"),
					tag = ParseStringProp,
					testId = ParseStringProp,
					text = ParseStringProp,
					variant = GetLuaTableEnumParserFunction(FoundationModule.Enums.ButtonVariant, "string"),
					visible = ParseBooleanProp,
					width = ParseUDimProp,
					zIndex = ParseNumberProp
				}
			},
			[SduiComponentType.CollectionCarousel] = {
				component = require(ServerDrivenUi.Content.Collections.SduiCollectionCarousel),
				propParsers = {
					anchorPoint = ParseVector2Prop,
					position = ParseUDim2Prop,
					size = ParseUDim2Prop,
					collectionItemSize = GetLuaTableEnumParserFunction(CollectionItemSize, "string"),
					itemHeightFromWidth = ParseUDimProp,
					headerComponent = ParseUiComponentProp,
					itemHeightMode = GetLuaTableEnumParserFunction(ItemHeightModeModule, "string"),
					layoutOverrides = LayoutOverrides,
					numColumnsOverride = if FFlagSduiCollectionCarouselOverrides then ParseNumberProp else nil,
					scrollingEnabledOverride = ParseBooleanProp,
					maxItemsToShow = ParseNumberProp,
					shouldUseFrameBoundsForImpressions = ParseBooleanProp,
					respectClipAncestors = if FFlagLuaAppRespectClipAncestorImpressions then ParseBooleanProp else nil,
					backgroundMuralUrl = ParseImageStringProp,
					onScrollToEnd = ParseCallbackProp,
					scrollThresholdFromEnd = ParseNumberProp,
					itemTemplateKey = ParseStringProp,
					focusNavActionsComponent = ParseUiComponentProp,
					disableSelectionOrder = ParseBooleanProp,
					numItemsToRenderOffScreen = ParseNumberProp,
					items = GetArrayMetatableParserFunction(ParseLazyUiComponentProp),
					impressionEventName = ParseStringProp,
					skipItemImpressionsLog = ParseBooleanProp,
					enableHoverOverflow = ParseBooleanProp
				}
			},
			[SduiComponentType.VariableItemWidthCarousel] = {
				component = require(ServerDrivenUi.Content.Collections.SduiVariableItemWidthCarousel)
			},
			[SduiComponentType.CollectionCarouselPlaceholder] = {
				component = require(ServerDrivenUi.Content.Collections.SduiCollectionCarouselPlaceholder)
			},
			[SduiComponentType.PlaceholderTile] = if FFlagSduiCollectionCarouselPlaceholderItem then {
				component = require(Parent.SduiSharedContent).SduiPlaceholderTile
			} else nil,
			[SduiComponentType.OptionSelectorCollection] = if FFlagSduiOptionSelectorCollection then {
				component = require(ServerDrivenUi.Content.Collections.SduiOptionSelectorCollection)
			} else nil,
			[SduiComponentType.CollectionGrid] = {
				component = require(ServerDrivenUi.Content.Collections.SduiCollectionGrid),
				propParsers = {
					anchorPoint = ParseVector2Prop,
					position = ParseUDim2Prop,
					size = ParseUDim2Prop,
					bufferRowsBelowScreen = ParseNumberProp,
					bufferRowsAboveScreen = ParseNumberProp,
					collectionItemSize = GetLuaTableEnumParserFunction(CollectionItemSize, "string"),
					disableRelativeGap = ParseBooleanProp,
					focusNavActionsComponent = ParseUiComponentProp,
					headerComponent = ParseUiComponentProp,
					itemHeightFromWidth = ParseUDimProp,
					itemTemplateKey = ParseStringProp,
					layoutOverrides = LayoutOverrides,
					maxNumRows = ParseNumberProp,
					shouldUseFrameBoundsForImpressions = ParseBooleanProp,
					disableSelectionOrder = ParseBooleanProp,
					items = GetArrayMetatableParserFunction(ParseLazyUiComponentProp),
					thresholdRowsFromBottom = ParseNumberProp,
					onReachedThresholdFromEnd = ParseCallbackProp,
					impressionEventName = ParseStringProp,
					skipItemImpressionsLog = ParseBooleanProp
				},
				propInterface = { itemHeightFromWidth = TModule.UDim }
			},
			[SduiComponentType.RevealRowsButtonWithDivider] = if FFlagSduiCollectionGridRevealRows then {
				component = require(ServerDrivenUi.Content.Collections.SduiRevealRowsButtonWithDivider)
			} else nil,
			[SduiComponentType.Dialog] = {
				component = require(ServerDrivenUi.Content.SduiDialog),
				propParsers = {
					size = GetLuaTableEnumParserFunction(FoundationModule.Enums.DialogSize, "string"),
					image = ParseStringProp,
					imageAspectRatio = ParseNumberProp,
					titleText = ParseStringProp,
					bodyText = ParseStringProp,
					bodyComponent = ParseUiComponentProp,
					actionsLabel = ParseStringProp,
					actionsOrientation = GetLuaTableEnumParserFunction(FoundationModule.Enums.Orientation, "string"),
					primaryButtonAction = ParseCallbackProp,
					primaryButtonText = ParseStringProp,
					primaryButtonIcon = ParseIconProp,
					primaryButtonInputDelay = ParseNumberProp,
					primaryButtonSideEffectAction = ParseCallbackProp,
					secondaryButtonAction = ParseCallbackProp,
					secondaryButtonText = ParseStringProp,
					secondaryButtonIcon = ParseIconProp,
					secondaryButtonInputDelay = ParseNumberProp,
					secondaryButtonSideEffectAction = ParseCallbackProp,
					onClose = ParseCallbackProp,
					disablePortal = ParseBooleanProp,
					hasBackdrop = ParseBooleanProp
				}
			},
			[SduiComponentType.Divider] = {
				component = require(ServerDrivenUi.Content.SduiDivider),
				propParsers = {
					anchorPoint = ParseVector2Prop,
					backgroundColor3 = ParseColor3Prop,
					position = ParseUDim2Prop,
					size = ParseUDim2Prop
				}
			},
			[SduiComponentType.FocusNavActions] = {
				component = require(ServerDrivenUi.FocusNavigation.SduiFocusNavActions),
				propParsers = { focusNavActions = ParseFocusNavActionsProp },
				propInterface = { focusNavActions = TModule.table }
			},
			[SduiComponentType.Fragment] = { component = ReactModule.Fragment },
			[SduiComponentType.GameTileActiveFriendsFooter] = {
				component = require(ServerDrivenUi.Content.SduiGameTileActiveFriendsFooter),
				propParsers = {
					anchorPoint = ParseVector2Prop,
					automaticSize = GetEngineEnumParserFunction(Enum.AutomaticSize),
					backgroundColor3 = ParseColor3Prop,
					layoutOrder = ParseIntegerProp,
					position = ParseUDim2Prop,
					size = ParseUDim2Prop,
					zIndex = ParseNumberProp,
					universeId = ParseStringProp,
					iconWidth = ParseNumberProp,
					maxAvatars = ParseNumberProp,
					onActivated = ParseCallbackProp
				},
				propInterface = {
					universeId = TModule.union(TModule.string, TModule.number)
				}
			},
			[SduiComponentType.HeroUnit] = {
				component = require(ServerDrivenUi.Content.SduiHeroUnit),
				propParsers = {
					backgroundComponent = ParseUiComponentProp,
					bottomRowComponent = ParseUiComponentProp,
					ctaButtonComponent = ParseUiComponentProp,
					gradient = ParseGradientProp,
					headerComponent = ParseUiComponentProp,
					onActivated = ParseCallbackProp,
					overlayComponent = ParseUiComponentProp,
					backgroundImage = ParseImageStringProp,
					foregroundImage = ParseImageStringProp,
					titleImage = ParseImageStringProp
				}
			},
			[SduiComponentType.HoldToPlay] = {
				component = require(ServerDrivenUi.FocusNavigation.SduiHoldToPlay),
				propParsers = { universeId = ParseStringProp, placeId = ParseStringProp },
				propInterface = {
					universeId = TModule.union(TModule.string, TModule.number)
				}
			},
			[SduiComponentType.Image] = {
				component = require(Parent.SduiSharedContent).SduiImage,
				propParsers = {
					anchorPoint = ParseVector2Prop,
					aspectRatio = ParseNumberProp,
					automaticSize = GetEngineEnumParserFunction(Enum.AutomaticSize),
					backgroundStyle = ParseColorTokenProp,
					clipsDescendants = ParseBooleanProp,
					cornerRadius = ParseUDimProp,
					cursorType = GetLuaTableEnumParserFunction(FoundationModule.Enums.CursorType, "string"),
					image = ParseImageStringProp,
					imageStyle = ParseColorTokenProp,
					layoutOrder = ParseIntegerProp,
					onActivated = ParseCallbackProp,
					position = ParseUDim2Prop,
					resampleMode = GetEngineEnumParserFunction(Enum.ResamplerMode),
					scaleType = GetEngineEnumParserFunction(Enum.ScaleType),
					size = ParseUDim2Prop,
					sizeConstraint = GetEngineEnumParserFunction(Enum.SizeConstraint),
					tag = ParseStringProp,
					tileSize = ParseUDim2Prop,
					visible = ParseBooleanProp,
					zIndex = ParseNumberProp
				}
			},
			[SduiComponentType.SingleItemCollection] = {
				component = require(ServerDrivenUi.Content.SduiSingleItemCollection),
				propParsers = {
					anchorPoint = ParseVector2Prop,
					automaticSize = GetEngineEnumParserFunction(Enum.AutomaticSize),
					position = ParseUDim2Prop,
					size = ParseUDim2Prop,
					item = ParseLazyUiComponentProp,
					impressionEventName = ParseStringProp,
					skipItemImpressionsLog = ParseBooleanProp
				}
			},
			[SduiComponentType.PlayButton] = {
				component = require(Parent.SduiSharedContent).SduiPlayButton,
				propParsers = {
					anchorPoint = ParseVector2Prop,
					layoutOrder = ParseIntegerProp,
					position = ParseUDim2Prop,
					tag = ParseStringProp,
					width = ParseUDimProp,
					onActivatedEffect = ParseCallbackProp
				},
				propInterface = {
					universeId = TModule.union(TModule.string, TModule.number)
				}
			},
			[SduiComponentType.SectionHeader] = {
				component = require(ServerDrivenUi.Content.SduiSectionHeader),
				propParsers = {
					anchorPoint = ParseVector2Prop,
					automaticSize = GetEngineEnumParserFunction(Enum.AutomaticSize),
					layoutOrder = ParseIntegerProp,
					position = ParseUDim2Prop,
					size = ParseUDim2Prop,
					zIndex = ParseNumberProp,
					iconComponent = ParseUiComponentProp,
					infoText = ParseStringProp,
					onTitleActivated = ParseCallbackProp,
					onSubtitleActivated = ParseCallbackProp,
					onInfoIconActivated = ParseCallbackProp,
					subtitleColor = ParseColor3Prop,
					subtitleComponent = ParseUiComponentProp,
					subtitleIcon = ParseIconProp,
					subtitleIconWidth = ParseNumberProp,
					subtitleFontStyle = ParseTypographyTokenProp,
					subtitleGap = ParseNumberProp,
					subtitleText = ParseStringProp,
					titleColor = ParseColor3Prop,
					titleComponent = ParseUiComponentProp,
					titleGap = ParseNumberProp,
					titleIcon = ParseIconProp,
					titleIconWidth = ParseNumberProp,
					titleFontStyle = ParseTypographyTokenProp,
					titleText = ParseStringProp,
					verticalGap = ParseNumberProp,
					allowInteractionForDirectionalInput = ParseBooleanProp
				}
			},
			[SduiComponentType.SeeAllTile] = {
				component = require(Parent.GameCollections).SeeAllTile,
				propParsers = {
					layoutOrder = ParseNumberProp,
					size = ParseUDim2Prop,
					onActivated = ParseCallbackProp,
					icon = ParseIconProp,
					title = ParseStringProp
				}
			},
			[SduiComponentType.SlotOverlay] = {
				component = require(ServerDrivenUi.Content.SduiSlotOverlay),
				propParsers = {
					anchorPoint = ParseVector2Prop,
					automaticSize = GetEngineEnumParserFunction(Enum.AutomaticSize),
					layoutOrder = ParseIntegerProp,
					position = ParseUDim2Prop,
					size = ParseUDim2Prop,
					zIndex = ParseNumberProp,
					topLeftSlot = ParseUiComponentProp,
					topMiddleSlot = ParseUiComponentProp,
					topRightSlot = ParseUiComponentProp,
					centerLeftSlot = ParseUiComponentProp,
					centerMiddleSlot = ParseUiComponentProp,
					centerRightSlot = ParseUiComponentProp,
					bottomLeftSlot = ParseUiComponentProp,
					bottomMiddleSlot = ParseUiComponentProp,
					bottomRightSlot = ParseUiComponentProp,
					padding = ParseNumberProp
				}
			},
			[SduiComponentType.Text] = {
				component = require(Parent.SduiSharedContent).SduiText,
				propParsers = {
					anchorPoint = ParseVector2Prop,
					aspectRatio = ParseNumberProp,
					automaticSize = GetEngineEnumParserFunction(Enum.AutomaticSize),
					backgroundStyle = ParseColorTokenProp,
					children = ParseUiComponentProp,
					cornerRadius = ParseUDimProp,
					cursorType = GetLuaTableEnumParserFunction(FoundationModule.Enums.CursorType, "string"),
					fontStyle = ParseTypographyTokenProp,
					isDisabled = ParseBooleanProp,
					layoutOrder = ParseIntegerProp,
					onActivated = ParseCallbackProp,
					onSecondaryActivated = ParseCallbackProp,
					padding = ParseNumberProp,
					position = ParseUDim2Prop,
					richText = ParseBooleanProp,
					rotation = ParseNumberProp,
					scale = ParseNumberProp,
					selectable = ParseBooleanProp,
					size = ParseUDim2Prop,
					sizeConstraint = GetEngineEnumParserFunction(Enum.SizeConstraint),
					tag = ParseStringProp,
					testId = ParseStringProp,
					text = ParseStringProp,
					textStyle = ParseColorTokenProp,
					textTruncate = GetEngineEnumParserFunction(Enum.TextTruncate),
					textWrapped = ParseBooleanProp,
					textXAlignment = GetEngineEnumParserFunction(Enum.TextXAlignment),
					textYAlignment = GetEngineEnumParserFunction(Enum.TextYAlignment),
					visible = ParseBooleanProp,
					zIndex = ParseNumberProp
				}
			},
			[SduiComponentType.TextIconRow] = {
				component = require(ServerDrivenUi.Content.SduiTextIconRow),
				propParsers = {
					anchorPoint = ParseVector2Prop,
					automaticSize = GetEngineEnumParserFunction(Enum.AutomaticSize),
					layoutOrder = ParseIntegerProp,
					position = ParseUDim2Prop,
					selectable = ParseBooleanProp,
					size = ParseUDim2Prop,
					zIndex = ParseNumberProp,
					iconFirst = ParseBooleanProp,
					onActivated = ParseCallbackProp,
					text = ParseStringProp,
					textColor = ParseColor3Prop,
					fontStyle = ParseTypographyTokenProp,
					gap = ParseNumberProp,
					icon = ParseIconProp,
					iconWidth = ParseNumberProp,
					iconColor = ParseColor3Prop,
					textOverrides = CryoModule.Dictionary.union({
						richText = ParseBooleanProp,
						text = ParseStringProp,
						textTruncate = GetEngineEnumParserFunction(Enum.TextTruncate),
						textWrapped = ParseBooleanProp,
						textXAlignment = GetEngineEnumParserFunction(Enum.TextXAlignment),
						textYAlignment = GetEngineEnumParserFunction(Enum.TextYAlignment)
					}, IconOverrides),
					iconOverrides = IconOverrides,
					textFlexMode = GetEngineEnumParserFunction(Enum.UIFlexMode),
					backgroundStyle = ParseColorTokenProp,
					cornerRadius = ParseUDimProp
				}
			},
			[SduiComponentType.TextPill] = {
				component = require(ServerDrivenUi.Content.SduiTextPill),
				propParsers = {
					anchorPoint = ParseVector2Prop,
					backgroundColor3 = ParseColor3Prop,
					position = ParseUDim2Prop,
					size = ParseUDim2Prop,
					textColor3 = ParseColor3Prop,
					fontStyle = ParseTypographyTokenProp
				}
			},
			[SduiComponentType.Tile] = {
				component = require(ServerDrivenUi.Content.SduiTile),
				propParsers = {
					anchorPoint = ParseVector2Prop,
					automaticSize = GetEngineEnumParserFunction(Enum.AutomaticSize),
					backgroundColor3 = ParseColor3Prop,
					layoutOrder = ParseNumberProp,
					position = ParseUDim2Prop,
					selectionOrder = ParseNumberProp,
					size = ParseUDim2Prop,
					zIndex = ParseNumberProp,
					backgroundImage = ParseImageSetOrImageProp,
					backgroundImageComponent = ParseUiComponentProp,
					backgroundStyle = ParseColorTokenProp,
					containmentPadding = ParseNumberProp,
					cornerRadius = ParseNumberProp,
					ctaButtonComponent = ParseUiComponentProp,
					footerComponent = ParseUiComponentProp,
					image = ParseImageStringProp,
					imageAspectRatio = ParseNumberProp,
					imageComponent = ParseUiComponentProp,
					isContained = ParseBooleanProp,
					onActivated = ParseCallbackProp,
					thumbnailBackgroundStyle = ParseColorTokenProp,
					thumbnailOverlayComponent = ParseUiComponentProp,
					titleComponent = ParseUiComponentProp,
					titleFont = ParseTypographyTokenProp,
					titleLines = ParseIntegerProp,
					titleText = ParseStringProp,
					enableLegacyHoverState = if FFlagSduiTileDisableLegacyHover then nil else ParseBooleanProp,
					focusNavActionsComponent = ParseUiComponentProp,
					bottomButtonComponent = ParseUiComponentProp,
					bottomButtonGap = ParseNumberProp,
					holdActionConfig = {
						onHoldCompleted = ParseCallbackProp,
						focusNavigationEventName = ParseStringProp,
						keyCode = GetEngineEnumParserFunction(Enum.KeyCode)
					}
				}
			},
			[SduiComponentType.TileFooter] = {
				component = require(ServerDrivenUi.Content.SduiTileFooter),
				propParsers = {
					anchorPoint = ParseVector2Prop,
					automaticSize = GetEngineEnumParserFunction(Enum.AutomaticSize),
					layoutOrder = ParseIntegerProp,
					position = ParseUDim2Prop,
					selectable = ParseBooleanProp,
					size = ParseUDim2Prop,
					zIndex = ParseNumberProp,
					sectionGap = ParseNumberProp,
					textIconGap = ParseNumberProp,
					fontStyle = ParseTypographyTokenProp,
					iconColor = ParseColor3Prop,
					iconWidth = ParseNumberProp,
					leftIcon = ParseIconProp,
					leftIconComponent = ParseUiComponentProp,
					leftText = ParseStringProp,
					leftTextFlexMode = GetEngineEnumParserFunction(Enum.UIFlexMode),
					onActivated = ParseCallbackProp,
					rightIcon = ParseIconProp,
					rightIconComponent = ParseUiComponentProp,
					rightText = ParseStringProp,
					rightTextFlexMode = GetEngineEnumParserFunction(Enum.UIFlexMode),
					textColor = ParseColor3Prop
				}
			},
			[SduiComponentType.View] = {
				component = require(Parent.SduiSharedContent).SduiView,
				propParsers = {
					anchorPoint = ParseVector2Prop,
					aspectRatio = ParseNumberProp,
					automaticSize = GetEngineEnumParserFunction(Enum.AutomaticSize),
					backgroundStyle = ParseColorTokenProp,
					children = ParseUiComponentProp,
					clipsDescendants = ParseBooleanProp,
					cornerRadius = ParseUDimProp,
					cursorType = GetLuaTableEnumParserFunction(FoundationModule.Enums.CursorType, "string"),
					groupTransparency = ParseNumberProp,
					isDisabled = ParseBooleanProp,
					layoutOrder = ParseIntegerProp,
					onActivated = ParseCallbackProp,
					onSecondaryActivated = ParseCallbackProp,
					padding = ParseNumberProp,
					position = ParseUDim2Prop,
					rotation = ParseNumberProp,
					scale = ParseNumberProp,
					selectable = ParseBooleanProp,
					selectionGroup = ParseBooleanProp,
					size = ParseUDim2Prop,
					sizeConstraint = GetEngineEnumParserFunction(Enum.SizeConstraint),
					tag = ParseStringProp,
					testId = ParseStringProp,
					visible = ParseBooleanProp,
					zIndex = ParseNumberProp
				}
			}
		}
	}
	config._registeredComponents[SduiComponentType.CountdownTextIconRow] = {
		component = require(ServerDrivenUi.Content.SduiCountdownTextIconRow),
		propParsers = CryoModule.Dictionary.join(config._registeredComponents[SduiComponentType.TextIconRow], {
			endTimestamp = ParseNumberProp,
			formatStringHoursMinutes = ParseStringProp,
			defaultString = ParseStringProp
		})
	}
	config._registeredComponents[SduiComponentType.GameTile] = {
		component = require(ServerDrivenUi.Content.SduiGameTile),
		propParsers = CryoModule.Dictionary.join(config._registeredComponents[SduiComponentType.Tile].propParsers, {
			universeId = ParseStringProp,
			placeId = ParseStringProp,
			collectionId = if FFlagLuaAppSduiGameTileFeedback then ParseStringProp else nil,
			hiddenStateComponent = if FFlagLuaAppSduiGameTileFeedback then ParseLazyUiComponentProp else nil,
			overflowMenuComponent = if FFlagLuaAppSduiGameTileFeedback then ParseLazyUiComponentProp else nil,
			directActionComponent = if FFlagSduiGameTileDirectAction then ParseLazyUiComponentProp else nil,
			disableHoldToPlay = ParseBooleanProp,
			ratingText = ParseStringProp,
			playerCount = ParseNumberProp
		}),
		propInterface = {
			universeId = TModule.union(TModule.string, TModule.number),
			placeId = TModule.union(TModule.string, TModule.number)
		}
	}
	
	if FFlagLuaAppSduiGameTileFeedback then
		config._registeredComponents[SduiComponentType.GameTileHiddenState] = {
			component = require(ServerDrivenUi.Content.SduiGameTileHiddenState)
		}
	end
	if FFlagSduiEnableHeroUnitBottomRow then
		config._registeredComponents[SduiComponentType.HeroUnitBottomRow] = {
			component = require(ServerDrivenUi.Content.SduiHeroUnitBottomRow),
			propParsers = {
				layoutOrder = ParseIntegerProp,
				position = ParseUDim2Prop,
				zIndex = ParseNumberProp,
				ctaButton = ParseUiComponentProp,
				labelText = ParseStringProp,
				rightLabelContent = ParseUiComponentProp
			}
		}
	end
	config._registeredComponents[SduiComponentType.Chip] = {
		component = require(Parent.SduiSharedContent).SduiChip,
		propParsers = {
			anchorPoint = ParseVector2Prop,
			layoutOrder = ParseIntegerProp,
			position = ParseUDim2Prop,
			text = ParseStringProp,
			leadingIconName = ParseStringProp,
			leadingIconVariant = GetLuaTableEnumParserFunction(FoundationModule.Enums.IconVariant, "string"),
			leadingIsCircular = ParseBooleanProp,
			leadingOnActivated = ParseCallbackProp,
			trailingIconName = ParseStringProp,
			trailingIconVariant = GetLuaTableEnumParserFunction(FoundationModule.Enums.IconVariant, "string"),
			trailingIsCircular = ParseBooleanProp,
			trailingOnActivated = ParseCallbackProp,
			onActivated = ParseCallbackProp,
			isChecked = ParseBooleanProp,
			size = GetLuaTableEnumParserFunction(FoundationModule.Enums.ChipSize, "string")
		},
		propInterface = if FFlagSduiChipAccessoryProps then {
			leading = TModule.optional(TModule.table),
			trailing = TModule.optional(TModule.table)
		} else nil
	}
	config._registeredComponents[SduiComponentType.DualActionChip] = {
		component = require(Parent.SduiSharedContent).SduiDualActionChip,
		propParsers = {
			anchorPoint = ParseVector2Prop,
			layoutOrder = ParseIntegerProp,
			position = ParseUDim2Prop,
			text = ParseStringProp,
			leadingIconName = ParseStringProp,
			leadingIconVariant = GetLuaTableEnumParserFunction(FoundationModule.Enums.IconVariant, "string"),
			leadingOnActivated = ParseCallbackProp,
			trailingIconName = ParseStringProp,
			trailingIconVariant = GetLuaTableEnumParserFunction(FoundationModule.Enums.IconVariant, "string"),
			trailingOnActivated = ParseCallbackProp
		}
	}
	config._registeredComponents[SduiComponentType.AssociatedItemsRow] = {
		component = require(ServerDrivenUi.Content.SduiAssociatedItemsRow),
		propParsers = {
			layoutOrder = ParseIntegerProp,
			items = GetArrayMetatableParserFunction(ParseLazyUiComponentProp),
			footerComponent = ParseUiComponentProp
		}
	}
	config._registeredComponents[SduiComponentType.ExperienceAssociatedItemsRow] = {
		component = require(ServerDrivenUi.Content.ExperienceDetails.ExperienceAssociatedItemsRow),
		propParsers = {
			layoutOrder = ParseIntegerProp,
			items = GetArrayMetatableParserFunction(ParseLazyUiComponentProp),
			universeId = ParseStringProp
		},
		propInterface = { universeId = TModule.string }
	}
	config._registeredComponents[SduiComponentType.ExperienceDetailsVoteChip] = {
		component = require(ServerDrivenUi.Content.ExperienceDetails.ExperienceDetailsVoteChip),
		propParsers = {
			layoutOrder = ParseIntegerProp,
			universeId = ParseStringProp
		},
		propInterface = { universeId = TModule.string }
	}
	config._registeredComponents[SduiComponentType.ExperienceDetailsFavoriteChip] = {
		component = require(ServerDrivenUi.Content.ExperienceDetails.ExperienceDetailsFavoriteChip),
		propParsers = {
			layoutOrder = ParseIntegerProp,
			universeId = ParseStringProp
		},
		propInterface = { universeId = TModule.string }
	}
	config._registeredComponents[SduiComponentType.ExperienceDetailsNotifyChip] = {
		component = require(ServerDrivenUi.Content.ExperienceDetails.ExperienceDetailsNotifyChip),
		propParsers = {
			layoutOrder = ParseIntegerProp,
			universeId = ParseStringProp
		},
		propInterface = { universeId = TModule.string }
	}
	config._registeredComponents[SduiComponentType.ExperienceDetailsActiveChip] = {
		component = require(ServerDrivenUi.Content.ExperienceDetails.ExperienceDetailsActiveChip),
		propParsers = {
			layoutOrder = ParseIntegerProp,
			universeId = ParseStringProp
		},
		propInterface = { universeId = TModule.string }
	}
	config._registeredComponents[SduiComponentType.ExperienceDetailsShareChip] = {
		component = require(ServerDrivenUi.Content.ExperienceDetails.ExperienceDetailsShareChip),
		propParsers = {
			layoutOrder = ParseIntegerProp,
			universeId = ParseStringProp
		},
		propInterface = { universeId = TModule.string }
	}
	config._registeredComponents[SduiComponentType.ExperienceDetailsReportChip] = {
		component = require(ServerDrivenUi.Content.ExperienceDetails.ExperienceDetailsReportChip),
		propParsers = {
			layoutOrder = ParseIntegerProp,
			universeId = ParseStringProp
		},
		propInterface = { universeId = TModule.string }
	}
	
	if FFlagSduiExperienceDetailsSocialProof then
		config._registeredComponents[SduiComponentType.ExperienceDetailsConnectionsPlayedChip] = {
			component = require(ServerDrivenUi.Content.ExperienceDetails.ExperienceDetailsConnectionsPlayedChip),
			propParsers = {
				layoutOrder = ParseIntegerProp,
				universeId = ParseStringProp
			},
			propInterface = { universeId = TModule.string }
		}
		config._registeredComponents[SduiComponentType.ExperienceDetailsConnectionsPlayedTextRow] = {
			component = require(ServerDrivenUi.Content.ExperienceDetails.ExperienceDetailsConnectionsPlayedTextRow),
			propParsers = {
				layoutOrder = ParseIntegerProp,
				universeId = ParseStringProp,
				name = ParseStringProp
			},
			propInterface = {
				universeId = TModule.string,
				name = TModule.optional(TModule.string)
			}
		}
	end
	config._registeredComponents[SduiComponentType.VerticalFeed] = {
		component = require(Parent.SduiSharedContent).SduiVerticalFeed,
		propParsers = {
			layoutOrder = ParseIntegerProp,
			feedItems = GetArrayMetatableParserFunction(ParseLazyUiComponentProp),
			gapBetweenFeedItems = ParseNumberProp,
			gapAfterFirstFeedItem = if FFlagSduiIndividualFeedItemSpacing then ParseNumberProp else nil,
			thresholdFromEnd = ParseNumberProp,
			onScrollToEnd = ParseCallbackProp,
			onRefresh = ParseCallbackProp,
			stickyItems = GetArrayMetatableParserFunction(ParseUiComponentProp),
			gapAfterStickyItems = ParseIntegerProp,
			gapBetweenStickyItems = ParseIntegerProp,
			stickyPaddingTop = ParseIntegerProp,
			stickyPaddingBottom = ParseIntegerProp,
			stickyBackgroundStyle = ParseColorTokenProp,
			stickyContentTag = ParseStringProp,
			backgroundStyle = ParseColorTokenProp
		}
	}
	config._registeredComponents[SduiComponentType.BadgeTile] = {
		component = require(ServerDrivenUi.Content.SduiBadgeTile),
		propParsers = CryoModule.Dictionary.join(config._registeredComponents[SduiComponentType.Tile].propParsers, {
			imageCornerRadius = ParseNumberProp,
			imagePadding = ParseNumberProp
		})
	}
	config._registeredComponents[SduiComponentType.Badge] = {
		component = require(Parent.SduiSharedContent).SduiBadge,
		propParsers = {
			anchorPoint = ParseVector2Prop,
			layoutOrder = ParseIntegerProp,
			position = ParseUDim2Prop,
			visible = ParseBooleanProp,
			zIndex = ParseNumberProp,
			text = ParseStringProp,
			icon = ParseStringProp,
			variant = GetLuaTableEnumParserFunction(FoundationModule.Enums.BadgeVariant, "string")
		}
	}
	config._registeredComponents[SduiComponentType.SongTile] = { component = require(ServerDrivenUi.Content.SduiSongTile) }
	config._registeredComponents[SduiComponentType.InfoTable] = {
		component = require(Parent.SduiSharedContent).SduiInfoTable,
		propParsers = {
			layoutOrder = ParseIntegerProp,
			gridTag = ParseStringProp,
			items = GetArrayMetatableParserFunction(ParseLazyUiComponentProp),
			numColumns = ParseIntegerProp,
			tag = ParseStringProp
		},
		propInterface = { items = TModule.array(TModule.table) }
	}
	config._registeredComponents[SduiComponentType.InfoTableCell] = {
		component = require(Parent.AppBlox).InfoTableCell,
		propParsers = {
			labelComponent = ParseUiComponentProp,
			isLastInSingleColumn = ParseBooleanProp,
			numColumns = ParseIntegerProp,
			onActivated = ParseCallbackProp,
			valueComponent = ParseUiComponentProp
		},
		propInterface = {
			labelComponent = TModule.table,
			valueComponent = TModule.table,
			isLastInSingleColumn = TModule.optional(TModule.boolean)
		}
	}
	config._registeredComponents[SduiComponentType.ExpandableText] = {
		component = require(Parent.SduiSharedContent).SduiExpandableText,
		propParsers = {
			layoutOrder = ParseIntegerProp,
			text = ParseStringProp,
			compactNumberOfLines = ParseIntegerProp,
			fontStyle = ParseTypographyTokenProp,
			textStyle = ParseColorTokenProp,
			pressedTextStyle = ParseColorTokenProp,
			expandedInitially = ParseBooleanProp,
			avoidBlankLineClip = ParseBooleanProp,
			onExpandChanged = ParseCallbackProp,
			headerComponent = ParseUiComponentProp
		},
		propInterface = { text = TModule.string }
	}
	config._registeredComponents[SduiComponentType.OverflowMenu] = {
		component = require(Parent.SduiSharedContent).SduiOverflowMenu,
		propParsers = {
			anchorPoint = ParseVector2Prop,
			layoutOrder = ParseIntegerProp,
			position = ParseUDim2Prop,
			zIndex = ParseNumberProp,
			buttonVariant = GetLuaTableEnumParserFunction(FoundationModule.Enums.ButtonVariant, "string"),
			buttonSize = GetLuaTableEnumParserFunction(FoundationModule.Enums.InputSize, "string"),
			buttonIcon = GetLuaTableEnumParserFunction(FoundationModule.Enums.IconName, "string"),
			buttonIconBackgroundStyle = ParseColorTokenProp,
			menuItemSize = GetLuaTableEnumParserFunction(FoundationModule.Enums.InputSize, "string"),
			popoverAlign = GetLuaTableEnumParserFunction(FoundationModule.Enums.PopoverAlign, "string"),
			popoverSide = GetLuaTableEnumParserFunction(FoundationModule.Enums.PopoverSide, "string"),
			menuWidth = ParseUDimProp
		},
		propInterface = { items = TModule.table }
	}
	
	if FFlagLuaAppDismissUnlockUpsell then
		config._registeredComponents[SduiComponentType.AgeCheckUpsellRow] = {
			component = require(ServerDrivenUi.Content.SduiAgeCheckUpsellRow),
			propParsers = {
				leading = ParseUiComponentProp,
				content = ParseUiComponentProp,
				trailing = ParseUiComponentProp,
				onActivated = ParseCallbackProp,
				tag = ParseStringProp,
				leadingTag = ParseStringProp,
				contentTag = ParseStringProp,
				trailingTag = ParseStringProp,
				layoutOrder = ParseIntegerProp,
				position = ParseUDim2Prop,
				zIndex = ParseNumberProp,
				testId = ParseStringProp
			}
		}
	end
	setmetatable(config, SduiComponentDefinitionsModule)
	
	return config
end

function SduiComponentDefinitionsModule:getComponentDefinition(p1) --[[ Line: 958 ]]
	-- upvalues: GetSduiComponentRegistryFunction (copy)
	return self._registeredComponents[p1] or GetSduiComponentRegistryFunction().getComponentDefinition(p1)
end

function SduiComponentDefinitionsModule:doesComponentManageChildren(p1) --[[ Line: 966 ]]
	local ComponentDefinition = self:getComponentDefinition(p1)
	
	return ComponentDefinition and ComponentDefinition.doesManageChildren or false
end

function SduiComponentDefinitionsModule:getComponent(p1) --[[ Line: 974 ]]
	local ComponentDefinition = self:getComponentDefinition(p1)
	
	return ComponentDefinition and ComponentDefinition.component
end

function SduiComponentDefinitionsModule:getPropParsers(p1) --[[ Line: 979 ]]
	-- upvalues: t (copy)
	local ComponentDefinition = self:getComponentDefinition(p1)
	
	return ComponentDefinition and ComponentDefinition.propParsers or t
end

function SduiComponentDefinitionsModule:getPropInterface(p1) --[[ Line: 987 ]]
	local ComponentDefinition = self:getComponentDefinition(p1)
	
	return ComponentDefinition and ComponentDefinition.propInterface or nil
end

local config = {
	[ParseUiComponentProp] = true,
	[ParseCallbackProp] = true,
	[ParseFocusNavActionsProp] = true
}

function SduiComponentDefinitionsModule:doesParserRequireRenderContext(p1): boolean --[[ Line: 998 ]]
	-- upvalues: config (copy)
	return if p1 and config[p1] then true else typeof(p1) == "table"
end

function SduiComponentDefinitionsModule:registerComponent(p1, p2) --[[ Line: 1013 ]]
	self._registeredComponents[p1] = p2
end

return SduiComponentDefinitionsModule