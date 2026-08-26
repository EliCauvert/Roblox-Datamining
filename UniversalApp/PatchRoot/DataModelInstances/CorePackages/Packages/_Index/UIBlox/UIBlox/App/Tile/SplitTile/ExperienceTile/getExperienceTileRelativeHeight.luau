local parent = script.Parent
local parent_1 = parent.Parent.Parent.Parent
local parent_2 = parent_1.Parent
local cryoModule = require(parent_2.Parent.Cryo)
local _ = require(parent_1.Style.StyleTypes)
local setDefaultModule = require(parent_2.Utility.setDefault)
local constantsModule = require(parent.Constants)
local aspectRatioModeModule = require(parent.Enum.AspectRatioMode)
local getAspectRatioModule = require(parent.getAspectRatio)

return function(p1, p2, p3, p4, p5)
	-- upvalues: cryoModule (ref), constantsModule (ref), setDefaultModule (ref), aspectRatioModeModule (ref), getAspectRatioModule (ref)
	local var1 = cryoModule.Dictionary.join(constantsModule.getDefaultStyleProps(p1), p5 or {})
	local var2 = setDefaultModule(p4, constantsModule.DEFAULT_FOOTER_HEIGHT)
	local var3 = setDefaultModule(p3, constantsModule.DEFAULT_TEXT_LINE_COUNT)
	local var4 = setDefaultModule(p2, aspectRatioModeModule.Square)
	local topContentPadding = var1.topContentPadding
	local bottomContentPadding = var1.bottomContentPadding
	local contentTitleFont = var1.contentTitleFont
	local contentTitlePadding = var1.contentTitlePadding
	local selectionCursorPadding = var1.selectionCursorPadding
	local var5 = getAspectRatioModule(var4)
	
	return UDim.new(var5, -1 * (selectionCursorPadding.Left + selectionCursorPadding.Right + topContentPadding.Left + topContentPadding.Right) * var5 + (math.floor(var3 * contentTitleFont.RelativeSize * p1.Font.BaseSize + contentTitlePadding) + var2) + (topContentPadding.Top + topContentPadding.Bottom + (bottomContentPadding.Top + bottomContentPadding.Bottom) + (selectionCursorPadding.Top + selectionCursorPadding.Bottom)))
end