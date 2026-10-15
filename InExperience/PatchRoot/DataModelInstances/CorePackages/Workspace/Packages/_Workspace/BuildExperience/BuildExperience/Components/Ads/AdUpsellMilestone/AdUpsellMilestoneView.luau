local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local adUpsellCardModule = require(buildExperience.Components.Ads.AdUpsellCard)
local fFlagBuildAgentAdCampaignCardModule = require(buildExperience.Flags.FFlagBuildAgentAdCampaignCard)
local fFlagBuildExperienceChatCardEmphasisModule = require(buildExperience.Flags.FFlagBuildExperienceChatCardEmphasis)
local fFlagBuildAdUpsellPinnedModule = require(buildExperience.Flags.FFlagBuildAdUpsellPinned)
local text = foundationModule.Text
local view = foundationModule.View

return function(p1)
	-- upvalues: reactModule (ref), view (ref), fFlagBuildAdUpsellPinnedModule (ref), text (ref), adUpsellCardModule (ref), fFlagBuildAgentAdCampaignCardModule (ref), fFlagBuildExperienceChatCardEmphasisModule (ref)
	return reactModule.createElement(view, {
		LayoutOrder = p1.order,
		tag = {
			["size-full-0 auto-y"] = fFlagBuildAdUpsellPinnedModule,
			["col gap-xxlarge size-full-0 auto-y"] = not fFlagBuildAdUpsellPinnedModule
		},
		testId = `AdUpsellMilestone.{p1.order}`
	}, {
		Congrats = if not fFlagBuildAdUpsellPinnedModule then reactModule.createElement(text, {
			LayoutOrder = 1,
			tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-emphasis",
			Text = p1.congratsText,
			testId = `AdUpsellCongrats.{p1.order}`
		}) else nil,
		Card = reactModule.createElement(adUpsellCardModule, {
			LayoutOrder = if fFlagBuildAdUpsellPinnedModule then 1 else 2,
			containerRef = p1.cardRef,
			isCreatePending = p1.isCreatePending,
			freePromotionsRemaining = if fFlagBuildAgentAdCampaignCardModule then p1.freePromotionsRemaining else nil,
			isCreateDisabled = if fFlagBuildAgentAdCampaignCardModule then false else nil,
			onCreate = p1.onCreate,
			onDismiss = p1.onDismiss,
			emphasisOrder = if fFlagBuildExperienceChatCardEmphasisModule then p1.order else nil
		})
	})
end