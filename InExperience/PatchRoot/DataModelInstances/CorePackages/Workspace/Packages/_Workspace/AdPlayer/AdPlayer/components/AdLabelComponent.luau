local Parent = script:FindFirstAncestor("AdPlayer").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local Text = FoundationModule.Text
local View = FoundationModule.View
local Image = FoundationModule.Image
local StateLayerAffordance = FoundationModule.Enums.StateLayerAffordance

return function(p1)
	-- upvalues: ReactModule (copy), View (copy), Text (copy), Image (copy), StateLayerAffordance (copy)
	local Visible = p1.Visible
	
	return ReactModule.createElement(View, {
		tag = "position-center-left anchor-center-left size-900-500 row align-x-center align-y-center gap-xsmall"
	}, {
		adText = ReactModule.createElement(Text, {
			tag = "size-400 content-emphasis text-body-small",
			Text = "Ad",
			TextScaled = true,
			Visible = Visible
		}),
		icon = ReactModule.createElement(Image, {
			tag = "size-300",
			LayoutOrder = 2,
			Image = p1.Image,
			onActivated = p1.handleToggleAdsModal,
			Visible = Visible,
			stateLayer = { affordance = StateLayerAffordance.None }
		})
	})
end