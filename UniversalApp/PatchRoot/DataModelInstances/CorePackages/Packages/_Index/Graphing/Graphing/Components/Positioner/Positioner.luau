local graphing = script:FindFirstAncestor("Graphing")
local reactModule = require(graphing.Parent.React)
local _ = require(graphing.Types)
local useViewportBindingModule = require(graphing.Util.useViewportBinding)
local useViewportBinding = useViewportBindingModule.useViewportBinding
local useViewportVisibility = useViewportBindingModule.useViewportVisibility

function Positioner(p1, p2)
	-- upvalues: useViewportBinding (ref), useViewportVisibility (ref), reactModule (ref)
	if typeof(p1.Position) ~= "Vector2" then
		return reactModule.createElement("Frame", {
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = p1.Position,
			Size = UDim2.fromOffset(0, 0),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ZIndex = p1.ZIndex,
			ref = p2,
			[reactModule.Tag] = p1.Tag
		}, p1.children)
	end
	local position = p1.Position
	
	return if useViewportVisibility(function(p3)
		-- upvalues: position (ref)
		return p3.isPointInViewport(position)
	end, { position }) then reactModule.createElement("Frame", {
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = useViewportBinding(function(p3)
			-- upvalues: position (ref)
			local var1 = p3.plotToView(position)
			
			return UDim2.fromScale(var1.X, var1.Y)
		end, { position }),
		Size = UDim2.fromOffset(0, 0),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ZIndex = p1.ZIndex,
		ref = p2,
		[reactModule.Tag] = p1.Tag
	}, p1.children) else nil
end

return reactModule.forwardRef(Positioner)