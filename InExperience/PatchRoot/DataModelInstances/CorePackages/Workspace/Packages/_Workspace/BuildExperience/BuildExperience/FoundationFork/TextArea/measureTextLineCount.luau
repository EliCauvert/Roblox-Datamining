local textService = game:GetService("TextService")
local getVisibleLineCountModule = require(script.Parent.getVisibleLineCount)
local chatTextAreaDebugModule = require(script.Parent.chatTextAreaDebug)

return function(p1)
	-- upvalues: getVisibleLineCountModule (ref), chatTextAreaDebugModule (ref), textService (ref)
	local var1 = getVisibleLineCountModule(p1.text, p1.maxLines)
	local var2 = 1
	
	if p1.text ~= "" then
		for i in string.gmatch(p1.text, "\n") do
			var2 += 1
		end
	end
	local layoutWidth = p1.layoutWidth or 0
	local var3 = nil
	local var4 = nil
	local var5 = var1
	
	if p1.text == "" then
		local t = {
			lineCount = 1,
			newlineLineCount = 1,
			wrappedLineCount = nil,
			boundsY = nil,
			layoutWidth = layoutWidth
		}
		chatTextAreaDebugModule.log("measure", `empty -> lineCount=1 layoutWidth={layoutWidth}`)
		
		return t
	elseif layoutWidth > 0 then
		local y = textService:GetTextSize("M", p1.fontSize, p1.font, Vector2.new(layoutWidth, 100000)).Y
		local y_1 = textService:GetTextSize(p1.text, p1.fontSize, p1.font, Vector2.new(layoutWidth, 100000)).Y
		var3 = y_1
		
		if y_1 > 0 and y > 0 then
			local ceiled = math.ceil(y_1 / y)
			local maxValue = math.max(var2, ceiled)
			var4 = ceiled
			var5 = math.clamp(maxValue, 1, p1.maxLines)
			var3 = maxValue * p1.singleLineHeight
		end
	end
	local t = {
		lineCount = var5,
		newlineLineCount = var1,
		wrappedLineCount = var4,
		layoutWidth = layoutWidth,
		boundsY = var3
	}
	chatTextAreaDebugModule.log("measure", `lineCount={var5} newlines={var1} wrapped={var4 or "nil"} boundsY={var3 or "nil"} layoutWidth={layoutWidth} textLen={utf8.len(p1.text) or #p1.text}`)
	
	return t
end