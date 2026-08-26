local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local statsCardModule = require(buildExperience.Components.Analytics.StatsCard.StatsCard)
local pastCampaignsListModule = require(script.Parent.PastCampaignsList)
local _ = require(script.Parent.PastCampaignRow)
local text = foundationModule.Text
local view = foundationModule.View
local skeleton = foundationModule.Skeleton
local radius = foundationModule.Enums.Radius
local useTokens = foundationModule.Hooks.useTokens

local function renderSummaryGrid(p1, p2)
	-- upvalues: reactModule (ref), view (ref), statsCardModule (ref)
	local t = {}
	
	for i_1 = 1, math.ceil(#p1 / 2) do
		local t_1 = {}
		
		for i = 1, 2 do
			local var1 = p1[(i_1 - 1) * 2 + i]
			
			if var1 ~= nil then
				t_1[`Cell{i}`] = reactModule.createElement(view, { tag = "fill auto-y", LayoutOrder = i }, { Card = reactModule.createElement(statsCardModule, var1) })
			end
		end
		t[`Row{i_1}`] = reactModule.createElement(view, {
			tag = "row gap-medium size-full-0 auto-y",
			LayoutOrder = i_1,
			testId = `{p2}-cards-row`
		}, t_1)
	end
	return reactModule.createElement(view, {
		LayoutOrder = 2,
		tag = "col gap-medium size-full-0 auto-y",
		testId = `{p2}-cards`
	}, t)
end

local function renderActiveCampaign(p3, p4, p5)
	-- upvalues: reactModule (ref), view (ref), text (ref), renderSummaryGrid (ref)
	local var2 = `{p5}-active-{p4}`
	
	return reactModule.createElement(view, {
		tag = "col gap-medium size-full-0 auto-y",
		LayoutOrder = p4,
		testId = var2
	}, {
		DateRange = reactModule.createElement(text, {
			LayoutOrder = 1,
			tag = "size-full-0 auto-y text-title-medium text-align-x-left content-emphasis",
			Text = p3.dateText,
			testId = `{var2}-date-range`
		}),
		Cards = renderSummaryGrid(p3.summaryCards, var2)
	})
end

local function renderSkeletonTileRow(p3, p4)
	-- upvalues: reactModule (ref), view (ref), skeleton (ref), radius (ref)
	local t = {}
	
	for i = 1, 2 do
		t[`Cell{i}`] = reactModule.createElement(view, { tag = "fill auto-y", LayoutOrder = i }, {
			Card = reactModule.createElement(skeleton, { Size = UDim2.new(1, 0, 0, p4), radius = radius.Large })
		})
	end
	return reactModule.createElement(view, {
		tag = "row gap-medium size-full-0 auto-y",
		LayoutOrder = p3
	}, t)
end

local function LoadingSkeleton(p5)
	-- upvalues: useTokens (ref), reactModule (ref), view (ref), skeleton (ref), radius (ref), renderSkeletonTileRow (ref)
	local var2 = useTokens()
	local size400 = var2.Size.Size_400
	local size1600 = var2.Size.Size_1600
	local size2000 = var2.Size.Size_2000
	
	return reactModule.createElement(view, {
		tag = "col gap-xlarge size-full-0 auto-y padding-top-xlarge",
		LayoutOrder = p5.layoutOrder,
		testId = p5.testId
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

return function(p5)
	-- upvalues: reactModule (ref), text (ref), LoadingSkeleton (ref), renderActiveCampaign (ref), view (ref), pastCampaignsListModule (ref)
	local testId = p5.testId or "AdsStatsView"
	local t = {}
	
	if p5.isFailed then
		t.Error = reactModule.createElement(text, {
			LayoutOrder = 1,
			tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-default",
			Text = p5.errorText,
			testId = `{testId}-error`
		})
	elseif p5.isLoading then
		t.Loading = reactModule.createElement(LoadingSkeleton, { layoutOrder = 1, testId = `{testId}-loading` })
	elseif #p5.activeCampaigns > 0 then
		local t_1 = {}
		
		for i, v in p5.activeCampaigns do
			t_1[v.id] = renderActiveCampaign(v, i, testId)
		end
		t.ActiveCampaigns = reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = "col gap-large size-full-0 auto-y",
			testId = `{testId}-active-campaigns`
		}, t_1)
	end
	if #p5.pastCampaigns > 0 then
		t.PastCampaigns = reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = "col gap-small size-full-0 auto-y",
			testId = `{testId}-past-campaigns`
		}, {
			Heading = reactModule.createElement(text, {
				LayoutOrder = 1,
				tag = "size-full-0 auto-y text-title-medium text-align-x-left content-emphasis",
				Text = p5.pastCampaignsTitle
			}),
			List = reactModule.createElement(pastCampaignsListModule, { layoutOrder = 2, rows = p5.pastCampaigns })
		})
	end
	return reactModule.createElement(view, {
		tag = "col gap-xlarge size-full-0 auto-y padding-top-xlarge",
		LayoutOrder = p5.layoutOrder,
		testId = testId
	}, t)
end