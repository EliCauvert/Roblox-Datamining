local corePackagesService = game:GetService("CorePackages")
local promiseModule = require(corePackagesService.Packages.Promise)
local userProfileStore = require(corePackagesService.Workspace.Packages.UserProfiles).Stores.UserProfileStore

local function collectUserIdsMissingUsername(p1)
	local t = {}
	local t_1 = {}
	
	for i, v in p1 do
		for i_1, v_1 in v.items do
			local meta = v_1.meta
			local userId = meta and meta.userId
			local username = meta and meta.username
			
			if userId and userId ~= "0" and (not username or username == "") and not t[userId] then
				t[userId] = true
				table.insert(t_1, userId)
			end
		end
	end
	return t_1
end

local function enrichGroupsWithProfileUsernames(p2, p3)
	local t = {}
	
	for i, v in p3 do
		local username = v.names.getUsername(false)
		
		if username and #username > 0 then
			t[v.userId] = username
		end
	end
	for i, v_1 in p2 do
		for i_2, v_2 in v_1.items do
			local meta = v_2.meta
			
			if meta and (not meta.username or meta.username == "") then
				local userId = t[meta.userId]
				
				if userId then
					meta.username = userId
				end
			end
		end
	end
end

return {
	collectUserIdsMissingUsername = collectUserIdsMissingUsername,
	enrichGroupsWithProfileUsernames = enrichGroupsWithProfileUsernames,
	enrichMissingUsernames = function(p4)
		-- upvalues: collectUserIdsMissingUsername (ref), promiseModule (ref), userProfileStore (ref), enrichGroupsWithProfileUsernames (ref)
		local var1 = collectUserIdsMissingUsername(p4)
		
		return if #var1 == 0 then promiseModule.resolve(p4) else promiseModule.new(function(p5)
			-- upvalues: userProfileStore (copy), var1 (ref), enrichGroupsWithProfileUsernames (copy), p4 (ref)
			userProfileStore.get().fetchNamesByUserIds(var1, function(p6)
				-- upvalues: enrichGroupsWithProfileUsernames (copy), p4 (copy), p5 (ref)
				if p6.status == "success" and p6.data then
					enrichGroupsWithProfileUsernames(p4, p6.data)
					p5(p4)
					
					return
				elseif p6.status == "failed" then
					p5(p4)
				end
			end)
		end)
	end
}