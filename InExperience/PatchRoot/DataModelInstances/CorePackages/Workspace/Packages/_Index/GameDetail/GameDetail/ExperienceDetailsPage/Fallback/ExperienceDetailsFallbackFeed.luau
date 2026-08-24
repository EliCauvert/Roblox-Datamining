local parent = script:FindFirstAncestor("GameDetail").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local view = foundationModule.View
local text = foundationModule.Text
local icon = foundationModule.Icon
local skeleton = foundationModule.Skeleton
local button = foundationModule.Button
local radius = foundationModule.Enums.Radius
local buttonVariant = foundationModule.Enums.ButtonVariant
local useTokens = foundationModule.Hooks.useTokens
local useLocalization = require(parent.Localization).Hooks.useLocalization
local dataHydrationModule = require(parent.DataHydration)
local signalsReactModule = require(parent.SignalsReact)
local compositionTags = require(parent.AppComposition).CompositionTags
local experienceDetailsFallbackAttributionRowModule = require(script.Parent.ExperienceDetailsFallbackAttributionRow)
local useGameInfoModule = require(script.Parent.Parent.useGameInfo)
local useGameInfosSelector = require(parent.GameInfosRodux).useGameInfosSelector
local fFlagLuaAppSduiEdpFallbackAttributionFromCache = require(parent.SharedFlags).FFlagLuaAppSduiEdpFallbackAttributionFromCache

local function ExperienceDetailsFeedSkeleton(p0)
	-- upvalues: useTokens (ref), fFlagLuaAppSduiEdpFallbackAttributionFromCache (ref), useGameInfosSelector (ref), reactModule (ref), view (ref), compositionTags (ref), experienceDetailsFallbackAttributionRowModule (ref), skeleton (ref), radius (ref)
	local universeId = p0.universeId
	local var7 = useTokens()
	local isSmallScreen = p0.isSmallScreen
	local var8 = if fFlagLuaAppSduiEdpFallbackAttributionFromCache then useGameInfosSelector(universeId) else nil
	
	return reactModule.createElement(view, {
		testId = "--edp-fallback-feed-skeleton",
		tag = {
			["col size-full auto-y"] = true,
			["gap-xlarge"] = isSmallScreen,
			["gap-xxlarge"] = not isSmallScreen,
			["padding-x-xlarge"] = isSmallScreen,
			["align-x-left"] = not isSmallScreen,
			[compositionTags.ContentRegion.Body] = true
		}
	}, {
		AttributionRow = reactModule.createElement(experienceDetailsFallbackAttributionRowModule, {
			isLoading = true,
			universeId = universeId,
			gameName = var8 and var8.name,
			isSmallScreen = isSmallScreen,
			launchSource = p0.launchSource,
			referralSource = p0.referralSource,
			experienceJoinData = p0.experienceJoinData,
			placeIdOverride = p0.placeIdOverride
		}),
		MediaGallerySkeleton = reactModule.createElement(view, {
			tag = "size-full-0",
			LayoutOrder = if isSmallScreen then 2 else 3,
			aspectRatio = {
				AspectRatio = 1.777777777778,
				AspectType = Enum.AspectType.ScaleWithParentSize,
				DominantAxis = Enum.DominantAxis.Width
			}
		}, {
			Skeleton = reactModule.createElement(skeleton, { Size = UDim2.fromScale(1, 1), radius = radius.Medium })
		}),
		ActionModuleSkeleton = reactModule.createElement(view, {
			tag = "row gap-small size-full-0 auto-y",
			LayoutOrder = if isSmallScreen then 3 else 2
		}, {
			Chip1 = reactModule.createElement(skeleton, {
				LayoutOrder = 1,
				Size = UDim2.fromOffset(var7.Size.Size_2800, var7.Size.Size_800),
				radius = radius.Large
			}),
			Chip2 = reactModule.createElement(skeleton, {
				LayoutOrder = 2,
				Size = UDim2.fromOffset(var7.Size.Size_2800, var7.Size.Size_800),
				radius = radius.Large
			}),
			Chip3 = reactModule.createElement(skeleton, {
				LayoutOrder = 3,
				Size = UDim2.fromOffset(var7.Size.Size_2800, var7.Size.Size_800),
				radius = radius.Large
			}),
			Chip4 = reactModule.createElement(skeleton, {
				LayoutOrder = 4,
				Size = UDim2.fromOffset(var7.Size.Size_2800, var7.Size.Size_800),
				radius = radius.Large
			}),
			Chip5 = reactModule.createElement(skeleton, {
				LayoutOrder = 5,
				Size = UDim2.fromOffset(var7.Size.Size_2800, var7.Size.Size_800),
				radius = radius.Large
			})
		}),
		DescriptionSkeleton = reactModule.createElement(view, {
			tag = "col gap-medium size-full-0 auto-y",
			LayoutOrder = 4
		}, {
			HeaderSkeleton = reactModule.createElement(skeleton, {
				LayoutOrder = 1,
				Size = UDim2.fromOffset(var7.Size.Size_2800 * 2, var7.Typography.HeadingSmall.LineHeight * var7.Typography.HeadingSmall.FontSize),
				radius = radius.Small
			}),
			TextSkeleton = reactModule.createElement(skeleton, {
				LayoutOrder = 2,
				Size = UDim2.new(1, 0, 0, var7.Typography.BodyLarge.LineHeight * var7.Typography.BodyLarge.FontSize * 3),
				radius = radius.Small
			})
		})
	})
