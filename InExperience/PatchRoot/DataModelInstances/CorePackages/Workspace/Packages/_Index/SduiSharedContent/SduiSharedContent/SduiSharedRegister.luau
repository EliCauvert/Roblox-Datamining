local SduiSharedContent = script:FindFirstAncestor("SduiSharedContent")
local Parent = SduiSharedContent.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local SduiActionType = SduiCoreSystemModule.SduiActionType
local SduiComponentType = SduiCoreSystemModule.SduiComponentType
local SduiParsers = SduiCoreSystemModule.SduiParsers
local GetSduiActionHandlerRegistryFunction = SduiCoreSystemModule.getSduiActionHandlerRegistry
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
local FFlagSDUIContentRowSelectableModule = require(SduiSharedContent.Flags.FFlagSDUIContentRowSelectable)
local FFlagSduiListComponents = require(Parent.SharedFlags).FFlagSduiListComponents
local FFlagSduiAccordionComponent = require(Parent.SharedFlags).FFlagSduiAccordionComponent
local FFlagSduiSystemBannerComponent = require(Parent.SharedFlags).FFlagSduiSystemBannerComponent
local FFlagSduiBannerContextComponent = require(Parent.SharedFlags).FFlagSduiBannerContextComponent
local FFlagSduiViewportVisibilityComponent = require(Parent.SharedFlags).FFlagSduiViewportVisibilityComponent
local FFlagSduiDevStoreSeeAllSupport = require(Parent.SharedFlags).FFlagSduiDevStoreSeeAllSupport
local FFlagSduiPlayWithReward = require(Parent.SharedFlags).FFlagSduiPlayWithReward
local FFlagSduiPlayWithRewardRefactor = require(Parent.SharedFlags).FFlagSduiPlayWithRewardRefactor
local FFlagSduiDismissPromptAction = require(Parent.SharedFlags).FFlagSduiDismissPromptAction
local FFlagLuaAppSduiMovePromptsActions = require(Parent.SharedFlags).FFlagLuaAppSduiMovePromptsActions
local FFlagSduiShimmerTextComponentEnabled = require(Parent.SharedFlags).FFlagSduiShimmerTextComponentEnabled
local FFlagSduiTooltipComponentEnabled = require(Parent.SharedFlags).FFlagSduiTooltipComponentEnabled
local FFlagSduiRevealTextComponentEnabled = require(Parent.SharedFlags).FFlagSduiRevealTextComponentEnabled
local FFlagSduiAiOverviewEnabled = require(Parent.SharedFlags).FFlagSduiAiOverviewEnabled
local FFlagSduiPreferredTextSizeLineBudgets = require(Parent.SharedFlags).FFlagSduiPreferredTextSizeLineBudgets
local FFlagSduiVerticalListWithImpressionsEnabled = require(Parent.SharedFlags).FFlagSduiVerticalListWithImpressionsEnabled
local FFlagSduiCollectionCarouselPlaceholderItem = require(Parent.SharedFlags).FFlagSduiCollectionCarouselPlaceholderItem
local FFlagSduiShowToastAction = require(Parent.SharedFlags).FFlagSduiShowToastAction
local FFlagSduiActionSequence = require(Parent.SharedFlags).FFlagSduiActionSequence
local FFlagSduiNavigate = require(Parent.SharedFlags).FFlagSduiNavigate
local FFlagSduiSetPageScopeFieldActionModule = require(SduiSharedContent.Flags.FFlagSduiSetPageScopeFieldAction)
local FFlagLuaAppSduiVideoThumbnail = require(Parent.SharedFlags).FFlagLuaAppSduiVideoThumbnail
local FFlagEnableGameJoinEarlyAccess = require(Parent.SharedFlags).FFlagEnableGameJoinEarlyAccess

