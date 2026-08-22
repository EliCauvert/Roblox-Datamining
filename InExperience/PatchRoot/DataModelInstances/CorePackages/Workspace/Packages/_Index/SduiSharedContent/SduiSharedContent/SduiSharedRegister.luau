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
local fFlagSduiNavigate = require(parent.SharedFlags).FFlagSduiNavigate
local fFlagLuaAppSduiVideoThumbnail = require(parent.SharedFlags).FFlagLuaAppSduiVideoThumbnail

local function registerSharedActions() --[[ line: 58 ]]
	-- upvalues: sduiActionType (ref), fFlagSduiChartsSupport (ref), luaAppEnableCustomAnalyticsEvent (ref), sduiSharedContent (ref), fFlagSduiExperienceDetailsSupport (ref), fFlagSduiDismissPromptAction (ref), fFlagSduiShowToastAction (ref), fFlagSduiActionSequence (ref), fFlagSduiNavigate (ref), getSduiActionHandlerRegistry (ref)
	getSduiActionHandlerRegistry().registerActionHandlerConfigs({
		[sduiActionType.CustomAnalyticsEvent] = if fFlagSduiChartsSupport or luaAppEnableCustomAnalyticsEvent then {
			skipUnifiedLogging = true,
			lazyHandler = function() --[[ line: 66 ]]
				-- upvalues: sduiSharedContent (copy)
				return require(sduiSharedContent.Actions.SduiAnalyticsEventAction)
			end
		} else nil,
		[sduiActionType.LoadMoreFromApi] = {
			skipUnifiedLogging = true,
			lazyHandler = function() --[[ line: 73 ]]
				-- upvalues: sduiSharedContent (copy)
				return require(sduiSharedContent.Actions.SduiLoadMoreFromApi)
			end
		},
		[sduiActionType.RefreshFromApi] = if fFlagSduiChartsSupport then {
			skipUnifiedLogging = true,
			lazyHandler = function() --[[ line: 80 ]]
				-- upvalues: sduiSharedContent (copy)
				return require(sduiSharedContent.Actions.SduiRefreshFromApi)
			end
		} else nil,
		[sduiActionType.Share] = {
			skipUnifiedLogging = false,
			lazyHandler = function() --[[ line: 87 ]]
				-- upvalues: sduiSharedContent (copy)
				return require(sduiSharedContent.Actions.SduiShareAction)
			end
		},
		[sduiActionType.OpenSocialProofUserListSheet] = if fFlagSduiExperienceDetailsSupport then {
			skipUnifiedLogging = true,
			lazyHandler = function() --[[ line: 94 ]]
				-- upvalues: sduiSharedContent (copy)
				return require(sduiSharedContent.Actions.SduiOpenSocialProofUserListSheetAction)
			end
		} else nil,
		[sduiActionType.DismissPrompt] = if fFlagSduiDismissPromptAction then {
			skipUnifiedLogging = false,
			lazyHandler = function() --[[ line: 102 ]]
				-- upvalues: sduiSharedContent (copy)
				return require(sduiSharedContent.Actions.SduiDismissPromptAction)
			end
		} else nil,
		[sduiActionType.ShowToast] = if fFlagSduiShowToastAction then {
			skipUnifiedLogging = false,
			lazyHandler = function() --[[ line: 110 ]]
				-- upvalues: sduiSharedContent (copy)
				return require(sduiSharedContent.Actions.SduiShowToastAction)
			end
		} else nil,
		[sduiActionType.ActionSequence] = if fFlagSduiActionSequence then {
			skipUnifiedLogging = true,
			lazyHandler = function() --[[ line: 120 ]]
				-- upvalues: sduiSharedContent (copy)
				return require(sduiSharedContent.Actions.SduiActionSequenceAction)
			end
		} else nil,
		[sduiActionType.Navigate] = if fFlagSduiNavigate then {
			lazyHandler = function() --[[ line: 128 ]]
				-- upvalues: sduiSharedContent (copy)
				return require(sduiSharedContent.Actions.SduiNavigateAction)
			end
		} else nil
	})
end

