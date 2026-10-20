local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local CreateDataCacheModule = require(DataHydration.createDataCache)
local CreateDataResolverModule = require(DataHydration.createDataResolver)
local _ = require(DataHydration.DataHydrationTypes)
local CryoModule = require(Parent.Cryo)
local PromiseModule = require(Parent.Promise)
local RequestsModule = require(script.Parent.Requests)
local _ = require(script.Parent.FollowingStoreTypes)
local ClassifyFollowingErrorModule = require(script.Parent.classifyFollowingError)
game:DefineFastInt("FollowingStoreProcessDelaySec", 1)

local function _()
	return game:GetFastInt("FollowingStoreProcessDelaySec")
end

local _ = function(p1)
	return if p1 == nil then nil else tostring(p1)
end

return function()
	-- upvalues: CreateDataCacheModule (copy), RequestsModule (copy), CreateDataResolverModule (copy), CryoModule (copy), PromiseModule (copy), ClassifyFollowingErrorModule (copy)
	local DataCacheModule = CreateDataCacheModule()
	local DataCacheModule1 = CreateDataCacheModule()
	
	local function _(p1)
		-- upvalues: RequestsModule (upval)
		return RequestsModule.GetFollowingExists(p1):andThen(function(Result)
			-- upvalues: p1 (copy)
			local IsFollowing = {}
			local IsFollowed = {}
			
			for _, value in if Result and Result.followings then Result.followings else {} do
				local UserId = value.userId
				local Text = if UserId == nil then nil else tostring(UserId)
				
				if Text then
					IsFollowing[Text] = value.isFollowing == true
					IsFollowed[Text] = value.isFollowed == true
				end
			end
			for _, value1 in p1 do
				if IsFollowing[value1] == nil then
					IsFollowing[value1] = false
				end
				if IsFollowed[value1] == nil then
					IsFollowed[value1] = false
				end
			end
			return { isFollowing = IsFollowing, isFollowed = IsFollowed }
		end)
	end
	
	local DataResolverModule = CreateDataResolverModule({
		requestBatchSize = 100,
		supportsMutations = true,
		cache = DataCacheModule,
		queueProcessDelaySec = game:GetFastInt("FollowingStoreProcessDelaySec"),
		fetchFn = function(p2)
			-- upvalues: CryoModule (upval), RequestsModule (upval), DataCacheModule1 (copy)
			local KeysResult = CryoModule.Dictionary.keys(p2)
			
			return RequestsModule.GetFollowingExists(KeysResult):andThen(function(Result)
				-- upvalues: KeysResult (copy)
				local IsFollowing = {}
				local IsFollowed = {}
				
				for _, value in if Result and Result.followings then Result.followings else {} do
					local UserId = value.userId
					local Text = if UserId == nil then nil else tostring(UserId)
					
					if Text then
						IsFollowing[Text] = value.isFollowing == true
						IsFollowed[Text] = value.isFollowed == true
					end
				end
				for _, value1 in KeysResult do
					if IsFollowing[value1] == nil then
						IsFollowing[value1] = false
					end
					if IsFollowed[value1] == nil then
						IsFollowed[value1] = false
					end
				end
				return { isFollowing = IsFollowing, isFollowed = IsFollowed }
			end):andThen(function(Result)
				-- upvalues: DataCacheModule1 (upval)
				DataCacheModule1.replaceItems(Result.isFollowed)
				
				return Result.isFollowing
			end)
		end
	})
	local DataResolverModule1 = CreateDataResolverModule({
		requestBatchSize = 100,
		supportsMutations = true,
		cache = DataCacheModule1,
		queueProcessDelaySec = game:GetFastInt("FollowingStoreProcessDelaySec"),
		fetchFn = function(p3)
			-- upvalues: CryoModule (upval), RequestsModule (upval), DataCacheModule (copy)
			local KeysResult = CryoModule.Dictionary.keys(p3)
			
			return RequestsModule.GetFollowingExists(KeysResult):andThen(function(Result)
				-- upvalues: KeysResult (copy)
				local IsFollowing = {}
				local IsFollowed = {}
				
				for _, value in if Result and Result.followings then Result.followings else {} do
					local UserId = value.userId
					local Text = if UserId == nil then nil else tostring(UserId)
					
					if Text then
						IsFollowing[Text] = value.isFollowing == true
						IsFollowed[Text] = value.isFollowed == true
					end
				end
				for _, value1 in KeysResult do
					if IsFollowing[value1] == nil then
						IsFollowing[value1] = false
					end
					if IsFollowed[value1] == nil then
						IsFollowed[value1] = false
					end
				end
				return { isFollowing = IsFollowing, isFollowed = IsFollowed }
			end):andThen(function(Result)
				-- upvalues: DataCacheModule (upval)
				DataCacheModule.replaceItems(Result.isFollowing)
				
				return Result.isFollowed
			end)
		end
	})
	local GetOptimisticCachedItemFunction = DataResolverModule.getOptimisticCachedItem
	local GetOptimisticAndFetchItemFunction1 = DataResolverModule.getOptimisticAndFetchItem
	local GetOptimisticCachedItemFunction1 = DataResolverModule1.getOptimisticCachedItem
	local GetOptimisticAndFetchItemFunction = DataResolverModule1.getOptimisticAndFetchItem
	
	local function writeFollowing(p4, IsFollowing, Callback, p5)
		-- upvalues: DataResolverModule (copy), PromiseModule (upval), ClassifyFollowingErrorModule (upval)
		DataResolverModule.setMutation(p4, IsFollowing)
		
		return Callback(p4, p5):andThen(function()
			-- upvalues: DataResolverModule (upval), p4 (copy), IsFollowing (copy)
			DataResolverModule.commitMutation(p4)
			
			return { type = "success", isFollowing = IsFollowing }
		end, function(p6)
			-- upvalues: DataResolverModule (upval), p4 (copy), PromiseModule (upval), ClassifyFollowingErrorModule (upval)
			DataResolverModule.clearMutation(p4)
			
			return PromiseModule.reject(ClassifyFollowingErrorModule(p6))
		end)
	end
	
	return {
		GetIsFollowing = function(p4, p5)
			-- upvalues: GetOptimisticCachedItemFunction (copy), DataResolverModule1 (copy), GetOptimisticAndFetchItemFunction1 (copy)
			return if p5 and p5.skipFetch then GetOptimisticCachedItemFunction(p4) elseif DataResolverModule1.isRequestInQueueOrInFlight(p4) then GetOptimisticCachedItemFunction(p4) else GetOptimisticAndFetchItemFunction1(p4)
		end,
		GetIsFollowed = function(p4, p5)
			-- upvalues: GetOptimisticCachedItemFunction1 (copy), DataResolverModule (copy), GetOptimisticAndFetchItemFunction (copy)
			return if p5 and p5.skipFetch then GetOptimisticCachedItemFunction1(p4) elseif DataResolverModule.isRequestInQueueOrInFlight(p4) then GetOptimisticCachedItemFunction1(p4) else GetOptimisticAndFetchItemFunction(p4)
		end,
		Follow = function(p4, p5)
			-- upvalues: writeFollowing (copy), RequestsModule (upval)
			return writeFollowing(p4, true, RequestsModule.FollowUser, p5)
		end,
		Unfollow = function(p4, p5)
			-- upvalues: writeFollowing (copy), RequestsModule (upval)
			return writeFollowing(p4, false, RequestsModule.UnfollowUser, p5)
		end,
		clear = function()
			-- upvalues: DataResolverModule (copy), DataResolverModule1 (copy)
			DataResolverModule.clear()
			DataResolverModule1.clear()
		end,
		dispose = function()
			-- upvalues: DataResolverModule (copy), DataResolverModule1 (copy)
			DataResolverModule.dispose()
			DataResolverModule1.dispose()
		end
	}
end