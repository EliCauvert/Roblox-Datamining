local Parent = script:FindFirstAncestor("GameDetail").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local Text = FoundationModule.Text
local Icon = FoundationModule.Icon
local Skeleton = FoundationModule.Skeleton
local Button = FoundationModule.Button
local Radius = FoundationModule.Enums.Radius
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local DataHydrationModule = require(Parent.DataHydration)
local SignalsReactModule = require(Parent.SignalsReact)
local CompositionTags = require(Parent.AppComposition).CompositionTags
local ExperienceDetailsFallbackAttributionRowModule = require(script.Parent.ExperienceDetailsFallbackAttributionRow)
local UseGameInfoModule = require(script.Parent.Parent.useGameInfo)
local UseGameInfosSelectorFunction = require(Parent.GameInfosRodux).useGameInfosSelector
local FFlagLuaAppSduiEdpFallbackAttributionFromCache = require(Parent.SharedFlags).FFlagLuaAppSduiEdpFallbackAttributionFromCache
local FFlagMigrateGameInfoToStore = require(Parent.SharedFlags).FFlagMigrateGameInfoToStore

local function ExperienceDetailsFeedSkeleton(p1)
	-- upvalues: UseTokensFunction (copy), FFlagLuaAppSduiEdpFallbackAttributionFromCache (copy), FFlagMigrateGameInfoToStore (copy), UseGameInfoModule (copy), UseGameInfosSelectorFunction (copy), ReactModule (copy), View (copy), CompositionTags (copy), ExperienceDetailsFallbackAttributionRowModule (copy), Skeleton (copy), Radius (copy)
	local UniverseId = p1.universeId
	local UseTokensResult = UseTokensFunction()
	local IsSmallScreen = p1.isSmallScreen
	local v1 = nil
	local v2 = nil
	
	if FFlagLuaAppSduiEdpFallbackAttributionFromCache then
		if FFlagMigrateGameInfoToStore then
			v2 = UseGameInfoModule(UniverseId)
		else
			v1 = UseGameInfosSelectorFunction(UniverseId)
		end
	end
	return ReactModule.createElement(View, {
		testId = "--edp-fallback-feed-skeleton",
		tag = {
			["col size-full auto-y"] = true,
			["gap-xlarge"] = IsSmallScreen,
			["gap-xxlarge"] = not IsSmallScreen,
			["padding-x-xlarge"] = IsSmallScreen,
			["align-x-left"] = not IsSmallScreen,
			[CompositionTags.ContentRegion.Body] = true
		}
	}, {
		AttributionRow = ReactModule.createElement(ExperienceDetailsFallbackAttributionRowModule, {
			isLoading = true,
			universeId = UniverseId,
			gameName = if FFlagMigrateGameInfoToStore then v2 and v2.name else v1 and v1.name,
			isSmallScreen = IsSmallScreen,
			launchSource = p1.launchSource,
			referralSource = p1.referralSource,
			experienceJoinData = p1.experienceJoinData,
			placeIdOverride = p1.placeIdOverride
		}),
		MediaGallerySkeleton = ReactModule.createElement(View, {
			tag = "size-full-0",
			LayoutOrder = if IsSmallScreen then 2 else 3,
			aspectRatio = {
				AspectRatio = 1.7777777777777777,
				AspectType = Enum.AspectType.ScaleWithParentSize,
				DominantAxis = Enum.DominantAxis.Width
			}
		}, {
			Skeleton = ReactModule.createElement(Skeleton, { Size = UDim2.fromScale(1, 1), radius = Radius.Medium })
		}),
		ActionModuleSkeleton = ReactModule.createElement(View, {
			tag = "row gap-small size-full-0 auto-y",
			LayoutOrder = if IsSmallScreen then 3 else 2
		}, {
			Chip1 = ReactModule.createElement(Skeleton, {
				LayoutOrder = 1,
				Size = UDim2.fromOffset(UseTokensResult.Size.Size_2800, UseTokensResult.Size.Size_800),
				radius = Radius.Large
			}),
			Chip2 = ReactModule.createElement(Skeleton, {
				LayoutOrder = 2,
				Size = UDim2.fromOffset(UseTokensResult.Size.Size_2800, UseTokensResult.Size.Size_800),
				radius = Radius.Large
			}),
			Chip3 = ReactModule.createElement(Skeleton, {
				LayoutOrder = 3,
				Size = UDim2.fromOffset(UseTokensResult.Size.Size_2800, UseTokensResult.Size.Size_800),
				radius = Radius.Large
			}),
			Chip4 = ReactModule.createElement(Skeleton, {
				LayoutOrder = 4,
				Size = UDim2.fromOffset(UseTokensResult.Size.Size_2800, UseTokensResult.Size.Size_800),
				radius = Radius.Large
			}),
			Chip5 = ReactModule.createElement(Skeleton, {
				LayoutOrder = 5,
				Size = UDim2.fromOffset(UseTokensResult.Size.Size_2800, UseTokensResult.Size.Size_800),
				radius = Radius.Large
			})
		}),
		DescriptionSkeleton = ReactModule.createElement(View, {
			tag = "col gap-medium size-full-0 auto-y",
			LayoutOrder = 4
		}, {
			HeaderSkeleton = ReactModule.createElement(Skeleton, {
				LayoutOrder = 1,
				Size = UDim2.fromOffset(UseTokensResult.Size.Size_2800 * 2, UseTokensResult.Typography.HeadingSmall.LineHeight * UseTokensResult.Typography.HeadingSmall.FontSize),
				radius = Radius.Small
			}),
			TextSkeleton = ReactModule.createElement(Skeleton, {
				LayoutOrder = 2,
				Size = UDim2.new(1, 0, 0, UseTokensResult.Typography.BodyLarge.LineHeight * UseTokensResult.Typography.BodyLarge.FontSize * 3),
				radius = Radius.Small
			})
		})
	})
