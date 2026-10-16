local Parent = script:FindFirstAncestor("MomentsCreation").Parent
local BuilderIconsModule = require(Parent.BuilderIcons)
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local View = FoundationModule.View
local Icon = FoundationModule.Icon
local _Color3 = Color3.fromHex("121215")
local Style = { Transparency = 0.2, Color3 = Color3.new(1, 1, 1) }

return ReactModule.forwardRef(function(p1, Ref) --[[ Line: 41 | Named "TextOverlayTrashZone" ]]
	-- upvalues: ReactModule (copy), View (copy), _Color3 (copy), FoundationModule (copy), Icon (copy), BuilderIconsModule (copy), Style (copy)
	return ReactModule.createElement(View, {
		Active = false,
		tag = "position-bottom-center anchor-bottom-center auto-xy padding-large",
		testId = "moments-text-overlay-trash-zone",
		ref = Ref,
		Visible = p1.visible == nil or p1.visible,
		ZIndex = p1.ZIndex or 20
	}, {
		ButtonScale = ReactModule.createElement(View, {
			Active = false,
			tag = "row align-x-center align-y-center radius-circle",
			testId = "moments-text-overlay-trash",
			backgroundStyle = { Transparency = 0.35, Color3 = _Color3 },
			scale = p1.highlightScale or 1,
			Size = UDim2.fromOffset(40, 40),
			stateLayer = {
				affordance = FoundationModule.Enums.StateLayerAffordance.None
			}
		}, {
			Icon = ReactModule.createElement(Icon, {
				name = BuilderIconsModule.Icon.TrashCan,
				size = FoundationModule.Enums.IconSize.Small,
				style = Style
			})
		})
	})
end)