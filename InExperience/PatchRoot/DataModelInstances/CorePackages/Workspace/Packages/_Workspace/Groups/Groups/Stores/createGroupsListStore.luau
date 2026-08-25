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

local function translateResultToGroup(p0, p1)
	local var13
	local group = p0.group or {}
	local role = p0.role or {}
	local owner = group.owner
	local t = {
		id = if group.id then group.id else 0,
		name = group.name,
		memberCount = group.memberCount,
		role = {
			name = role.name,
			rank = if role.rank then role.rank else 0
		},
		isPrimary = p0.isPrimaryGroup or false
	}
	
	if owner and owner.userId then
		var13 = tostring(owner.userId) == p1
		var13 = nil
	else
		var13 = false
	end
	t.isOwner = var13
	t.groupHasVerifiedBadge = group.hasVerifiedBadge or false
	t.hasSocialModules = group.hasSocialModules or false
	t.thumbnail = group.emblemUrl
	
	return t
end

local function compareNames(p2, p3)
	local lowerText = string.lower(p2)
	local lowerText_1 = string.lower(p3)
	local substring = string.sub(lowerText, 1, 1)
	local substring_1 = string.sub(lowerText_1, 1, 1)
	local var18 = "a" <= substring and substring <= "z"
	local var19 = "a" <= substring_1 and substring_1 <= "z"
	
	return if not (not var18 and var19) then if var18 and not var19 then false else lowerText < lowerText_1 else true
end

local function _(p4)
	-- upvalues: compareNames (ref)
	local cloned = table.clone(p4)
	table.sort(cloned, function(p5, p6)
		-- upvalues: compareNames (copy)
		local isOwner = p5.isOwner or false
		local isOwner_1 = p6.isOwner or false
		local name = p5.name or ""
		local name_1 = p6.name or ""
		
		return if isOwner and isOwner_1 then compareNames(name, name_1) elseif isOwner then true elseif isOwner_1 then false else compareNames(name, name_1)
	end)
	
	return cloned
end

local function getVisibleGroups(p7, p8)
	if not p8 or not p8.groups then
		return {}
	end
	local t = {}
	
	for i, v in ipairs(p7) do
		t[v.id] = v
	end
	local t_1 = {}
	
	for i_1, v_1 in ipairs(p8.groups) do
		if v_1 and v_1.canViewGroup and v_1.groupId then
			local var27 = tonumber(v_1.groupId)
			
			if var27 and t[var27] then
				table.insert(t_1, t[var27])
			end
		end
	end
	return t_1
end

local function movePrimaryGroupToFront(p9)
	local var28 = nil
	
	for i, v in ipairs(p9) do
		if v.isPrimary then
			var28 = i
			break
		end
	end
	if not var28 then
		return p9
	end
	local t = {}
	table.insert(t, p9[var28])
	
	for v, v_1 in ipairs(p9) do
		if v ~= var28 then
			table.insert(t, v_1)
		end
	end
	return t
end

local _ = function(p10)
	if not p10 then
		return true
	end
	local groupLimit = p10.groupLimit
	local currentGroupCount = p10.currentGroupCount
	
	return if groupLimit and currentGroupCount then currentGroupCount < groupLimit else true
end

local function collectGroupIds(p11)
	if not p11 then
		return {}
	end
	local t = {}
	
	for i, v in ipairs(p11) do
		if v.group and v.group.id then
			table.insert(t, v.group.id)
		end
	end
	return t
end

