local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local CreateDataCacheModule = require(DataHydration.createDataCache)
local CreateDataResolverModule = require(DataHydration.createDataResolver)
local _ = require(DataHydration.DataHydrationTypes)
local CryoModule = require(Parent.Cryo)
local PromiseModule = require(Parent.Promise)
local NewResult = require(Parent.Loggers).Logger:new(script.Name)
local RequestsModule = require(DataHydration.Profile.Requests)
local _ = require(DataHydration.Profile.Enums.ProfileCTAEnums)
local HydratePresenceFromProfileMetadataModule = require(DataHydration.Profile.hydratePresenceFromProfileMetadata)
local FFlagProfileCTAHydratePresenceFromMetadataModule = require(DataHydration.Flags.FFlagProfileCTAHydratePresenceFromMetadata)
local FFlagJoinabilityCTARefactor = require(Parent.SharedFlags).FFlagJoinabilityCTARefactor
game:DefineFastInt("ProfileCTAStoreProcessDelaySec", 1)

local function _()
	return game:GetFastInt("ProfileCTAStoreProcessDelaySec")
end

local ProfileJoinUserActionsProcessDelaySec = game:DefineFastInt("ProfileJoinUserActionsProcessDelaySec", 0)
local list = {
	{ component = "Actions", excludeContextualActions = true }
}
local list1 = { { component = "JoinUserActions" } }

