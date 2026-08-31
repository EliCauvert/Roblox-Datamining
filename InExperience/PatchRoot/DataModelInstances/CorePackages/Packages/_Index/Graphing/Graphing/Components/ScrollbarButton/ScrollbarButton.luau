local graphing = script:FindFirstAncestor("Graphing")
local reactModule = require(graphing.Parent.React)
local _ = require(graphing.Types)
local inputDetectorModule = require(graphing.Components.InputDetector)
local styleUtilModule = require(graphing.Util.StyleUtil)

function ScrollbarButton(p1)
	-- upvalues: reactModule (ref), styleUtilModule (ref), inputDetectorModule (ref)
	return reactModule.createElement("ImageButton", {
		AnchorPoint = p1.AnchorPoint,
		Position = p1.Position,
		Rotation = p1.Rotation,
		Size = p1.Size,
		Image = p1.Image,
		BackgroundColor3 = p1.Color3 or styleUtilModule.SCROLLBAR_BUTTON_COLOR3,
		ZIndex = p1.ZIndex
	}, {
		MouseDetector = reactModule.createElement(inputDetectorModule, {
			AnchorPoint = p1.AnchorPoint,
			OnClick = function()
				-- upvalues: p1 (ref)
				if p1.OnClick then
					p1.OnClick()
				end
			end,
			OnDragMoved = function(p2)
				-- upvalues: p1 (ref)
				if p1.OnMoved then
					p1.OnMoved(p2)
				end
			end
		})
	})
end

return ScrollbarButton