local RecycledInlineLayout = script:FindFirstAncestor("RecycledInlineLayout")
local TextBaseModule = require(RecycledInlineLayout.Leaves.TextBase)
local TextViewModule = require(RecycledInlineLayout.Leaves.TextView)
local _ = require(RecycledInlineLayout.Types)
local GetFontFaceModule = require(RecycledInlineLayout.Utils.getFontFace)
local _, Definition = require(RecycledInlineLayout.Definitions.defineLeaf)({
	name = "MergedText",
	view = TextViewModule,
	pool = TextViewModule,
	props = {
		Markup = { layout = "none", delivery = "binding" },
		fontStyle = { layout = "none", delivery = "binding" },
		textStyle = { layout = "none", delivery = "binding" },
		strokeStyle = { layout = "none", delivery = "binding" },
		strokeThickness = { layout = "none", delivery = "binding" }
	},
	measure = function(p1, p2)
		-- upvalues: TextBaseModule (copy), GetFontFaceModule (copy)
		return TextBaseModule.withFoundationPadding(p2.measureText(p1.Markup or "", GetFontFaceModule(p1.fontStyle), if p1.fontStyle and p1.fontStyle.FontSize then p1.fontStyle.FontSize else 16, true), p1.fontStyle, p2)
	end
})

return { definition = Definition }