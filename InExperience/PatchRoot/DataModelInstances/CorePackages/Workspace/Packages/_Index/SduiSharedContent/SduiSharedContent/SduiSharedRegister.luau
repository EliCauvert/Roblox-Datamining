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
local fFlagSduiGameItemsComponent = require(parent.SharedFlags).FFlagSduiGameItemsComponent
local luaAppEnableCustomAnalyticsEvent = game:DefineFastFlag("LuaAppEnableCustomAnalyticsEvent", false)
local fFlagSduiSystemBannerComponent = require(parent.SharedFlags).FFlagSduiSystemBannerComponent
local fFlagSduiChartsSupport = require(parent.SharedFlags).FFlagSduiChartsSupport
local fFlagSduiExperienceDetailsSupport = require(parent.SharedFlags).FFlagSduiExperienceDetailsSupport
local fFlagSduiEventDetailsSupport = require(parent.SharedFlags).FFlagSduiEventDetailsSupport
local fFlagLuaAppUnlockUpsellSupport = require(parent.SharedFlags).FFlagLuaAppUnlockUpsellSupport
local fFlagSduiDevStoreSeeAllSupport = require(parent.SharedFlags).FFlagSduiDevStoreSeeAllSupport
local fFlagSduiPlayWithReward = require(parent.SharedFlags).FFlagSduiPlayWithReward
local fFlagSduiDismissPromptAction = require(parent.SharedFlags).FFlagSduiDismissPromptAction
local fFlagSduiShimmerTextComponentEnabled = require(parent.SharedFlags).FFlagSduiShimmerTextComponentEnabled
local fFlagSduiTooltipComponentEnabled = require(parent.SharedFlags).FFlagSduiTooltipComponentEnabled
local fFlagLuaAppSduiPlaceholderSupport = require(parent.SharedFlags).FFlagLuaAppSduiPlaceholderSupport
local fFlagSduiRevealTextComponentEnabled = require(parent.SharedFlags).FFlagSduiRevealTextComponentEnabled
local fFlagSduiAiOverviewEnabled = require(parent.SharedFlags).FFlagSduiAiOverviewEnabled
local fFlagSduiVerticalListWithImpressionsEnabled = require(parent.SharedFlags).FFlagSduiVerticalListWithImpressionsEnabled
local fFlagSduiCollectionCarouselPlaceholderItem = require(parent.SharedFlags).FFlagSduiCollectionCarouselPlaceholderItem
local fFlagSduiShowToastAction = require(parent.SharedFlags).FFlagSduiShowToastAction
local fFlagSduiActionSequence = require(parent.SharedFlags).FFlagSduiActionSequence
local fFlagLuaAppSduiVideoThumbnail = require(parent.SharedFlags).FFlagLuaAppSduiVideoThumbnail

