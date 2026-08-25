local adPlayer = script:FindFirstAncestor("AdPlayer")
local parent = adPlayer.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local text = foundationModule.Text
local view = foundationModule.View
local image = foundationModule.Image
local stateLayerAffordance = foundationModule.Enums.StateLayerAffordance
local flagsModule = require(adPlayer.Flags)

return function(p0)
	-- upvalues: reactModule (ref), view (ref), flagsModule (ref), text (ref), image (ref), stateLayerAffordance (ref)
	local visible = p0.Visible
	
	return reactModule.createElement(view, {
		tag = if flagsModule.GetEnableLuaRewardTimerUI() then "size-900-500 row align-x-center align-y-center gap-xsmall" else "position-center-left anchor-center-left size-900-500 row align-x-center align-y-center gap-xsmall"
	}, {
		adText = reactModule.createElement(text, {
			tag = "size-400 content-emphasis text-body-small",
			Text = "Ad",
			TextScaled = true,
			Visible = visible
		}),
		icon = reactModule.createElement(image, {
			tag = "size-300",
			LayoutOrder = 2,
			Image = p0.Image,
			onActivated = p0.handleToggleAdsModal,
			Visible = visible,
			stateLayer = { affordance = stateLayerAffordance.None }
		})
	})
end