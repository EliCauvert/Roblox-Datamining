local sduiSharedContent = script:FindFirstAncestor("SduiSharedContent")
local parent = sduiSharedContent.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local sduiActionType = sduiCoreSystemModule.SduiActionType
local sduiComponentType = sduiCoreSystemModule.SduiComponentType
local sduiParsers = sduiCoreSystemModule.SduiParsers
local getSduiActionHandlerRegistry = sduiCoreSystemModule.getSduiActionHandlerRegistry
local getSduiComponentRegistry = sduiCoreSystemModule.getSduiComponentRegistry
local parseBooleanProp = sduiParsers.parseBooleanProp_
local parseCallbackProp = sduiParsers.parseCallbackProp_
local parseColorTokenProp = sduiParsers.parseColorTokenProp_
local parseIntegerProp = sduiParsers.parseIntegerProp_
local parseNumberProp = sduiParsers.parseNumberProp_
local parseStringProp = sduiParsers.parseStringProp_
local parseUDim2Prop = sduiParsers.parseUDim2Prop_
local parseUiComponentProp = sduiParsers.parseUiComponentProp_
local parseVector2Prop = sduiParsers.parseVector2Prop_
local getLuaTableEnumParser = sduiParsers.getLuaTableEnumParser
local fFlagSduiCardComponent = require(parent.SharedFlags).FFlagSduiCardComponent
local sduiCoachmarkComponent = game:DefineFastFlag("SduiCoachmarkComponent", false)
local fFlagSduiContentRowStateLayerModule = require(sduiSharedContent.Flags.FFlagSduiContentRowStateLayer)
local fFlagSduiSystemBannerComponent = require(parent.SharedFlags).FFlagSduiSystemBannerComponent
local fFlagLuaAppUnlockUpsellSupport = require(parent.SharedFlags).FFlagLuaAppUnlockUpsellSupport
local fFlagSduiDevStoreSeeAllSupport = require(parent.SharedFlags).FFlagSduiDevStoreSeeAllSupport
local fFlagSduiPlayWithReward = require(parent.SharedFlags).FFlagSduiPlayWithReward
local fFlagSduiDismissPromptAction = require(parent.SharedFlags).FFlagSduiDismissPromptAction
local fFlagLuaAppSduiMovePromptsActions = require(parent.SharedFlags).FFlagLuaAppSduiMovePromptsActions
local fFlagSduiShimmerTextComponentEnabled = require(parent.SharedFlags).FFlagSduiShimmerTextComponentEnabled
local fFlagSduiTooltipComponentEnabled = require(parent.SharedFlags).FFlagSduiTooltipComponentEnabled
local fFlagSduiRevealTextComponentEnabled = require(parent.SharedFlags).FFlagSduiRevealTextComponentEnabled
local fFlagSduiAiOverviewEnabled = require(parent.SharedFlags).FFlagSduiAiOverviewEnabled
local fFlagSduiVerticalListWithImpressionsEnabled = require(parent.SharedFlags).FFlagSduiVerticalListWithImpressionsEnabled
local fFlagSduiCollectionCarouselPlaceholderItem = require(parent.SharedFlags).FFlagSduiCollectionCarouselPlaceholderItem
local fFlagSduiShowToastAction = require(parent.SharedFlags).FFlagSduiShowToastAction
local fFlagSduiActionSequence = require(parent.SharedFlags).FFlagSduiActionSequence
local fFlagSduiNavigate = require(parent.SharedFlags).FFlagSduiNavigate
local fFlagLuaAppSduiVideoThumbnail = require(parent.SharedFlags).FFlagLuaAppSduiVideoThumbnail
local fFlagEnableGameJoinEarlyAccess = require(parent.SharedFlags).FFlagEnableGameJoinEarlyAccess

