local Graphing = script:FindFirstAncestor("Graphing")
local ReactModule = require(Graphing.Parent.React)
local StyleUtilModule = require(Graphing.Util.StyleUtil)
local _ = require(Graphing.Types)
local UseViewportBindingModule = require(Graphing.Util.useViewportBinding)
local UseViewportBindingFunction = UseViewportBindingModule.useViewportBinding
local UseViewportVisibilityFunction = UseViewportBindingModule.useViewportVisibility

function Panel(Frame: Frame)
	-- upvalues: UseViewportBindingFunction (copy), UseViewportVisibilityFunction (copy), ReactModule (copy), StyleUtilModule (copy)
	local UseViewportBindingResult = UseViewportBindingFunction(function(p1)
		-- upvalues: Frame (copy)
		local PlotToViewResult = p1.plotToView(Frame.Rect.Min)
		local PlotToViewResult1 = p1.plotToView(Frame.Rect.Max)
		
		return {
			position = UDim2.fromScale(PlotToViewResult.X, PlotToViewResult.Y),
			size = UDim2.fromScale(PlotToViewResult1.X - PlotToViewResult.X, PlotToViewResult1.Y - PlotToViewResult.Y)
		}
	end, { Frame.Rect })
	
	return if UseViewportVisibilityFunction(function(p1)
		-- upvalues: Frame (copy)
		return p1.isRectInViewport(Frame.Rect)
	end, { Frame.Rect }) then if Frame.Image then ReactModule.createElement("ImageLabel", {
		Position = UseViewportBindingResult:map(function(p1)
			return p1.position
		end),
		Size = UseViewportBindingResult:map(function(p1)
			return p1.size
		end),
		Image = Frame.Image,
		ImageColor3 = Frame.ImageColor3,
		ImageTransparency = Frame.ImageTransparency,
		BackgroundTransparency = 0,
		BorderSizePixel = 0,
		ZIndex = Frame.ZIndex,
		[ReactModule.Tag] = Frame.Tag
	}, Frame.children) else ReactModule.createElement("Frame", {
		Position = UseViewportBindingResult:map(function(p1)
			return p1.position
		end),
		Size = UseViewportBindingResult:map(function(p1)
			return p1.size
		end),
		BackgroundColor3 = Frame.BackgroundColor3 or StyleUtilModule.GRID_BOX_BACKGROUND_COLOR3,
		BackgroundTransparency = Frame.BackgroundTransparency or StyleUtilModule.GRID_BOX_BACKGROUND_TRANSPARENCY,
		BorderColor3 = Frame.BorderColor3 or StyleUtilModule.GRID_BOX_BORDER_COLOR3,
		BorderSizePixel = Frame.BorderThickness or StyleUtilModule.GRID_BOX_BORDER_THICKNESS,
		ZIndex = Frame.ZIndex,
		[ReactModule.Tag] = Frame.Tag
	}, Frame.children) else nil
end

return Panel