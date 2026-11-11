local Parent = script:FindFirstAncestor("BuildExperience").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local ChatCaptureToolbarIllustrationModule = require(script.Parent.ChatCaptureToolbarIllustration)
local Text = FoundationModule.Text
local View = FoundationModule.View

local function renderStep(LayoutOrder, Text1)
	-- upvalues: ReactModule (copy), View (copy), Text (copy)
	return ReactModule.createElement(View, {
		tag = "row align-y-center gap-small size-full-0 auto-y",
		LayoutOrder = LayoutOrder,
		testId = `ChatCaptureEmptyState.Step.{LayoutOrder}`
	}, {
		Number = ReactModule.createElement(View, {
			LayoutOrder = 1,
			tag = "row align-x-center align-y-center size-600-600 radius-circle bg-shift-200"
		}, {
			Label = ReactModule.createElement(Text, {
				tag = "auto-xy text-caption-medium content-emphasis",
				Text = tostring(LayoutOrder)
			})
		}),
		Text = ReactModule.createElement(Text, {
			LayoutOrder = 2,
			tag = "fill auto-y text-body-medium text-wrap text-align-x-left content-default",
			Text = Text1
		})
	})
end

return function(p1)
	-- upvalues: renderStep (copy), ReactModule (copy), View (copy), Text (copy), ChatCaptureToolbarIllustrationModule (copy)
	local t = {}
	
	for i, howToStep in p1.howToSteps do
		t[`Step-{i}`] = renderStep(i, howToStep)
	end
	return ReactModule.createElement(View, {
		tag = "col gap-large size-full-0 auto-y padding-bottom-medium",
		testId = "ChatCaptureEmptyState"
	}, {
		Header = ReactModule.createElement(View, {
			LayoutOrder = 1,
			tag = "col align-x-center gap-xsmall size-full-0 auto-y"
		}, {
			Title = ReactModule.createElement(Text, {
				LayoutOrder = 1,
				tag = "size-full-0 auto-y text-heading-small text-wrap text-align-x-center content-emphasis",
				Text = p1.emptyText
			}),
			Description = ReactModule.createElement(Text, {
				LayoutOrder = 2,
				tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-center content-muted",
				Text = p1.descriptionText
			})
		}),
		Illustration = ReactModule.createElement(ChatCaptureToolbarIllustrationModule, { LayoutOrder = 2, layout = p1.toolbarLayout }),
		Steps = ReactModule.createElement(View, {
			LayoutOrder = 3,
			tag = "col gap-medium size-full-0 auto-y"
		}, t)
	})
end