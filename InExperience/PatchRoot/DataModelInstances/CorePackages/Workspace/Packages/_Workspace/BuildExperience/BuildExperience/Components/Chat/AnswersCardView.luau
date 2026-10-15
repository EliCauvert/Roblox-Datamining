local parent = script:FindFirstAncestor("BuildExperience").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)

return function(p1)
	-- upvalues: reactModule (ref), foundationModule (ref)
	local t = {}
	
	for i, v in p1.rows do
		local t_1 = {}
		
		for i_1, v_1 in v.answers do
			t_1[`Answer{i_1}`] = reactModule.createElement(foundationModule.View, {
				tag = "col gap-xsmall size-full-0 auto-y",
				LayoutOrder = i_1
			}, {
				Title = reactModule.createElement(foundationModule.Text, {
					LayoutOrder = 1,
					tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-emphasis",
					Text = v_1.title
				}),
				Description = if v_1.description ~= nil then nil else reactModule.createElement(foundationModule.Text, {
					LayoutOrder = 2,
					tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-default",
					Text = v_1.description
				})
			})
		end
		t[`Answer{i}`] = reactModule.createElement(foundationModule.View, { tag = "col size-full-0 auto-y", LayoutOrder = i }, {
			Divider = reactModule.createElement(foundationModule.Divider, { LayoutOrder = 1 }),
			Content = reactModule.createElement(foundationModule.View, {
				LayoutOrder = 2,
				tag = "col gap-xsmall size-full-0 auto-y padding-large"
			}, {
				Question = reactModule.createElement(foundationModule.Text, {
					LayoutOrder = 1,
					tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-muted",
					Text = v.question
				}),
				Answers = reactModule.createElement(foundationModule.View, {
					LayoutOrder = 2,
					tag = "col gap-small size-full-0 auto-y"
				}, t_1)
			})
		})
	end
	return reactModule.createElement(foundationModule.View, {
		tag = "stroke-standard stroke-default radius-large",
		testId = "AnswersCard",
		LayoutOrder = p1.LayoutOrder,
		Size = p1.Size
	}, {
		Content = reactModule.createElement(foundationModule.View, {
			tag = "col size-full-0 auto-y",
			testId = "AnswersCard.Content",
			onAbsoluteSizeChanged = p1.onContentSizeChanged
		}, {
			Header = reactModule.createElement(foundationModule.Text, {
				LayoutOrder = 1,
				tag = "size-full-0 auto-y padding-large text-title-small text-align-x-left content-emphasis",
				Text = p1.headerText
			}),
			Answers = reactModule.createElement(foundationModule.View, { LayoutOrder = 2, tag = "col size-full-0 auto-y" }, t)
		})
	})
end