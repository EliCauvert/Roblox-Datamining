local parent = script:FindFirstAncestor("ProfilePlatform").Parent
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local momentsGetMomentsUserStoreModule = require(parent.DataHydration.MomentsGetMomentsUserStore)
local _ = require(parent.DataHydration.MomentsStoreTypes)

return function(p0) --[[ line: 21 | named "useUserMoments" ]]
	-- upvalues: reactModule (ref), momentsGetMomentsUserStoreModule (ref), cryoModule (ref)
	local var3, var4 = reactModule.useState({})
	local var5, var6 = reactModule.useState(nil)
	local var7, var8 = reactModule.useState(false)
	local var9, var10 = reactModule.useState(false)
	local var11, var12 = reactModule.useState(false)
	reactModule.useEffect(function() --[[ line: 28 ]]
		-- upvalues: p0 (ref), momentsGetMomentsUserStoreModule (copy), var10 (ref), var4 (ref), var6 (ref), var8 (ref)
		local var13 = if p0 ~= nil then nil else tonumber(p0)
		
		if var13 == nil then
			return
		end
		local var14 = false
		momentsGetMomentsUserStoreModule(false).getUserMoments(var13):andThen(function(p1) --[[ line: 36 ]]
			-- upvalues: var14 (write), var10 (copy), var4 (copy), var6 (copy), var8 (copy)
			if not var14 then
				var10(false)
				var4(p1.moments)
				var6(p1.nextCursor)
				var8(p1.nextCursor ~= nil)
			end
		end):catch(function() --[[ line: 44 ]]
			-- upvalues: var14 (write), var10 (copy)
			if not var14 then
				var10(true)
			end
		end)
		
		return function() --[[ line: 49 ]]
			-- upvalues: var14 (write)
			var14 = true
		end
	end, { p0 })
	
	return {
		moments = var3,
		hasMore = var7,
		hasFailed = var9,
		isLoadingMore = var11,
		loadMore = reactModule.useCallback(function() --[[ line: 54 ]]
			-- upvalues: p0 (ref), var5 (ref), var7 (ref), var11 (ref), var12 (ref), momentsGetMomentsUserStoreModule (copy), var4 (ref), cryoModule (copy), var8 (ref), var6 (ref)
			local var15 = if p0 ~= nil then nil else tonumber(p0)
			
			if var15 == nil or var5 == nil or (not var7 or var11) then
				return
			end
			var12(true)
			momentsGetMomentsUserStoreModule(false).getUserMoments(var15, var5):andThen(function(p2) --[[ line: 62 ]]
				-- upvalues: var4 (copy), cryoModule (copy), var8 (copy), var5 (copy), var6 (copy)
				var4(function(p3) --[[ line: 63 ]]
					-- upvalues: cryoModule (copy), p2 (ref)
					return cryoModule.List.join(p3, p2.moments)
				end)
				var8(p2.nextCursor ~= nil and p2.nextCursor ~= var5)
				var6(p2.nextCursor)
			end):catch(function() --[[ line: 70 ]] end):finally(function() --[[ line: 71 ]]
				-- upvalues: var12 (copy)
				var12(false)
			end)
		end, { p0, var5, var7, var11 })
	}
end