local graphing = script:FindFirstAncestor("Graphing")
local reactModule = require(graphing.Parent.React)
local styleUtilModule = require(graphing.Util.StyleUtil)
local _ = require(graphing.Types)
local useViewportBindingModule = require(graphing.Util.useViewportBinding)
local useViewportBinding = useViewportBindingModule.useViewportBinding
local useViewportVisibility = useViewportBindingModule.useViewportVisibility

function Panel(p1)
	-- upvalues: useViewportBinding (ref), useViewportVisibility (ref), reactModule (ref), styleUtilModule (ref)
	local var1 = useViewportBinding(function(p2)
		-- upvalues: p1 (ref)
		local var2 = p2.plotToView(p1.Rect.Min)
		local var3 = p2.plotToView(p1.Rect.Max)
		
		return {
			position = UDim2.fromScale(var2.X, var2.Y),
			size = UDim2.fromScale(var3.X - var2.X, var3.Y - var2.Y)
		}
	end, { p1.Rect })
	
	return if useViewportVisibility(function(p2)
		-- upvalues: p1 (ref)
		return p2.isRectInViewport(p1.Rect)
	end, { p1.Rect }) then if p1.Image then reactModule.createElement("ImageLabel", {
		Position = var1:map(function(p2)
			return p2.position
		end),
		Size = var1:map(function(p2)
			return p2.size
		end),
		Image = p1.Image,
		ImageColor3 = p1.ImageColor3,
		ImageTransparency = p1.ImageTransparency,
		BackgroundTransparency = 0,
		BorderSizePixel = 0,
		ZIndex = p1.ZIndex,
		[reactModule.Tag] = p1.Tag
	}, p1.children) else reactModule.createElement("Frame", {
		Position = var1:map(function(p2)
			return p2.position
		end),
		Size = var1:map(function(p2)
			return p2.size
		end),
		BackgroundColor3 = p1.BackgroundColor3 or styleUtilModule.GRID_BOX_BACKGROUND_COLOR3,
		BackgroundTransparency = p1.BackgroundTransparency or styleUtilModule.GRID_BOX_BACKGROUND_TRANSPARENCY,
		BorderColor3 = p1.BorderColor3 or styleUtilModule.GRID_BOX_BORDER_COLOR3,
		BorderSizePixel = p1.BorderThickness or styleUtilModule.GRID_BOX_BORDER_THICKNESS,
		ZIndex = p1.ZIndex,
		[reactModule.Tag] = p1.Tag
	}, p1.children) else nil
end

return Panel