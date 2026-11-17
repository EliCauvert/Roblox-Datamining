local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local PromiseModule = require(Parent.Promise)
local SignalsModule = require(Parent.Signals)
local FFlagEnableGroupSidebarSdui = require(Parent.SharedFlags).FFlagEnableGroupSidebarSdui
local CreateDataCacheModule = require(DataHydration.createDataCache)
local _ = require(DataHydration.DataHydrationTypes)
local _ = require(script.Parent.GroupInfoStoreTypes)
local CreateDataResolverModule = require(DataHydration.createDataResolver)

return function()
	-- upvalues: CreateDataCacheModule (copy), CreateDataResolverModule (copy), PromiseModule (copy), FFlagEnableGroupSidebarSdui (copy), SignalsModule (copy)
	local DataCacheModule = CreateDataCacheModule()
	local DataResolverModule = CreateDataResolverModule({
		cache = DataCacheModule,
		fetchFn = function(_)
			-- upvalues: PromiseModule (upval)
			return PromiseModule.resolve({})
		end
	})
	local Callback1 = nil
	local Callback = nil
	
	if FFlagEnableGroupSidebarSdui then
		Callback1, Callback = SignalsModule.createSignal(0)
	end
	local function notifyMembershipChanged()
		-- upvalues: Callback (ref), Callback1 (ref)
		Callback(Callback1(false) + 1)
	end
	
	return {
		getGroupInfo = DataResolverModule.getCachedItem,
		getGroupInfos = DataResolverModule.getCachedItems,
		updateGroupInfo = DataCacheModule.updateItem,
		updateGroupInfos = DataCacheModule.updateItems,
		membershipChangeCount = if FFlagEnableGroupSidebarSdui then Callback1 else nil,
		notifyMembershipChanged = if FFlagEnableGroupSidebarSdui then notifyMembershipChanged else nil,
		clear = DataResolverModule.clear,
		dispose = DataResolverModule.dispose
	}
end