local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local _ = require(buildExperience.Chat.chatTypes)
local publishExperienceTitleModule = require(script.Parent.PublishExperienceTitle)
local view = foundationModule.View

return function(p0) --[[ line: 21 | named "PublishLatestPreviewCard" ]]
	-- upvalues: reactModule (ref), view (ref), publishExperienceTitleModule (ref)
	local testId = p0.testId or "publish-latest-preview-card"
	
	return reactModule.createElement(view, {
		tag = "col size-full-0 auto-y padding-top-xxsmall",
		LayoutOrder = p0.layoutOrder,
		testId = testId
	}, {
		Card = reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = "col size-full-0 auto-y stroke-standard stroke-default radius-large clip"
		}, {
			Content = reactModule.createElement(view, {
				LayoutOrder = 1,
				tag = "col size-full-0 auto-y padding-large"
			}, {
				Title = reactModule.createElement(publishExperienceTitleModule, {
					layoutOrder = 1,
					target = p0.target,
					isCreatorVerified = p0.isCreatorVerified,
					testId = `{testId}-title`
				})
			})
		})
	})
end