local corePackagesService = game:GetService("CorePackages")
local promiseModule = require(corePackagesService.Packages.Promise)
local userProfileStore = require(corePackagesService.Workspace.Packages.UserProfiles).Stores.UserProfileStore

local function collectUserIdsMissingUsername(p0) --[[ line: 8 ]]
	local t = {}
	local t_1 = {}
	
	for i, v in p0 do
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

local function enrichGroupsWithProfileUsernames(p1, p2) --[[ line: 27 ]]
	local t = {}
	
	for i, v in p2 do
		local username = v.names.getUsername(false)
		
		if username and #username > 0 then
			t[v.userId] = username
		end
	end
	for i, v_1 in p1 do
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
	enrichMissingUsernames = function(p3) --[[ line: 50 ]]
		-- upvalues: collectUserIdsMissingUsername (ref), promiseModule (ref), userProfileStore (ref), enrichGroupsWithProfileUsernames (ref)
		local var10 = collectUserIdsMissingUsername(p3)
		
		return if #var10 == 0 then promiseModule.resolve(p3) else promiseModule.new(function(p4) --[[ line: 56 ]]
			-- upvalues: userProfileStore (copy), var10 (ref), enrichGroupsWithProfileUsernames (copy), p3 (ref)
			userProfileStore.get().fetchNamesByUserIds(var10, function(p5) --[[ line: 57 ]]
				-- upvalues: enrichGroupsWithProfileUsernames (copy), p3 (copy), p4 (ref)
				if p5.status == "success" and p5.data then
					enrichGroupsWithProfileUsernames(p3, p5.data)
					p4(p3)
					
					return
				elseif p5.status == "failed" then
					p4(p3)
				end
			end)
		end)
	end
}