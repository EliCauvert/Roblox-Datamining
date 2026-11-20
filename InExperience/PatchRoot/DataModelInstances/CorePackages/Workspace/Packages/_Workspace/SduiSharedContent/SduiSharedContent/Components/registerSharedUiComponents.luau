local SduiSharedContent = script:FindFirstAncestor("SduiSharedContent")
local Parent = SduiSharedContent.Parent
local FoundationModule = require(Parent.Foundation)
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local SduiComponentType = SduiCoreSystemModule.SduiComponentType
local SduiParsers = SduiCoreSystemModule.SduiParsers
local GetSduiComponentRegistryFunction = SduiCoreSystemModule.getSduiComponentRegistry
local ParseBooleanProp = SduiParsers.parseBooleanProp_
local ParseCallbackProp = SduiParsers.parseCallbackProp_
local ParseColorTokenProp = SduiParsers.parseColorTokenProp_
local ParseIntegerProp = SduiParsers.parseIntegerProp_
local ParseNumberProp = SduiParsers.parseNumberProp_
local ParseStringProp = SduiParsers.parseStringProp_
local ParseUDim2Prop = SduiParsers.parseUDim2Prop_
local ParseUiComponentProp = SduiParsers.parseUiComponentProp_
local ParseVector2Prop = SduiParsers.parseVector2Prop_
local GetLuaTableEnumParserFunction = SduiParsers.getLuaTableEnumParser
local FFlagSduiCardComponent = require(Parent.SharedFlags).FFlagSduiCardComponent
local FFlagSduiContentRowStateLayerModule = require(SduiSharedContent.Flags.FFlagSduiContentRowStateLayer)
local FFlagSduiCollectionSlotsLayoutModule = require(SduiSharedContent.Flags.FFlagSduiCollectionSlotsLayout)
local FFlagSDUIContentRowSelectableModule = require(SduiSharedContent.Flags.FFlagSDUIContentRowSelectable)
local FFlagSduiListComponents = require(Parent.SharedFlags).FFlagSduiListComponents
local FFlagSduiAccordionComponent = require(Parent.SharedFlags).FFlagSduiAccordionComponent
local FFlagSduiBannerComponent = require(Parent.SharedFlags).FFlagSduiBannerComponent
local FFlagSduiSheetComponent = require(Parent.SharedFlags).FFlagSduiSheetComponent
local FFlagSduiSystemBannerComponent = require(Parent.SharedFlags).FFlagSduiSystemBannerComponent
local FFlagSduiBannerContextComponent = require(Parent.SharedFlags).FFlagSduiBannerContextComponent
local FFlagSduiViewportVisibilityComponent = require(Parent.SharedFlags).FFlagSduiViewportVisibilityComponent
local FFlagSduiInteractableTileWrapper = require(Parent.SharedFlags).FFlagSduiInteractableTileWrapper
local FFlagSduiPlayWithReward = require(Parent.SharedFlags).FFlagSduiPlayWithReward
local FFlagSduiPlayWithRewardRefactor = require(Parent.SharedFlags).FFlagSduiPlayWithRewardRefactor
local FFlagSduiShimmerTextComponentEnabled = require(Parent.SharedFlags).FFlagSduiShimmerTextComponentEnabled
local FFlagSduiTooltipComponentEnabled = require(Parent.SharedFlags).FFlagSduiTooltipComponentEnabled
local FFlagSduiRevealTextComponentEnabled = require(Parent.SharedFlags).FFlagSduiRevealTextComponentEnabled
local FFlagSduiAiOverviewEnabled = require(Parent.SharedFlags).FFlagSduiAiOverviewEnabled
local FFlagSduiPreferredTextSizeLineBudgets = require(Parent.SharedFlags).FFlagSduiPreferredTextSizeLineBudgets
local FFlagSduiVerticalListWithImpressionsEnabled = require(Parent.SharedFlags).FFlagSduiVerticalListWithImpressionsEnabled
local FFlagSduiCollectionCarouselPlaceholderItem = require(Parent.SharedFlags).FFlagSduiCollectionCarouselPlaceholderItem
local FFlagEnableGameJoinEarlyAccess = require(Parent.SharedFlags).FFlagEnableGameJoinEarlyAccess
local FFlagSduiReactionsComponent = require(Parent.SharedFlags).FFlagSduiReactionsComponent
local FFlagSduiMuralSection = require(Parent.SharedFlags).FFlagSduiMuralSection
local FFlagMigrateSduiIcon = require(Parent.SharedFlags).FFlagMigrateSduiIcon

