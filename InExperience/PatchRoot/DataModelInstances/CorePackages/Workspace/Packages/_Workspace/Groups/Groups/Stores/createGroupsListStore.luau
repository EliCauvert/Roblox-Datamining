local groups = script:FindFirstAncestor("Groups")
local parent = groups.Parent
local signalsModule = require(parent.Signals)
local cryoModule = require(parent.Cryo)
local _ = require(groups.Common.Types)
local groupsWebApiModule = require(groups.Networking.GroupsWebApi)
local t = {
	isLoading = false,
	loadFailure = false,
	groupsList = nil,
	canCreateGroup = true
}

local function translateResultToGroup(p1, p2)
	local var1
	local group = p1.group or {}
	local role = p1.role or {}
	local owner = group.owner
	local t = {
		id = if group.id then group.id else 0,
		name = group.name,
		memberCount = group.memberCount,
		role = {
			name = role.name,
			rank = if role.rank then role.rank else 0
		},
		isPrimary = p1.isPrimaryGroup or false
	}
	
	if owner and owner.userId then
		var1 = tostring(owner.userId) == p2
		var1 = nil
	else
		var1 = false
	end
	t.isOwner = var1
	t.groupHasVerifiedBadge = group.hasVerifiedBadge or false
	t.hasSocialModules = group.hasSocialModules or false
	t.thumbnail = group.emblemUrl
	
	return t
end

local function compareNames(p1, p2)
	local lowerText = string.lower(p1)
	local lowerText_1 = string.lower(p2)
	local substring = string.sub(lowerText, 1, 1)
	local substring_1 = string.sub(lowerText_1, 1, 1)
	local var1 = "a" <= substring and substring <= "z"
	local var2 = "a" <= substring_1 and substring_1 <= "z"
	
	return if not (not var1 and var2) then if var1 and not var2 then false else lowerText < lowerText_1 else true
end

local function _(p1)
	-- upvalues: compareNames (ref)
	local cloned = table.clone(p1)
	table.sort(cloned, function(p2, p3)
		-- upvalues: compareNames (copy)
		local isOwner = p2.isOwner or false
		local isOwner_1 = p3.isOwner or false
		local name = p2.name or ""
		local name_1 = p3.name or ""
		
		return if isOwner and isOwner_1 then compareNames(name, name_1) elseif isOwner then true elseif isOwner_1 then false else compareNames(name, name_1)
	end)
	
	return cloned
end

local function getVisibleGroups(p1, p2)
	if not p2 or not p2.groups then
		return {}
	end
	local t = {}
	
	for i, v in ipairs(p1) do
		t[v.id] = v
	end
	local t_1 = {}
	
	for i_1, v_1 in ipairs(p2.groups) do
		if v_1 and v_1.canViewGroup and v_1.groupId then
			local var1 = tonumber(v_1.groupId)
			
			if var1 and t[var1] then
				table.insert(t_1, t[var1])
			end
		end
	end
	return t_1
end

local function movePrimaryGroupToFront(p3)
	local var2 = nil
	
	for i, v in ipairs(p3) do
		if v.isPrimary then
			var2 = i
			break
		end
	end
	if not var2 then
		return p3
	end
	local t = {}
	table.insert(t, p3[var2])
	
	for v, v_1 in ipairs(p3) do
		if v ~= var2 then
			table.insert(t, v_1)
		end
	end
	return t
end

local _ = function(p4)
	if not p4 then
		return true
	end
	local groupLimit = p4.groupLimit
	local currentGroupCount = p4.currentGroupCount
	
	return if groupLimit and currentGroupCount then currentGroupCount < groupLimit else true
end

local function collectGroupIds(p4)
	if not p4 then
		return {}
	end
	local t = {}
	
	for i, v in ipairs(p4) do
		if v.group and v.group.id then
			table.insert(t, v.group.id)
		end
	end
	return t
end

