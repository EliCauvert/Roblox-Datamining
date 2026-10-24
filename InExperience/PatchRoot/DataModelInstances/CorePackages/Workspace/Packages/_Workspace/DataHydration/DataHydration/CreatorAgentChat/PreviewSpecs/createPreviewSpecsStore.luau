local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local _ = require(Parent.HttpClient)
local _ = require(Parent.Signals)
local ExperimentOverrideModule = require(script.Parent.Parent.experimentOverride)
local IsEnabled = require(Parent.SharedFlags).FFlagBuildExperienceModelPickerData and ExperimentOverrideModule.isEnabled()
local CreateDataCacheModule = require(DataHydration.createDataCache)
local CreateDataResolverModule = require(DataHydration.createDataResolver)
local _ = require(DataHydration.DataHydrationTypes)
local FetchPreviewSpecsModule = require(script.Parent.fetchPreviewSpecs)
local _ = require(script.Parent.PreviewSpecsTypes)

return function(p1)
	-- upvalues: CreateDataCacheModule (copy), CreateDataResolverModule (copy), FetchPreviewSpecsModule (copy), IsEnabled (copy), Parent (copy)
	local P0 = p1 or {}
	local config = { network = P0.network, baseUrl = P0.baseUrl }
	local DataResolverModule = CreateDataResolverModule({
		supportsMultiGet = false,
		replaceItems = true,
		cache = CreateDataCacheModule(),
		fetchFn = function(_, _)
			-- upvalues: FetchPreviewSpecsModule (upval), config (copy)
			return FetchPreviewSpecsModule(config)
		end
	})
	
	local function SessionScopedSignal(_): string
		return "preview-specs"
	end
	
	if IsEnabled then
		local Count = 0
		SessionScopedSignal = require(Parent.SignalsUtils).createSessionScopedSignal(function(): string
			-- upvalues: Count (ref)
			Count += 1
			
			return `preview-specs:{Count}`
		end)
	end
	return {
		getCachedPreviewSpecs = function(p2)
			-- upvalues: DataResolverModule (copy), SessionScopedSignal (ref)
			return (DataResolverModule.getCachedItem(SessionScopedSignal(p2)))
		end,
		getAndFetchPreviewSpecs = function(p2)
			-- upvalues: DataResolverModule (copy), SessionScopedSignal (ref)
			return (DataResolverModule.getAndFetchItem(SessionScopedSignal(p2)))
		end,
		refreshPreviewSpecs = function()
			-- upvalues: IsEnabled (upval), DataResolverModule (copy), SessionScopedSignal (ref)
			if not IsEnabled then
				DataResolverModule.clear()
			end
			return (DataResolverModule.fetchItem(SessionScopedSignal(false)))
		end,
		clear = DataResolverModule.clear,
		dispose = DataResolverModule.dispose
	}
end