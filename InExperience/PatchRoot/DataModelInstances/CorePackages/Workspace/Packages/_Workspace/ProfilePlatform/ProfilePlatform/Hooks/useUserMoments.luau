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
local fFlagMomentsOptimisticProfilePending = sharedFlagsModule.FFlagMomentsOptimisticProfilePending
local fFlagMomentsRefreshProfileOnPostStatus = sharedFlagsModule.FFlagMomentsRefreshProfileOnPostStatus

return function(p1, p2)
	-- upvalues: reactModule (ref), fFlagMomentsRefreshProfileOnPostStatus (ref), fFlagMomentsOptimisticProfilePending (ref), useLocalUserId (ref), fFlagMomentsRefreshOwnMomentsAfterPublish (ref), signalsReactModule (ref), momentsGetMomentsUserStoreModule (ref), var1 (write), cryoModule (ref), fFlagMomentsRemoveDeletedFromProfile (ref), getDeletedMomentsStoreModule (ref)
	local var2, var3 = reactModule.useState({})
	local var4, var5 = reactModule.useState(nil)
	local var6, var7 = reactModule.useState(false)
	local var8, var9 = reactModule.useState(false)
	local var10, var11 = reactModule.useState(false)
	local var12 = reactModule.useRef(nil)
	local var13 = if fFlagMomentsRefreshProfileOnPostStatus or fFlagMomentsOptimisticProfilePending then useLocalUserId() else nil
	local var14 = var13 ~= nil and tostring(var13) == p1
	local var15 = if fFlagMomentsOptimisticProfilePending then signalsReactModule.useSignalState(momentsGetMomentsUserStoreModule(false).getPendingUserMoments) else {}
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), momentsGetMomentsUserStoreModule (copy), fFlagMomentsRefreshProfileOnPostStatus (copy), fFlagMomentsOptimisticProfilePending (copy), var12 (ref), var14 (ref), var9 (ref), var3 (ref), var5 (ref), var7 (ref)
		local var16 = if p1 ~= nil then nil else tonumber(p1)
		
		if var16 == nil then return end
		local var17 = momentsGetMomentsUserStoreModule(false)
		
		if (fFlagMomentsRefreshProfileOnPostStatus or fFlagMomentsOptimisticProfilePending) and var12.current ~= p1 then
			var12.current = p1
			
			if var14 then
				var17.evictUserMoments(var16)
			end
		end
		local var18 = false
		var17.getUserMoments(var16):andThen(function(p3)
			-- upvalues: var18 (write), var9 (copy), var3 (copy), var5 (copy), var7 (copy)
			if not var18 then
				var9(false)
				var3(p3.moments)
				var5(p3.nextCursor)
				var7(p3.nextCursor ~= nil)
			end
		end):catch(function()
			-- upvalues: var18 (write), var9 (copy)
			if not var18 then
				var9(true)
			end
		end)
		
		return function()
			-- upvalues: var18 (write)
			var18 = true
		end
	end, {
		p1,
		if fFlagMomentsRefreshOwnMomentsAfterPublish or fFlagMomentsRefreshProfileOnPostStatus or fFlagMomentsOptimisticProfilePending then signalsReactModule.useSignalState(momentsGetMomentsUserStoreModule(false).getUserMomentsVersion) else 0,
		var14
	})
	
	if fFlagMomentsRefreshProfileOnPostStatus or fFlagMomentsOptimisticProfilePending then
		reactModule.useEffect(function()
			-- upvalues: var14 (ref), p2 (ref), var1 (copy), p1 (ref), momentsGetMomentsUserStoreModule (copy)
			if not var14 then return end
			local p3 = p2 or var1
			
			if p3 == nil then
				return
			end
			local onUnhideConnection = p3.OnUnhide:Connect(function()
				-- upvalues: p1 (copy), momentsGetMomentsUserStoreModule (copy)
				local var16 = if p1 ~= nil then nil else tonumber(p1)
				
				if var16 ~= nil then
					momentsGetMomentsUserStoreModule(false).invalidateUser(var16)
				end
			end)
			
			return function()
				-- upvalues: onUnhideConnection (ref)
				onUnhideConnection:Disconnect()
			end
		end, { p1, p2, var14 })
	end
	local var16 = reactModule.useCallback(function()
		-- upvalues: p1 (ref), var4 (ref), var6 (ref), var10 (ref), var11 (ref), momentsGetMomentsUserStoreModule (copy), var3 (ref), cryoModule (copy), var7 (ref), var5 (ref)
		local var17 = if p1 ~= nil then nil else tonumber(p1)
		
		if var17 == nil or var4 == nil or (not var6 or var10) then
			return
		end
		var11(true)
		momentsGetMomentsUserStoreModule(false).getUserMoments(var17, var4):andThen(function(p3)
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
	local var17 = var2
	local var18 = nil
	
	if fFlagMomentsRemoveDeletedFromProfile or fFlagMomentsOptimisticProfilePending then
		var18 = signalsReactModule.useSignalState(getDeletedMomentsStoreModule(false).getDeletedIds)
		local var19 = var18
		var17 = reactModule.useMemo(function()
			-- upvalues: var19 (ref), var2 (ref)
			if #var19 == 0 then
				return var2
			end
			local t = {}
			
			for i, v in var2 do
				if not table.find(var19, v.momentId) then
					table.insert(t, v)
				end
			end
			return t
		end, { var2, var19 })
	end
	if fFlagMomentsOptimisticProfilePending then
		local var20 = if p1 ~= nil then nil else tonumber(p1)
		local var21, var22 = reactModule.useState({})
		local var23 = reactModule.useMemo(function()
			-- upvalues: var20 (ref), var15 (ref), var2 (ref), var18 (write)
			local var24 = if var20 ~= nil then {} else var15[var20] or {}
			local t = {}
			local t_1 = {}
			
			for i, v in var2 do
				t_1[v.momentId] = true
				local feedItemId = v.recommendationMetadata.feedItemId
				
				if feedItemId ~= nil and feedItemId ~= "" then
					t_1[feedItemId] = true
				end
			end
			for i, v_1 in var24 do
				local publishedMoment = v_1.publishedMoment
				
				if publishedMoment ~= nil then
					local feedItemId = publishedMoment.recommendationMetadata.feedItemId
					
					if t_1[publishedMoment.momentId] or feedItemId ~= nil and t_1[feedItemId] or var18 ~= nil and table.find(var18, publishedMoment.momentId) ~= nil then
						t[v_1.moment.momentId] = true
					end
				end
			end
			return t
		end, { var20, var2, var15, var18 })
		reactModule.useEffect(function()
			-- upvalues: var22 (ref), var23 (ref)
			var22(function(p3)
				-- upvalues: var23 (copy)
				local cloned = table.clone(p3)
				local var25 = false
				
				for i in var23 do
					if not cloned[i] then
						cloned[i] = true
						var25 = true
					end
				end
				return if var25 then cloned else p3
			end)
		end, { var23 })
		local var25 = if var20 ~= nil then nil else var15[var20]
		
		if var25 ~= nil and #var25 > 0 then
			local t = {}
			
			for i, v in var25 do
				local moment = v.moment
				
				if not var23[moment.momentId] and not var21[moment.momentId] then
					table.insert(t, moment)
				end
			end
			if #t > 0 then
				var17 = cryoModule.List.join(t, var17)
			end
		end
	end
	return {
		moments = var17,
		hasMore = var6,
		hasFailed = var8,
		isLoadingMore = var10,
		loadMore = var16
	}
end