local function registerSharedUiComponents() --[[ line: 137 ]]
	-- upvalues: sduiComponentType (ref), sduiSharedContent (ref), fFlagSduiExperienceDetailsSupport (ref), fFlagSduiCardComponent (ref), sduiCoachmarkComponent (ref), fFlagSduiSystemBannerComponent (ref), fFlagLuaAppUnlockUpsellSupport (ref), getLuaTableEnumParser (ref), foundationModule (ref), parseColorTokenProp (ref), parseVector2Prop (ref), parseIntegerProp (ref), parseUDim2Prop (ref), parseBooleanProp (ref), parseNumberProp (ref), parseStringProp (ref), fFlagSduiEventDetailsSupport (ref), fFlagSduiShimmerTextComponentEnabled (ref), fFlagSduiRevealTextComponentEnabled (ref), fFlagLuaAppSduiVideoThumbnail (ref), fFlagSduiPlayWithReward (ref), fFlagSduiGameItemsComponent (ref), parseUiComponentProp (ref), parseCallbackProp (ref), fFlagSduiDevStoreSeeAllSupport (ref), fFlagSduiTooltipComponentEnabled (ref), fFlagSduiChartsSupport (ref), fFlagLuaAppSduiPlaceholderSupport (ref), fFlagSduiCollectionCarouselPlaceholderItem (ref), fFlagSduiAiOverviewEnabled (ref), fFlagSduiVerticalListWithImpressionsEnabled (ref), getSduiComponentRegistry (ref)
	getSduiComponentRegistry().registerComponentDefinitions({
		[sduiComponentType.DetailsPageImageHeader] = {
			getLazyComponent = function() --[[ line: 140 ]]
				-- upvalues: sduiSharedContent (copy)
				return require(sduiSharedContent.Components.SduiDetailsPageImageHeader)
			end
		},
		[sduiComponentType.AvatarGroup] = if fFlagSduiExperienceDetailsSupport then {
			getLazyComponent = function() --[[ line: 146 ]]
				-- upvalues: sduiSharedContent (copy)
				return require(sduiSharedContent.Components.SduiAvatarGroup)
			end
		} else nil,
		[sduiComponentType.Card] = if fFlagSduiCardComponent then {
			getLazyComponent = function() --[[ line: 153 ]]
				-- upvalues: sduiSharedContent (copy)
				return require(sduiSharedContent.Components.SduiCard)
			end
		} else nil,
		[sduiComponentType.Coachmark] = if sduiCoachmarkComponent then {
			getLazyComponent = function() --[[ line: 160 ]]
				-- upvalues: sduiSharedContent (copy)
				return require(sduiSharedContent.Components.SduiCoachmark)
			end
		} else nil,
		[sduiComponentType.SystemBanner] = if fFlagSduiSystemBannerComponent then {
			getLazyComponent = function() --[[ line: 167 ]]
				-- upvalues: sduiSharedContent (copy)
				return require(sduiSharedContent.Components.SduiSystemBanner)
			end
		} else nil,
		[sduiComponentType.CircleIcon] = if fFlagSduiExperienceDetailsSupport then {
			getLazyComponent = function() --[[ line: 174 ]]
				-- upvalues: sduiSharedContent (copy)
				return require(sduiSharedContent.Components.SduiCircleIcon)
			end
		} else nil,
		[sduiComponentType.Icon] = if fFlagSduiExperienceDetailsSupport or fFlagLuaAppUnlockUpsellSupport then {
			getLazyComponent = function() --[[ line: 181 ]]
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
			getLazyComponent = function() --[[ line: 203 ]]
				-- upvalues: sduiSharedContent (copy)
				return require(sduiSharedContent.Components.SduiIconButton)
			end
		} else nil,
		[sduiComponentType.LinkText] = if fFlagSduiExperienceDetailsSupport then {
			getLazyComponent = function() --[[ line: 211 ]]
				-- upvalues: sduiSharedContent (copy)
				return require(sduiSharedContent.Components.SduiLinkText)
			end
		} else nil,
		[sduiComponentType.ShimmerText] = if fFlagSduiShimmerTextComponentEnabled then {
			getLazyComponent = function() --[[ line: 218 ]]
				-- upvalues: sduiSharedContent (copy)
				return require(sduiSharedContent.Components.SduiShimmerText)
			end
		} else nil,
		[sduiComponentType.RevealText] = if fFlagSduiRevealTextComponentEnabled then {
			getLazyComponent = function() --[[ line: 225 ]]
				-- upvalues: sduiSharedContent (copy)
				return require(sduiSharedContent.Components.SduiRevealText)
			end
		} else nil,
		[sduiComponentType.ContentRatingLabel] = if fFlagSduiExperienceDetailsSupport then {
			getLazyComponent = function() --[[ line: 232 ]]
				-- upvalues: sduiSharedContent (copy)
				return require(sduiSharedContent.Components.SduiContentRatingLabel)
			end
		} else nil,
		[sduiComponentType.MediaGallery] = if fFlagSduiExperienceDetailsSupport then {
			getLazyComponent = function() --[[ line: 239 ]]
				-- upvalues: sduiSharedContent (copy)
				return require(sduiSharedContent.Components.SduiMediaGallery)
			end
		} else nil,
		[sduiComponentType.VideoPlayer] = if fFlagLuaAppSduiVideoThumbnail then {
			getLazyComponent = function() --[[ line: 246 ]]
				-- upvalues: sduiSharedContent (copy)
				return require(sduiSharedContent.Components.SduiVideoPlayer)
			end
		} else nil,
		[sduiComponentType.ActionBar] = if fFlagSduiExperienceDetailsSupport or fFlagSduiEventDetailsSupport then {
			getLazyComponent = function() --[[ line: 253 ]]
				-- upvalues: sduiSharedContent (copy)
				return require(sduiSharedContent.Components.SduiActionBar)
			end
		} else nil,
		[sduiComponentType.PlayButtonContextualMessage] = if fFlagSduiExperienceDetailsSupport then {
			getLazyComponent = function() --[[ line: 260 ]]
				-- upvalues: sduiSharedContent (copy)
				return require(sduiSharedContent.Components.SduiPlayButtonContextualMessage)
			end
		} else nil,
		[sduiComponentType.PlayWithReward] = if fFlagSduiPlayWithReward then {
			getLazyComponent = function() --[[ line: 267 ]]
				-- upvalues: sduiSharedContent (copy)
				return require(sduiSharedContent.Components.SduiPlayWithReward)
			end
		} else nil,
		[sduiComponentType.ContentRow] = if fFlagSduiExperienceDetailsSupport or fFlagLuaAppUnlockUpsellSupport or (fFlagSduiEventDetailsSupport or fFlagSduiGameItemsComponent) then {
			getLazyComponent = function() --[[ line: 277 ]]
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
			getLazyComponent = function() --[[ line: 300 ]]
				-- upvalues: sduiSharedContent (copy)
				return require(sduiSharedContent.Components.SduiSubscriptionCell)
			end
		} else nil,
		[sduiComponentType.Tooltip] = if fFlagSduiTooltipComponentEnabled then {
			getLazyComponent = function() --[[ line: 307 ]]
				-- upvalues: sduiSharedContent (copy)
				return require(sduiSharedContent.Components.SduiTooltip)
			end
		} else nil,
		[sduiComponentType.FilterPillsCarousel] = if fFlagSduiChartsSupport then {
			getLazyComponent = function() --[[ line: 314 ]]
				-- upvalues: sduiSharedContent (copy)
				return require(sduiSharedContent.Components.SduiFilterPillsCarousel)
			end
		} else nil,
		[sduiComponentType.Placeholder] = if fFlagLuaAppSduiPlaceholderSupport then {
			getLazyComponent = function() --[[ line: 321 ]]
				-- upvalues: sduiSharedContent (copy)
				return require(sduiSharedContent.Components.SduiPlaceholder)
			end
		} else nil,
		[sduiComponentType.PlaceholderTile] = if fFlagSduiCollectionCarouselPlaceholderItem then {
			getLazyComponent = function() --[[ line: 328 ]]
				-- upvalues: sduiSharedContent (copy)
				return require(sduiSharedContent.Components.SduiPlaceholderTile)
			end
		} else nil,
		[sduiComponentType.PlaceholderWrapper] = if fFlagLuaAppSduiPlaceholderSupport then {
			getLazyComponent = function() --[[ line: 335 ]]
				-- upvalues: sduiSharedContent (copy)
				return require(sduiSharedContent.Components.SduiPlaceholderWrapper)
			end
		} else nil,
		[sduiComponentType.Skeleton] = {
			getLazyComponent = function() --[[ line: 341 ]]
				-- upvalues: sduiSharedContent (copy)
				return require(sduiSharedContent.Components.SduiSkeleton)
			end
		},
		[sduiComponentType.AiOverview] = if fFlagSduiAiOverviewEnabled then {
			getLazyComponent = function() --[[ line: 347 ]]
				-- upvalues: sduiSharedContent (copy)
				return require(sduiSharedContent.Components.SduiAiOverview)
			end
		} else nil,
		[sduiComponentType.VerticalListWithImpressions] = if fFlagSduiVerticalListWithImpressionsEnabled then {
			getLazyComponent = function() --[[ line: 354 ]]
				-- upvalues: sduiSharedContent (copy)
				return require(sduiSharedContent.Components.SduiVerticalListWithImpressions)
			end
		} else nil
	})
end

return reactModule.memo(function() --[[ line: 364 | named "SduiSharedRegister" ]]
	-- upvalues: reactModule (ref), registerSharedActions (ref), registerSharedUiComponents (ref)
	reactModule.useEffect(function() --[[ line: 365 ]]
		-- upvalues: registerSharedActions (copy), registerSharedUiComponents (copy)
		registerSharedActions()
		registerSharedUiComponents()
	end, {})
	
	return nil
end)