end

return {
	Skeleton = ReactModule.memo(ExperienceDetailsFeedSkeleton),
	Error = ReactModule.memo(function(p1)
		-- upvalues: UseTokensFunction (copy), UseGameInfoModule (copy), SignalsReactModule (copy), DataHydrationModule (copy), UseLocalizationFunction (copy), ReactModule (copy), ExperienceDetailsFeedSkeleton (copy), View (copy), Icon (copy), FoundationModule (copy), Text (copy), CompositionTags (copy), ExperienceDetailsFallbackAttributionRowModule (copy), Button (copy), ButtonVariant (copy)
		local UniverseId = p1.universeId
		local IsSmallScreen = p1.isSmallScreen
		local UseTokensResult = UseTokensFunction()
		local UseGameInfoModuleResult = UseGameInfoModule(UniverseId)
		local UseSignalStateResult = SignalsReactModule.useSignalState(DataHydrationModule.Game.getAgeRecommendationStore(false).getAgeRecommendation(UniverseId).data)
		local UseLocalizationResult = UseLocalizationFunction({
			somethingWentWrongMessage = "Feature.Toast.NetworkingError.SomethingIsWrong",
			experienceUnavailableMessage = "Feature.GamePage.QuickLaunch.LaunchError.TemporarilyUnavailable",
			retryButtonText = "InGame.CommonUI.Button.Retry"
		})
		
		if UseGameInfoModuleResult == nil then
			return ReactModule.createElement(ExperienceDetailsFeedSkeleton, {
				universeId = UniverseId,
				isSmallScreen = IsSmallScreen,
				launchSource = p1.launchSource,
				referralSource = p1.referralSource,
				experienceJoinData = p1.experienceJoinData,
				placeIdOverride = p1.placeIdOverride
			})
		else
			local Creator = UseGameInfoModuleResult.creator
			local Name = UseGameInfoModuleResult.name
			local Name1 = Creator and Creator.name
			local IsHasVerifiedBadge: boolean = if Creator then Creator.hasVerifiedBadge == true else false
			local DisplayNameWithHeaderShort = UseSignalStateResult and UseSignalStateResult.displayNameWithHeaderShort
			
			return if UseGameInfoModuleResult.isUnavailable == true then ReactModule.createElement(View, {
				tag = "col align-x-center align-y-center size-full-0 auto-y",
				testId = "--edp-fallback-feed-unavailable"
			}, {
				ErrorIcon = ReactModule.createElement(Icon, {
					LayoutOrder = 1,
					size = UseTokensResult.Size.Size_2500,
					name = FoundationModule.Enums.IconName.TriangleExclamation
				}),
				ErrorText = ReactModule.createElement(Text, {
					tag = "auto-xy padding-top-medium text-body-large text-align-x-center content-default",
					LayoutOrder = 2,
					Text = UseLocalizationResult.experienceUnavailableMessage
				})
			}) else ReactModule.createElement(View, {
				testId = "--edp-fallback-feed-error",
				tag = {
					["col size-full auto-y"] = true,
					["gap-xlarge"] = IsSmallScreen,
					["gap-xxlarge"] = not IsSmallScreen,
					["padding-x-xlarge"] = IsSmallScreen,
					["align-x-left"] = not IsSmallScreen,
					[CompositionTags.ContentRegion.Body] = true
				}
			}, {
				AttributionRow = ReactModule.createElement(ExperienceDetailsFallbackAttributionRowModule, {
					universeId = UniverseId,
					gameName = Name,
					creatorName = Name1,
					hasVerifiedBadge = IsHasVerifiedBadge,
					ageRecDisplayName = DisplayNameWithHeaderShort,
					isSmallScreen = IsSmallScreen,
					launchSource = p1.launchSource,
					referralSource = p1.referralSource,
					experienceJoinData = p1.experienceJoinData,
					placeIdOverride = p1.placeIdOverride
				}),
				ErrorBlock = ReactModule.createElement(View, {
					tag = "col align-x-center size-full-0 auto-y padding-top-xxlarge",
					LayoutOrder = 2,
					testId = "--edp-fallback-error-state"
				}, {
					ErrorIcon = ReactModule.createElement(Icon, {
						LayoutOrder = 1,
						size = UseTokensResult.Size.Size_2500,
						name = FoundationModule.Enums.IconName.TriangleExclamation
					}),
					ErrorText = ReactModule.createElement(Text, {
						tag = "auto-xy padding-bottom-medium text-body-large text-align-x-center content-default",
						LayoutOrder = 2,
						Text = UseLocalizationResult.somethingWentWrongMessage
					}),
					RetryButton = ReactModule.createElement(Button, {
						LayoutOrder = 3,
						testId = "--edp-fallback-error-state-retry",
						text = UseLocalizationResult.retryButtonText,
						onActivated = p1.refresh,
						variant = ButtonVariant.Standard
					})
				})
			})
		end
	end)
}