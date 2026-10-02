local commentsSheetSnapPointsModule = require(script.Parent.CommentsSheetSnapPoints)

return function(p1, p2)
	-- upvalues: commentsSheetSnapPointsModule (ref)
	if p1.sheetInset <= 0 then
		return nil
	elseif p1.isKeyboardVisible and p2 ~= nil then
		return p2
	end
	local var1 = commentsSheetSnapPointsModule[1] * p1.overlayHeight
	
	return if var1 <= 0 then nil else {
		progress = math.min(p1.sheetInset / var1, 1),
		bandTop = p1.overlayTop,
		bandBottom = p1.overlayTop + p1.overlayHeight - var1
	}
end