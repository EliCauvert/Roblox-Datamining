local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local _ = require(Parent.DataHydration.CreatorAgentChat)
local _ = require(BuildExperience.Components.Analytics.StatsCard.StatsCard)
local StatsCardContainerModule = require(BuildExperience.Components.Analytics.StatsCardContainer)
local PastCampaignsListModule = require(script.Parent.PastCampaignsList)
local _ = require(script.Parent.PastCampaignRow)
local CreateAdCampaignSheetContainerModule = require(script.Parent.CreateAdCampaignSheet.CreateAdCampaignSheetContainer)
local FFlagBuildAdsManagerUniverseUrlModule = require(BuildExperience.Flags.FFlagBuildAdsManagerUniverseUrl)
local Icon = FoundationModule.Icon
local Text = FoundationModule.Text
local View = FoundationModule.View
local Skeleton = FoundationModule.Skeleton
local IconName = FoundationModule.Enums.IconName
local Radius = FoundationModule.Enums.Radius
local UseTokensFunction = FoundationModule.Hooks.useTokens

local function renderActiveCampaign(p1, LayoutOrder, TestId)
	-- upvalues: ReactModule (copy), View (copy), Text (copy), StatsCardContainerModule (copy)
	local ActiveName: string = `{TestId}-active-{LayoutOrder}`
	
	return ReactModule.createElement(View, {
		tag = "col gap-medium size-full-0 auto-y",
		LayoutOrder = LayoutOrder,
		testId = ActiveName
	}, {
		DateRange = ReactModule.createElement(Text, {
			LayoutOrder = 1,
			tag = "size-full-0 auto-y text-title-medium text-align-x-left content-emphasis",
			Text = p1.dateText,
			testId = `{ActiveName}-date-range`
		}),
		Cards = ReactModule.createElement(StatsCardContainerModule, {
			layoutOrder = 2,
			cards = p1.summaryCards,
			testId = `{ActiveName}-cards`
		})
	})
end

local function renderSkeletonTileRow(LayoutOrder, YOffset)
	-- upvalues: ReactModule (copy), View (copy), Skeleton (copy), Radius (copy)
	local Elements = {}
	
	for i = 1, 2 do
		Elements[`Cell{i}`] = ReactModule.createElement(View, { tag = "fill auto-y", LayoutOrder = i }, {
			Card = ReactModule.createElement(Skeleton, {
				Size = UDim2.new(1, 0, 0, YOffset),
				radius = Radius.Large
			})
		})
	end
	return ReactModule.createElement(View, {
		tag = "row gap-medium size-full-0 auto-y",
		LayoutOrder = LayoutOrder
	}, Elements)
end

local function LoadingSkeleton(p1)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), View (copy), Skeleton (copy), Radius (copy), renderSkeletonTileRow (copy)
	local UseTokensResult = UseTokensFunction()
	local Size400 = UseTokensResult.Size.Size_400
	local Size1600 = UseTokensResult.Size.Size_1600
	local Size2000 = UseTokensResult.Size.Size_2000
	
	return ReactModule.createElement(View, {
		tag = "col gap-xlarge size-full-0 auto-y padding-top-xlarge",
		LayoutOrder = p1.layoutOrder,
		testId = p1.testId
	}, {
		ActiveBlock = ReactModule.createElement(View, {
			LayoutOrder = 1,
			tag = "col gap-medium size-full-0 auto-y"
		}, {
			DateRange = ReactModule.createElement(Skeleton, {
				LayoutOrder = 1,
				Size = UDim2.new(0.4, 0, 0, Size400),
				radius = Radius.Small
			}),
			Grid = ReactModule.createElement(View, {
				LayoutOrder = 2,
				tag = "col gap-medium size-full-0 auto-y"
			}, {
				Row1 = renderSkeletonTileRow(1, Size1600),
				Row2 = renderSkeletonTileRow(2, Size1600)
			})
		}),
		PastSection = ReactModule.createElement(View, {
			LayoutOrder = 2,
			tag = "col gap-small size-full-0 auto-y"
		}, {
			Heading = ReactModule.createElement(Skeleton, {
				LayoutOrder = 1,
				Size = UDim2.new(0.35, 0, 0, Size400),
				radius = Radius.Small
			}),
			Rows = ReactModule.createElement(View, {
				LayoutOrder = 2,
				tag = "col gap-small size-full-0 auto-y"
			}, {
				Row1 = ReactModule.createElement(Skeleton, {
					LayoutOrder = 1,
					Size = UDim2.new(1, 0, 0, Size2000),
					radius = Radius.Large
				}),
				Row2 = ReactModule.createElement(Skeleton, {
					LayoutOrder = 2,
					Size = UDim2.new(1, 0, 0, Size2000),
					radius = Radius.Large
				})
			})
		})
	})