return function()
	-- upvalues: signalsModule (ref), t (ref), groupsWebApiModule (ref), collectGroupIds (ref), cryoModule (ref), translateResultToGroup (ref), getVisibleGroups (ref), compareNames (ref), movePrimaryGroupToFront (ref)
	local var3, var4 = signalsModule.createSignal(t)
	local t_1 = {}
	local t_2 = {}
	
	local function cleanup()
		-- upvalues: t_1 (write), t_2 (write)
		for i, v in t_1 do
			v()
		end
		for i, v_1 in t_2 do
			v_1()
		end
		t_1 = {}
		t_2 = {}
	end
	
	return {
		getState = var3,
		fetchGroups = function(p5)
			-- upvalues: cleanup (ref), var4 (ref), groupsWebApiModule (copy), t_2 (write), signalsModule (copy), collectGroupIds (copy), cryoModule (copy), translateResultToGroup (copy), getVisibleGroups (copy), compareNames (copy), movePrimaryGroupToFront (copy), t_1 (write)
			cleanup()
			var4({
				isLoading = true,
				loadFailure = false,
				groupsList = nil,
				canCreateGroup = true
			})
			local userGroupsWithRoles, userGroupsWithRoles_1 = groupsWebApiModule.GetUserGroupsWithRoles(p5)
			local groupsMetadata, groupsMetadata_1 = groupsWebApiModule.GetGroupsMetadata()
			table.insert(t_2, userGroupsWithRoles_1)
			table.insert(t_2, groupsMetadata_1)
			local var5 = false
			table.insert(t_1, signalsModule.createEffect(function(p6)
				-- upvalues: var5 (write), userGroupsWithRoles (ref), var4 (copy), collectGroupIds (copy), groupsWebApiModule (copy), t_2 (copy), signalsModule (copy), groupsMetadata (ref), cryoModule (copy), translateResultToGroup (copy), p5 (ref), getVisibleGroups (copy), compareNames (copy), movePrimaryGroupToFront (copy), t_1 (copy)
				if var5 then return end
				local var6 = userGroupsWithRoles(p6)
				
				if var6.status == "Loading" then return end
				if var6.status == "Failed" then
					var5 = true
					var4({
						isLoading = false,
						loadFailure = true,
						groupsList = nil,
						canCreateGroup = true
					})
					
					return
				end
				local var7 = if var6.data and var6.data.data then var6.data.data else {}
				
				if #var7 == 0 then
					var5 = true
					var4({
						isLoading = false,
						loadFailure = false,
						canCreateGroup = true,
						groupsList = {}
					})
					
					return
				end
				local groupPolicies, groupPolicies_1 = groupsWebApiModule.GetGroupPolicies(collectGroupIds(var7))
				table.insert(t_2, groupPolicies_1)
				table.insert(t_1, signalsModule.createEffect(function(p7)
					-- upvalues: var5 (copy), groupPolicies (ref), groupsMetadata (copy), cryoModule (copy), var7 (ref), translateResultToGroup (copy), p5 (copy), getVisibleGroups (copy), compareNames (copy), var4 (copy), movePrimaryGroupToFront (copy)
					if var5 then return end
					local var8 = groupPolicies(p7)
					
					if var8.status == "Loading" then return end
					local groupLimit
					local var9 = groupsMetadata(p7)
					local var10 = if var9.status == "Success" then var9.data else nil
					var5 = true
					local var11 = if var8.status == "Success" then var8.data else nil
					local cloned = table.clone(if var11 then getVisibleGroups(cryoModule.List.map(var7, function(p8)
						-- upvalues: translateResultToGroup (copy), p5 (copy)
						return translateResultToGroup(p8, p5)
					end), var11) else {})
					table.sort(cloned, function(p8, p9)
						-- upvalues: compareNames (copy)
						local isOwner = p8.isOwner or false
						local isOwner_1 = p9.isOwner or false
						local name = p8.name or ""
						local name_1 = p9.name or ""
						
						return if isOwner and isOwner_1 then compareNames(name, name_1) elseif isOwner then true elseif isOwner_1 then false else compareNames(name, name_1)
					end)
					
					if #cloned == 0 then
						local var12
						local var13 = var4
						local t = { isLoading = false, loadFailure = false, groupsList = {} }
						
						if var10 then
							groupLimit = var10.groupLimit
							local currentGroupCount = var10.currentGroupCount
							
							if groupLimit and currentGroupCount then
								var12 = currentGroupCount < groupLimit
								var12 = nil
							else
								var12 = true
							end
						else
							var12 = true
						end
						t.canCreateGroup = var12
						var13(t)
						
						return
					else
						local t = {
							isLoading = false,
							loadFailure = false,
							groupsList = movePrimaryGroupToFront(cloned)
						}
						
						if var10 then
							local groupLimit_1 = var10.groupLimit
							local currentGroupCount = var10.currentGroupCount
							
							if groupLimit_1 and currentGroupCount then
								groupLimit = currentGroupCount < groupLimit_1
								groupLimit = nil
							else
								groupLimit = true
							end
						else
							groupLimit = true
						end
						t.canCreateGroup = groupLimit
						var4(t)
					end
				end))
			end))
		end,
		reset = function()
			-- upvalues: cleanup (ref), var4 (ref), t (copy)
			cleanup()
			var4(t)
		end
	}
end