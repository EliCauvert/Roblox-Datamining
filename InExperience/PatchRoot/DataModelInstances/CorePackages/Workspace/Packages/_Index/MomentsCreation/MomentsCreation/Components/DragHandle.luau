local parent = script:FindFirstAncestor("MomentsCreation").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local view = foundationModule.View
local useTokens = foundationModule.Hooks.useTokens

return function(p1)
	-- upvalues: useTokens (ref), reactModule (ref), view (ref)
	local var1 = useTokens()
	
	return reactModule.createElement(view, {
		tag = "size-300-1000 radius-medium bg-system-contrast",
		AnchorPoint = p1.anchorPoint,
		Position = p1.position,
		stroke = {
			Color = var1.Color.System.Contrast.Color3,
			Transparency = var1.Color.System.Contrast.Transparency,
			Thickness = var1.Stroke.Thicker
		}
	}, {
		Line = reactModule.createElement(view, {
			tag = "position-center-center anchor-center-center size-100-400 radius-circle bg-surface-300",
			ZIndex = 2
		}),
		Box = reactModule.createElement(view, {
			tag = "anchor-center-center size-100-1000 bg-system-contrast",
			Position = if p1.isFlipped then UDim2.new(0, var1.Size.Size_50, 0.5, 0) else UDim2.new(1, -var1.Size.Size_50, 0.5, 0),
			stroke = {
				Color = var1.Color.System.Contrast.Color3,
				Transparency = var1.Color.System.Contrast.Transparency,
				Thickness = var1.Stroke.Thicker
			}
		}),
		DragDetector = reactModule.createElement("UIDragDetector", {
			DragStyle = Enum.UIDragDetectorDragStyle.TranslateLine,
			ref = p1.dragDetectorRef,
			ResponseStyle = Enum.UIDragDetectorResponseStyle.CustomScale
		})
	})
end