local Parent = script.Parent
local Parent1 = Parent.Parent.Parent.Parent
local Parent2 = Parent1.Parent
local CryoModule = require(Parent2.Parent.Cryo)
local _ = require(Parent1.Style.StyleTypes)
local SetDefaultModule = require(Parent2.Utility.setDefault)
local ConstantsModule = require(Parent.Constants)
local AspectRatioModeModule = require(Parent.Enum.AspectRatioMode)
local GetAspectRatioModule = require(Parent.getAspectRatio)

return function(p1, p2, p3, p4, p5): UDim
	-- upvalues: CryoModule (copy), ConstantsModule (copy), SetDefaultModule (copy), AspectRatioModeModule (copy), GetAspectRatioModule (copy)
	local JoinResult = CryoModule.Dictionary.join(ConstantsModule.getDefaultStyleProps(p1), p5 or {})
	local TopContentPadding = JoinResult.topContentPadding
	local BottomContentPadding = JoinResult.bottomContentPadding
	local SelectionCursorPadding = JoinResult.selectionCursorPadding
	local NewLeft = SelectionCursorPadding.Left + SelectionCursorPadding.Right + TopContentPadding.Left + TopContentPadding.Right
	local NewFloored = math.floor(SetDefaultModule(p3, ConstantsModule.DEFAULT_TEXT_LINE_COUNT) * JoinResult.contentTitleFont.RelativeSize * p1.Font.BaseSize + JoinResult.contentTitlePadding) + SetDefaultModule(p4, ConstantsModule.DEFAULT_FOOTER_HEIGHT)
	local NewTop = TopContentPadding.Top + TopContentPadding.Bottom + (BottomContentPadding.Top + BottomContentPadding.Bottom) + (SelectionCursorPadding.Top + SelectionCursorPadding.Bottom)
	local AspectRatioModule = GetAspectRatioModule((SetDefaultModule(p2, AspectRatioModeModule.Square)))
	
	return UDim.new(AspectRatioModule, -1 * NewLeft * AspectRatioModule + NewFloored + NewTop)
end