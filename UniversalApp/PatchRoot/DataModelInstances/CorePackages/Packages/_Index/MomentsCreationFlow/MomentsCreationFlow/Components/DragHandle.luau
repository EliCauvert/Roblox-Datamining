local parent = script:FindFirstAncestor("MomentsCreationFlow").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local view = foundationModule.View
local useTokens = foundationModule.Hooks.useTokens

return function(p1)
	-- upvalues: useTokens (ref), reactModule (ref), view (ref)
	local var1 = useTokens()
	
	return reactModule.createElement(view, {
		tag = "bg-system-contrast radius-medium size-300-1000",
		AnchorPoint = p1.anchorPoint,
		Position = p1.position
	}, {
		OutlineStroke = reactModule.createElement("UIStroke", {
			ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
			Color = var1.Color.System.Contrast.Color3,
			Transparency = var1.Color.System.Contrast.Transparency,
			Thickness = var1.Stroke.Thicker
		}),
		Line = reactModule.createElement(view, {
			tag = "anchor-center-center bg-surface-300 size-100-400 position-center-center radius-circle",
			ZIndex = 2
		}),
		Box = reactModule.createElement(view, {
			tag = "anchor-center-center bg-system-contrast size-100-1000",
			Position = if p1.isFlipped then UDim2.new(0, var1.Size.Size_50, 0.5, 0) else UDim2.new(1, -var1.Size.Size_50, 0.5, 0)
		}, {
			OutlineStroke = reactModule.createElement("UIStroke", {
				ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
				Color = var1.Color.System.Contrast.Color3,
				LineJoinMode = Enum.LineJoinMode.Miter,
				Transparency = var1.Color.System.Contrast.Transparency,
				Thickness = var1.Stroke.Thicker
			})
		}),
		DragDetector = reactModule.createElement("UIDragDetector", {
			DragStyle = Enum.UIDragDetectorDragStyle.TranslateLine,
			ref = p1.dragDetectorRef,
			ResponseStyle = Enum.UIDragDetectorResponseStyle.CustomScale
		})
	})
end