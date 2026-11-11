local Parent = script:FindFirstAncestor("Moments").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local FoundationProvider = FoundationModule.FoundationProvider
local Text = FoundationModule.Text
local View = FoundationModule.View
local ColorMode = FoundationModule.Enums.ColorMode

return function(p1)
	-- upvalues: ReactModule (copy), View (copy), FoundationProvider (copy), ColorMode (copy), Text (copy)
	return ReactModule.createElement(View, {
		tag = "position-top-left anchor-top-left auto-xy padding-small",
		testId = "moments-post-status-badge",
		ZIndex = p1.ZIndex
	}, {
		DarkScope = ReactModule.createElement(FoundationProvider, { colorMode = ColorMode.Dark }, {
			Pill = ReactModule.createElement(View, {
				tag = "row align-y-center size-0-600 auto-x padding-x-small radius-circle bg-over-media-300"
			}, {
				Label = ReactModule.createElement(Text, {
					tag = "auto-xy text-caption-medium content-emphasis",
					Text = p1.label
				})
			})
		})
	})
end