local ListBlockModule = require(script:FindFirstAncestor("CommonMark").node.ListBlock)

return function()
	-- upvalues: ListBlockModule (copy)
	local OrderedList = ListBlockModule.new("OrderedList")
	OrderedList.markerDelimiter = nil
	OrderedList.markerStartNumber = nil
	
	return OrderedList
end