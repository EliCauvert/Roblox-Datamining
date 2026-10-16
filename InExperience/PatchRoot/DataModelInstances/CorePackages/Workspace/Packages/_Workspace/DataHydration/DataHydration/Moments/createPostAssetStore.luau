local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local PromiseModule = require(Parent.Promise)
local CreateSingleEntityResolverModule = require(DataHydration.createSingleEntityResolver)
local _ = require(script.Parent.MomentsStoreTypes)

return function(p1) --[[ Line: 18 | Named "createPostAssetStore" ]]
	-- upvalues: CreateSingleEntityResolverModule (copy), PromiseModule (copy), Parent (copy)
	local P0 = p1 or {}
	local MomentsService = P0.momentsService or game:GetService("MomentsService")
	local PostDecoder = P0.postDecoder
	local SingleEntityResolverModule = CreateSingleEntityResolverModule(function(AssetId) --[[ Line: 24 ]]
		-- upvalues: PromiseModule (upval), PostDecoder (ref), Parent (upval), MomentsService (copy)
		return PromiseModule.new(function(Callback, Callback1) --[[ Line: 25 ]]
			-- upvalues: PostDecoder (upval), Parent (upval), MomentsService (upval), AssetId (copy)
			task.spawn(function() --[[ Line: 26 ]]
				-- upvalues: PostDecoder (upval), Parent (upval), MomentsService (upval), AssetId (upval), Callback (copy), Callback1 (copy)
				local Packed = table.pack(pcall(function() --[[ Line: 27 ]]
					-- upvalues: PostDecoder (upval), Parent (upval), MomentsService (upval), AssetId (upval)
					if PostDecoder == nil then
						PostDecoder = require(Parent.ServiceContractsProto).posts.postasset.post.Post
					end
					return PostDecoder.decode((MomentsService:FetchPostAsync(AssetId)))
				end))
				
				if Packed[1] then
					Callback(Packed[2])
					
					return
				else
					Callback1(Packed[2])
				end
			end)
		end)
	end, { resolver = { replaceItems = true } })
	
	return {
		getCachedPostAsset = SingleEntityResolverModule.get,
		getAndFetchPostAsset = SingleEntityResolverModule.getAndFetch,
		clear = SingleEntityResolverModule.clear,
		dispose = SingleEntityResolverModule.dispose
	}
end