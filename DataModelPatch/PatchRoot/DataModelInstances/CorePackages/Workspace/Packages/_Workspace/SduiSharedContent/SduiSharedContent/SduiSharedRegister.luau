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
local SduiCoachmarkComponent = game:DefineFastFlag("SduiCoachmarkComponent", false)
local LuaAppEnableCustomAnalyticsEvent = game:DefineFastFlag("LuaAppEnableCustomAnalyticsEvent", false)
local FFlagSduiSystemBannerComponent = require(Parent.SharedFlags).FFlagSduiSystemBannerComponent
local FFlagSduiChartsSupport = require(Parent.SharedFlags).FFlagSduiChartsSupport
local FFlagSduiExperienceDetailsSupport = require(Parent.SharedFlags).FFlagSduiExperienceDetailsSupport
local FFlagSduiEventDetailsSupport = require(Parent.SharedFlags).FFlagSduiEventDetailsSupport
local FFlagLuaAppUnlockUpsellSupport = require(Parent.SharedFlags).FFlagLuaAppUnlockUpsellSupport
local FFlagSduiDevStoreSeeAllSupport = require(Parent.SharedFlags).FFlagSduiDevStoreSeeAllSupport
local FFlagSduiPlayWithReward = require(Parent.SharedFlags).FFlagSduiPlayWithReward
local FFlagSduiDismissPromptAction = require(Parent.SharedFlags).FFlagSduiDismissPromptAction
local FFlagLuaAppSduiVerificationUpsellActions = require(Parent.SharedFlags).FFlagLuaAppSduiVerificationUpsellActions
local FFlagSduiShimmerTextComponentEnabled = require(Parent.SharedFlags).FFlagSduiShimmerTextComponentEnabled
local FFlagSduiTooltipComponentEnabled = require(Parent.SharedFlags).FFlagSduiTooltipComponentEnabled
local FFlagLuaAppSduiPlaceholderSupport = require(Parent.SharedFlags).FFlagLuaAppSduiPlaceholderSupport
local FFlagSduiSkeletonComponentEnabled = require(Parent.SharedFlags).FFlagSduiSkeletonComponentEnabled
local FFlagSduiRevealTextComponentEnabled = require(Parent.SharedFlags).FFlagSduiRevealTextComponentEnabled
local FFlagSduiAiOverviewEnabled = require(Parent.SharedFlags).FFlagSduiAiOverviewEnabled
local FFlagSduiCollectionCarouselPlaceholderItem = require(Parent.SharedFlags).FFlagSduiCollectionCarouselPlaceholderItem

local function registerSharedActions()
	-- upvalues: SduiActionType (copy), FFlagSduiChartsSupport (copy), LuaAppEnableCustomAnalyticsEvent (copy), SduiSharedContent (copy), FFlagSduiExperienceDetailsSupport (copy), FFlagSduiDismissPromptAction (copy), FFlagLuaAppSduiVerificationUpsellActions (copy), GetSduiActionHandlerRegistryFunction (copy)
	GetSduiActionHandlerRegistryFunction().registerActionHandlerConfigs({
		[SduiActionType.CustomAnalyticsEvent] = if FFlagSduiChartsSupport or LuaAppEnableCustomAnalyticsEvent then {
			skipUnifiedLogging = true,
			lazyHandler = function()
				-- upvalues: SduiSharedContent (upval)
				return require(SduiSharedContent.Actions.SduiAnalyticsEventAction)
			end
		} else nil,
		[SduiActionType.LoadMoreFromApi] = {
			skipUnifiedLogging = true,
			lazyHandler = function()
				-- upvalues: SduiSharedContent (upval)
				return require(SduiSharedContent.Actions.SduiLoadMoreFromApi)
			end
		},
		[SduiActionType.RefreshFromApi] = if FFlagSduiChartsSupport then {
			skipUnifiedLogging = true,
			lazyHandler = function()
				-- upvalues: SduiSharedContent (upval)
				return require(SduiSharedContent.Actions.SduiRefreshFromApi)
			end
		} else nil,
		[SduiActionType.Share] = {
			skipUnifiedLogging = false,
			lazyHandler = function()
				-- upvalues: SduiSharedContent (upval)
				return require(SduiSharedContent.Actions.SduiShareAction)
			end
		},
		[SduiActionType.OpenSocialProofUserListSheet] = if FFlagSduiExperienceDetailsSupport then {
			skipUnifiedLogging = true,
			lazyHandler = function()
				-- upvalues: SduiSharedContent (upval)
				return require(SduiSharedContent.Actions.SduiOpenSocialProofUserListSheetAction)
			end
		} else nil,
		[SduiActionType.DismissPrompt] = if FFlagSduiDismissPromptAction then {
			skipUnifiedLogging = false,
			lazyHandler = function()
				-- upvalues: SduiSharedContent (upval)
				return require(SduiSharedContent.Actions.SduiDismissPromptAction)
			end
		} else nil,
		[SduiActionType.OpenFacialAgeEstimation] = if FFlagLuaAppSduiVerificationUpsellActions then {
			skipUnifiedLogging = false,
			lazyHandler = function()
				-- upvalues: SduiSharedContent (upval)
				return require(SduiSharedContent.Actions.SduiOpenFacialAgeEstimationAction)
			end
		} else nil
	})
