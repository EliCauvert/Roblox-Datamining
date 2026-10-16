local squads = script:FindFirstAncestor("Squads")
local foundationModule = require(squads.Parent.Foundation)
local dependenciesModule = require(squads.dependencies)
local react = dependenciesModule.React
local cryo = dependenciesModule.Cryo
local useTokens = foundationModule.Hooks.useTokens
local t = {
	voicePackName = "",
	LayoutOrder = 1,
	isSelected = false,
	isVoiceChangerActive = false,
	onActivated = function() end
}

return function(p1)
	-- upvalues: cryo (ref), t (ref), useTokens (ref), react (ref), foundationModule (ref)
	local var1 = cryo.Dictionary.join(t, p1)
	local size = useTokens().Size
	local size1000 = size.Size_1000
	local size600 = size.Size_600
	local size400 = size.Size_400
	
	return react.createElement(foundationModule.View, {
		tag = "size-full-0 auto-y radius-medium row align-x-left align-y-center gap-large padding-x-large padding-y-xsmall",
		LayoutOrder = var1.LayoutOrder,
		onActivated = var1.onActivated
	}, {
		Label = react.createElement(foundationModule.Text, {
			tag = "auto-xy fill text-align-x-left text-label-medium content-emphasis text-truncate-end text-no-wrap",
			LayoutOrder = 1,
			Text = var1.voicePackName
		}),
		RadioButtonContainer = react.createElement(foundationModule.View, {
			tag = "auto-x row align-x-right align-y-center",
			LayoutOrder = 2,
			Size = UDim2.new(0, 0, 0, size1000)
		}, {
			DefaultIcon = react.createElement(foundationModule.Image, {
				tag = "bg-action-subtle content-emphasis anchor-center-center position-center-center",
				Image = "component_assets/circle_24_stroke_1",
				Size = UDim2.new(0, size600, 0, size600)
			}, {
				SelectedIcon = var1.isSelected and react.createElement(foundationModule.Image, {
					tag = "bg-action-subtle content-emphasis anchor-center-center position-center-center",
					Image = "component_assets/circle_16",
					Size = UDim2.new(0, size400, 0, size400)
				})
			})
		})
	})
end