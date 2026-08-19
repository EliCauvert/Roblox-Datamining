local textService = game:GetService("TextService")
local getVisibleLineCountModule = require(script.Parent.getVisibleLineCount)
local composerDebugModule = require(script.Parent.composerDebug)

return function(p0) --[[ line: 23 | named "measureTextLineCount" ]]
	-- upvalues: getVisibleLineCountModule (ref), composerDebugModule (ref), textService (ref)
	local var3 = getVisibleLineCountModule(p0.text, p0.maxLines)
	local var4 = 1
	
	if p0.text ~= "" then
		for i in string.gmatch(p0.text, "\n") do
			var4 += 1
		end
	end
	local layoutWidth = p0.layoutWidth or 0
	local var6 = nil
	local var7 = nil
	local var8 = var3
	
	if p0.text == "" then
		local t = {
			lineCount = 1,
			newlineLineCount = 1,
			wrappedLineCount = nil,
			boundsY = nil,
			layoutWidth = layoutWidth
		}
		composerDebugModule.log("measure", `empty -> lineCount=1 layoutWidth={layoutWidth}`)
		
		return t
	elseif layoutWidth > 0 then
		local y = textService:GetTextSize("M", p0.fontSize, p0.font, Vector2.new(layoutWidth, 100000)).Y
		local y_1 = textService:GetTextSize(p0.text, p0.fontSize, p0.font, Vector2.new(layoutWidth, 100000)).Y
		var6 = y_1
		
		if y_1 > 0 and y > 0 then
			local ceiled = math.ceil(y_1 / y)
			local maxValue = math.max(var4, ceiled)
			var7 = ceiled
			var8 = math.clamp(maxValue, 1, p0.maxLines)
			var6 = maxValue * p0.singleLineHeight
		end
	end
	local t = {
		lineCount = var8,
		newlineLineCount = var3,
		wrappedLineCount = var7,
		layoutWidth = layoutWidth,
		boundsY = var6
	}
	composerDebugModule.log("measure", `lineCount={var8} newlines={var3} wrapped={var7 or "nil"} boundsY={var6 or "nil"} layoutWidth={layoutWidth} textLen={utf8.len(p0.text) or #p0.text}`)
	
	return t
end