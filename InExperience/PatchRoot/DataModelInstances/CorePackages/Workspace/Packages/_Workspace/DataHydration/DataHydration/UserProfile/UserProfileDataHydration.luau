local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local CreateDataCacheModule = require(DataHydration.createDataCache)
local DataHydrationTypesModule = require(DataHydration.DataHydrationTypes)
local SignalsModule = require(Parent.Signals)
local GetLocalPlayerUserIdFunction = require(DataHydration.DataHydrationUtils).getLocalPlayerUserId
local ObserveLocalPlayerUserIdFunction = require(DataHydration.DataHydrationUtils).observeLocalPlayerUserId
local UserProfileNamesRetryCount = game:DefineFastInt("UserProfileNamesRetryCount", 3)
local DataCacheModule = CreateDataCacheModule()
local Tbl = {}
local LocalPlayerUserId = GetLocalPlayerUserIdFunction()
game:GetService("Players"):GetPropertyChangedSignal("LocalPlayer"):Connect(function()
	-- upvalues: GetLocalPlayerUserIdFunction (copy), LocalPlayerUserId (ref), Tbl (copy)
	local LocalPlayerUserId1 = GetLocalPlayerUserIdFunction()
	
	if LocalPlayerUserId1 ~= LocalPlayerUserId then
		LocalPlayerUserId = LocalPlayerUserId1
		table.clear(Tbl)
	end
end)
local v1 = nil
local Tbl1 = {}
local Tbl2 = {}
local Count = 0

local function getNamesStatusCache()
	-- upvalues: v1 (ref), CreateDataCacheModule (copy), ObserveLocalPlayerUserIdFunction (copy), Count (ref), Tbl1 (copy), Tbl2 (copy)
	if v1 == nil then
		local DataCacheModule = CreateDataCacheModule(nil, nil, { observeLocalUser = false })
		v1 = DataCacheModule
		ObserveLocalPlayerUserIdFunction(function()
			-- upvalues: Count (upval), Tbl1 (upval), Tbl2 (upval), DataCacheModule (copy)
			Count += 1
			table.clear(Tbl1)
			table.clear(Tbl2)
			DataCacheModule.clear()
		end)
	end
	return v1
end

local UserProfileStore = nil

local function _()
	-- upvalues: UserProfileStore (ref), Parent (copy)
	if not UserProfileStore then
		UserProfileStore = require(Parent.UserProfiles.Stores).UserProfileStore
	end
	return UserProfileStore
end

local _ = function(p1)
	-- upvalues: UserProfileStore (ref), Parent (copy)
	if not UserProfileStore then
		UserProfileStore = require(Parent.UserProfiles.Stores).UserProfileStore
	end
	return (UserProfileStore.get().getProfileByUserId(p1))
end

local function getStatusAndFetch(p1)
	-- upvalues: DataCacheModule (copy), UserProfileStore (ref), Parent (copy)
	local Item, Item2 = DataCacheModule.getItem(p1)
	
	if Item2 then
		if not UserProfileStore then
			UserProfileStore = require(Parent.UserProfiles.Stores).UserProfileStore
		end
		UserProfileStore.get().fetchNamesByUserIds({ p1 }, function(p2)
			-- upvalues: DataCacheModule (upval), p1 (copy)
			if p2.status == "success" then
				DataCacheModule.replaceItem(p1, true)
				
				return
			end
			if p2.status == "failed" then
				DataCacheModule.markItemsAsFailed({ p1 })
			end
		end)
	end
	return Item, Item2
end

local function resolveUserProfileField(ProfileByUserId, p1, p2)
	return if p1 == "userId" then tonumber(ProfileByUserId.userId) elseif p1 == "username" then ProfileByUserId.names.getUsername(p2) elseif p1 == "displayName" then ProfileByUserId.names.getDisplayName(p2) elseif p1 == "isVerified" then if ProfileByUserId.getIsVerified == nil then nil else ProfileByUserId.getIsVerified(p2) else nil
end

