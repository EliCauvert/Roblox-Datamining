local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local DataHydrationTypesModule = require(DataHydration.DataHydrationTypes)
local _ = require(Parent.Signals)
local v1 = require(DataHydration.createDataCache)()
local UserProfileStore = nil

local function _()
	-- upvalues: UserProfileStore (ref), Parent (copy)
	if not UserProfileStore then
		UserProfileStore = require(Parent.UserProfiles).Stores.UserProfileStore
	end
	return UserProfileStore
end

local _ = function(p1)
	-- upvalues: UserProfileStore (ref), Parent (copy)
	if not UserProfileStore then
		UserProfileStore = require(Parent.UserProfiles).Stores.UserProfileStore
	end
	return (UserProfileStore.get().getProfileByUserId(p1))
end

local function getStatusAndFetch(p1)
	-- upvalues: v1 (copy), UserProfileStore (ref), Parent (copy)
	local Item, Item2 = v1.getItem(p1)
	
	if Item2 then
		if not UserProfileStore then
			UserProfileStore = require(Parent.UserProfiles).Stores.UserProfileStore
		end
		UserProfileStore.get().fetchNamesByUserIds({ p1 }, function(p2)
			-- upvalues: v1 (upval), p1 (copy)
			if p2.status == "success" then
				v1.replaceItem(p1, true)
				
				return
			end
			if p2.status == "failed" then
				v1.markItemsAsFailed({ p1 })
			end
		end)
	end
	return Item, Item2
end

local function resolveUserProfileField(ProfileByUserId, p1, p2)
	return if p1 == "userId" then tonumber(ProfileByUserId.userId) elseif p1 == "username" then ProfileByUserId.names.getUsername(p2) elseif p1 == "displayName" then ProfileByUserId.names.getDisplayName(p2) elseif p1 == "isVerified" then if ProfileByUserId.getIsVerified == nil then nil else ProfileByUserId.getIsVerified(p2) else nil
end

return {
	resolveField = function(_, Entry, p1, p2, _)
		-- upvalues: getStatusAndFetch (copy), DataHydrationTypesModule (copy), UserProfileStore (ref), Parent (copy), resolveUserProfileField (copy)
		if #Entry < 2 then
			return nil, nil
		end
		local Text = tostring(p1)
		local StatusResult = getStatusAndFetch(Text).status(p2)
		
		if StatusResult ~= DataHydrationTypesModule.DataStatus.Ready then
			return nil, StatusResult
		end
		if not UserProfileStore then
			UserProfileStore = require(Parent.UserProfiles).Stores.UserProfileStore
		end
		local ProfileByUserId = UserProfileStore.get().getProfileByUserId(Text)
		
		if ProfileByUserId then
			return resolveUserProfileField(ProfileByUserId, Entry[2], p2), StatusResult
		else
			return nil, StatusResult
		end
	end,
	updateFromHydration = function(List)
		-- upvalues: UserProfileStore (ref), Parent (copy), v1 (copy)
		if not UserProfileStore then
			UserProfileStore = require(Parent.UserProfiles).Stores.UserProfileStore
		end
		UserProfileStore.get().updateFromHydration(List)
		local t = {}
		
		for i, value in List do
			t[if value.userId == nil then i else tostring(value.userId)] = true
		end
		v1.replaceItems(t)
	end
}