local function registerSharedActions() --[[ line: 57 ]]
	-- upvalues: sduiActionType (ref), fFlagSduiChartsSupport (ref), luaAppEnableCustomAnalyticsEvent (ref), sduiSharedContent (ref), fFlagSduiExperienceDetailsSupport (ref), fFlagSduiDismissPromptAction (ref), fFlagSduiShowToastAction (ref), fFlagSduiActionSequence (ref), getSduiActionHandlerRegistry (ref)
	getSduiActionHandlerRegistry().registerActionHandlerConfigs({
		[sduiActionType.CustomAnalyticsEvent] = if fFlagSduiChartsSupport or luaAppEnableCustomAnalyticsEvent then {
			skipUnifiedLogging = true,
			lazyHandler = function() --[[ line: 65 ]]
				-- upvalues: sduiSharedContent (copy)
				return require(sduiSharedContent.Actions.SduiAnalyticsEventAction)
			end
		} else nil,
		[sduiActionType.LoadMoreFromApi] = {
			skipUnifiedLogging = true,
			lazyHandler = function() --[[ line: 72 ]]
				-- upvalues: sduiSharedContent (copy)
				return require(sduiSharedContent.Actions.SduiLoadMoreFromApi)
			end
		},
		[sduiActionType.RefreshFromApi] = if fFlagSduiChartsSupport then {
			skipUnifiedLogging = true,
			lazyHandler = function() --[[ line: 79 ]]
				-- upvalues: sduiSharedContent (copy)
				return require(sduiSharedContent.Actions.SduiRefreshFromApi)
			end
		} else nil,
		[sduiActionType.Share] = {
			skipUnifiedLogging = false,
			lazyHandler = function() --[[ line: 86 ]]
				-- upvalues: sduiSharedContent (copy)
				return require(sduiSharedContent.Actions.SduiShareAction)
			end
		},
		[sduiActionType.OpenSocialProofUserListSheet] = if fFlagSduiExperienceDetailsSupport then {
			skipUnifiedLogging = true,
			lazyHandler = function() --[[ line: 93 ]]
				-- upvalues: sduiSharedContent (copy)
				return require(sduiSharedContent.Actions.SduiOpenSocialProofUserListSheetAction)
			end
		} else nil,
		[sduiActionType.DismissPrompt] = if fFlagSduiDismissPromptAction then {
			skipUnifiedLogging = false,
			lazyHandler = function() --[[ line: 101 ]]
				-- upvalues: sduiSharedContent (copy)
				return require(sduiSharedContent.Actions.SduiDismissPromptAction)
			end
		} else nil,
		[sduiActionType.ShowToast] = if fFlagSduiShowToastAction then {
			skipUnifiedLogging = false,
			lazyHandler = function() --[[ line: 109 ]]
				-- upvalues: sduiSharedContent (copy)
				return require(sduiSharedContent.Actions.SduiShowToastAction)
			end
		} else nil,
		[sduiActionType.ActionSequence] = if fFlagSduiActionSequence then {
			skipUnifiedLogging = true,
			lazyHandler = function() --[[ line: 119 ]]
				-- upvalues: sduiSharedContent (copy)
				return require(sduiSharedContent.Actions.SduiActionSequenceAction)
			end
		} else nil
	})
end

