local _ = require(script:FindFirstAncestor("VirtualEvents").Parent.GraphQLServer)

return function(List): string? --[[ Line: 15 | Named "findFirstImageInMedia" ]]
	for _, value in List do
		if value.assetType == "Image" and value.imageId then
			return ("rbxassetid://%s"):format(value.imageId)
		end
	end
	return nil
end