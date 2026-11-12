local Parent = script:FindFirstAncestor("Moments").Parent
local BuilderIconsModule = require(Parent.BuilderIcons)
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local Icon = FoundationModule.Icon
local Progress = FoundationModule.Progress
local Text = FoundationModule.Text
local View = FoundationModule.View
local IconSize = FoundationModule.Enums.IconSize
local ProgressShape = FoundationModule.Enums.ProgressShape
local ProgressSize = FoundationModule.Enums.ProgressSize

return function(Frame)
	-- upvalues: ReactModule (copy), View (copy), Progress (copy), ProgressShape (copy), ProgressSize (copy), Icon (copy), BuilderIconsModule (copy), IconSize (copy), Text (copy)
	return ReactModule.createElement(View, {
		tag = "row align-x-left align-y-center gap-medium size-full-0 auto-y padding-large radius-medium bg-shift-300",
		testId = "moments-post-status-row",
		LayoutOrder = Frame.LayoutOrder
	}, {
		Media = ReactModule.createElement(View, {
			LayoutOrder = 1,
			tag = "row align-x-center align-y-center size-1000-1000"
		}, {
			Indicator = if Frame.variant == "posting" then ReactModule.createElement(Progress, {
				testId = "moments-post-status-row-progress",
				shape = ProgressShape.Circle,
				size = ProgressSize.Medium,
				value = Frame.progress
			}) else ReactModule.createElement(Icon, {
				testId = "moments-post-status-row-warning",
				name = BuilderIconsModule.Icon.TriangleExclamation,
				size = IconSize.Medium
			})
		}),
		Text = ReactModule.createElement(View, {
			LayoutOrder = 2,
			tag = "col align-x-left align-y-center grow auto-y"
		}, {
			Title = ReactModule.createElement(Text, {
				LayoutOrder = 1,
				tag = "size-full-0 auto-y text-title-medium text-align-x-left text-truncate-end content-emphasis",
				Text = Frame.title
			}),
			Body = ReactModule.createElement(Text, {
				LayoutOrder = 2,
				tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-default",
				Text = Frame.body
			})
		})
	})
end