return function()
	-- upvalues: SduiComponentType (copy), SduiSharedContent (copy), FFlagSduiCardComponent (copy), FFlagSduiBannerComponent (copy), FFlagSduiSheetComponent (copy), FFlagSduiSystemBannerComponent (copy), FFlagSduiBannerContextComponent (copy), FFlagSduiViewportVisibilityComponent (copy), FFlagSduiInteractableTileWrapper (copy), FFlagMigrateSduiIcon (copy), Parent (copy), GetLuaTableEnumParserFunction (copy), FoundationModule (copy), ParseColorTokenProp (copy), ParseVector2Prop (copy), ParseIntegerProp (copy), ParseUDim2Prop (copy), ParseBooleanProp (copy), ParseNumberProp (copy), ParseStringProp (copy), FFlagSduiShimmerTextComponentEnabled (copy), FFlagSduiRevealTextComponentEnabled (copy), FFlagSduiPreferredTextSizeLineBudgets (copy), FFlagSduiCollectionSlotsLayoutModule (copy), FFlagEnableGameJoinEarlyAccess (copy), FFlagSduiPlayWithRewardRefactor (copy), FFlagSduiPlayWithReward (copy), ParseUiComponentProp (copy), ParseCallbackProp (copy), FFlagSduiContentRowStateLayerModule (copy), FFlagSDUIContentRowSelectableModule (copy), FFlagSduiListComponents (copy), FFlagSduiAccordionComponent (copy), FFlagSduiTooltipComponentEnabled (copy), FFlagSduiCollectionCarouselPlaceholderItem (copy), FFlagSduiAiOverviewEnabled (copy), FFlagSduiVerticalListWithImpressionsEnabled (copy), FFlagSduiReactionsComponent (copy), FFlagSduiMuralSection (copy), GetSduiComponentRegistryFunction (copy)
	GetSduiComponentRegistryFunction().registerComponentDefinitions({
		[SduiComponentType.DetailsPageImageHeader] = {
			getLazyComponent = function()
				-- upvalues: SduiSharedContent (upval)
				return require(SduiSharedContent.Components.SduiDetailsPageImageHeader)
			end
		},
		[SduiComponentType.AvatarGroup] = {
			getLazyComponent = function()
				-- upvalues: SduiSharedContent (upval)
				return require(SduiSharedContent.Components.SduiAvatarGroup)
			end
		},
		[SduiComponentType.Card] = if FFlagSduiCardComponent then {
			getLazyComponent = function()
				-- upvalues: SduiSharedContent (upval)
				return require(SduiSharedContent.Components.SduiCard)
			end
		} else nil,
		[SduiComponentType.Coachmark] = {
			getLazyComponent = function()
				-- upvalues: SduiSharedContent (upval)
				return require(SduiSharedContent.Components.SduiCoachmark)
			end
		},
		[SduiComponentType.Banner] = if FFlagSduiBannerComponent then {
			getLazyComponent = function()
				-- upvalues: SduiSharedContent (upval)
				return require(SduiSharedContent.Components.SduiBanner)
			end
		} else nil,
		[SduiComponentType.Sheet] = if FFlagSduiSheetComponent then {
			getLazyComponent = function()
				-- upvalues: SduiSharedContent (upval)
				return require(SduiSharedContent.Components.SduiSheet)
			end
		} else nil,
		[SduiComponentType.SystemBanner] = if FFlagSduiSystemBannerComponent then {
			getLazyComponent = function()
				-- upvalues: SduiSharedContent (upval)
				return require(SduiSharedContent.Components.SduiSystemBanner)
			end
		} else nil,
		[SduiComponentType.BannerContext] = if FFlagSduiBannerContextComponent then {
			getLazyComponent = function()
				-- upvalues: SduiSharedContent (upval)
				return require(SduiSharedContent.Components.SduiBannerContext)
			end
		} else nil,
		[SduiComponentType.ViewportVisibility] = if FFlagSduiViewportVisibilityComponent then {
			getLazyComponent = function()
				-- upvalues: SduiSharedContent (upval)
				return require(SduiSharedContent.Components.SduiViewportVisibility)
			end
		} else nil,
		[SduiComponentType.InteractableTileWrapper] = if FFlagSduiInteractableTileWrapper then {
			getLazyComponent = function()
				-- upvalues: SduiSharedContent (upval)
				return require(SduiSharedContent.Components.SduiInteractableTileWrapper)
			end
		} else nil,
		[SduiComponentType.CircleIcon] = {
			getLazyComponent = function()
				-- upvalues: SduiSharedContent (upval)
				return require(SduiSharedContent.Components.SduiCircleIcon)
			end
		},
		[SduiComponentType.Icon] = if FFlagMigrateSduiIcon then nil else {
			getLazyComponent = function()
				-- upvalues: Parent (upval)
				return require(Parent.SduiFoundation).SduiIcon
			end,
			propParsers = {
				name = GetLuaTableEnumParserFunction(FoundationModule.Enums.IconName, "string"),
				style = ParseColorTokenProp,
				size = GetLuaTableEnumParserFunction(FoundationModule.Enums.IconSize, "string"),
				variant = GetLuaTableEnumParserFunction(FoundationModule.Enums.IconVariant, "string"),
				anchorPoint = ParseVector2Prop,
				layoutOrder = ParseIntegerProp,
				position = ParseUDim2Prop,
				visible = ParseBooleanProp,
				zIndex = ParseNumberProp,
				testId = ParseStringProp
			}
		},
		[SduiComponentType.IconButton] = {
			getLazyComponent = function()
				-- upvalues: SduiSharedContent (upval)
				return require(SduiSharedContent.Components.SduiIconButton)
			end
		},
		[SduiComponentType.LinkText] = {
			getLazyComponent = function()
				-- upvalues: SduiSharedContent (upval)
				return require(SduiSharedContent.Components.SduiLinkText)
			end
		},
		[SduiComponentType.ShimmerText] = if FFlagSduiShimmerTextComponentEnabled then {
			getLazyComponent = function()
				-- upvalues: SduiSharedContent (upval)
				return require(SduiSharedContent.Components.SduiShimmerText)
			end
		} else nil,
		[SduiComponentType.RevealText] = if FFlagSduiRevealTextComponentEnabled then {
			getLazyComponent = function()
				-- upvalues: SduiSharedContent (upval)
				return require(SduiSharedContent.Components.SduiRevealText)
			end
		} else nil,
		[SduiComponentType.LineLimitedText] = if FFlagSduiPreferredTextSizeLineBudgets then {
			getLazyComponent = function()
				-- upvalues: SduiSharedContent (upval)
				return require(SduiSharedContent.Components.SduiLineLimitedText)
			end
		} else nil,
		[SduiComponentType.CollectionSlotsLayout] = if FFlagSduiCollectionSlotsLayoutModule then {
			getLazyComponent = function()
				-- upvalues: SduiSharedContent (upval)
				return require(SduiSharedContent.Components.SduiCollectionSlotsLayout)
			end
		} else nil,
		[SduiComponentType.ContentRatingLabel] = {
			getLazyComponent = function()
				-- upvalues: SduiSharedContent (upval)
				return require(SduiSharedContent.Components.SduiContentRatingLabel)
			end
		},
		[SduiComponentType.MediaGallery] = {
			getLazyComponent = function()
				-- upvalues: SduiSharedContent (upval)
				return require(SduiSharedContent.Components.SduiMediaGallery)
			end
		},
		[SduiComponentType.VideoPlayer] = {
			getLazyComponent = function()
				-- upvalues: SduiSharedContent (upval)
				return require(SduiSharedContent.Components.SduiVideoPlayer)
			end
		},
		[SduiComponentType.ActionBar] = {
			getLazyComponent = function()
				-- upvalues: SduiSharedContent (upval)
				return require(SduiSharedContent.Components.SduiActionBar)
			end
		},
		[SduiComponentType.PlayButtonContextualMessage] = {
			getLazyComponent = function()
				-- upvalues: SduiSharedContent (upval)
				return require(SduiSharedContent.Components.SduiPlayButtonContextualMessage)
			end
		},
		[SduiComponentType.PlusEarlyAccessUpsell] = if FFlagEnableGameJoinEarlyAccess then {
			getLazyComponent = function()
				-- upvalues: SduiSharedContent (upval)
				return require(SduiSharedContent.Components.SduiPlusEarlyAccessUpsell)
			end
		} else nil,
		[SduiComponentType.PlayWithReward] = if FFlagSduiPlayWithRewardRefactor then nil elseif FFlagSduiPlayWithReward then {
			getLazyComponent = function()
				-- upvalues: SduiSharedContent (upval)
				return require(SduiSharedContent.Components.SduiPlayWithReward)
			end
		} else nil,
		[SduiComponentType.ContentRow] = {
			getLazyComponent = function()
				-- upvalues: SduiSharedContent (upval)
				return require(SduiSharedContent.Components.SduiContentRow)
			end,
			propParsers = {
				leading = ParseUiComponentProp,
				content = ParseUiComponentProp,
				trailing = ParseUiComponentProp,
				onActivated = ParseCallbackProp,
				stateLayerAffordance = if FFlagSduiContentRowStateLayerModule then GetLuaTableEnumParserFunction(FoundationModule.Enums.StateLayerAffordance, "string") else nil,
				selectable = if FFlagSDUIContentRowSelectableModule then ParseBooleanProp else nil,
				tag = ParseStringProp,
				leadingTag = ParseStringProp,
				contentTag = ParseStringProp,
				trailingTag = ParseStringProp,
				layoutOrder = ParseIntegerProp,
				position = ParseUDim2Prop,
				zIndex = ParseNumberProp,
				testId = ParseStringProp
			}
		},
		[SduiComponentType.ListRoot] = if FFlagSduiListComponents then {
			getLazyComponent = function()
				-- upvalues: SduiSharedContent (upval)
				return require(SduiSharedContent.Components.SduiListRoot)
			end
		} else nil,
		[SduiComponentType.ListItem] = if FFlagSduiListComponents then {
			getLazyComponent = function()
				-- upvalues: SduiSharedContent (upval)
				return require(SduiSharedContent.Components.SduiListItem)
			end
		} else nil,
		[SduiComponentType.Accordion] = if FFlagSduiAccordionComponent then {
			getLazyComponent = function()
				-- upvalues: SduiSharedContent (upval)
				return require(SduiSharedContent.Components.SduiAccordion)
			end
		} else nil,
		[SduiComponentType.AccordionItem] = if FFlagSduiAccordionComponent then {
			getLazyComponent = function()
				-- upvalues: SduiSharedContent (upval)
				return require(SduiSharedContent.Components.SduiAccordionItem)
			end
		} else nil,
		[SduiComponentType.SubscriptionCell] = {
			getLazyComponent = function()
				-- upvalues: SduiSharedContent (upval)
				return require(SduiSharedContent.Components.SduiSubscriptionCell)
			end
		},
		[SduiComponentType.Tooltip] = if FFlagSduiTooltipComponentEnabled then {
			getLazyComponent = function()
				-- upvalues: SduiSharedContent (upval)
				return require(SduiSharedContent.Components.SduiTooltip)
			end
		} else nil,
		[SduiComponentType.FilterPillsCarousel] = {
			getLazyComponent = function()
				-- upvalues: SduiSharedContent (upval)
				return require(SduiSharedContent.Components.SduiFilterPillsCarousel)
			end
		},
		[SduiComponentType.Placeholder] = {
			getLazyComponent = function()
				-- upvalues: SduiSharedContent (upval)
				return require(SduiSharedContent.Components.SduiPlaceholder)
			end
		},
		[SduiComponentType.PlaceholderTile] = if FFlagSduiCollectionCarouselPlaceholderItem then {
			getLazyComponent = function()
				-- upvalues: SduiSharedContent (upval)
				return require(SduiSharedContent.Components.SduiPlaceholderTile)
			end
		} else nil,
		[SduiComponentType.PlaceholderWrapper] = {
			getLazyComponent = function()
				-- upvalues: SduiSharedContent (upval)
				return require(SduiSharedContent.Components.SduiPlaceholderWrapper)
			end
		},
		[SduiComponentType.Skeleton] = {
			getLazyComponent = function()
				-- upvalues: SduiSharedContent (upval)
				return require(SduiSharedContent.Components.SduiSkeleton)
			end
		},
		[SduiComponentType.AiOverview] = if FFlagSduiAiOverviewEnabled then {
			getLazyComponent = function()
				-- upvalues: SduiSharedContent (upval)
				return require(SduiSharedContent.Components.SduiAiOverview)
			end
		} else nil,
		[SduiComponentType.VerticalListWithImpressions] = if FFlagSduiVerticalListWithImpressionsEnabled then {
			getLazyComponent = function()
				-- upvalues: SduiSharedContent (upval)
				return require(SduiSharedContent.Components.SduiVerticalListWithImpressions)
			end
		} else nil,
		[SduiComponentType.Reactions] = if FFlagSduiReactionsComponent then {
			getLazyComponent = function()
				-- upvalues: SduiSharedContent (upval)
				return require(SduiSharedContent.Components.SduiReactions)
			end
		} else nil,
		[SduiComponentType.MuralSection] = if FFlagSduiMuralSection then {
			getLazyComponent = function()
				-- upvalues: SduiSharedContent (upval)
				return require(SduiSharedContent.Components.SduiMuralSection)
			end
		} else nil
	})
end