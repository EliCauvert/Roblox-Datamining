local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local DataHydrationTypesModule = require(DataHydration.DataHydrationTypes)
local SignalsModule = require(Parent.Signals)
local GetLocalPlayerUserIdFunction = require(DataHydration.DataHydrationUtils).getLocalPlayerUserId
local v1 = require(DataHydration.createDataCache)()
local Tbl = {}
local LocalPlayerUserId = GetLocalPlayerUserIdFunction()
game:GetService("Players"):GetPropertyChangedSignal("LocalPlayer"):Connect(function() --[[ Line: 64 ]]
	-- upvalues: GetLocalPlayerUserIdFunction (copy), LocalPlayerUserId (ref), Tbl (copy)
	local LocalPlayerUserId1 = GetLocalPlayerUserIdFunction()
	
	if LocalPlayerUserId1 ~= LocalPlayerUserId then
		LocalPlayerUserId = LocalPlayerUserId1
		table.clear(Tbl)
	end
end)
local UserProfileStore = nil

local function _() --[[ Line: 73 | Named "getUserProfileStore" ]]
	-- upvalues: UserProfileStore (ref), Parent (copy)
	if not UserProfileStore then
		UserProfileStore = require(Parent.UserProfiles.Stores).UserProfileStore
	end
	return UserProfileStore
end

local _ = function(p1) --[[ Line: 80 | Named "getProfileModel" ]]
	-- upvalues: UserProfileStore (ref), Parent (copy)
	if not UserProfileStore then
		UserProfileStore = require(Parent.UserProfiles.Stores).UserProfileStore
	end
	return (UserProfileStore.get().getProfileByUserId(p1))
end

local function getStatusAndFetch(p1) --[[ Line: 84 ]]
	-- upvalues: v1 (copy), UserProfileStore (ref), Parent (copy)
	local Item, Item2 = v1.getItem(p1)
	
	if Item2 then
		if not UserProfileStore then
			UserProfileStore = require(Parent.UserProfiles.Stores).UserProfileStore
		end
		UserProfileStore.get().fetchNamesByUserIds({ p1 }, function(p2) --[[ Line: 87 ]]
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

local function resolveUserProfileField(ProfileByUserId, p1, p2) --[[ Line: 98 ]]
	return if p1 == "userId" then tonumber(ProfileByUserId.userId) elseif p1 == "username" then ProfileByUserId.names.getUsername(p2) elseif p1 == "displayName" then ProfileByUserId.names.getDisplayName(p2) elseif p1 == "isVerified" then if ProfileByUserId.getIsVerified == nil then nil else ProfileByUserId.getIsVerified(p2) else nil
end

return {
	resolveField = function(_, Entry, p1, p2, _) --[[ Line: 111 ]]
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
			UserProfileStore = require(Parent.UserProfiles.Stores).UserProfileStore
		end
		local ProfileByUserId = UserProfileStore.get().getProfileByUserId(Text)
		
		if ProfileByUserId then
			return resolveUserProfileField(ProfileByUserId, Entry[2], p2), StatusResult
		else
			return nil, StatusResult
		end
	end,
	updateFromHydration = function(List) --[[ Line: 178 ]]
		-- upvalues: UserProfileStore (ref), Parent (copy), v1 (copy)
		if not UserProfileStore then
			UserProfileStore = require(Parent.UserProfiles.Stores).UserProfileStore
		end
		UserProfileStore.get().updateFromHydration(List)
		local t = {}
		
		for i, value in List do
			t[if value.userId == nil then i else tostring(value.userId)] = true
		end
		v1.replaceItems(t)
	end,
	getAndFetchUserInfo = function(p1) --[[ Line: 143 ]]
		-- upvalues: Tbl (copy), SignalsModule (copy), getStatusAndFetch (copy), DataHydrationTypesModule (copy), UserProfileStore (ref), Parent (copy)
		local Text = tostring(p1)
		local Entry = Tbl[Text]
		
		if Entry == nil then
			local Computed = SignalsModule.createComputed(function(p2) --[[ Line: 150 ]]
				-- upvalues: getStatusAndFetch (upval), Text (copy)
				return getStatusAndFetch(Text).status(p2)
			end)
			local config = {
				info = SignalsModule.createComputed(function(p2) --[[ Line: 155 ]]
					-- upvalues: Computed (copy), DataHydrationTypesModule (upval), Text (copy), UserProfileStore (upval), Parent (upval)
					if Computed(p2) ~= DataHydrationTypesModule.DataStatus.Ready then
						return nil
					end
					if not UserProfileStore then
						UserProfileStore = require(Parent.UserProfiles.Stores).UserProfileStore
					end
					local ProfileByUserId = UserProfileStore.get().getProfileByUserId(Text)
					
					return if ProfileByUserId == nil then nil else {
						userId = tonumber(Text),
						displayName = ProfileByUserId.names.getDisplayName(p2),
						username = ProfileByUserId.names.getUsername(p2),
						hasVerifiedBadge = ProfileByUserId.getIsVerified ~= nil and ProfileByUserId.getIsVerified(p2)
					}
				end),
				status = Computed
			}
			Tbl[Text] = config
			
			return config
		else
			return Entry
		end
	end
}