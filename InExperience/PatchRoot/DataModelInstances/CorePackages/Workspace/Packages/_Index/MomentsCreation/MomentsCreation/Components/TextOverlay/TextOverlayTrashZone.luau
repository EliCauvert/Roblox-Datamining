local parent = script:FindFirstAncestor("MomentsCreation").Parent
local builderIconsModule = require(parent.BuilderIcons)
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local view = foundationModule.View
local icon = foundationModule.Icon
local hexColor = Color3.fromHex("121215")
local t = { Transparency = 0.2, Color3 = Color3.new(1, 1, 1) }

return reactModule.forwardRef(function(p1, p2)
	-- upvalues: reactModule (ref), view (ref), hexColor (ref), foundationModule (ref), icon (ref), builderIconsModule (ref), t (ref)
	return reactModule.createElement(view, {
		Active = false,
		tag = "position-bottom-center anchor-bottom-center auto-xy padding-large",
		testId = "moments-text-overlay-trash-zone",
		ref = p2,
		Visible = p1.visible == nil or p1.visible,
		ZIndex = p1.ZIndex or 20
	}, {
		ButtonScale = reactModule.createElement(view, {
			Active = false,
			tag = "row align-x-center align-y-center radius-circle",
			testId = "moments-text-overlay-trash",
			backgroundStyle = { Transparency = 0.35, Color3 = hexColor },
			scale = p1.highlightScale or 1,
			Size = UDim2.fromOffset(40, 40),
			stateLayer = {
				affordance = foundationModule.Enums.StateLayerAffordance.None
			}
		}, {
			Icon = reactModule.createElement(icon, {
				name = builderIconsModule.Icon.TrashCan,
				size = foundationModule.Enums.IconSize.Small,
				style = t
			})
		})
	})
end)