local function fetchNamesWithRetries(Key, p1, Count1)
	-- upvalues: Count (ref), Tbl2 (copy), UserProfileStore (ref), Parent (copy), getNamesStatusCache (copy), UserProfileNamesRetryCount (copy), fetchNamesWithRetries (copy)
	if Count1 ~= Count then return end
	Tbl2[Key] = true
	
	if not UserProfileStore then
		UserProfileStore = require(Parent.UserProfiles.Stores).UserProfileStore
	end
	UserProfileStore.get().fetchNamesByUserIds({ Key }, function(p2)
		-- upvalues: Count1 (copy), Count (upval), Tbl2 (upval), Key (copy), getNamesStatusCache (upval), p1 (copy), UserProfileNamesRetryCount (upval), fetchNamesWithRetries (upval)
		if Count1 ~= Count then return end
		if p2.status == "success" then
			Tbl2[Key] = nil
			getNamesStatusCache().replaceItem(Key, true)
			
			return
		end
		if p2.status == "failed" then
			if p1 < UserProfileNamesRetryCount then
				task.delay(2 ^ p1 + math.random(), fetchNamesWithRetries, Key, p1 + 1, Count1)
				
				return
			end
			Tbl2[Key] = nil
			getNamesStatusCache().markItemsAsFailed({ Key })
		end
	end)
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
			UserProfileStore = require(Parent.UserProfiles.Stores).UserProfileStore
		end
		local ProfileByUserId = UserProfileStore.get().getProfileByUserId(Text)
		
		if ProfileByUserId then
			return resolveUserProfileField(ProfileByUserId, Entry[2], p2), StatusResult
		else
			return nil, StatusResult
		end
	end,
	updateFromHydration = function(List)
		-- upvalues: UserProfileStore (ref), Parent (copy), DataCacheModule (copy)
		if not UserProfileStore then
			UserProfileStore = require(Parent.UserProfiles.Stores).UserProfileStore
		end
		UserProfileStore.get().updateFromHydration(List)
		local t = {}
		
		for i, value in List do
			t[if value.userId == nil then i else tostring(value.userId)] = true
		end
		DataCacheModule.replaceItems(t)
	end,
	getAndFetchUserInfo = function(p1)
		-- upvalues: Tbl (copy), SignalsModule (copy), getStatusAndFetch (copy), DataHydrationTypesModule (copy), UserProfileStore (ref), Parent (copy)
		local Text = tostring(p1)
		local Entry = Tbl[Text]
		
		if Entry == nil then
			local Computed = SignalsModule.createComputed(function(p2)
				-- upvalues: getStatusAndFetch (upval), Text (copy)
				return getStatusAndFetch(Text).status(p2)
			end)
			local config = {
				info = SignalsModule.createComputed(function(p2)
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
	end,
	getAndFetchUserNames = function(p1)
		-- upvalues: Tbl1 (copy), SignalsModule (copy), getNamesStatusCache (copy), Tbl2 (copy), fetchNamesWithRetries (copy), Count (ref), DataHydrationTypesModule (copy), UserProfileStore (ref), Parent (copy)
		local Text = tostring(p1)
		local Entry = Tbl1[Text]
		
		if Entry == nil then
			local Computed = SignalsModule.createComputed(function(p2)
				-- upvalues: getNamesStatusCache (upval), Text (copy), Tbl2 (upval), fetchNamesWithRetries (upval), Count (upval)
				local Item, Item2 = getNamesStatusCache().getItem(Text)
				
				if Item2 and not Tbl2[Text] then
					fetchNamesWithRetries(Text, 0, Count)
				end
				return Item.status(p2)
			end)
			local config = {
				names = SignalsModule.createComputed(function(p2)
					-- upvalues: Computed (copy), DataHydrationTypesModule (upval), Text (copy), UserProfileStore (upval), Parent (upval)
					if Computed(p2) ~= DataHydrationTypesModule.DataStatus.Ready then
						return nil
					end
					if not UserProfileStore then
						UserProfileStore = require(Parent.UserProfiles.Stores).UserProfileStore
					end
					local ProfileByUserId = UserProfileStore.get().getProfileByUserId(Text)
					
					return if ProfileByUserId == nil then nil else {
						combinedName = ProfileByUserId.names.getCombinedName(p2),
						username = ProfileByUserId.names.getUsername(p2)
					}
				end),
				status = Computed
			}
			Tbl1[Text] = config
			
			return config
		else
			return Entry
		end
	end
}