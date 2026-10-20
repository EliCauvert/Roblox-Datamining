local Parent = script:FindFirstAncestor("BuildExperience").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)

return function(Frame)
	-- upvalues: ReactModule (copy), FoundationModule (copy)
	local Elements = {}
	
	for LayoutOrder, row in Frame.rows do
		local Elements1 = {}
		
		for LayoutOrder1, answer in row.answers do
			Elements1[`Answer{LayoutOrder1}`] = ReactModule.createElement(FoundationModule.View, {
				tag = "col gap-xsmall size-full-0 auto-y",
				LayoutOrder = LayoutOrder1
			}, {
				Title = ReactModule.createElement(FoundationModule.Text, {
					LayoutOrder = 1,
					tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-emphasis",
					Text = answer.title
				}),
				Description = if answer.description == nil then nil else ReactModule.createElement(FoundationModule.Text, {
					LayoutOrder = 2,
					tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-default",
					Text = answer.description
				})
			})
		end
		Elements[`Answer{LayoutOrder}`] = ReactModule.createElement(FoundationModule.View, {
			tag = "col size-full-0 auto-y",
			LayoutOrder = LayoutOrder
		}, {
			Divider = ReactModule.createElement(FoundationModule.Divider, { LayoutOrder = 1 }),
			Content = ReactModule.createElement(FoundationModule.View, {
				LayoutOrder = 2,
				tag = "col gap-xsmall size-full-0 auto-y padding-large"
			}, {
				Question = ReactModule.createElement(FoundationModule.Text, {
					LayoutOrder = 1,
					tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-muted",
					Text = row.question
				}),
				Answers = ReactModule.createElement(FoundationModule.View, {
					LayoutOrder = 2,
					tag = "col gap-small size-full-0 auto-y"
				}, Elements1)
			})
		})
	end
	return ReactModule.createElement(FoundationModule.View, {
		tag = "stroke-standard stroke-default radius-large",
		testId = "AnswersCard",
		LayoutOrder = Frame.LayoutOrder,
		Size = Frame.Size
	}, {
		Content = ReactModule.createElement(FoundationModule.View, {
			tag = "col size-full-0 auto-y",
			testId = "AnswersCard.Content",
			onAbsoluteSizeChanged = Frame.onContentSizeChanged
		}, {
			Header = ReactModule.createElement(FoundationModule.Text, {
				LayoutOrder = 1,
				tag = "size-full-0 auto-y padding-large text-title-small text-align-x-left content-emphasis",
				Text = Frame.headerText
			}),
			Answers = ReactModule.createElement(FoundationModule.View, { LayoutOrder = 2, tag = "col size-full-0 auto-y" }, Elements)
		})
	})
end