local _ = require(script:FindFirstAncestor("VirtualEvents").Parent.GraphQLServer)

return function(p1)
	for i, v in p1 do
		if v.assetType == "Image" and v.imageId then
			return ("rbxassetid://%s"):format(v.imageId)
		end
	end
	return nil
end