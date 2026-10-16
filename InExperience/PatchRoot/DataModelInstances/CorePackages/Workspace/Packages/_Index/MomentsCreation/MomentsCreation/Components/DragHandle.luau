local Parent = script:FindFirstAncestor("MomentsCreation").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local View = FoundationModule.View
local UseTokensFunction = FoundationModule.Hooks.useTokens

return function(p1) --[[ Line: 27 ]]
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), View (copy)
	local UseTokensResult = UseTokensFunction()
	
	return ReactModule.createElement(View, {
		tag = "size-300-1000 radius-medium bg-system-contrast",
		AnchorPoint = p1.anchorPoint,
		Position = p1.position,
		stroke = {
			Color = UseTokensResult.Color.System.Contrast.Color3,
			Transparency = UseTokensResult.Color.System.Contrast.Transparency,
			Thickness = UseTokensResult.Stroke.Thicker
		}
	}, {
		Line = ReactModule.createElement(View, {
			tag = "position-center-center anchor-center-center size-100-400 radius-circle bg-surface-300",
			ZIndex = 2
		}),
		Box = ReactModule.createElement(View, {
			tag = "anchor-center-center size-100-1000 bg-system-contrast",
			Position = if p1.isFlipped then UDim2.new(0, UseTokensResult.Size.Size_50, 0.5, 0) else UDim2.new(1, -UseTokensResult.Size.Size_50, 0.5, 0),
			stroke = {
				Color = UseTokensResult.Color.System.Contrast.Color3,
				Transparency = UseTokensResult.Color.System.Contrast.Transparency,
				Thickness = UseTokensResult.Stroke.Thicker
			}
		}),
		DragDetector = ReactModule.createElement("UIDragDetector", {
			DragStyle = Enum.UIDragDetectorDragStyle.TranslateLine,
			ref = p1.dragDetectorRef,
			ResponseStyle = Enum.UIDragDetectorResponseStyle.CustomScale
		})
	})
end