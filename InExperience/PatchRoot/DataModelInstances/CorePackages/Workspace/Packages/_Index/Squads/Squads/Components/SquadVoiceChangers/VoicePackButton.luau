local Squads = script:FindFirstAncestor("Squads")
local FFlagSquadsEnableFoundationTestIdsModule = require(Squads.Flags.FFlagSquadsEnableFoundationTestIds)
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

local function _(Text: string): string
	return string.lower((string.gsub(Text, "%s+", "-")))
end

return function(p1)
	-- upvalues: Cryo (copy), config (copy), FFlagSquadsEnableFoundationTestIdsModule (copy), UseTokensFunction (copy), React (copy), FoundationModule (copy)
	local JoinResult = Cryo.Dictionary.join(config, p1)
	local TestId = if FFlagSquadsEnableFoundationTestIdsModule then JoinResult.testId or `--social-squad-voice-changers--voice-pack-{string.lower((string.gsub(JoinResult.voicePackName, "%s+", "-")))}` else nil
	local Size = UseTokensFunction().Size
	local Size600 = Size.Size_600
	local Size400 = Size.Size_400
	
	return React.createElement(FoundationModule.View, {
		tag = "size-full-0 auto-y radius-medium row align-x-left align-y-center gap-large padding-x-large padding-y-xsmall",
		LayoutOrder = JoinResult.LayoutOrder,
		onActivated = JoinResult.onActivated,
		testId = TestId
	}, {
		Label = React.createElement(FoundationModule.Text, {
			tag = "auto-xy fill text-align-x-left text-label-medium content-emphasis text-truncate-end text-no-wrap",
			LayoutOrder = 1,
			Text = JoinResult.voicePackName,
			testId = if TestId then `{TestId}--label` else nil
		}),
		RadioButtonContainer = React.createElement(FoundationModule.View, {
			tag = "auto-x row align-x-right align-y-center",
			LayoutOrder = 2,
			Size = UDim2.new(0, 0, 0, Size.Size_1000)
		}, {
			DefaultIcon = React.createElement(FoundationModule.Image, {
				tag = "bg-action-subtle content-emphasis anchor-center-center position-center-center",
				Image = "component_assets/circle_24_stroke_1",
				Size = UDim2.new(0, Size600, 0, Size600),
				testId = if TestId then `{TestId}--radio` else nil
			}, {
				SelectedIcon = JoinResult.isSelected and React.createElement(FoundationModule.Image, {
					tag = "bg-action-subtle content-emphasis anchor-center-center position-center-center",
					Image = "component_assets/circle_16",
					Size = UDim2.new(0, Size400, 0, Size400),
					testId = if TestId then `{TestId}--radio-selected` else nil
				})
			})
		})
	})
end