end

local function EmptyState(p1)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), View (copy), Icon (copy), IconName (copy), Text (copy)
	local UseTokensResult = UseTokensFunction()
	
	return ReactModule.createElement(View, {
		LayoutOrder = 1,
		tag = "col align-x-center gap-small size-full-0 auto-y",
		testId = `{p1.testId}-empty`
	}, {
		Illustration = ReactModule.createElement(Icon, {
			LayoutOrder = 1,
			name = IconName.ChartScatterPlot,
			size = UseTokensResult.Size.Size_1400,
			style = UseTokensResult.Color.Content.Emphasis,
			testId = `{p1.testId}-empty-illustration`
		}),
		Headings = ReactModule.createElement(View, {
			LayoutOrder = 2,
			tag = "col align-x-center gap-xxsmall size-full-0 auto-y"
		}, {
			Title = ReactModule.createElement(Text, {
				LayoutOrder = 1,
				tag = "size-full-0 auto-y text-heading-small text-wrap text-align-x-center content-emphasis",
				Text = p1.title
			}),
			Subtitle = ReactModule.createElement(Text, {
				LayoutOrder = 2,
				tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-center content-default",
				Text = p1.subtitle
			})
		})
	})
end

return function(p1)
	-- upvalues: ReactModule (copy), CreateAdCampaignSheetContainerModule (copy), FFlagBuildAdsManagerUniverseUrlModule (copy), Text (copy), LoadingSkeleton (copy), EmptyState (copy), renderActiveCampaign (copy), View (copy), PastCampaignsListModule (copy)
	local TestId = p1.testId or "AdsStatsView"
	local config = {
		PromotionSheet = ReactModule.createElement(CreateAdCampaignSheetContainerModule, {
			waitForCreateResult = true,
			useLocalRunDates = true,
			universeId = if FFlagBuildAdsManagerUniverseUrlModule then p1.universeId else nil,
			isOpen = p1.isPromotionSheetOpen,
			onClose = p1.onClosePromotionSheet,
			onCreate = p1.onCreateCampaign,
			isCreatePending = p1.isPromotionCreatePending,
			hasCreateError = p1.hasPromotionCreateError,
			createErrorKind = p1.promotionCreateErrorKind,
			campaignDurationDays = p1.adCampaignDurationDays,
			estimatedPriceRobux = p1.adCampaignEstimatedPriceRobux,
			campaignOffers = p1.adCampaignOffers,
			runStartTimeMs = p1.adCampaignRunStartTimeMs,
			runEndTimeMs = p1.adCampaignRunEndTimeMs
		})
	}
	
	if p1.isFailed then
		config.Error = ReactModule.createElement(Text, {
			LayoutOrder = 1,
			tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-default",
			Text = p1.errorText,
			testId = `{TestId}-error`
		})
	elseif p1.isLoading then
		config.Loading = ReactModule.createElement(LoadingSkeleton, { layoutOrder = 1, testId = `{TestId}-loading` })
	elseif p1.hasCampaigns then
		if #p1.activeCampaigns > 0 then
			local t = {}
			
			for i, activeCampaign in p1.activeCampaigns do
				t[activeCampaign.id] = renderActiveCampaign(activeCampaign, i, TestId)
			end
			config.ActiveCampaigns = ReactModule.createElement(View, {
				LayoutOrder = 1,
				tag = "col gap-large size-full-0 auto-y",
				testId = `{TestId}-active-campaigns`
			}, t)
		end
		if #p1.pastCampaigns > 0 then
			config.PastCampaigns = ReactModule.createElement(View, {
				LayoutOrder = 2,
				tag = "col gap-small size-full-0 auto-y",
				testId = `{TestId}-past-campaigns`
			}, {
				Heading = ReactModule.createElement(Text, {
					LayoutOrder = 1,
					tag = "size-full-0 auto-y text-title-medium text-align-x-left content-emphasis",
					Text = p1.pastCampaignsTitle
				}),
				List = ReactModule.createElement(PastCampaignsListModule, { layoutOrder = 2, rows = p1.pastCampaigns })
			})
		end
	else
		config.EmptyState = ReactModule.createElement(EmptyState, {
			title = p1.emptyTitle,
			subtitle = p1.emptySubtitle,
			testId = TestId
		})
	end
	local NoHasCampaigns: boolean = not p1.isFailed and (not p1.isLoading and not p1.hasCampaigns)
	
	return ReactModule.createElement(View, {
		LayoutOrder = p1.layoutOrder,
		tag = {
			["col align-y-center size-full"] = NoHasCampaigns,
			["col gap-xlarge size-full-0 auto-y padding-top-xlarge"] = not NoHasCampaigns
		},
		testId = TestId
	}, config)
end