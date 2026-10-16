local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local ReactModule = require(Parent.React)
local _ = require(BuildExperience.Chat.chatTypes)
local PublishExperienceTitleModule = require(script.Parent.PublishExperienceTitle)
local View = require(Parent.Foundation).View

return function(p1) --[[ Line: 21 | Named "PublishLatestPreviewCard" ]]
	-- upvalues: ReactModule (copy), View (copy), PublishExperienceTitleModule (copy)
	local TestId = p1.testId or "publish-latest-preview-card"
	
	return ReactModule.createElement(View, {
		tag = "col size-full-0 auto-y padding-top-xxsmall",
		LayoutOrder = p1.layoutOrder,
		testId = TestId
	}, {
		Card = ReactModule.createElement(View, {
			LayoutOrder = 1,
			tag = "col size-full-0 auto-y stroke-standard stroke-default radius-large clip"
		}, {
			Content = ReactModule.createElement(View, {
				LayoutOrder = 1,
				tag = "col size-full-0 auto-y padding-large"
			}, {
				Title = ReactModule.createElement(PublishExperienceTitleModule, {
					layoutOrder = 1,
					target = p1.target,
					isCreatorVerified = p1.isCreatorVerified,
					testId = `{TestId}-title`
				})
			})
		})
	})
end