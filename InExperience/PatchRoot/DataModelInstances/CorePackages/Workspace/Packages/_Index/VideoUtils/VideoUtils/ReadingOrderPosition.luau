local ReadingOrderPositionModule = {
	getOffset = function(p1, p2, p3)
		return p1 / p3 * p2
	end
}

function ReadingOrderPositionModule.get(p1, p2, p3, p4)
	-- upvalues: ReadingOrderPositionModule (copy)
	return p1 + ReadingOrderPositionModule.getOffset(p2, p3, p4)
end

return ReadingOrderPositionModule