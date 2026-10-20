local Graphing = script:FindFirstAncestor("Graphing")
local ReactModule = require(Graphing.Parent.React)
local _ = require(Graphing.Types)
local InputDetectorModule = require(Graphing.Components.InputDetector)
local StyleUtilModule = require(Graphing.Util.StyleUtil)

function ScrollbarButton(Frame: Frame)
	-- upvalues: ReactModule (copy), StyleUtilModule (copy), InputDetectorModule (copy)
	return ReactModule.createElement("ImageButton", {
		AnchorPoint = Frame.AnchorPoint,
		Position = Frame.Position,
		Rotation = Frame.Rotation,
		Size = Frame.Size,
		Image = Frame.Image,
		BackgroundColor3 = Frame.Color3 or StyleUtilModule.SCROLLBAR_BUTTON_COLOR3,
		ZIndex = Frame.ZIndex
	}, {
		MouseDetector = ReactModule.createElement(InputDetectorModule, {
			AnchorPoint = Frame.AnchorPoint,
			OnClick = function()
				-- upvalues: Frame (copy)
				if Frame.OnClick then
					Frame.OnClick()
				end
			end,
			OnDragMoved = function(p1)
				-- upvalues: Frame (copy)
				if Frame.OnMoved then
					Frame.OnMoved(p1)
				end
			end
		})
	})
end

return ScrollbarButton