local _ = require(script:FindFirstAncestor("VirtualEvents").Parent.GraphQLServer)

return function(p0)
	for i, v in p0 do
		if v.assetType == "Image" and v.imageId then
			return ("rbxassetid://%s"):format(v.imageId)
		end
	end
	return nil
end