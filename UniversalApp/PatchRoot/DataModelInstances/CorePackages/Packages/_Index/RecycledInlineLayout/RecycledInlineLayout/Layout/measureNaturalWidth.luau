local RecycledInlineLayout = script:FindFirstAncestor("RecycledInlineLayout")
local ReactiveModule = require(RecycledInlineLayout.Utils.Reactive)
local _ = require(RecycledInlineLayout.Types)
local FlattenModule = require(RecycledInlineLayout.Layout.flatten)
local LayoutModule = require(RecycledInlineLayout.Layout.layout)
local MeasureTextModule = require(RecycledInlineLayout.Measure.measureText)

return function(p1, p2): number
	-- upvalues: FlattenModule (copy), ReactiveModule (copy), LayoutModule (copy), MeasureTextModule (copy)
	return (math.ceil(LayoutModule(FlattenModule(p1, ReactiveModule.peek), 1e999, {}, p2 or { tokens = nil, measureText = MeasureTextModule }).naturalWidth))
end