end

local function registerSharedUiComponents()
	-- upvalues: SduiComponentType (copy), SduiSharedContent (copy), FFlagSduiExperienceDetailsSupport (copy), FFlagSduiCardComponent (copy), SduiCoachmarkComponent (copy), FFlagSduiSystemBannerComponent (copy), FFlagLuaAppUnlockUpsellSupport (copy), GetLuaTableEnumParserFunction (copy), FoundationModule (copy), ParseColorTokenProp (copy), ParseVector2Prop (copy), ParseIntegerProp (copy), ParseUDim2Prop (copy), ParseBooleanProp (copy), ParseNumberProp (copy), ParseStringProp (copy), FFlagSduiEventDetailsSupport (copy), FFlagSduiShimmerTextComponentEnabled (copy), FFlagSduiRevealTextComponentEnabled (copy), FFlagSduiPlayWithReward (copy), ParseUiComponentProp (copy), ParseCallbackProp (copy), FFlagSduiDevStoreSeeAllSupport (copy), FFlagSduiTooltipComponentEnabled (copy), FFlagSduiChartsSupport (copy), FFlagLuaAppSduiPlaceholderSupport (copy), FFlagSduiCollectionCarouselPlaceholderItem (copy), FFlagSduiSkeletonComponentEnabled (copy), FFlagSduiAiOverviewEnabled (copy), GetSduiComponentRegistryFunction (copy)
	GetSduiComponentRegistryFunction().registerComponentDefinitions({
		[SduiComponentType.DetailsPageImageHeader] = {
			getLazyComponent = function()
				-- upvalues: SduiSharedContent (upval)
				return require(SduiSharedContent.Components.SduiDetailsPageImageHeader)
			end
		},
		[SduiComponentType.AvatarGroup] = if FFlagSduiExperienceDetailsSupport then {
			getLazyComponent = function()
				-- upvalues: SduiSharedContent (upval)
				return require(SduiSharedContent.Components.SduiAvatarGroup)
			end
		} else nil,
		[SduiComponentType.Card] = if FFlagSduiCardComponent then {
			getLazyComponent = function()
				-- upvalues: SduiSharedContent (upval)
				return require(SduiSharedContent.Components.SduiCard)
			end
		} else nil,
		[SduiComponentType.Coachmark] = if SduiCoachmarkComponent then {
			getLazyComponent = function()
				-- upvalues: SduiSharedContent (upval)
				return require(SduiSharedContent.Components.SduiCoachmark)
			end
		} else nil,
		[SduiComponentType.SystemBanner] = if FFlagSduiSystemBannerComponent then {
			getLazyComponent = function()
				-- upvalues: SduiSharedContent (upval)
				return require(SduiSharedContent.Components.SduiSystemBanner)
			end
		} else nil,
		[SduiComponentType.CircleIcon] = if FFlagSduiExperienceDetailsSupport then {
			getLazyComponent = function()
				-- upvalues: SduiSharedContent (upval)
				return require(SduiSharedContent.Components.SduiCircleIcon)
			end
		} else nil,
		[SduiComponentType.Icon] = if FFlagSduiExperienceDetailsSupport or FFlagLuaAppUnlockUpsellSupport then {
			getLazyComponent = function()
				-- upvalues: SduiSharedContent (upval)
				return require(SduiSharedContent.Components.SduiIcon)
			end,
			propParsers = if FFlagLuaAppUnlockUpsellSupport then {
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
			} else nil
		} else nil,
		[SduiComponentType.IconButton] = if FFlagSduiExperienceDetailsSupport or FFlagSduiEventDetailsSupport then {
			getLazyComponent = function()
				-- upvalues: SduiSharedContent (upval)
				return require(SduiSharedContent.Components.SduiIconButton)
			end
		} else nil,
		[SduiComponentType.LinkText] = if FFlagSduiExperienceDetailsSupport then {
			getLazyComponent = function()
				-- upvalues: SduiSharedContent (upval)
				return require(SduiSharedContent.Components.SduiLinkText)
			end
		} else nil,
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
		[SduiComponentType.ContentRatingLabel] = if FFlagSduiExperienceDetailsSupport then {
			getLazyComponent = function()
				-- upvalues: SduiSharedContent (upval)
				return require(SduiSharedContent.Components.SduiContentRatingLabel)
			end
		} else nil,
		[SduiComponentType.MediaGallery] = if FFlagSduiExperienceDetailsSupport then {
			getLazyComponent = function()
				-- upvalues: SduiSharedContent (upval)
				return require(SduiSharedContent.Components.SduiMediaGallery)
			end
		} else nil,
		[SduiComponentType.ActionBar] = if FFlagSduiExperienceDetailsSupport or FFlagSduiEventDetailsSupport then {
			getLazyComponent = function()
				-- upvalues: SduiSharedContent (upval)
				return require(SduiSharedContent.Components.SduiActionBar)
			end
		} else nil,
		[SduiComponentType.PlayButtonContextualMessage] = if FFlagSduiExperienceDetailsSupport then {
			getLazyComponent = function()
				-- upvalues: SduiSharedContent (upval)
				return require(SduiSharedContent.Components.SduiPlayButtonContextualMessage)
			end
		} else nil,
		[SduiComponentType.PlayWithReward] = if FFlagSduiPlayWithReward then {
			getLazyComponent = function()
				-- upvalues: SduiSharedContent (upval)
				return require(SduiSharedContent.Components.SduiPlayWithReward)
			end
		} else nil,
		[SduiComponentType.ContentRow] = if FFlagSduiExperienceDetailsSupport or (FFlagLuaAppUnlockUpsellSupport or FFlagSduiEventDetailsSupport) then {
			getLazyComponent = function()
				-- upvalues: SduiSharedContent (upval)
				return require(SduiSharedContent.Components.SduiContentRow)
			end,
			propParsers = if FFlagLuaAppUnlockUpsellSupport then {
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
			} else nil
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
		[SduiComponentType.FilterPillsCarousel] = if FFlagSduiChartsSupport then {
			getLazyComponent = function()
				-- upvalues: SduiSharedContent (upval)
				return require(SduiSharedContent.Components.SduiFilterPillsCarousel)
			end
		} else nil,
		[SduiComponentType.Placeholder] = if FFlagLuaAppSduiPlaceholderSupport then {
			getLazyComponent = function()
				-- upvalues: SduiSharedContent (upval)
				return require(SduiSharedContent.Components.SduiPlaceholder)
			end
		} else nil,
		[SduiComponentType.PlaceholderTile] = if FFlagSduiCollectionCarouselPlaceholderItem then {
			getLazyComponent = function()
				-- upvalues: SduiSharedContent (upval)
				return require(SduiSharedContent.Components.SduiPlaceholderTile)
			end
		} else nil,
		[SduiComponentType.PlaceholderWrapper] = if FFlagLuaAppSduiPlaceholderSupport then {
			getLazyComponent = function()
				-- upvalues: SduiSharedContent (upval)
				return require(SduiSharedContent.Components.SduiPlaceholderWrapper)
			end
		} else nil,
		[SduiComponentType.Skeleton] = if FFlagSduiSkeletonComponentEnabled then {
			getLazyComponent = function()
				-- upvalues: SduiSharedContent (upval)
				return require(SduiSharedContent.Components.SduiSkeleton)
			end
		} else nil,
		[SduiComponentType.AiOverview] = if FFlagSduiAiOverviewEnabled then {
			getLazyComponent = function()
				-- upvalues: SduiSharedContent (upval)
				return require(SduiSharedContent.Components.SduiAiOverview)
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