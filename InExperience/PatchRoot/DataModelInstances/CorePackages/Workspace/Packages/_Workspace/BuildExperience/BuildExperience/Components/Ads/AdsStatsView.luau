local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local _ = require(buildExperience.Components.Analytics.StatsCard.StatsCard)
local statsCardContainerModule = require(buildExperience.Components.Analytics.StatsCardContainer)
local pastCampaignsListModule = require(script.Parent.PastCampaignsList)
local _ = require(script.Parent.PastCampaignRow)
local promotionCardModule = require(script.Parent.PromotionCard)
local createAdCampaignSheetContainerModule = require(script.Parent.CreateAdCampaignSheet.CreateAdCampaignSheetContainer)
local icon = foundationModule.Icon
local text = foundationModule.Text
local view = foundationModule.View
local skeleton = foundationModule.Skeleton
local iconName = foundationModule.Enums.IconName
local radius = foundationModule.Enums.Radius
local useTokens = foundationModule.Hooks.useTokens

local function renderActiveCampaign(p1, p2, p3)
	-- upvalues: reactModule (ref), view (ref), text (ref), statsCardContainerModule (ref)
	local var1 = `{p3}-active-{p2}`
	
	return reactModule.createElement(view, {
		tag = "col gap-medium size-full-0 auto-y",
		LayoutOrder = p2,
		testId = var1
	}, {
		DateRange = reactModule.createElement(text, {
			LayoutOrder = 1,
			tag = "size-full-0 auto-y text-title-medium text-align-x-left content-emphasis",
			Text = p1.dateText,
			testId = `{var1}-date-range`
		}),
		Cards = reactModule.createElement(statsCardContainerModule, {
			layoutOrder = 2,
			cards = p1.summaryCards,
			testId = `{var1}-cards`
		})
	})
end

local function renderSkeletonTileRow(p1, p2)
	-- upvalues: reactModule (ref), view (ref), skeleton (ref), radius (ref)
	local t = {}
	
	for i = 1, 2 do
		t[`Cell{i}`] = reactModule.createElement(view, { tag = "fill auto-y", LayoutOrder = i }, {
			Card = reactModule.createElement(skeleton, { Size = UDim2.new(1, 0, 0, p2), radius = radius.Large })
		})
	end
	return reactModule.createElement(view, {
		tag = "row gap-medium size-full-0 auto-y",
		LayoutOrder = p1
	}, t)
end

local function LoadingSkeleton(p3)
	-- upvalues: useTokens (ref), reactModule (ref), view (ref), skeleton (ref), radius (ref), renderSkeletonTileRow (ref)
	local var1 = useTokens()
	local size400 = var1.Size.Size_400
	local size1600 = var1.Size.Size_1600
	local size2000 = var1.Size.Size_2000
	
	return reactModule.createElement(view, {
		tag = "col gap-xlarge size-full-0 auto-y padding-top-xlarge",
		LayoutOrder = p3.layoutOrder,
		testId = p3.testId
	}, {
		ActiveBlock = reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = "col gap-medium size-full-0 auto-y"
		}, {
			DateRange = reactModule.createElement(skeleton, {
				LayoutOrder = 1,
				Size = UDim2.new(0.4, 0, 0, size400),
				radius = radius.Small
			}),
			Grid = reactModule.createElement(view, {
				LayoutOrder = 2,
				tag = "col gap-medium size-full-0 auto-y"
			}, {
				Row1 = renderSkeletonTileRow(1, size1600),
				Row2 = renderSkeletonTileRow(2, size1600)
			})
		}),
		PastSection = reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = "col gap-small size-full-0 auto-y"
		}, {
			Heading = reactModule.createElement(skeleton, {
				LayoutOrder = 1,
				Size = UDim2.new(0.35, 0, 0, size400),
				radius = radius.Small
			}),
			Rows = reactModule.createElement(view, {
				LayoutOrder = 2,
				tag = "col gap-small size-full-0 auto-y"
			}, {
				Row1 = reactModule.createElement(skeleton, {
					LayoutOrder = 1,
					Size = UDim2.new(1, 0, 0, size2000),
					radius = radius.Large
				}),
				Row2 = reactModule.createElement(skeleton, {
					LayoutOrder = 2,
					Size = UDim2.new(1, 0, 0, size2000),
					radius = radius.Large
				})
			})
		})
	})
end

