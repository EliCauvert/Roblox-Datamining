local DataHydration = script:FindFirstAncestor("DataHydration")
local CreateDataCacheModule = require(DataHydration.createDataCache)
local CreateDataResolverModule = require(DataHydration.createDataResolver)
local _ = require(DataHydration.DataHydrationTypes)
local CryoModule = require(DataHydration.Parent.Cryo)
local RequestsModule = require(DataHydration.Profile.Requests)
local _ = require(DataHydration.Profile.Enums.ProfileCTAEnums)
game:DefineFastInt("ProfileCTAStoreProcessDelaySec", 1)

local function _()
	return game:GetFastInt("ProfileCTAStoreProcessDelaySec")
end

return function()
	-- upvalues: CreateDataCacheModule (copy), CreateDataResolverModule (copy), CryoModule (copy), RequestsModule (copy)
	local DataCacheModule = CreateDataCacheModule()
	local DataResolverModule = CreateDataResolverModule({
		requestBatchSize = 25,
		cache = DataCacheModule,
		queueProcessDelaySec = game:GetFastInt("ProfileCTAStoreProcessDelaySec"),
		fetchFn = function(p1)
			-- upvalues: CryoModule (upval), RequestsModule (upval)
			local KeysResult = CryoModule.Dictionary.keys(p1)
			
			return RequestsModule.GetUserProfileCTA(KeysResult):andThen(function(Result)
				-- upvalues: KeysResult (copy)
				local t = {}
				
				if Result.responseBody and Result.responseBody.profiles then
					for _, value in KeysResult do
						local Text = tostring(value)
						local Profile = Result.responseBody.profiles[Text]
						t[Text] = Profile and Profile.components and Profile.components.Actions or {}
					end
				end
				return t
			end):catch(function(_)
				return {}
			end)
		end
	})
	
	return {
		getCTA = function(p2, Enabled)
			-- upvalues: DataResolverModule (copy)
			local v1: ((any) -> any)? = nil
			
			if Enabled ~= nil then
				local IsEnabled = Enabled == true
				
				v1 = function(_)
					-- upvalues: IsEnabled (copy)
					return IsEnabled
				end
			end
			return DataResolverModule.getAndFetchItem(p2, v1)
		end,
		getBatchCTAs = function(p2, p3)
			-- upvalues: DataResolverModule (copy)
			local v1: ((any) -> boolean)? = nil
			
			if p3 then
				local Count = 0
				
				v1 = function(_): boolean
					-- upvalues: Count (ref), p2 (copy), p3 (copy)
					Count += 1
					local v2 = p2[Count]
					
					return if v2 then p3[v2] == true else false
				end
			end
			return DataResolverModule.getAndFetchItems(p2, v1)
		end,
		clear = function()
			-- upvalues: DataCacheModule (copy), DataResolverModule (copy)
			DataCacheModule.clear()
			DataResolverModule.clear()
		end,
		dispose = function()
			-- upvalues: DataResolverModule (copy)
			DataResolverModule.dispose()
		end
	}
end