local songbird = script:FindFirstAncestor("Songbird")
local reactModule = require(songbird.Parent.React)
local foundationModule = require(songbird.Parent.Foundation)
local progressCountdownModule = require(songbird.Components.ProgressCountdown)
local createNextOrder = require(songbird.Parent.ReactUtils).createNextOrder

return function(p0)
	-- upvalues: createNextOrder (ref), reactModule (ref), foundationModule (ref), progressCountdownModule (ref)
	local var4 = createNextOrder()
	
	return reactModule.createElement(foundationModule.View, {
		tag = "size-full-0 auto-y row flex-between align-y-center gap-large",
		LayoutOrder = p0.LayoutOrder
	}, {
		TimeElapsed = reactModule.createElement(progressCountdownModule, {
			counterType = "Elapsed",
			timeLength = p0.duration,
			timePosition = p0.elapsed,
			LayoutOrder = var4()
		}),
		ProgressBar = reactModule.createElement(foundationModule.View, {
			tag = "size-full-0 auto-y shrink padding-top-xxsmall",
			LayoutOrder = var4()
		}, {
			Slider = reactModule.createElement(foundationModule.Slider, {
				value = p0.elapsed:map(function(p1)
					-- upvalues: p0 (ref)
					return if p0.duration > 0 then p1 / p0.duration else 0
				end),
				onValueChanged = p0.onDragTimeline,
				onDragStarted = p0.onDragTimelineStart,
				onDragEnded = p0.onDragTimelineEnd,
				size = foundationModule.Enums.InputSize.Medium,
				knobVisibility = foundationModule.Enums.ScrollBarVisibility.Auto,
				variant = foundationModule.Enums.SliderVariant.Standard
			})
		}),
		TimeRemaining = reactModule.createElement(progressCountdownModule, {
			timeLength = p0.duration,
			timePosition = p0.elapsed,
			LayoutOrder = var4()
		})
	})
end