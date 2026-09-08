local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local adUpsellCardModule = require(buildExperience.Components.Ads.AdUpsellCard)
local text = foundationModule.Text
local view = foundationModule.View

return function(p1)
	-- upvalues: reactModule (ref), view (ref), text (ref), adUpsellCardModule (ref)
	return reactModule.createElement(view, {
		tag = "col gap-xxlarge size-full-0 auto-y",
		LayoutOrder = p1.order,
		testId = `AdUpsellMilestone.{p1.order}`
	}, {
		Congrats = reactModule.createElement(text, {
			LayoutOrder = 1,
			tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-emphasis",
			Text = p1.congratsText,
			testId = `AdUpsellCongrats.{p1.order}`
		}),
		Card = reactModule.createElement(adUpsellCardModule, {
			LayoutOrder = 2,
			containerRef = p1.cardRef,
			isCreatePending = p1.isCreatePending,
			onCreate = p1.onCreate,
			onDismiss = p1.onDismiss
		})
	})
end