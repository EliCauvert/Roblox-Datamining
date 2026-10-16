local Songbird = script:FindFirstAncestor("Songbird")
local ReactModule = require(Songbird.Parent.React)
local FoundationModule = require(Songbird.Parent.Foundation)
local ProgressCountdownModule = require(Songbird.Components.ProgressCountdown)
local CreateNextOrderFunction = require(Songbird.Parent.ReactUtils).createNextOrder

return function(Frame) --[[ Line: 22 | Named "AudioPlaybackTimeline" ]]
	-- upvalues: CreateNextOrderFunction (copy), ReactModule (copy), FoundationModule (copy), ProgressCountdownModule (copy)
	local NextOrder = CreateNextOrderFunction()
	
	return ReactModule.createElement(FoundationModule.View, {
		tag = "size-full-0 auto-y row flex-between align-y-center gap-large",
		LayoutOrder = Frame.LayoutOrder
	}, {
		TimeElapsed = ReactModule.createElement(ProgressCountdownModule, {
			counterType = "Elapsed",
			timeLength = Frame.duration,
			timePosition = Frame.elapsed,
			LayoutOrder = NextOrder()
		}),
		ProgressBar = ReactModule.createElement(FoundationModule.View, {
			tag = "size-full-0 auto-y shrink padding-top-xxsmall",
			LayoutOrder = NextOrder()
		}, {
			Slider = ReactModule.createElement(FoundationModule.Slider, {
				value = Frame.elapsed:map(function(p1) --[[ Line: 41 ]]
					-- upvalues: Frame (copy)
					return if Frame.duration > 0 then p1 / Frame.duration else 0
				end),
				onValueChanged = Frame.onDragTimeline,
				onDragStarted = Frame.onDragTimelineStart,
				onDragEnded = Frame.onDragTimelineEnd,
				size = FoundationModule.Enums.InputSize.Medium,
				knobVisibility = FoundationModule.Enums.ScrollBarVisibility.Auto,
				variant = FoundationModule.Enums.SliderVariant.Standard
			})
		}),
		TimeRemaining = ReactModule.createElement(ProgressCountdownModule, {
			timeLength = Frame.duration,
			timePosition = Frame.elapsed,
			LayoutOrder = NextOrder()
		})
	})
end