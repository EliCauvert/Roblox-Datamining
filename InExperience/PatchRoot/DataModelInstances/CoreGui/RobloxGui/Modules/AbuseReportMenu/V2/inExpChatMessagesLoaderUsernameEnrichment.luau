local CorePackages = game:GetService("CorePackages")
local PromiseModule = require(CorePackages.Packages.Promise)
local UserProfileStore = require(CorePackages.Workspace.Packages.UserProfiles).Stores.UserProfileStore

local function collectUserIdsMissingUsername(List) --[[ Line: 8 ]]
	local t = {}
	local List1 = {}
	
	for _, value in List do
		for _, item in value.items do
			local Meta = item.meta
			local UserId = Meta and Meta.userId
			local Username = Meta and Meta.username
			
			if UserId and UserId ~= "0" and (not Username or Username == "") and not t[UserId] then
				t[UserId] = true
				table.insert(List1, UserId)
			end
		end
	end
	return List1
end

local function enrichGroupsWithProfileUsernames(List, List1) --[[ Line: 27 ]]
	local Usernames = {}
	
	for _, value in List1 do
		local Username = value.names.getUsername(false)
		
		if Username and #Username > 0 then
			Usernames[value.userId] = Username
		end
	end
	for _, value1 in List do
		for _, item in value1.items do
			local Meta = item.meta
			
			if Meta and (not Meta.username or Meta.username == "") then
				local Username = Usernames[Meta.userId]
				
				if Username then
					Meta.username = Username
				end
			end
		end
	end
end

return {
	collectUserIdsMissingUsername = collectUserIdsMissingUsername,
	enrichGroupsWithProfileUsernames = enrichGroupsWithProfileUsernames,
	enrichMissingUsernames = function(p1) --[[ Line: 50 ]]
		-- upvalues: collectUserIdsMissingUsername (copy), PromiseModule (copy), UserProfileStore (copy), enrichGroupsWithProfileUsernames (copy)
		local CollectUserIdsMissingUsernameResult = collectUserIdsMissingUsername(p1)
		
		return if #CollectUserIdsMissingUsernameResult == 0 then PromiseModule.resolve(p1) else PromiseModule.new(function(Callback) --[[ Line: 56 ]]
			-- upvalues: UserProfileStore (upval), CollectUserIdsMissingUsernameResult (copy), enrichGroupsWithProfileUsernames (upval), p1 (copy)
			UserProfileStore.get().fetchNamesByUserIds(CollectUserIdsMissingUsernameResult, function(p2) --[[ Line: 57 ]]
				-- upvalues: enrichGroupsWithProfileUsernames (upval), p1 (upval), Callback (copy)
				if p2.status == "success" and p2.data then
					enrichGroupsWithProfileUsernames(p1, p2.data)
					Callback(p1)
					
					return
				end
				if p2.status == "failed" then
					Callback(p1)
				end
			end)
		end)
	end
}