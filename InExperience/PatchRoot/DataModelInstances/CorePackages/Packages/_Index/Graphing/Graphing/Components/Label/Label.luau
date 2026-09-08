local graphing = script:FindFirstAncestor("Graphing")
local reactModule = require(graphing.Parent.React)
local styleUtilModule = require(graphing.Util.StyleUtil)
local _ = require(graphing.Types)
local useViewportBindingModule = require(graphing.Util.useViewportBinding)
local useViewportBinding = useViewportBindingModule.useViewportBinding
local useViewportVisibility = useViewportBindingModule.useViewportVisibility

local function anchorForAlignment(p1, p2)
	local var1 = 0
	local var2 = 0
	
	if p1 == Enum.TextXAlignment.Left then
		var1 = 0
	elseif p1 == Enum.TextXAlignment.Center then
		var1 = 0.5
	elseif p1 == Enum.TextXAlignment.Right then
		var1 = 1
	end
	if p2 == Enum.TextYAlignment.Top then
		var2 = 0
	elseif p2 == Enum.TextYAlignment.Center then
		var2 = 0.5
	elseif p2 == Enum.TextYAlignment.Bottom then
		var2 = 1
	end
	return Vector2.new(var1, var2)
end

function Label(p1)
	-- upvalues: reactModule (ref), anchorForAlignment (ref), useViewportBinding (ref), useViewportVisibility (ref), styleUtilModule (ref)
	local var1 = if p1.TextXAlignment then p1.TextXAlignment else Enum.TextXAlignment.Center
	local var2 = if p1.TextYAlignment then p1.TextYAlignment else Enum.TextYAlignment.Center
	
	return if useViewportVisibility(function(p2)
		-- upvalues: p1 (ref)
		return p2.isPointInViewport(p1.Position)
	end, { p1.Position }) then reactModule.createElement("TextLabel", {
		BackgroundTransparency = 1,
		AnchorPoint = reactModule.useMemo(function()
			-- upvalues: anchorForAlignment (copy), var1 (ref), var2 (ref)
			return anchorForAlignment(var1, var2)
		end, { p1.TextXAlignment, p1.TextYAlignment }),
		Position = useViewportBinding(function(p2)
			-- upvalues: p1 (ref)
			local var3 = if p1.Offset then p1.Offset else Vector2.new(0, 0)
			local var4 = p2.plotToView(p1.Position)
			
			return UDim2.new(var4.X, var3.X, var4.Y, var3.Y)
		end, { p1.Position, p1.Offset }),
		Text = p1.Text,
		TextXAlignment = var1,
		TextYAlignment = var2,
		TextColor3 = p1.Color3 or styleUtilModule.GRID_LABEL_COLOR3,
		TextSize = p1.FontSize or styleUtilModule.GRID_LABEL_FONT_SIZE,
		ZIndex = p1.ZIndex
	}, p1.children) else nil
end

return Label