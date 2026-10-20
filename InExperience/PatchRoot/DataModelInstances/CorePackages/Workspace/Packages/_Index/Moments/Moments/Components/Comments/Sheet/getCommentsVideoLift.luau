local CommentsSheetSnapPointsModule = require(script.Parent.CommentsSheetSnapPoints)

return function(p1, p2)
	-- upvalues: CommentsSheetSnapPointsModule (copy)
	if p1.sheetInset <= 0 then
		return nil
	elseif p1.isKeyboardVisible and p2 ~= nil then
		return p2
	else
		local ScaledCommentsSheetSnapPointsModuleEntry = CommentsSheetSnapPointsModule[1] * p1.overlayHeight
		
		return if ScaledCommentsSheetSnapPointsModuleEntry <= 0 then nil else {
			progress = math.min(p1.sheetInset / ScaledCommentsSheetSnapPointsModuleEntry, 1),
			bandTop = p1.overlayTop,
			bandBottom = p1.overlayTop + p1.overlayHeight - ScaledCommentsSheetSnapPointsModuleEntry
		}
	end
end