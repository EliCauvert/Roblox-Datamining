local Squads = script:FindFirstAncestor("Squads")
local FoundationModule = require(Squads.Parent.Foundation)
local DependenciesModule = require(Squads.dependencies)
local React = DependenciesModule.React
local Cryo = DependenciesModule.Cryo
local UseTokensFunction = FoundationModule.Hooks.useTokens
local config = {
	voicePackName = "",
	LayoutOrder = 1,
	isSelected = false,
	isVoiceChangerActive = false,
	onActivated = function() end
}

return function(p1)
	-- upvalues: Cryo (copy), config (copy), UseTokensFunction (copy), React (copy), FoundationModule (copy)
	local JoinResult = Cryo.Dictionary.join(config, p1)
	local Size = UseTokensFunction().Size
	local Size600 = Size.Size_600
	local Size400 = Size.Size_400
	
	return React.createElement(FoundationModule.View, {
		tag = "size-full-0 auto-y radius-medium row align-x-left align-y-center gap-large padding-x-large padding-y-xsmall",
		LayoutOrder = JoinResult.LayoutOrder,
		onActivated = JoinResult.onActivated
	}, {
		Label = React.createElement(FoundationModule.Text, {
			tag = "auto-xy fill text-align-x-left text-label-medium content-emphasis text-truncate-end text-no-wrap",
			LayoutOrder = 1,
			Text = JoinResult.voicePackName
		}),
		RadioButtonContainer = React.createElement(FoundationModule.View, {
			tag = "auto-x row align-x-right align-y-center",
			LayoutOrder = 2,
			Size = UDim2.new(0, 0, 0, Size.Size_1000)
		}, {
			DefaultIcon = React.createElement(FoundationModule.Image, {
				tag = "bg-action-subtle content-emphasis anchor-center-center position-center-center",
				Image = "component_assets/circle_24_stroke_1",
				Size = UDim2.new(0, Size600, 0, Size600)
			}, {
				SelectedIcon = JoinResult.isSelected and React.createElement(FoundationModule.Image, {
					tag = "bg-action-subtle content-emphasis anchor-center-center position-center-center",
					Image = "component_assets/circle_16",
					Size = UDim2.new(0, Size400, 0, Size400)
				})
			})
		})
	})
end