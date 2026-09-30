local parent = script:FindFirstAncestor("Moments").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local commentRowSkeletonViewModule = require(script.Parent.Rows.CommentRowSkeletonView)
local view = foundationModule.View
local useTokens = foundationModule.Hooks.useTokens

local function getRowShapes(p1)
	local size = p1.Size
	
	return {
		{
			authorWidth = size.Size_2400,
			timestampWidth = size.Size_500,
			bodyLineWidths = { 1, 0.62 }
		},
		{
			authorWidth = size.Size_1600,
			timestampWidth = size.Size_600,
			bodyLineWidths = { 0.45 }
		},
		{
			authorWidth = size.Size_2800,
			timestampWidth = size.Size_500,
			bodyLineWidths = { 0.96, 1, 0.38 }
		},
		{
			authorWidth = size.Size_2000,
			timestampWidth = size.Size_700,
			bodyLineWidths = { 0.8 }
		},
		{
			authorWidth = size.Size_2600,
			timestampWidth = size.Size_500,
			bodyLineWidths = { 1, 0.5 }
		},
		{
			authorWidth = size.Size_1800,
			timestampWidth = size.Size_600,
			bodyLineWidths = { 0.3 }
		},
		{
			authorWidth = size.Size_2200,
			timestampWidth = size.Size_500,
			bodyLineWidths = { 0.97, 0.72 }
		},
		{
			authorWidth = size.Size_3000,
			timestampWidth = size.Size_600,
			bodyLineWidths = { 0.55 }
		}
	}
end

return function(p1)
	-- upvalues: useTokens (ref), getRowShapes (ref), reactModule (ref), commentRowSkeletonViewModule (ref), view (ref)
	local t = {}
	
	for i, v in getRowShapes(useTokens()) do
		t[`Row{i}`] = reactModule.createElement(commentRowSkeletonViewModule, {
			LayoutOrder = i,
			authorWidth = v.authorWidth,
			timestampWidth = v.timestampWidth,
			bodyLineWidths = v.bodyLineWidths,
			testId = `{p1.testId}--row-{i}`
		})
	end
	return reactModule.createElement(view, {
		tag = "col size-full clip",
		LayoutOrder = p1.LayoutOrder,
		testId = p1.testId
	}, t)
end