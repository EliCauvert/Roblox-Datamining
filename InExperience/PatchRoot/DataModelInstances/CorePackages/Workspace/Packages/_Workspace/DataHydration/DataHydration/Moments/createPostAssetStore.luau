local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local PromiseModule = require(Parent.Promise)
local FFlagMomentsRenderAvatarPostsInFeed = require(Parent.SharedFlags).FFlagMomentsRenderAvatarPostsInFeed
local CreateSingleEntityResolverModule = require(DataHydration.createSingleEntityResolver)
local _ = require(script.Parent.MomentsStoreTypes)

return function(p1)
	-- upvalues: CreateSingleEntityResolverModule (copy), PromiseModule (copy), Parent (copy), FFlagMomentsRenderAvatarPostsInFeed (copy)
	local P0 = p1 or {}
	local MomentsService = P0.momentsService or game:GetService("MomentsService")
	local PostDecoder = P0.postDecoder
	local SingleEntityResolverModule = CreateSingleEntityResolverModule(function(AssetId)
		-- upvalues: PromiseModule (upval), PostDecoder (ref), Parent (upval), MomentsService (copy), FFlagMomentsRenderAvatarPostsInFeed (upval)
		return PromiseModule.new(function(Callback, Callback1)
			-- upvalues: PostDecoder (upval), Parent (upval), MomentsService (upval), AssetId (copy), FFlagMomentsRenderAvatarPostsInFeed (upval)
			task.spawn(function()
				-- upvalues: PostDecoder (upval), Parent (upval), MomentsService (upval), AssetId (upval), FFlagMomentsRenderAvatarPostsInFeed (upval), Callback (copy), Callback1 (copy)
				local Packed = table.pack(pcall(function()
					-- upvalues: PostDecoder (upval), Parent (upval), MomentsService (upval), AssetId (upval), FFlagMomentsRenderAvatarPostsInFeed (upval)
					if PostDecoder == nil then
						PostDecoder = require(Parent.ServiceContractsProto).posts.postasset.post.Post
					end
					local PostAsync = MomentsService:FetchPostAsync(AssetId)
					
					if not FFlagMomentsRenderAvatarPostsInFeed then
						return PostDecoder.decode(PostAsync)
					end
					if typeof(PostAsync) ~= "buffer" then
						error(`FetchPostAsync returned {typeof(PostAsync)} instead of a buffer for Post {AssetId}`)
					end
					local DecodeResult = PostDecoder.decode(PostAsync)
					
					if DecodeResult == nil then
						error(`Post decoder returned nil for Post {AssetId} ({buffer.len(PostAsync)} bytes)`)
					end
					return DecodeResult
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