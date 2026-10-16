local CryoModule = require(script:FindFirstAncestor("AppBlox").Parent.Cryo)

return function(p1) --[[ Line: 6 | Named "getShowItems" ]]
	-- upvalues: CryoModule (copy)
	local JoinResults = {}
	local JoinResults1 = {}
	
	for OriginalIndex, item in ipairs(p1.items) do
		if item.isYouTubeVideo then
			table.insert(JoinResults, CryoModule.Dictionary.join(item, { originalIndex = OriginalIndex }))
		else
			table.insert(JoinResults1, CryoModule.Dictionary.join(item, { originalIndex = OriginalIndex }))
		end
	end
	local JoinResult = CryoModule.List.join(JoinResults, JoinResults1)
	local NumberOfThumbnails = p1.numberOfThumbnails
	
	if NumberOfThumbnails then
		for i = #JoinResult + 1, NumberOfThumbnails do
			JoinResult[i] = {}
		end
	end
	return JoinResult, #JoinResults, #JoinResults1
end