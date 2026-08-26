local cryoModule = require(script:FindFirstAncestor("AppBlox").Parent.Cryo)

return function(p1)
	-- upvalues: cryoModule (ref)
	local t = {}
	local t_1 = {}
	
	for i, v in ipairs(p1.items) do
		if v.isYouTubeVideo then
			table.insert(t, cryoModule.Dictionary.join(v, { originalIndex = i }))
		else
			table.insert(t_1, cryoModule.Dictionary.join(v, { originalIndex = i }))
		end
	end
	local var1 = cryoModule.List.join(t, t_1)
	local numberOfThumbnails = p1.numberOfThumbnails
	
	if numberOfThumbnails then
		for i_1 = #var1 + 1, numberOfThumbnails do
			var1[i_1] = {}
		end
	end
	return var1, #t, #t_1
end