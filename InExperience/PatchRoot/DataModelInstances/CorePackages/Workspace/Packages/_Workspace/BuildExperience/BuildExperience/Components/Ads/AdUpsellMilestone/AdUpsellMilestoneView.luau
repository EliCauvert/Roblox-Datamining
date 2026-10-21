local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local AdUpsellCardModule = require(BuildExperience.Components.Ads.AdUpsellCard)
local FFlagBuildAgentAdCampaignCardModule = require(BuildExperience.Flags.FFlagBuildAgentAdCampaignCard)
local FFlagBuildExperienceChatCardEmphasisModule = require(BuildExperience.Flags.FFlagBuildExperienceChatCardEmphasis)
local FFlagBuildAdUpsellPinnedModule = require(BuildExperience.Flags.FFlagBuildAdUpsellPinned)
local Text = FoundationModule.Text
local View = FoundationModule.View

return function(p1)
	-- upvalues: ReactModule (copy), View (copy), FFlagBuildAdUpsellPinnedModule (copy), Text (copy), AdUpsellCardModule (copy), FFlagBuildAgentAdCampaignCardModule (copy), FFlagBuildExperienceChatCardEmphasisModule (copy)
	return ReactModule.createElement(View, {
		LayoutOrder = p1.order,
		tag = {
			["size-full-0 auto-y"] = FFlagBuildAdUpsellPinnedModule,
			["col gap-xxlarge size-full-0 auto-y"] = not FFlagBuildAdUpsellPinnedModule
		},
		testId = `AdUpsellMilestone.{p1.order}`
	}, {
		Congrats = if FFlagBuildAdUpsellPinnedModule then nil else ReactModule.createElement(Text, {
			LayoutOrder = 1,
			tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-emphasis",
			Text = p1.congratsText,
			testId = `AdUpsellCongrats.{p1.order}`
		}),
		Card = ReactModule.createElement(AdUpsellCardModule, {
			LayoutOrder = if FFlagBuildAdUpsellPinnedModule then 1 else 2,
			containerRef = p1.cardRef,
			isCreatePending = p1.isCreatePending,
			freePromotionsRemaining = if FFlagBuildAgentAdCampaignCardModule then p1.freePromotionsRemaining else nil,
			isCreateDisabled = p1.isCreateDisabled == true,
			onCreate = p1.onCreate,
			onDismiss = p1.onDismiss,
			emphasisOrder = if FFlagBuildExperienceChatCardEmphasisModule then p1.order else nil
		})
	})
end