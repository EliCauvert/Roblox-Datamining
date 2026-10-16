local AppBlox = script:FindFirstAncestor("AppBlox")
local StyleModule = require(AppBlox.Parent.Style)
local GetVisibleLineCountModule = require(script.Parent.getVisibleLineCount)
local ComposerDebugModule = require(script.Parent.composerDebug)
local TextService = game:GetService("TextService")
local FoundationFontFaceMigration = require(AppBlox.Parent.Foundation).Utility.Flags.FoundationFontFaceMigration

return function(p1) --[[ Line: 28 | Named "measureTextLineCount" ]]
	-- upvalues: GetVisibleLineCountModule (copy), ComposerDebugModule (copy), FoundationFontFaceMigration (copy), StyleModule (copy), TextService (copy)
	local VisibleLineCountModule = GetVisibleLineCountModule(p1.text, p1.maxLines)
	local Count = 1
	
	if p1.text ~= "" then
		for _ in string.gmatch(p1.text, "\n") do
			Count += 1
		end
	end
	local LayoutWidth = p1.layoutWidth or 0
	local ScaledSingleLineHeight: number? = nil
	local WrappedLineCount: number? = nil
	local ClampedValue: number = VisibleLineCountModule
	local UnclampedLineCount: number = Count
	
	if p1.text == "" then
		local config = {
			lineCount = 1,
			unclampedLineCount = 1,
			newlineLineCount = 1,
			wrappedLineCount = nil,
			boundsY = nil,
			layoutWidth = LayoutWidth
		}
		ComposerDebugModule.log("measure", `empty -> lineCount=1 layoutWidth={LayoutWidth}`)
		
		return config
	end
	if LayoutWidth > 0 then
		local Y = if FoundationFontFaceMigration then StyleModule.GetTextSize("M", p1.fontSize, p1.font, Vector2.new(LayoutWidth, 100000), { addTemporaryPadding = false }).Y else TextService:GetTextSize("M", p1.fontSize, p1.font, Vector2.new(LayoutWidth, 100000)).Y
		local Y1: number = (if FoundationFontFaceMigration then StyleModule.GetTextSize(p1.text, p1.fontSize, p1.font, Vector2.new(LayoutWidth, 100000), { addTemporaryPadding = false }) else TextService:GetTextSize(p1.text, p1.fontSize, p1.font, Vector2.new(LayoutWidth, 100000))).Y
		ScaledSingleLineHeight = Y1
		
		if Y1 > 0 and Y > 0 then
			local Ceiled = math.ceil(Y1 / Y)
			local Largest = math.max(Count, Ceiled)
			WrappedLineCount = Ceiled
			ClampedValue = math.clamp(Largest, 1, p1.maxLines)
			UnclampedLineCount = Largest
			ScaledSingleLineHeight = Largest * p1.singleLineHeight
		end
	end
	local config = {
		lineCount = ClampedValue,
		unclampedLineCount = UnclampedLineCount,
		newlineLineCount = VisibleLineCountModule,
		wrappedLineCount = WrappedLineCount,
		layoutWidth = LayoutWidth,
		boundsY = ScaledSingleLineHeight
	}
	ComposerDebugModule.log("measure", `lineCount={ClampedValue} newlines={VisibleLineCountModule} wrapped={WrappedLineCount or "nil"} boundsY={ScaledSingleLineHeight or "nil"} layoutWidth={LayoutWidth} textLen={utf8.len(p1.text) or #p1.text}`)
	
	return config
end