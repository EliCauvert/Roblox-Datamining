local Parent = script:FindFirstAncestor("MomentsCreationFlow").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local View = FoundationModule.View
local UseTokensFunction = FoundationModule.Hooks.useTokens

return function(p1)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), View (copy)
	local UseTokensResult = UseTokensFunction()
	
	return ReactModule.createElement(View, {
		tag = "bg-system-contrast radius-medium size-300-1000",
		AnchorPoint = p1.anchorPoint,
		Position = p1.position
	}, {
		OutlineStroke = ReactModule.createElement("UIStroke", {
			ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
			Color = UseTokensResult.Color.System.Contrast.Color3,
			Transparency = UseTokensResult.Color.System.Contrast.Transparency,
			Thickness = UseTokensResult.Stroke.Thicker
		}),
		Line = ReactModule.createElement(View, {
			tag = "anchor-center-center bg-surface-300 size-100-400 position-center-center radius-circle",
			ZIndex = 2
		}),
		Box = ReactModule.createElement(View, {
			tag = "anchor-center-center bg-system-contrast size-100-1000",
			Position = if p1.isFlipped then UDim2.new(0, UseTokensResult.Size.Size_50, 0.5, 0) else UDim2.new(1, -UseTokensResult.Size.Size_50, 0.5, 0)
		}, {
			OutlineStroke = ReactModule.createElement("UIStroke", {
				ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
				Color = UseTokensResult.Color.System.Contrast.Color3,
				LineJoinMode = Enum.LineJoinMode.Miter,
				Transparency = UseTokensResult.Color.System.Contrast.Transparency,
				Thickness = UseTokensResult.Stroke.Thicker
			})
		}),
		DragDetector = ReactModule.createElement("UIDragDetector", {
			DragStyle = Enum.UIDragDetectorDragStyle.TranslateLine,
			ref = p1.dragDetectorRef,
			ResponseStyle = Enum.UIDragDetectorResponseStyle.CustomScale
		})
	})
end