local function registerSharedActions()
	-- upvalues: SduiActionType (copy), SduiSharedContent (copy), FFlagSduiDismissPromptAction (copy), FFlagLuaAppSduiMovePromptsActions (copy), FFlagSduiShowToastAction (copy), FFlagSduiActionSequence (copy), FFlagSduiNavigate (copy), FFlagSduiSetPageScopeFieldActionModule (copy), GetSduiActionHandlerRegistryFunction (copy)
	GetSduiActionHandlerRegistryFunction().registerActionHandlerConfigs({
		[SduiActionType.CustomAnalyticsEvent] = {
			skipUnifiedLogging = true,
			lazyHandler = function()
				-- upvalues: SduiSharedContent (upval)
				return require(SduiSharedContent.Actions.SduiAnalyticsEventAction)
			end
		},
		[SduiActionType.LoadMoreFromApi] = {
			skipUnifiedLogging = true,
			lazyHandler = function()
				-- upvalues: SduiSharedContent (upval)
				return require(SduiSharedContent.Actions.SduiLoadMoreFromApi)
			end
		},
		[SduiActionType.RefreshFromApi] = {
			skipUnifiedLogging = true,
			lazyHandler = function()
				-- upvalues: SduiSharedContent (upval)
				return require(SduiSharedContent.Actions.SduiRefreshFromApi)
			end
		},
		[SduiActionType.Share] = {
			skipUnifiedLogging = false,
			lazyHandler = function()
				-- upvalues: SduiSharedContent (upval)
				return require(SduiSharedContent.Actions.SduiShareAction)
			end
		},
		[SduiActionType.OpenSocialProofUserListSheet] = {
			skipUnifiedLogging = true,
			lazyHandler = function()
				-- upvalues: SduiSharedContent (upval)
				return require(SduiSharedContent.Actions.SduiOpenSocialProofUserListSheetAction)
			end
		},
		[SduiActionType.DismissPrompt] = if FFlagSduiDismissPromptAction and not FFlagLuaAppSduiMovePromptsActions then {
			skipUnifiedLogging = false,
			lazyHandler = function()
				-- upvalues: SduiSharedContent (upval)
				return require(SduiSharedContent.Actions.SduiDismissPromptAction)
			end
		} else nil,
		[SduiActionType.ShowToast] = if FFlagSduiShowToastAction then {
			skipUnifiedLogging = false,
			lazyHandler = function()
				-- upvalues: SduiSharedContent (upval)
				return require(SduiSharedContent.Actions.SduiShowToastAction)
			end
		} else nil,
		[SduiActionType.ActionSequence] = if FFlagSduiActionSequence then {
			skipUnifiedLogging = true,
			lazyHandler = function()
				-- upvalues: SduiSharedContent (upval)
				return require(SduiSharedContent.Actions.SduiActionSequenceAction)
			end
		} else nil,
		[SduiActionType.Navigate] = if FFlagSduiNavigate then {
			lazyHandler = function()
				-- upvalues: SduiSharedContent (upval)
				return require(SduiSharedContent.Actions.SduiNavigateAction)
			end
		} else nil,
		[SduiActionType.SetPageScopeField] = if FFlagSduiSetPageScopeFieldActionModule then {
			lazyHandler = function()
				-- upvalues: SduiSharedContent (upval)
				return require(SduiSharedContent.Actions.SduiSetPageScopeFieldAction)
			end
		} else nil
	})
end

local function registerSharedUiComponents()
	-- upvalues: SduiComponentType (copy), SduiSharedContent (copy), FFlagSduiCardComponent (copy), FFlagSduiSystemBannerComponent (copy), FFlagSduiBannerContextComponent (copy), FFlagSduiViewportVisibilityComponent (copy), GetLuaTableEnumParserFunction (copy), FoundationModule (copy), ParseColorTokenProp (copy), ParseVector2Prop (copy), ParseIntegerProp (copy), ParseUDim2Prop (copy), ParseBooleanProp (copy), ParseNumberProp (copy), ParseStringProp (copy), FFlagSduiShimmerTextComponentEnabled (copy), FFlagSduiRevealTextComponentEnabled (copy), FFlagSduiPreferredTextSizeLineBudgets (copy), FFlagLuaAppSduiVideoThumbnail (copy), FFlagEnableGameJoinEarlyAccess (copy), FFlagSduiPlayWithRewardRefactor (copy), FFlagSduiPlayWithReward (copy), ParseUiComponentProp (copy), ParseCallbackProp (copy), FFlagSduiContentRowStateLayerModule (copy), FFlagSDUIContentRowSelectableModule (copy), FFlagSduiListComponents (copy), FFlagSduiAccordionComponent (copy), FFlagSduiDevStoreSeeAllSupport (copy), FFlagSduiTooltipComponentEnabled (copy), FFlagSduiCollectionCarouselPlaceholderItem (copy), FFlagSduiAiOverviewEnabled (copy), FFlagSduiVerticalListWithImpressionsEnabled (copy), GetSduiComponentRegistryFunction (copy)
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
		[SduiComponentType.CircleIcon] = {
			getLazyComponent = function()
				-- upvalues: SduiSharedContent (upval)
				return require(SduiSharedContent.Components.SduiCircleIcon)
			end
		},
		[SduiComponentType.Icon] = {
			getLazyComponent = function()
				-- upvalues: SduiSharedContent (upval)
				return require(SduiSharedContent.Components.SduiIcon)
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
		[SduiComponentType.VideoPlayer] = if FFlagLuaAppSduiVideoThumbnail then {
			getLazyComponent = function()
				-- upvalues: SduiSharedContent (upval)
				return require(SduiSharedContent.Components.SduiVideoPlayer)
			end
		} else nil,
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
		[SduiComponentType.SubscriptionCell] = if FFlagSduiDevStoreSeeAllSupport then {
			getLazyComponent = function()
				-- upvalues: SduiSharedContent (upval)
				return require(SduiSharedContent.Components.SduiSubscriptionCell)
			end
		} else nil,
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
		} else nil
	})
end

return ReactModule.memo(function()
	-- upvalues: ReactModule (copy), registerSharedActions (copy), registerSharedUiComponents (copy)
	ReactModule.useEffect(function()
		-- upvalues: registerSharedActions (upval), registerSharedUiComponents (upval)
		registerSharedActions()
		registerSharedUiComponents()
	end, {})
	
	return nil
end)