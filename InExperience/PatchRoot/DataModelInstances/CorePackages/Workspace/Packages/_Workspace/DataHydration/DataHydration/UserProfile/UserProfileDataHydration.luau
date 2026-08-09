local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local createDataCacheModule = require(dataHydration.createDataCache)
local dataHydrationTypesModule = require(dataHydration.DataHydrationTypes)
local _ = require(parent.Signals)
local var3 = createDataCacheModule()
local var4 = nil

local function _() --[[ line: 42 | named "getUserProfileStore" ]]
	-- upvalues: var4 (write), parent (ref)
	if not var4 then
		var4 = require(parent.UserProfiles).Stores.UserProfileStore
	end
	return var4
end

local _ = function(p0) --[[ line: 49 | named "getProfileModel" ]]
	-- upvalues: var4 (write), parent (ref)
	if not var4 then
		var4 = require(parent.UserProfiles).Stores.UserProfileStore
	end
	return var4.get().getProfileByUserId(p0)
end

local function getStatusAndFetch(p1) --[[ line: 53 ]]
	-- upvalues: var3 (ref), var4 (write), parent (ref)
	local item, item_1 = var3.getItem(p1)
	
	if item_1 then
		if not var4 then
			var4 = require(parent.UserProfiles).Stores.UserProfileStore
		end
		var4.get().fetchNamesByUserIds({ p1 }, function(p2) --[[ line: 56 ]]
			-- upvalues: var3 (copy), p1 (ref)
			if p2.status == "success" then
				var3.replaceItem(p1, true)
				
				return
			elseif p2.status == "failed" then
				var3.markItemsAsFailed({ p1 })
			end
		end)
	end
	return item, item_1
end

local function resolveUserProfileField(p3, p4, p5) --[[ line: 67 ]]
	return if p4 == "userId" then tonumber(p3.userId) elseif p4 == "username" then p3.names.getUsername(p5) elseif p4 == "displayName" then p3.names.getDisplayName(p5) elseif p4 == "isVerified" then if p3.getIsVerified == nil then nil else p3.getIsVerified(p5) else nil
end

return {
	resolveField = function(_, p6, p7, p8, _) --[[ line: 80 ]]
		-- upvalues: getStatusAndFetch (ref), dataHydrationTypesModule (ref), var4 (write), parent (ref), resolveUserProfileField (ref)
		if #p6 < 2 then
			return nil, nil
		end
		local var9 = tostring(p7)
		local var10 = getStatusAndFetch(var9).status(p8)
		
		if var10 ~= dataHydrationTypesModule.DataStatus.Ready then
			return nil, var10
		elseif not var4 then
			var4 = require(parent.UserProfiles).Stores.UserProfileStore
		end
		local profileByUserId = var4.get().getProfileByUserId(var9)
		
		if profileByUserId then
			return resolveUserProfileField(profileByUserId, p6[2], p8), var10
		end
		return nil, var10
	end,
	updateFromHydration = function(p9) --[[ line: 108 ]]
		-- upvalues: var4 (write), parent (ref), var3 (ref)
		if not var4 then
			var4 = require(parent.UserProfiles).Stores.UserProfileStore
		end
		var4.get().updateFromHydration(p9)
		local t = {}
		
		for i, v in p9 do
			t[if v.userId ~= nil then i else tostring(v.userId)] = true
		end
		var3.replaceItems(t)
	end
}