local parent = script:FindFirstAncestor("ProfilePlatform").Parent
local var1 = nil
pcall(function()
	-- upvalues: var1 (write)
	var1 = game:GetService("AppLifecycleObserverService")
end)
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local signalsReactModule = require(parent.SignalsReact)
local sharedFlagsModule = require(parent.SharedFlags)
local useLocalUserId = require(parent.RobloxAppHooks).useLocalUserId
local momentsGetMomentsUserStoreModule = require(parent.DataHydration.MomentsGetMomentsUserStore)
local _ = require(parent.DataHydration.MomentsStoreTypes)
local getDeletedMomentsStoreModule = require(parent.Moments.GetDeletedMomentsStore)
local fFlagMomentsRemoveDeletedFromProfile = sharedFlagsModule.FFlagMomentsRemoveDeletedFromProfile
local fFlagMomentsRefreshOwnMomentsAfterPublish = sharedFlagsModule.FFlagMomentsRefreshOwnMomentsAfterPublish
local fFlagMomentsRefreshProfileOnPostStatus = sharedFlagsModule.FFlagMomentsRefreshProfileOnPostStatus

return function(p1, p2)
	-- upvalues: reactModule (ref), fFlagMomentsRefreshProfileOnPostStatus (ref), useLocalUserId (ref), fFlagMomentsRefreshOwnMomentsAfterPublish (ref), signalsReactModule (ref), momentsGetMomentsUserStoreModule (ref), var1 (write), cryoModule (ref), fFlagMomentsRemoveDeletedFromProfile (ref), getDeletedMomentsStoreModule (ref)
	local var2, var3 = reactModule.useState({})
	local var4, var5 = reactModule.useState(nil)
	local var6, var7 = reactModule.useState(false)
	local var8, var9 = reactModule.useState(false)
	local var10, var11 = reactModule.useState(false)
	local var12 = reactModule.useRef(nil)
	local var13 = if fFlagMomentsRefreshProfileOnPostStatus then useLocalUserId() else nil
	local var14 = var13 ~= nil and tostring(var13) == p1
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), momentsGetMomentsUserStoreModule (copy), fFlagMomentsRefreshProfileOnPostStatus (copy), var12 (ref), var14 (ref), var9 (ref), var3 (ref), var5 (ref), var7 (ref)
		local var15 = if p1 ~= nil then nil else tonumber(p1)
		
		if var15 == nil then return end
		local var16 = momentsGetMomentsUserStoreModule(false)
		
		if fFlagMomentsRefreshProfileOnPostStatus and var12.current ~= p1 then
			var12.current = p1
			
			if var14 then
				var16.evictUserMoments(var15)
			end
		end
		local var17 = false
		var16.getUserMoments(var15):andThen(function(p3)
			-- upvalues: var17 (write), var9 (copy), var3 (copy), var5 (copy), var7 (copy)
			if not var17 then
				var9(false)
				var3(p3.moments)
				var5(p3.nextCursor)
				var7(p3.nextCursor ~= nil)
			end
		end):catch(function()
			-- upvalues: var17 (write), var9 (copy)
			if not var17 then
				var9(true)
			end
		end)
		
		return function()
			-- upvalues: var17 (write)
			var17 = true
		end
	end, {
		p1,
		if fFlagMomentsRefreshOwnMomentsAfterPublish or fFlagMomentsRefreshProfileOnPostStatus then signalsReactModule.useSignalState(momentsGetMomentsUserStoreModule(false).getUserMomentsVersion) else 0,
		var14
	})
	
	if fFlagMomentsRefreshProfileOnPostStatus then
		reactModule.useEffect(function()
			-- upvalues: var14 (ref), p2 (ref), var1 (copy), p1 (ref), momentsGetMomentsUserStoreModule (copy)
			if not var14 then return end
			local p3 = p2 or var1
			
			if p3 == nil then
				return
			end
			local onUnhideConnection = p3.OnUnhide:Connect(function()
				-- upvalues: p1 (copy), momentsGetMomentsUserStoreModule (copy)
				local var15 = if p1 ~= nil then nil else tonumber(p1)
				
				if var15 ~= nil then
					momentsGetMomentsUserStoreModule(false).invalidateUser(var15)
				end
			end)
			
			return function()
				-- upvalues: onUnhideConnection (ref)
				onUnhideConnection:Disconnect()
			end
		end, { p1, p2, var14 })
	end
	local var15 = reactModule.useCallback(function()
		-- upvalues: p1 (ref), var4 (ref), var6 (ref), var10 (ref), var11 (ref), momentsGetMomentsUserStoreModule (copy), var3 (ref), cryoModule (copy), var7 (ref), var5 (ref)
		local var16 = if p1 ~= nil then nil else tonumber(p1)
		
		if var16 == nil or var4 == nil or (not var6 or var10) then
			return
		end
		var11(true)
		momentsGetMomentsUserStoreModule(false).getUserMoments(var16, var4):andThen(function(p3)
			-- upvalues: var3 (copy), cryoModule (copy), var7 (copy), var4 (copy), var5 (copy)
			var3(function(p4)
				-- upvalues: cryoModule (copy), p3 (ref)
				return cryoModule.List.join(p4, p3.moments)
			end)
			var7(p3.nextCursor ~= nil and p3.nextCursor ~= var4)
			var5(p3.nextCursor)
		end):catch(function() end):finally(function()
			-- upvalues: var11 (copy)
			var11(false)
		end)
	end, { p1, var4, var6, var10 })
	local var16 = var2
	
	if fFlagMomentsRemoveDeletedFromProfile then
		local var17 = signalsReactModule.useSignalState(getDeletedMomentsStoreModule(false).getDeletedIds)
		var16 = reactModule.useMemo(function()
			-- upvalues: var17 (ref), var2 (ref)
			if #var17 == 0 then
				return var2
			end
			local t = {}
			
			for i, v in var2 do
				if not table.find(var17, v.momentId) then
					table.insert(t, v)
				end
			end
			return t
		end, { var2, var17 })
	end
	return {
		moments = var16,
		hasMore = var6,
		hasFailed = var8,
		isLoadingMore = var10,
		loadMore = var15
	}
end