end

return {
	Skeleton = reactModule.memo(ExperienceDetailsFeedSkeleton),
	Error = reactModule.memo(function(p1)
		-- upvalues: useTokens (ref), useGameInfoModule (ref), signalsReactModule (ref), dataHydrationModule (ref), useLocalization (ref), reactModule (ref), ExperienceDetailsFeedSkeleton (ref), view (ref), icon (ref), foundationModule (ref), text (ref), compositionTags (ref), experienceDetailsFallbackAttributionRowModule (ref), button (ref), buttonVariant (ref)
		local universeId = p1.universeId
		local isSmallScreen = p1.isSmallScreen
		local var9 = useTokens()
		local var10 = useGameInfoModule(universeId)
		local var11 = signalsReactModule.useSignalState(dataHydrationModule.Game.getAgeRecommendationStore(false).getAgeRecommendation(universeId).data)
		local var12 = useLocalization({
			somethingWentWrongMessage = "Feature.Toast.NetworkingError.SomethingIsWrong",
			experienceUnavailableMessage = "Feature.GamePage.QuickLaunch.LaunchError.TemporarilyUnavailable",
			retryButtonText = "InGame.CommonUI.Button.Retry"
		})
		
		if var10 == nil then
			return reactModule.createElement(ExperienceDetailsFeedSkeleton, {
				universeId = universeId,
				isSmallScreen = isSmallScreen,
				launchSource = p1.launchSource,
				referralSource = p1.referralSource,
				experienceJoinData = p1.experienceJoinData,
				placeIdOverride = p1.placeIdOverride
			})
		end
		local var14
		local creator = var10.creator
		local name = var10.name
		local name_1 = creator and creator.name
		
		if creator then
			var14 = creator.hasVerifiedBadge == true
			var14 = nil
		else
			var14 = false
		end
		return if var10.isUnavailable == true then reactModule.createElement(view, {
			tag = "col align-x-center align-y-center size-full-0 auto-y",
			testId = "--edp-fallback-feed-unavailable"
		}, {
			ErrorIcon = reactModule.createElement(icon, {
				LayoutOrder = 1,
				size = var9.Size.Size_2500,
				name = foundationModule.Enums.IconName.TriangleExclamation
			}),
			ErrorText = reactModule.createElement(text, {
				tag = "auto-xy padding-top-medium text-body-large text-align-x-center content-default",
				LayoutOrder = 2,
				Text = var12.experienceUnavailableMessage
			})
		}) else reactModule.createElement(view, {
			testId = "--edp-fallback-feed-error",
			tag = {
				["col size-full auto-y"] = true,
				["gap-xlarge"] = isSmallScreen,
				["gap-xxlarge"] = not isSmallScreen,
				["padding-x-xlarge"] = isSmallScreen,
				["align-x-left"] = not isSmallScreen,
				[compositionTags.ContentRegion.Body] = true
			}
		}, {
			AttributionRow = reactModule.createElement(experienceDetailsFallbackAttributionRowModule, {
				universeId = universeId,
				gameName = name,
				creatorName = name_1,
				hasVerifiedBadge = var14,
				ageRecDisplayName = var11 and var11.displayNameWithHeaderShort,
				isSmallScreen = isSmallScreen,
				launchSource = p1.launchSource,
				referralSource = p1.referralSource,
				experienceJoinData = p1.experienceJoinData,
				placeIdOverride = p1.placeIdOverride
			}),
			ErrorBlock = reactModule.createElement(view, {
				tag = "col align-x-center size-full-0 auto-y padding-top-xxlarge",
				LayoutOrder = 2,
				testId = "--edp-fallback-error-state"
			}, {
				ErrorIcon = reactModule.createElement(icon, {
					LayoutOrder = 1,
					size = var9.Size.Size_2500,
					name = foundationModule.Enums.IconName.TriangleExclamation
				}),
				ErrorText = reactModule.createElement(text, {
					tag = "auto-xy padding-bottom-medium text-body-large text-align-x-center content-default",
					LayoutOrder = 2,
					Text = var12.somethingWentWrongMessage
				}),
				RetryButton = reactModule.createElement(button, {
					LayoutOrder = 3,
					testId = "--edp-fallback-error-state-retry",
					text = var12.retryButtonText,
					onActivated = p1.refresh,
					variant = buttonVariant.Standard
				})
			})
		})
	end)
}