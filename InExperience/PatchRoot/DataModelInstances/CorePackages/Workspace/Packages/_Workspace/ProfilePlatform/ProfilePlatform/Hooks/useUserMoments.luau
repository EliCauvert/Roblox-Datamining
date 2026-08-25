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

return function(p0)
	-- upvalues: reactModule (ref), fFlagMomentsRefreshOwnMomentsAfterPublish (ref), signalsReactModule (ref), momentsGetMomentsUserStoreModule (ref), cryoModule (ref), fFlagMomentsRemoveDeletedFromProfile (ref), getDeletedMomentsStoreModule (ref)
	local var6, var7 = reactModule.useState({})
	local var8, var9 = reactModule.useState(nil)
	local var10, var11 = reactModule.useState(false)
	local var12, var13 = reactModule.useState(false)
	local var14, var15 = reactModule.useState(false)
	reactModule.useEffect(function()
		-- upvalues: p0 (ref), momentsGetMomentsUserStoreModule (copy), var13 (ref), var7 (ref), var9 (ref), var11 (ref)
		local var19 = if p0 ~= nil then nil else tonumber(p0)
		
		if var19 == nil then
			return
		end
		local var20 = false
		momentsGetMomentsUserStoreModule(false).getUserMoments(var19):andThen(function(p1)
			-- upvalues: var20 (write), var13 (copy), var7 (copy), var9 (copy), var11 (copy)
			if not var20 then
				var13(false)
				var7(p1.moments)
				var9(p1.nextCursor)
				var11(p1.nextCursor ~= nil)
			end
		end):catch(function()
			-- upvalues: var20 (write), var13 (copy)
			if not var20 then
				var13(true)
			end
		end)
		
		return function()
			-- upvalues: var20 (write)
			var20 = true
		end
	end, {
		p0,
		if fFlagMomentsRefreshOwnMomentsAfterPublish then signalsReactModule.useSignalState(momentsGetMomentsUserStoreModule(false).getUserMomentsVersion) else 0
	})
	local var16 = reactModule.useCallback(function()
		-- upvalues: p0 (ref), var8 (ref), var10 (ref), var14 (ref), var15 (ref), momentsGetMomentsUserStoreModule (copy), var7 (ref), cryoModule (copy), var11 (ref), var9 (ref)
		local var21 = if p0 ~= nil then nil else tonumber(p0)
		
		if var21 == nil or var8 == nil or (not var10 or var14) then
			return
		end
		var15(true)
		momentsGetMomentsUserStoreModule(false).getUserMoments(var21, var8):andThen(function(p2)
			-- upvalues: var7 (copy), cryoModule (copy), var11 (copy), var8 (copy), var9 (copy)
			var7(function(p3)
				-- upvalues: cryoModule (copy), p2 (ref)
				return cryoModule.List.join(p3, p2.moments)
			end)
			var11(p2.nextCursor ~= nil and p2.nextCursor ~= var8)
			var9(p2.nextCursor)
		end):catch(function() end):finally(function()
			-- upvalues: var15 (copy)
			var15(false)
		end)
	end, { p0, var8, var10, var14 })
	local var17 = var6
	
	if fFlagMomentsRemoveDeletedFromProfile then
		local var18 = signalsReactModule.useSignalState(getDeletedMomentsStoreModule(false).getDeletedIds)
		var17 = reactModule.useMemo(function()
			-- upvalues: var18 (ref), var6 (ref)
			if #var18 == 0 then
				return var6
			end
			local t = {}
			
			for i, v in var6 do
				if not table.find(var18, v.momentId) then
					table.insert(t, v)
				end
			end
			return t
		end, { var6, var18 })
	end
	return {
		moments = var17,
		hasMore = var10,
		hasFailed = var12,
		isLoadingMore = var14,
		loadMore = var16
	}
end