return function()
	-- upvalues: signalsModule (ref), t (ref), groupsWebApiModule (ref), collectGroupIds (ref), cryoModule (ref), translateResultToGroup (ref), getVisibleGroups (ref), compareNames (ref), movePrimaryGroupToFront (ref)
	local var31, var32 = signalsModule.createSignal(t)
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
		getState = var31,
		fetchGroups = function(p12)
			-- upvalues: cleanup (ref), var32 (ref), groupsWebApiModule (copy), t_2 (write), signalsModule (copy), collectGroupIds (copy), cryoModule (copy), translateResultToGroup (copy), getVisibleGroups (copy), compareNames (copy), movePrimaryGroupToFront (copy), t_1 (write)
			cleanup()
			var32({
				isLoading = true,
				loadFailure = false,
				groupsList = nil,
				canCreateGroup = true
			})
			local userGroupsWithRoles, userGroupsWithRoles_1 = groupsWebApiModule.GetUserGroupsWithRoles(p12)
			local groupsMetadata, groupsMetadata_1 = groupsWebApiModule.GetGroupsMetadata()
			table.insert(t_2, userGroupsWithRoles_1)
			table.insert(t_2, groupsMetadata_1)
			local var40 = false
			table.insert(t_1, signalsModule.createEffect(function(p13)
				-- upvalues: var40 (write), userGroupsWithRoles (ref), var32 (copy), collectGroupIds (copy), groupsWebApiModule (copy), t_2 (copy), signalsModule (copy), groupsMetadata (ref), cryoModule (copy), translateResultToGroup (copy), p12 (ref), getVisibleGroups (copy), compareNames (copy), movePrimaryGroupToFront (copy), t_1 (copy)
				if var40 then return end
				local var41 = userGroupsWithRoles(p13)
				
				if var41.status == "Loading" then return end
				if var41.status == "Failed" then
					var40 = true
					var32({
						isLoading = false,
						loadFailure = true,
						groupsList = nil,
						canCreateGroup = true
					})
					
					return
				end
				local var42 = if var41.data and var41.data.data then var41.data.data else {}
				
				if #var42 == 0 then
					var40 = true
					var32({
						isLoading = false,
						loadFailure = false,
						canCreateGroup = true,
						groupsList = {}
					})
					
					return
				end
				local groupPolicies, groupPolicies_1 = groupsWebApiModule.GetGroupPolicies(collectGroupIds(var42))
				table.insert(t_2, groupPolicies_1)
				table.insert(t_1, signalsModule.createEffect(function(p14)
					-- upvalues: var40 (copy), groupPolicies (ref), groupsMetadata (copy), cryoModule (copy), var42 (ref), translateResultToGroup (copy), p12 (copy), getVisibleGroups (copy), compareNames (copy), var32 (copy), movePrimaryGroupToFront (copy)
					if var40 then return end
					local var45 = groupPolicies(p14)
					
					if var45.status == "Loading" then return end
					local groupLimit
					local var46 = groupsMetadata(p14)
					local var47 = if var46.status == "Success" then var46.data else nil
					var40 = true
					local var48 = if var45.status == "Success" then var45.data else nil
					local cloned = table.clone(if var48 then getVisibleGroups(cryoModule.List.map(var42, function(p15)
						-- upvalues: translateResultToGroup (copy), p12 (copy)
						return translateResultToGroup(p15, p12)
					end), var48) else {})
					table.sort(cloned, function(p16, p17)
						-- upvalues: compareNames (copy)
						local isOwner = p16.isOwner or false
						local isOwner_1 = p17.isOwner or false
						local name = p16.name or ""
						local name_1 = p17.name or ""
						
						return if isOwner and isOwner_1 then compareNames(name, name_1) elseif isOwner then true elseif isOwner_1 then false else compareNames(name, name_1)
					end)
					
					if #cloned == 0 then
						local var52
						local var50 = var32
						local t = { isLoading = false, loadFailure = false, groupsList = {} }
						
						if var47 then
							groupLimit = var47.groupLimit
							local currentGroupCount = var47.currentGroupCount
							
							if groupLimit and currentGroupCount then
								var52 = currentGroupCount < groupLimit
								var52 = nil
							else
								var52 = true
							end
						else
							var52 = true
						end
						t.canCreateGroup = var52
						var50(t)
						
						return
					else
						local t = {
							isLoading = false,
							loadFailure = false,
							groupsList = movePrimaryGroupToFront(cloned)
						}
						
						if var47 then
							local groupLimit_1 = var47.groupLimit
							local currentGroupCount = var47.currentGroupCount
							
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
						var32(t)
					end
				end))
			end))
		end,
		reset = function()
			-- upvalues: cleanup (ref), var32 (ref), t (copy)
			cleanup()
			var32(t)
		end
	}
end