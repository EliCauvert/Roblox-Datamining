-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:33:01 2026 Pacific Standard Time.

local parent = script.Parent
local parent_1 = parent.Parent.Parent.Parent
local parent_2 = parent_1.Parent
local cryoModule = require(parent_2.Parent.Cryo)
local _ = require(parent_1.Style.StyleTypes)
local setDefaultModule = require(parent_2.Utility.setDefault)
local constantsModule = require(parent.Constants)
local aspectRatioModeModule = require(parent.Enum.AspectRatioMode)
local getAspectRatioModule = require(parent.getAspectRatio)

return function(p0, p1, p2, p3, p4) --[[ line: 33 ]]
	-- upvalues: cryoModule (ref), constantsModule (ref), setDefaultModule (ref), aspectRatioModeModule (ref), getAspectRatioModule (ref)
	local var5 = cryoModule.Dictionary.join(constantsModule.getDefaultStyleProps(p0), p4 or {})
	local var6 = setDefaultModule(p3, constantsModule.DEFAULT_FOOTER_HEIGHT)
	local var7 = setDefaultModule(p2, constantsModule.DEFAULT_TEXT_LINE_COUNT)
	local var8 = setDefaultModule(p1, aspectRatioModeModule.Square)
	local topContentPadding = var5.topContentPadding
	local bottomContentPadding = var5.bottomContentPadding
	local contentTitleFont = var5.contentTitleFont
	local contentTitlePadding = var5.contentTitlePadding
	local selectionCursorPadding = var5.selectionCursorPadding
	local var9 = getAspectRatioModule(var8)
	
	return UDim.new(var9, -1 * (selectionCursorPadding.Left + selectionCursorPadding.Right + topContentPadding.Left + topContentPadding.Right) * var9 + (math.floor(var7 * contentTitleFont.RelativeSize * p0.Font.BaseSize + contentTitlePadding) + var6) + (topContentPadding.Top + topContentPadding.Bottom + (bottomContentPadding.Top + bottomContentPadding.Bottom) + (selectionCursorPadding.Top + selectionCursorPadding.Bottom)))
end