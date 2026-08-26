local parent = script:FindFirstAncestor("ProfilePlatform").Parent
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local signalsReactModule = require(parent.SignalsReact)
local sharedFlagsModule = require(parent.SharedFlags)
local momentsGetMomentsUserStoreModule = require(parent.DataHydration.MomentsGetMomentsUserStore)
local _ = require(parent.DataHydration.MomentsStoreTypes)
local getDeletedMomentsStoreModule = require(parent.Moments.GetDeletedMomentsStore)
local fFlagMomentsRemoveDeletedFromProfile = sharedFlagsModule.FFlagMomentsRemoveDeletedFromProfile
local fFlagMomentsRefreshOwnMomentsAfterPublish = sharedFlagsModule.FFlagMomentsRefreshOwnMomentsAfterPublish

return function(p1)
	-- upvalues: reactModule (ref), fFlagMomentsRefreshOwnMomentsAfterPublish (ref), signalsReactModule (ref), momentsGetMomentsUserStoreModule (ref), cryoModule (ref), fFlagMomentsRemoveDeletedFromProfile (ref), getDeletedMomentsStoreModule (ref)
	local var1, var2 = reactModule.useState({})
	local var3, var4 = reactModule.useState(nil)
	local var5, var6 = reactModule.useState(false)
	local var7, var8 = reactModule.useState(false)
	local var9, var10 = reactModule.useState(false)
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), momentsGetMomentsUserStoreModule (copy), var8 (ref), var2 (ref), var4 (ref), var6 (ref)
		local var11 = if p1 ~= nil then nil else tonumber(p1)
		
		if var11 == nil then
			return
		end
		local var12 = false
		momentsGetMomentsUserStoreModule(false).getUserMoments(var11):andThen(function(p2)
			-- upvalues: var12 (write), var8 (copy), var2 (copy), var4 (copy), var6 (copy)
			if not var12 then
				var8(false)
				var2(p2.moments)
				var4(p2.nextCursor)
				var6(p2.nextCursor ~= nil)
			end
		end):catch(function()
			-- upvalues: var12 (write), var8 (copy)
			if not var12 then
				var8(true)
			end
		end)
		
		return function()
			-- upvalues: var12 (write)
			var12 = true
		end
	end, {
		p1,
		if fFlagMomentsRefreshOwnMomentsAfterPublish then signalsReactModule.useSignalState(momentsGetMomentsUserStoreModule(false).getUserMomentsVersion) else 0
	})
	local var11 = reactModule.useCallback(function()
		-- upvalues: p1 (ref), var3 (ref), var5 (ref), var9 (ref), var10 (ref), momentsGetMomentsUserStoreModule (copy), var2 (ref), cryoModule (copy), var6 (ref), var4 (ref)
		local var12 = if p1 ~= nil then nil else tonumber(p1)
		
		if var12 == nil or var3 == nil or (not var5 or var9) then
			return
		end
		var10(true)
		momentsGetMomentsUserStoreModule(false).getUserMoments(var12, var3):andThen(function(p2)
			-- upvalues: var2 (copy), cryoModule (copy), var6 (copy), var3 (copy), var4 (copy)
			var2(function(p3)
				-- upvalues: cryoModule (copy), p2 (ref)
				return cryoModule.List.join(p3, p2.moments)
			end)
			var6(p2.nextCursor ~= nil and p2.nextCursor ~= var3)
			var4(p2.nextCursor)
		end):catch(function() end):finally(function()
			-- upvalues: var10 (copy)
			var10(false)
		end)
	end, { p1, var3, var5, var9 })
	local var12 = var1
	
	if fFlagMomentsRemoveDeletedFromProfile then
		local var13 = signalsReactModule.useSignalState(getDeletedMomentsStoreModule(false).getDeletedIds)
		var12 = reactModule.useMemo(function()
			-- upvalues: var13 (ref), var1 (ref)
			if #var13 == 0 then
				return var1
			end
			local t = {}
			
			for i, v in var1 do
				if not table.find(var13, v.momentId) then
					table.insert(t, v)
				end
			end
			return t
		end, { var1, var13 })
	end
	return {
		moments = var12,
		hasMore = var5,
		hasFailed = var7,
		isLoadingMore = var9,
		loadMore = var11
	}
end