local function EmptyState(p3)
	-- upvalues: useTokens (ref), reactModule (ref), view (ref), icon (ref), iconName (ref), text (ref)
	local var1 = useTokens()
	
	return reactModule.createElement(view, {
		LayoutOrder = 1,
		tag = "col align-x-center gap-small size-full-0 auto-y",
		testId = `{p3.testId}-empty`
	}, {
		Illustration = reactModule.createElement(icon, {
			LayoutOrder = 1,
			name = iconName.ChartScatterPlot,
			size = var1.Size.Size_1400,
			style = var1.Color.Content.Emphasis,
			testId = `{p3.testId}-empty-illustration`
		}),
		Headings = reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = "col align-x-center gap-xxsmall size-full-0 auto-y"
		}, {
			Title = reactModule.createElement(text, {
				LayoutOrder = 1,
				tag = "size-full-0 auto-y text-heading-small text-wrap text-align-x-center content-emphasis",
				Text = p3.title
			}),
			Subtitle = reactModule.createElement(text, {
				LayoutOrder = 2,
				tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-center content-default",
				Text = p3.subtitle
			})
		})
	})
end

return function(p3)
	-- upvalues: reactModule (ref), createAdCampaignSheetContainerModule (ref), text (ref), LoadingSkeleton (ref), promotionCardModule (ref), EmptyState (ref), renderActiveCampaign (ref), view (ref), pastCampaignsListModule (ref)
	local testId = p3.testId or "AdsStatsView"
	local t = {}
	
	if p3.isPromotionSheetOpen then
		t.PromotionSheet = reactModule.createElement(createAdCampaignSheetContainerModule, {
			isOpen = true,
			waitForCreateResult = true,
			useLocalRunDates = true,
			onClose = p3.onClosePromotionSheet,
			onCreate = p3.onCreateCampaign,
			isCreatePending = p3.isPromotionCreatePending,
			hasCreateError = p3.hasPromotionCreateError,
			campaignDurationDays = p3.adCampaignDurationDays,
			estimatedPriceRobux = p3.adCampaignEstimatedPriceRobux,
			runStartTimeMs = p3.adCampaignRunStartTimeMs,
			runEndTimeMs = p3.adCampaignRunEndTimeMs
		})
	end
	if p3.isFailed then
		t.Error = reactModule.createElement(text, {
			LayoutOrder = 1,
			tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-default",
			Text = p3.errorText,
			testId = `{testId}-error`
		})
	elseif p3.isLoading then
		t.Loading = reactModule.createElement(LoadingSkeleton, { layoutOrder = 1, testId = `{testId}-loading` })
	elseif p3.showPromotionCard then
		t.PromotionCard = reactModule.createElement(promotionCardModule, {
			LayoutOrder = 0,
			freePromotionsRemaining = p3.promotionFreeCreditsRemaining
		})
	end
	if p3.hasCampaigns then
		if #p3.activeCampaigns > 0 then
			local t_1 = {}
			
			for i, v in p3.activeCampaigns do
				t_1[v.id] = renderActiveCampaign(v, i, testId)
			end
			t.ActiveCampaigns = reactModule.createElement(view, {
				LayoutOrder = 1,
				tag = "col gap-large size-full-0 auto-y",
				testId = `{testId}-active-campaigns`
			}, t_1)
		end
		if #p3.pastCampaigns > 0 then
			t.PastCampaigns = reactModule.createElement(view, {
				LayoutOrder = 2,
				tag = "col gap-small size-full-0 auto-y",
				testId = `{testId}-past-campaigns`
			}, {
				Heading = reactModule.createElement(text, {
					LayoutOrder = 1,
					tag = "size-full-0 auto-y text-title-medium text-align-x-left content-emphasis",
					Text = p3.pastCampaignsTitle
				}),
				List = reactModule.createElement(pastCampaignsListModule, { layoutOrder = 2, rows = p3.pastCampaigns })
			})
		end
	else
		t.EmptyState = reactModule.createElement(EmptyState, {
			title = p3.emptyTitle,
			subtitle = p3.emptySubtitle,
			testId = testId
		})
	end
	local var1 = not p3.isFailed and (not p3.isLoading and not p3.hasCampaigns)
	
	return reactModule.createElement(view, {
		LayoutOrder = p3.layoutOrder,
		tag = {
			["col align-y-center size-full"] = var1,
			["col gap-xlarge size-full-0 auto-y padding-top-xlarge"] = not var1
		},
		testId = testId
	}, t)
end