local function registerSharedUiComponents() --[[ line: 129 ]]
	-- upvalues: sduiComponentType (ref), sduiSharedContent (ref), fFlagSduiExperienceDetailsSupport (ref), fFlagSduiCardComponent (ref), sduiCoachmarkComponent (ref), fFlagSduiSystemBannerComponent (ref), fFlagLuaAppUnlockUpsellSupport (ref), getLuaTableEnumParser (ref), foundationModule (ref), parseColorTokenProp (ref), parseVector2Prop (ref), parseIntegerProp (ref), parseUDim2Prop (ref), parseBooleanProp (ref), parseNumberProp (ref), parseStringProp (ref), fFlagSduiEventDetailsSupport (ref), fFlagSduiShimmerTextComponentEnabled (ref), fFlagSduiRevealTextComponentEnabled (ref), fFlagLuaAppSduiVideoThumbnail (ref), fFlagSduiPlayWithReward (ref), fFlagSduiGameItemsComponent (ref), parseUiComponentProp (ref), parseCallbackProp (ref), fFlagSduiDevStoreSeeAllSupport (ref), fFlagSduiTooltipComponentEnabled (ref), fFlagSduiChartsSupport (ref), fFlagLuaAppSduiPlaceholderSupport (ref), fFlagSduiCollectionCarouselPlaceholderItem (ref), fFlagSduiAiOverviewEnabled (ref), fFlagSduiVerticalListWithImpressionsEnabled (ref), getSduiComponentRegistry (ref)
	getSduiComponentRegistry().registerComponentDefinitions({
		[sduiComponentType.DetailsPageImageHeader] = {
			getLazyComponent = function() --[[ line: 132 ]]
				-- upvalues: sduiSharedContent (copy)
				return require(sduiSharedContent.Components.SduiDetailsPageImageHeader)
			end
		},
		[sduiComponentType.AvatarGroup] = if fFlagSduiExperienceDetailsSupport then {
			getLazyComponent = function() --[[ line: 138 ]]
				-- upvalues: sduiSharedContent (copy)
				return require(sduiSharedContent.Components.SduiAvatarGroup)
			end
		} else nil,
		[sduiComponentType.Card] = if fFlagSduiCardComponent then {
			getLazyComponent = function() --[[ line: 145 ]]
				-- upvalues: sduiSharedContent (copy)
				return require(sduiSharedContent.Components.SduiCard)
			end
		} else nil,
		[sduiComponentType.Coachmark] = if sduiCoachmarkComponent then {
			getLazyComponent = function() --[[ line: 152 ]]
				-- upvalues: sduiSharedContent (copy)
				return require(sduiSharedContent.Components.SduiCoachmark)
			end
		} else nil,
		[sduiComponentType.SystemBanner] = if fFlagSduiSystemBannerComponent then {
			getLazyComponent = function() --[[ line: 159 ]]
				-- upvalues: sduiSharedContent (copy)
				return require(sduiSharedContent.Components.SduiSystemBanner)
			end
		} else nil,
		[sduiComponentType.CircleIcon] = if fFlagSduiExperienceDetailsSupport then {
			getLazyComponent = function() --[[ line: 166 ]]
				-- upvalues: sduiSharedContent (copy)
				return require(sduiSharedContent.Components.SduiCircleIcon)
			end
		} else nil,
		[sduiComponentType.Icon] = if fFlagSduiExperienceDetailsSupport or fFlagLuaAppUnlockUpsellSupport then {
			getLazyComponent = function() --[[ line: 173 ]]
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
		} else nil,
		[sduiComponentType.IconButton] = if fFlagSduiExperienceDetailsSupport or fFlagSduiEventDetailsSupport then {
			getLazyComponent = function() --[[ line: 195 ]]
				-- upvalues: sduiSharedContent (copy)
				return require(sduiSharedContent.Components.SduiIconButton)
			end
		} else nil,
		[sduiComponentType.LinkText] = if fFlagSduiExperienceDetailsSupport then {
			getLazyComponent = function() --[[ line: 203 ]]
				-- upvalues: sduiSharedContent (copy)
				return require(sduiSharedContent.Components.SduiLinkText)
			end
		} else nil,
		[sduiComponentType.ShimmerText] = if fFlagSduiShimmerTextComponentEnabled then {
			getLazyComponent = function() --[[ line: 210 ]]
				-- upvalues: sduiSharedContent (copy)
				return require(sduiSharedContent.Components.SduiShimmerText)
			end
		} else nil,
		[sduiComponentType.RevealText] = if fFlagSduiRevealTextComponentEnabled then {
			getLazyComponent = function() --[[ line: 217 ]]
				-- upvalues: sduiSharedContent (copy)
				return require(sduiSharedContent.Components.SduiRevealText)
			end
		} else nil,
		[sduiComponentType.ContentRatingLabel] = if fFlagSduiExperienceDetailsSupport then {
			getLazyComponent = function() --[[ line: 224 ]]
				-- upvalues: sduiSharedContent (copy)
				return require(sduiSharedContent.Components.SduiContentRatingLabel)
			end
		} else nil,
		[sduiComponentType.MediaGallery] = if fFlagSduiExperienceDetailsSupport then {
			getLazyComponent = function() --[[ line: 231 ]]
				-- upvalues: sduiSharedContent (copy)
				return require(sduiSharedContent.Components.SduiMediaGallery)
			end
		} else nil,
		[sduiComponentType.VideoPlayer] = if fFlagLuaAppSduiVideoThumbnail then {
			getLazyComponent = function() --[[ line: 238 ]]
				-- upvalues: sduiSharedContent (copy)
				return require(sduiSharedContent.Components.SduiVideoPlayer)
			end
		} else nil,
		[sduiComponentType.ActionBar] = if fFlagSduiExperienceDetailsSupport or fFlagSduiEventDetailsSupport then {
			getLazyComponent = function() --[[ line: 245 ]]
				-- upvalues: sduiSharedContent (copy)
				return require(sduiSharedContent.Components.SduiActionBar)
			end
		} else nil,
		[sduiComponentType.PlayButtonContextualMessage] = if fFlagSduiExperienceDetailsSupport then {
			getLazyComponent = function() --[[ line: 252 ]]
				-- upvalues: sduiSharedContent (copy)
				return require(sduiSharedContent.Components.SduiPlayButtonContextualMessage)
			end
		} else nil,
		[sduiComponentType.PlayWithReward] = if fFlagSduiPlayWithReward then {
			getLazyComponent = function() --[[ line: 259 ]]
				-- upvalues: sduiSharedContent (copy)
				return require(sduiSharedContent.Components.SduiPlayWithReward)
			end
		} else nil,
		[sduiComponentType.ContentRow] = if fFlagSduiExperienceDetailsSupport or fFlagLuaAppUnlockUpsellSupport or (fFlagSduiEventDetailsSupport or fFlagSduiGameItemsComponent) then {
			getLazyComponent = function() --[[ line: 269 ]]
				-- upvalues: sduiSharedContent (copy)
				return require(sduiSharedContent.Components.SduiContentRow)
			end,
			propParsers = if fFlagLuaAppUnlockUpsellSupport then {
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
			} else nil
		} else nil,
		[sduiComponentType.SubscriptionCell] = if fFlagSduiDevStoreSeeAllSupport then {
			getLazyComponent = function() --[[ line: 292 ]]
				-- upvalues: sduiSharedContent (copy)
				return require(sduiSharedContent.Components.SduiSubscriptionCell)
			end
		} else nil,
		[sduiComponentType.Tooltip] = if fFlagSduiTooltipComponentEnabled then {
			getLazyComponent = function() --[[ line: 299 ]]
				-- upvalues: sduiSharedContent (copy)
				return require(sduiSharedContent.Components.SduiTooltip)
			end
		} else nil,
		[sduiComponentType.FilterPillsCarousel] = if fFlagSduiChartsSupport then {
			getLazyComponent = function() --[[ line: 306 ]]
				-- upvalues: sduiSharedContent (copy)
				return require(sduiSharedContent.Components.SduiFilterPillsCarousel)
			end
		} else nil,
		[sduiComponentType.Placeholder] = if fFlagLuaAppSduiPlaceholderSupport then {
			getLazyComponent = function() --[[ line: 313 ]]
				-- upvalues: sduiSharedContent (copy)
				return require(sduiSharedContent.Components.SduiPlaceholder)
			end
		} else nil,
		[sduiComponentType.PlaceholderTile] = if fFlagSduiCollectionCarouselPlaceholderItem then {
			getLazyComponent = function() --[[ line: 320 ]]
				-- upvalues: sduiSharedContent (copy)
				return require(sduiSharedContent.Components.SduiPlaceholderTile)
			end
		} else nil,
		[sduiComponentType.PlaceholderWrapper] = if fFlagLuaAppSduiPlaceholderSupport then {
			getLazyComponent = function() --[[ line: 327 ]]
				-- upvalues: sduiSharedContent (copy)
				return require(sduiSharedContent.Components.SduiPlaceholderWrapper)
			end
		} else nil,
		[sduiComponentType.Skeleton] = {
			getLazyComponent = function() --[[ line: 333 ]]
				-- upvalues: sduiSharedContent (copy)
				return require(sduiSharedContent.Components.SduiSkeleton)
			end
		},
		[sduiComponentType.AiOverview] = if fFlagSduiAiOverviewEnabled then {
			getLazyComponent = function() --[[ line: 339 ]]
				-- upvalues: sduiSharedContent (copy)
				return require(sduiSharedContent.Components.SduiAiOverview)
			end
		} else nil,
		[sduiComponentType.VerticalListWithImpressions] = if fFlagSduiVerticalListWithImpressionsEnabled then {
			getLazyComponent = function() --[[ line: 346 ]]
				-- upvalues: sduiSharedContent (copy)
				return require(sduiSharedContent.Components.SduiVerticalListWithImpressions)
			end
		} else nil
	})
end

return reactModule.memo(function() --[[ line: 356 | named "SduiSharedRegister" ]]
	-- upvalues: reactModule (ref), registerSharedActions (ref), registerSharedUiComponents (ref)
	reactModule.useEffect(function() --[[ line: 357 ]]
		-- upvalues: registerSharedActions (copy), registerSharedUiComponents (copy)
		registerSharedActions()
		registerSharedUiComponents()
	end, {})
	
	return nil
end)