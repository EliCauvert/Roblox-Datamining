local songbird = script:FindFirstAncestor("Songbird")
local reactModule = require(songbird.Parent.React)
local foundationModule = require(songbird.Parent.Foundation)
local progressCountdownModule = require(songbird.Components.ProgressCountdown)
local createNextOrder = require(songbird.Parent.ReactUtils).createNextOrder

return function(p1)
	-- upvalues: createNextOrder (ref), reactModule (ref), foundationModule (ref), progressCountdownModule (ref)
	local var1 = createNextOrder()
	
	return reactModule.createElement(foundationModule.View, {
		tag = "size-full-0 auto-y row flex-between align-y-center gap-large",
		LayoutOrder = p1.LayoutOrder
	}, {
		TimeElapsed = reactModule.createElement(progressCountdownModule, {
			counterType = "Elapsed",
			timeLength = p1.duration,
			timePosition = p1.elapsed,
			LayoutOrder = var1()
		}),
		ProgressBar = reactModule.createElement(foundationModule.View, {
			tag = "size-full-0 auto-y shrink padding-top-xxsmall",
			LayoutOrder = var1()
		}, {
			Slider = reactModule.createElement(foundationModule.Slider, {
				value = p1.elapsed:map(function(p2)
					-- upvalues: p1 (ref)
					return if p1.duration > 0 then p2 / p1.duration else 0
				end),
				onValueChanged = p1.onDragTimeline,
				onDragStarted = p1.onDragTimelineStart,
				onDragEnded = p1.onDragTimelineEnd,
				size = foundationModule.Enums.InputSize.Medium,
				knobVisibility = foundationModule.Enums.ScrollBarVisibility.Auto,
				variant = foundationModule.Enums.SliderVariant.Standard
			})
		}),
		TimeRemaining = reactModule.createElement(progressCountdownModule, {
			timeLength = p1.duration,
			timePosition = p1.elapsed,
			LayoutOrder = var1()
		})
	})
end