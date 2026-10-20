local Parent = script:FindFirstAncestor("Moments").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local CommentRowSkeletonViewModule = require(script.Parent.Rows.CommentRowSkeletonView)
local View = FoundationModule.View
local UseTokensFunction = FoundationModule.Hooks.useTokens

local function getRowShapes(p1)
	local Size = p1.Size
	
	return {
		{
			authorWidth = Size.Size_2400,
			timestampWidth = Size.Size_500,
			bodyLineWidths = { 1, 0.62 }
		},
		{
			authorWidth = Size.Size_1600,
			timestampWidth = Size.Size_600,
			bodyLineWidths = { 0.45 }
		},
		{
			authorWidth = Size.Size_2800,
			timestampWidth = Size.Size_500,
			bodyLineWidths = { 0.96, 1, 0.38 }
		},
		{
			authorWidth = Size.Size_2000,
			timestampWidth = Size.Size_700,
			bodyLineWidths = { 0.8 }
		},
		{
			authorWidth = Size.Size_2600,
			timestampWidth = Size.Size_500,
			bodyLineWidths = { 1, 0.5 }
		},
		{
			authorWidth = Size.Size_1800,
			timestampWidth = Size.Size_600,
			bodyLineWidths = { 0.3 }
		},
		{
			authorWidth = Size.Size_2200,
			timestampWidth = Size.Size_500,
			bodyLineWidths = { 0.97, 0.72 }
		},
		{
			authorWidth = Size.Size_3000,
			timestampWidth = Size.Size_600,
			bodyLineWidths = { 0.55 }
		}
	}
end

return function(Frame)
	-- upvalues: UseTokensFunction (copy), getRowShapes (copy), ReactModule (copy), CommentRowSkeletonViewModule (copy), View (copy)
	local Elements = {}
	
	for LayoutOrder, value in getRowShapes((UseTokensFunction())) do
		Elements[`Row{LayoutOrder}`] = ReactModule.createElement(CommentRowSkeletonViewModule, {
			LayoutOrder = LayoutOrder,
			authorWidth = value.authorWidth,
			timestampWidth = value.timestampWidth,
			bodyLineWidths = value.bodyLineWidths,
			testId = `{Frame.testId}--row-{LayoutOrder}`
		})
	end
	return ReactModule.createElement(View, {
		tag = "col size-full clip",
		LayoutOrder = Frame.LayoutOrder,
		testId = Frame.testId
	}, Elements)
end