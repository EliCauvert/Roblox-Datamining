local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local promiseModule = require(parent.Promise)
local createSingleEntityResolverModule = require(dataHydration.createSingleEntityResolver)
local _ = require(script.Parent.MomentsStoreTypes)

return function(value)
	-- upvalues: createSingleEntityResolverModule (ref), promiseModule (ref), parent (ref)
	local value_1 = value or {}
	local momentsService = value_1.momentsService or game:GetService("MomentsService")
	local postDecoder = value_1.postDecoder
	local var1 = createSingleEntityResolverModule(function(p1)
		-- upvalues: promiseModule (copy), postDecoder (write), parent (copy), momentsService (ref)
		return promiseModule.new(function(p2, p3)
			-- upvalues: postDecoder (copy), parent (copy), momentsService (copy), p1 (ref)
			task.spawn(function()
				-- upvalues: postDecoder (copy), parent (copy), momentsService (copy), p1 (copy), p2 (ref), p3 (ref)
				local packed = table.pack(pcall(function()
					-- upvalues: postDecoder (copy), parent (copy), momentsService (copy), p1 (copy)
					if postDecoder == nil then
						postDecoder = require(parent.ServiceContractsProto).posts.postasset.post.Post
					end
					return postDecoder.decode(momentsService:FetchPostAsync(p1))
				end))
				
				if packed[1] then
					p2(packed[2])
					
					return
				end
				p3(packed[2])
			end)
		end)
	end, { resolver = { replaceItems = true } })
	
	return {
		getCachedPostAsset = var1.get,
		getAndFetchPostAsset = var1.getAndFetch,
		clear = var1.clear,
		dispose = var1.dispose
	}
end