-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:50 2026 Pacific Standard Time.

local parent = script:FindFirstAncestor("MomentsCreationFlow").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local view = foundationModule.View
local useTokens = foundationModule.Hooks.useTokens

return function(p0) --[[ line: 21 ]]
	-- upvalues: useTokens (ref), reactModule (ref), view (ref)
	local var2 = useTokens()
	
	return reactModule.createElement(view, {
		tag = "bg-system-contrast radius-medium size-300-1000",
		AnchorPoint = p0.anchorPoint,
		Position = p0.position
	}, {
		OutlineStroke = reactModule.createElement("UIStroke", {
			ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
			Color = var2.Color.System.Contrast.Color3,
			Transparency = var2.Color.System.Contrast.Transparency,
			Thickness = var2.Stroke.Thicker
		}),
		Line = reactModule.createElement(view, {
			tag = "anchor-center-center bg-surface-300 size-100-400 position-center-center radius-circle",
			ZIndex = 2
		}),
		Box = reactModule.createElement(view, {
			tag = "anchor-center-center bg-system-contrast size-100-1000",
			Position = if p0.isFlipped then UDim2.new(0, var2.Size.Size_50, 0.5, 0) else UDim2.new(1, -var2.Size.Size_50, 0.5, 0)
		}, {
			OutlineStroke = reactModule.createElement("UIStroke", {
				ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
				Color = var2.Color.System.Contrast.Color3,
				LineJoinMode = Enum.LineJoinMode.Miter,
				Transparency = var2.Color.System.Contrast.Transparency,
				Thickness = var2.Stroke.Thicker
			})
		}),
		DragDetector = reactModule.createElement("UIDragDetector", {
			DragStyle = Enum.UIDragDetectorDragStyle.TranslateLine,
			ref = p0.dragDetectorRef,
			ResponseStyle = Enum.UIDragDetectorResponseStyle.CustomScale
		})
	})
end