return function(p1)
	-- upvalues: CreateDataCacheModule (copy), FFlagJoinabilityCTARefactor (copy), list (copy), CryoModule (copy), RequestsModule (copy), FFlagProfileCTAHydratePresenceFromMetadataModule (copy), HydratePresenceFromProfileMetadataModule (copy), CreateDataResolverModule (copy), ProfileJoinUserActionsProcessDelaySec (copy), NewResult (copy), list1 (copy), DataHydration (copy), PromiseModule (copy)
	local DataCacheModule = CreateDataCacheModule()
	local DataCacheModule1 = if FFlagJoinabilityCTARefactor then CreateDataCacheModule() else nil
	local Components = if FFlagJoinabilityCTARefactor and p1 and p1.components then p1.components else list
	local Component = if FFlagJoinabilityCTARefactor and Components[1] then Components[1].component else "Actions"
	
	local function fetchComponent(p2, Components, Component, p3)
		-- upvalues: CryoModule (upval), RequestsModule (upval), FFlagProfileCTAHydratePresenceFromMetadataModule (upval), HydratePresenceFromProfileMetadataModule (upval)
		local KeysResult = CryoModule.Dictionary.keys(p2)
		
		return RequestsModule.GetUserProfileCTA(KeysResult, Components):andThen(function(Result)
			-- upvalues: KeysResult (copy), Component (copy), FFlagProfileCTAHydratePresenceFromMetadataModule (upval), p3 (copy), HydratePresenceFromProfileMetadataModule (upval)
			local Components = {}
			
			if Result.responseBody and Result.responseBody.profiles then
				for _, value in KeysResult do
					local Text = tostring(value)
					local Profile = Result.responseBody.profiles[Text]
					Components[Text] = Profile and Profile.components and Profile.components[Component] or {}
					
					if FFlagProfileCTAHydratePresenceFromMetadataModule and p3 then
						HydratePresenceFromProfileMetadataModule(Text, Profile and Profile.metadata)
					end
				end
			end
			return Components
		end)
	end
	
	local DataResolverModule = CreateDataResolverModule({
		requestBatchSize = 25,
		cache = DataCacheModule,
		queueProcessDelaySec = game:GetFastInt("ProfileCTAStoreProcessDelaySec"),
		fetchFn = function(p4)
			-- upvalues: FFlagJoinabilityCTARefactor (upval), fetchComponent (copy), Components (copy), Component (copy), CryoModule (upval), RequestsModule (upval), FFlagProfileCTAHydratePresenceFromMetadataModule (upval), HydratePresenceFromProfileMetadataModule (upval)
			if FFlagJoinabilityCTARefactor then
				return fetchComponent(p4, Components, Component, true)
			else
				local KeysResult = CryoModule.Dictionary.keys(p4)
				
				return RequestsModule.GetUserProfileCTA(KeysResult):andThen(function(Result)
					-- upvalues: KeysResult (copy), FFlagProfileCTAHydratePresenceFromMetadataModule (upval), HydratePresenceFromProfileMetadataModule (upval)
					local t = {}
					
					if Result.responseBody and Result.responseBody.profiles then
						for _, value in KeysResult do
							local Text = tostring(value)
							local Profile = Result.responseBody.profiles[Text]
							t[Text] = Profile and Profile.components and Profile.components.Actions or {}
							
							if FFlagProfileCTAHydratePresenceFromMetadataModule then
								HydratePresenceFromProfileMetadataModule(Text, Profile and Profile.metadata)
							end
						end
					end
					return t
				end):catch(function(_)
					return {}
				end)
			end
		end
	})
	local DataResolverModule1 = if FFlagJoinabilityCTARefactor then CreateDataResolverModule({
		requestBatchSize = 25,
		replaceItems = true,
		cache = DataCacheModule1,
		queueProcessDelaySec = ProfileJoinUserActionsProcessDelaySec,
		logError = function(p5)
			-- upvalues: NewResult (upval)
			NewResult:warning(`Failed to fetch JoinUserActions: {tostring(p5)}`)
		end,
		fetchFn = function(p5)
			-- upvalues: list1 (upval), CryoModule (upval), RequestsModule (upval), FFlagProfileCTAHydratePresenceFromMetadataModule (upval), HydratePresenceFromProfileMetadataModule (upval), DataHydration (upval), PromiseModule (upval)
			local Component = list1[1].component
			local KeysResult = CryoModule.Dictionary.keys(p5)
			local v1 = true
			local JoinUserActionsTelemetryModule = require(DataHydration.Profile.JoinUserActionsTelemetry)
			
			return RequestsModule.GetUserProfileCTA(KeysResult, list1):andThen(function(Result)
				-- upvalues: KeysResult (copy), Component (copy), FFlagProfileCTAHydratePresenceFromMetadataModule (upval), v1 (copy), HydratePresenceFromProfileMetadataModule (upval)
				local Components = {}
				
				if Result.responseBody and Result.responseBody.profiles then
					for _, value in KeysResult do
						local Text = tostring(value)
						local Profile = Result.responseBody.profiles[Text]
						Components[Text] = Profile and Profile.components and Profile.components[Component] or {}
						
						if FFlagProfileCTAHydratePresenceFromMetadataModule and v1 then
							HydratePresenceFromProfileMetadataModule(Text, Profile and Profile.metadata)
						end
					end
				end
				return Components
			end):andThen(function(Result)
				-- upvalues: JoinUserActionsTelemetryModule (copy)
				JoinUserActionsTelemetryModule.logFetchResult("Success")
				
				return Result
			end):catch(function(Err)
				-- upvalues: JoinUserActionsTelemetryModule (copy), PromiseModule (upval)
				JoinUserActionsTelemetryModule.logFetchResult("Failed")
				
				return PromiseModule.reject(Err)
			end)
		end
	}) else nil
	
	return {
		getCTA = function(p6, Enabled)
			-- upvalues: DataResolverModule (copy)
			local v2: ((any) -> any)? = nil
			
			if Enabled ~= nil then
				local IsEnabled = Enabled == true
				
				v2 = function(_)
					-- upvalues: IsEnabled (copy)
					return IsEnabled
				end
			end
			return DataResolverModule.getAndFetchItem(p6, v2)
		end,
		getBatchCTAs = function(p6, p7)
			-- upvalues: DataResolverModule (copy)
			local v2: ((any) -> boolean)? = nil
			
			if p7 then
				local Count = 0
				
				v2 = function(_): boolean
					-- upvalues: Count (ref), p6 (copy), p7 (copy)
					Count += 1
					local v3 = p6[Count]
					
					return if v3 then p7[v3] == true else false
				end
			end
			return DataResolverModule.getAndFetchItems(p6, v2)
		end,
		getJoinUserActions = if FFlagJoinabilityCTARefactor then function(p6, Enabled)
			-- upvalues: DataResolverModule1 (copy)
			local v2: ((any) -> any)? = nil
			
			if Enabled ~= nil then
				local IsEnabled = Enabled == true
				
				v2 = function(_)
					-- upvalues: IsEnabled (copy)
					return IsEnabled
				end
			end
			return DataResolverModule1.getAndFetchItem(p6, v2)
		end else nil,
		clear = function()
			-- upvalues: DataCacheModule (copy), DataResolverModule (copy), FFlagJoinabilityCTARefactor (upval), DataCacheModule1 (copy), DataResolverModule1 (copy)
			DataCacheModule.clear()
			DataResolverModule.clear()
			
			if FFlagJoinabilityCTARefactor then
				DataCacheModule1.clear()
				DataResolverModule1.clear()
			end
		end,
		dispose = function()
			-- upvalues: DataResolverModule (copy), FFlagJoinabilityCTARefactor (upval), DataResolverModule1 (copy)
			DataResolverModule.dispose()
			
			if FFlagJoinabilityCTARefactor then
				DataResolverModule1.dispose()
			end
		end
	}
end