local function registerSharedActions()
	-- upvalues: sduiActionType (ref), sduiSharedContent (ref), fFlagSduiDismissPromptAction (ref), fFlagLuaAppSduiMovePromptsActions (ref), fFlagSduiShowToastAction (ref), fFlagSduiActionSequence (ref), fFlagSduiNavigate (ref), getSduiActionHandlerRegistry (ref)
	getSduiActionHandlerRegistry().registerActionHandlerConfigs({
		[sduiActionType.CustomAnalyticsEvent] = {
			skipUnifiedLogging = true,
			lazyHandler = function()
				-- upvalues: sduiSharedContent (copy)
				return require(sduiSharedContent.Actions.SduiAnalyticsEventAction)
			end
		},
		[sduiActionType.LoadMoreFromApi] = {
			skipUnifiedLogging = true,
			lazyHandler = function()
				-- upvalues: sduiSharedContent (copy)
				return require(sduiSharedContent.Actions.SduiLoadMoreFromApi)
			end
		},
		[sduiActionType.RefreshFromApi] = {
			skipUnifiedLogging = true,
			lazyHandler = function()
				-- upvalues: sduiSharedContent (copy)
				return require(sduiSharedContent.Actions.SduiRefreshFromApi)
			end
		},
		[sduiActionType.Share] = {
			skipUnifiedLogging = false,
			lazyHandler = function()
				-- upvalues: sduiSharedContent (copy)
				return require(sduiSharedContent.Actions.SduiShareAction)
			end
		},
		[sduiActionType.OpenSocialProofUserListSheet] = {
			skipUnifiedLogging = true,
			lazyHandler = function()
				-- upvalues: sduiSharedContent (copy)
				return require(sduiSharedContent.Actions.SduiOpenSocialProofUserListSheetAction)
			end
		},
		[sduiActionType.DismissPrompt] = if fFlagSduiDismissPromptAction and not fFlagLuaAppSduiMovePromptsActions then {
			skipUnifiedLogging = false,
			lazyHandler = function()
				-- upvalues: sduiSharedContent (copy)
				return require(sduiSharedContent.Actions.SduiDismissPromptAction)
			end
		} else nil,
		[sduiActionType.ShowToast] = if fFlagSduiShowToastAction then {
			skipUnifiedLogging = false,
			lazyHandler = function()
				-- upvalues: sduiSharedContent (copy)
				return require(sduiSharedContent.Actions.SduiShowToastAction)
			end
		} else nil,
		[sduiActionType.ActionSequence] = if fFlagSduiActionSequence then {
			skipUnifiedLogging = true,
			lazyHandler = function()
				-- upvalues: sduiSharedContent (copy)
				return require(sduiSharedContent.Actions.SduiActionSequenceAction)
			end
		} else nil,
		[sduiActionType.Navigate] = if fFlagSduiNavigate then {
			lazyHandler = function()
				-- upvalues: sduiSharedContent (copy)
				return require(sduiSharedContent.Actions.SduiNavigateAction)
			end
		} else nil
	})
end

