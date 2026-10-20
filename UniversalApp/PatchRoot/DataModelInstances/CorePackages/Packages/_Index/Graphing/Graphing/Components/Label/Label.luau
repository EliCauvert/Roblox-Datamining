local Graphing = script:FindFirstAncestor("Graphing")
local ReactModule = require(Graphing.Parent.React)
local StyleUtilModule = require(Graphing.Util.StyleUtil)
local _ = require(Graphing.Types)
local UseViewportBindingModule = require(Graphing.Util.useViewportBinding)
local UseViewportBindingFunction = UseViewportBindingModule.useViewportBinding
local UseViewportVisibilityFunction = UseViewportBindingModule.useViewportVisibility

local function anchorForAlignment(TextXAlignment, TextYAlignment): Vector2
	local X = 0
	local Y = 0
	
	if TextXAlignment == Enum.TextXAlignment.Left then
		X = 0
	elseif TextXAlignment == Enum.TextXAlignment.Center then
		X = 0.5
	elseif TextXAlignment == Enum.TextXAlignment.Right then
		X = 1
	end
	if TextYAlignment == Enum.TextYAlignment.Top then
		Y = 0
	elseif TextYAlignment == Enum.TextYAlignment.Center then
		Y = 0.5
	elseif TextYAlignment == Enum.TextYAlignment.Bottom then
		Y = 1
	end
	return Vector2.new(X, Y)
end

function Label(Label1)
	-- upvalues: ReactModule (copy), anchorForAlignment (copy), UseViewportBindingFunction (copy), UseViewportVisibilityFunction (copy), StyleUtilModule (copy)
	local TextXAlignment = if Label1.TextXAlignment then Label1.TextXAlignment else Enum.TextXAlignment.Center
	local TextYAlignment = if Label1.TextYAlignment then Label1.TextYAlignment else Enum.TextYAlignment.Center
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: anchorForAlignment (upval), TextXAlignment (copy), TextYAlignment (copy)
		return anchorForAlignment(TextXAlignment, TextYAlignment)
	end, { Label1.TextXAlignment, Label1.TextYAlignment })
	local UseViewportBindingResult = UseViewportBindingFunction(function(p1): UDim2
		-- upvalues: Label1 (copy)
		local Offset = if Label1.Offset then Label1.Offset else Vector2.new(0, 0)
		local PlotToViewResult = p1.plotToView(Label1.Position)
		
		return UDim2.new(PlotToViewResult.X, Offset.X, PlotToViewResult.Y, Offset.Y)
	end, { Label1.Position, Label1.Offset })
	
	return if UseViewportVisibilityFunction(function(p1)
		-- upvalues: Label1 (copy)
		return p1.isPointInViewport(Label1.Position)
	end, { Label1.Position }) then ReactModule.createElement("TextLabel", {
		BackgroundTransparency = 1,
		AnchorPoint = UseMemoResult,
		Position = UseViewportBindingResult,
		Text = Label1.Text,
		TextXAlignment = TextXAlignment,
		TextYAlignment = TextYAlignment,
		TextColor3 = Label1.Color3 or StyleUtilModule.GRID_LABEL_COLOR3,
		TextSize = Label1.FontSize or StyleUtilModule.GRID_LABEL_FONT_SIZE,
		ZIndex = Label1.ZIndex
	}, Label1.children) else nil
end

return Label