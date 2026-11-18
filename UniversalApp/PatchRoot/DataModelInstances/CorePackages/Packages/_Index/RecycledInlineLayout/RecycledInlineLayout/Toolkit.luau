local RecycledInlineLayout = script:FindFirstAncestor("RecycledInlineLayout")
local TextBaseModule = require(RecycledInlineLayout.Leaves.TextBase)
local _ = require(RecycledInlineLayout.Types)

return {
	defineLeaf = require(RecycledInlineLayout.Definitions.defineLeaf),
	defineSpan = require(RecycledInlineLayout.Definitions.defineSpan),
	defineDecoration = require(RecycledInlineLayout.Definitions.defineDecoration),
	useReportedSize = require(RecycledInlineLayout.Hooks.useReportedSize),
	useReportedFrameSize = require(RecycledInlineLayout.Hooks.useReportedFrameSize),
	TextLeaf = {
		View = require(RecycledInlineLayout.Leaves.TextView),
		label = require(RecycledInlineLayout.Leaves.MergedText).definition,
		createMerge = TextBaseModule.createMerge,
		measure = TextBaseModule.measure,
		measureFoundationText = TextBaseModule.measureFoundationText,
		withFoundationPadding = TextBaseModule.withFoundationPadding,
		split = TextBaseModule.split,
		trimStart = TextBaseModule.trimStart,
		trimEnd = TextBaseModule.trimEnd,
		styleProps = TextBaseModule.styleProps,
		foundationProps = TextBaseModule.foundationProps,
		useLineHeight = TextBaseModule.useLineHeight
	},
	RichText = require(RecycledInlineLayout.Utils.RichText),
	SplitText = require(RecycledInlineLayout.Utils.SplitText),
	Utils = {
		getFontFace = require(RecycledInlineLayout.Utils.getFontFace),
		measureText = require(RecycledInlineLayout.Measure.measureText),
		useTestId = require(RecycledInlineLayout.Utils.useTestId),
		deepEqual = require(RecycledInlineLayout.Utils.deepEqual),
		useRecyclingAssignment = require(RecycledInlineLayout.Parent.ViewRecyclerReact).useRecyclingAssignment
	}
}