local function registerSharedUiComponents()
	-- upvalues: sduiComponentType (ref), sduiSharedContent (ref), fFlagSduiCardComponent (ref), sduiCoachmarkComponent (ref), fFlagSduiSystemBannerComponent (ref), fFlagLuaAppUnlockUpsellSupport (ref), getLuaTableEnumParser (ref), foundationModule (ref), parseColorTokenProp (ref), parseVector2Prop (ref), parseIntegerProp (ref), parseUDim2Prop (ref), parseBooleanProp (ref), parseNumberProp (ref), parseStringProp (ref), fFlagSduiShimmerTextComponentEnabled (ref), fFlagSduiRevealTextComponentEnabled (ref), fFlagLuaAppSduiVideoThumbnail (ref), fFlagEnableGameJoinEarlyAccess (ref), fFlagSduiPlayWithReward (ref), parseUiComponentProp (ref), parseCallbackProp (ref), fFlagSduiContentRowStateLayerModule (ref), fFlagSduiDevStoreSeeAllSupport (ref), fFlagSduiTooltipComponentEnabled (ref), fFlagSduiCollectionCarouselPlaceholderItem (ref), fFlagSduiAiOverviewEnabled (ref), fFlagSduiVerticalListWithImpressionsEnabled (ref), getSduiComponentRegistry (ref)
	getSduiComponentRegistry().registerComponentDefinitions({
		[sduiComponentType.DetailsPageImageHeader] = {
			getLazyComponent = function()
				-- upvalues: sduiSharedContent (copy)
				return require(sduiSharedContent.Components.SduiDetailsPageImageHeader)
			end
		},
		[sduiComponentType.AvatarGroup] = {
			getLazyComponent = function()
				-- upvalues: sduiSharedContent (copy)
				return require(sduiSharedContent.Components.SduiAvatarGroup)
			end
		},
		[sduiComponentType.Card] = if fFlagSduiCardComponent then {
			getLazyComponent = function()
				-- upvalues: sduiSharedContent (copy)
				return require(sduiSharedContent.Components.SduiCard)
			end
		} else nil,
		[sduiComponentType.Coachmark] = if sduiCoachmarkComponent then {
			getLazyComponent = function()
				-- upvalues: sduiSharedContent (copy)
				return require(sduiSharedContent.Components.SduiCoachmark)
			end
		} else nil,
		[sduiComponentType.SystemBanner] = if fFlagSduiSystemBannerComponent then {
			getLazyComponent = function()
				-- upvalues: sduiSharedContent (copy)
				return require(sduiSharedContent.Components.SduiSystemBanner)
			end
		} else nil,
		[sduiComponentType.CircleIcon] = {
			getLazyComponent = function()
				-- upvalues: sduiSharedContent (copy)
				return require(sduiSharedContent.Components.SduiCircleIcon)
			end
		},
		[sduiComponentType.Icon] = {
			getLazyComponent = function()
				-- upvalues: sduiSharedContent (copy)
				return require(sduiSharedContent.Components.SduiIcon)
			end,
			propParsers = if fFlagLuaAppUnlockUpsellSupport then {
				name = getLuaTableEnumParser(foundationModule.Enums.IconName, "string"),
				style = parseColorTokenProp,
				size = getLuaTableEnumParser(foundationModule.Enums.IconSize, "string"),
				variant = getLuaTableEnumParser(foundationModule.Enums.IconVariant, "string"),
				anchorPoint = parseVector2Prop,
				layoutOrder = parseIntegerProp,
				position = parseUDim2Prop,
				visible = parseBooleanProp,
				zIndex = parseNumberProp,
				testId = parseStringProp
			} else nil
		},
		[sduiComponentType.IconButton] = {
			getLazyComponent = function()
				-- upvalues: sduiSharedContent (copy)
				return require(sduiSharedContent.Components.SduiIconButton)
			end
		},
		[sduiComponentType.LinkText] = {
			getLazyComponent = function()
				-- upvalues: sduiSharedContent (copy)
				return require(sduiSharedContent.Components.SduiLinkText)
			end
		},
		[sduiComponentType.ShimmerText] = if fFlagSduiShimmerTextComponentEnabled then {
			getLazyComponent = function()
				-- upvalues: sduiSharedContent (copy)
				return require(sduiSharedContent.Components.SduiShimmerText)
			end
		} else nil,
		[sduiComponentType.RevealText] = if fFlagSduiRevealTextComponentEnabled then {
			getLazyComponent = function()
				-- upvalues: sduiSharedContent (copy)
				return require(sduiSharedContent.Components.SduiRevealText)
			end
		} else nil,
		[sduiComponentType.ContentRatingLabel] = {
			getLazyComponent = function()
				-- upvalues: sduiSharedContent (copy)
				return require(sduiSharedContent.Components.SduiContentRatingLabel)
			end
		},
		[sduiComponentType.MediaGallery] = {
			getLazyComponent = function()
				-- upvalues: sduiSharedContent (copy)
				return require(sduiSharedContent.Components.SduiMediaGallery)
			end
		},
		[sduiComponentType.VideoPlayer] = if fFlagLuaAppSduiVideoThumbnail then {
			getLazyComponent = function()
				-- upvalues: sduiSharedContent (copy)
				return require(sduiSharedContent.Components.SduiVideoPlayer)
			end
		} else nil,
		[sduiComponentType.ActionBar] = {
			getLazyComponent = function()
				-- upvalues: sduiSharedContent (copy)
				return require(sduiSharedContent.Components.SduiActionBar)
			end
		},
		[sduiComponentType.PlayButtonContextualMessage] = {
			getLazyComponent = function()
				-- upvalues: sduiSharedContent (copy)
				return require(sduiSharedContent.Components.SduiPlayButtonContextualMessage)
			end
		},
		[sduiComponentType.PlusEarlyAccessUpsell] = if fFlagEnableGameJoinEarlyAccess then {
			getLazyComponent = function()
				-- upvalues: sduiSharedContent (copy)
				return require(sduiSharedContent.Components.SduiPlusEarlyAccessUpsell)
			end
		} else nil,
		[sduiComponentType.PlayWithReward] = if fFlagSduiPlayWithReward then {
			getLazyComponent = function()
				-- upvalues: sduiSharedContent (copy)
				return require(sduiSharedContent.Components.SduiPlayWithReward)
			end
		} else nil,
		[sduiComponentType.ContentRow] = {
			getLazyComponent = function()
				-- upvalues: sduiSharedContent (copy)
				return require(sduiSharedContent.Components.SduiContentRow)
			end,
			propParsers = if fFlagLuaAppUnlockUpsellSupport then {
				leading = parseUiComponentProp,
				content = parseUiComponentProp,
				trailing = parseUiComponentProp,
				onActivated = parseCallbackProp,
				stateLayerAffordance = if fFlagSduiContentRowStateLayerModule then getLuaTableEnumParser(foundationModule.Enums.StateLayerAffordance, "string") else nil,
				tag = parseStringProp,
				leadingTag = parseStringProp,
				contentTag = parseStringProp,
				trailingTag = parseStringProp,
				layoutOrder = parseIntegerProp,
				position = parseUDim2Prop,
				zIndex = parseNumberProp,
				testId = parseStringProp
			} else nil
		},
		[sduiComponentType.SubscriptionCell] = if fFlagSduiDevStoreSeeAllSupport then {
			getLazyComponent = function()
				-- upvalues: sduiSharedContent (copy)
				return require(sduiSharedContent.Components.SduiSubscriptionCell)
			end
		} else nil,
		[sduiComponentType.Tooltip] = if fFlagSduiTooltipComponentEnabled then {
			getLazyComponent = function()
				-- upvalues: sduiSharedContent (copy)
				return require(sduiSharedContent.Components.SduiTooltip)
			end
		} else nil,
		[sduiComponentType.FilterPillsCarousel] = {
			getLazyComponent = function()
				-- upvalues: sduiSharedContent (copy)
				return require(sduiSharedContent.Components.SduiFilterPillsCarousel)
			end
		},
		[sduiComponentType.Placeholder] = {
			getLazyComponent = function()
				-- upvalues: sduiSharedContent (copy)
				return require(sduiSharedContent.Components.SduiPlaceholder)
			end
		},
		[sduiComponentType.PlaceholderTile] = if fFlagSduiCollectionCarouselPlaceholderItem then {
			getLazyComponent = function()
				-- upvalues: sduiSharedContent (copy)
				return require(sduiSharedContent.Components.SduiPlaceholderTile)
			end
		} else nil,
		[sduiComponentType.PlaceholderWrapper] = {
			getLazyComponent = function()
				-- upvalues: sduiSharedContent (copy)
				return require(sduiSharedContent.Components.SduiPlaceholderWrapper)
			end
		},
		[sduiComponentType.Skeleton] = {
			getLazyComponent = function()
				-- upvalues: sduiSharedContent (copy)
				return require(sduiSharedContent.Components.SduiSkeleton)
			end
		},
		[sduiComponentType.AiOverview] = if fFlagSduiAiOverviewEnabled then {
			getLazyComponent = function()
				-- upvalues: sduiSharedContent (copy)
				return require(sduiSharedContent.Components.SduiAiOverview)
			end
		} else nil,
		[sduiComponentType.VerticalListWithImpressions] = if fFlagSduiVerticalListWithImpressionsEnabled then {
			getLazyComponent = function()
				-- upvalues: sduiSharedContent (copy)
				return require(sduiSharedContent.Components.SduiVerticalListWithImpressions)
			end
		} else nil
	})
end

return reactModule.memo(function()
	-- upvalues: reactModule (ref), registerSharedActions (ref), registerSharedUiComponents (ref)
	reactModule.useEffect(function()
		-- upvalues: registerSharedActions (copy), registerSharedUiComponents (copy)
		registerSharedActions()
		registerSharedUiComponents()
	end, {})
	
	return nil
end)