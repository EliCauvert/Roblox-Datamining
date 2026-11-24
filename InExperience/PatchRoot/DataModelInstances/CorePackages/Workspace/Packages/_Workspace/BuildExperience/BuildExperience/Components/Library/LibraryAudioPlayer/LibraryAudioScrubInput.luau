local Parent = script:FindFirstAncestor("BuildExperience").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local UseLibraryAudioScrubInputModule = require(script.Parent.useLibraryAudioScrubInput)
local View = FoundationModule.View

return function(Frame)
	-- upvalues: UseLibraryAudioScrubInputModule (copy), ReactModule (copy), View (copy)
	local UseLibraryAudioScrubInputModuleResult, UseLibraryAudioScrubInputModuleResult2 = UseLibraryAudioScrubInputModule({
		onScrubStarted = Frame.onScrubStarted,
		onScrub = Frame.onScrub,
		onScrubEnded = Frame.onScrubEnded
	})
	
	return ReactModule.createElement(View, {
		tag = "size-full-0 auto-y",
		LayoutOrder = Frame.LayoutOrder
	}, {
		Slider = Frame.children,
		ScrubInput = if Frame.isDisabled then nil else ReactModule.createElement("TextButton", {
			AnchorPoint = Vector2.new(0.5, 0.5),
			AutoButtonColor = false,
			BackgroundTransparency = 1,
			Position = UDim2.fromScale(0.5, 0.5),
			Selectable = false,
			Size = UDim2.new(1, 0, 1, 24),
			Text = "",
			ZIndex = 2,
			ref = UseLibraryAudioScrubInputModuleResult,
			[ReactModule.Event.InputBegan] = UseLibraryAudioScrubInputModuleResult2
		})
	})
end