local Groups = script:FindFirstAncestor("Groups")
local Parent = Groups.Parent
local SignalsModule = require(Parent.Signals)
local CryoModule = require(Parent.Cryo)
local _ = require(Groups.Common.Types)
local GroupsWebApiModule = require(Groups.Networking.GroupsWebApi)
local config = {
	isLoading = false,
	loadFailure = false,
	groupsList = nil,
	canCreateGroup = true
}

local function translateResultToGroup(p1, p2)
	local Group = p1.group or {}
	local Role = p1.role or {}
	local Owner = Group.owner
	
	return {
		id = if Group.id then Group.id else 0,
		name = Group.name,
		memberCount = Group.memberCount,
		role = {
			name = Role.name,
			rank = if Role.rank then Role.rank else 0
		},
		isPrimary = p1.isPrimaryGroup or false,
		isOwner = if Owner and Owner.userId then tostring(Owner.userId) == p2 else false,
		groupHasVerifiedBadge = Group.hasVerifiedBadge or false,
		hasSocialModules = Group.hasSocialModules or false,
		thumbnail = Group.emblemUrl
	}
end

local function compareNames(Text: string, Text1: string): boolean
	local Lowered = string.lower(Text)
	local Lowered1 = string.lower(Text1)
	local Segment = string.sub(Lowered, 1, 1)
	local Segment1 = string.sub(Lowered1, 1, 1)
	local IsSegmentBelow: boolean = Segment >= "a" and Segment <= "z"
	local IsSegmentBelow1: boolean = Segment1 >= "a" and Segment1 <= "z"
	
	return not IsSegmentBelow and IsSegmentBelow1 or (not IsSegmentBelow or IsSegmentBelow1) and Lowered < Lowered1
end

local function _(Tbl)
	-- upvalues: compareNames (copy)
	local Copy = table.clone(Tbl)
	table.sort(Copy, function(A, B)
		-- upvalues: compareNames (upval)
		local IsOwner = A.isOwner or false
		local IsOwner1 = B.isOwner or false
		local Name = A.name or ""
		local Name1 = B.name or ""
		
		return if IsOwner and IsOwner1 then compareNames(Name, Name1) elseif IsOwner then true else not IsOwner1 and compareNames(Name, Name1)
	end)
	
	return Copy
end

local function getVisibleGroups(MapResult, p1)
	if not p1 or not p1.groups then
		return {}
	end
	local t = {}
	
	for _, value in ipairs(MapResult) do
		t[value.id] = value
	end
	local List = {}
	
	for _, group in ipairs(p1.groups) do
		if group and group.canViewGroup and group.groupId then
			local Number: number? = tonumber(group.groupId)
			
			if Number and t[Number] then
				table.insert(List, t[Number])
			end
		end
	end
	return List
end

local function movePrimaryGroupToFront(List)
	local v1 = nil
	
	for i, value in ipairs(List) do
		if value.isPrimary then
			v1 = i
			break
		end
	end
	if not v1 then
		return List
	end
	local List1 = {}
	table.insert(List1, List[v1])
	
	for i1, value1 in ipairs(List) do
		if i1 ~= v1 then
			table.insert(List1, value1)
		end
	end
	return List1
end

local _ = function(p2): boolean
	if p2 then
		local GroupLimit = p2.groupLimit
		local CurrentGroupCount = p2.currentGroupCount
		
		return not GroupLimit or not CurrentGroupCount or CurrentGroupCount < GroupLimit
	else
		return true
	end
end

local function collectGroupIds(List)
	if not List then
		return {}
	end
	local Ids = {}
	
	for _, value in ipairs(List) do
		if value.group and value.group.id then
			table.insert(Ids, value.group.id)
		end
	end
	return Ids
end

return function()
	-- upvalues: SignalsModule (copy), config (copy), GroupsWebApiModule (copy), collectGroupIds (copy), CryoModule (copy), translateResultToGroup (copy), getVisibleGroups (copy), compareNames (copy), movePrimaryGroupToFront (copy)
	local Signal, Signal2 = SignalsModule.createSignal(config)
	local Effects = {}
	local List = {}
	
	local function cleanup()
		-- upvalues: Effects (ref), List (ref)
		for _, effect in Effects do
			effect()
		end
		for _, value in List do
			value()
		end
		Effects = {}
		List = {}
	end
	
	return {
		getState = Signal,
		fetchGroups = function(p2)
			-- upvalues: cleanup (copy), Signal2 (copy), GroupsWebApiModule (upval), List (ref), SignalsModule (upval), collectGroupIds (upval), CryoModule (upval), translateResultToGroup (upval), getVisibleGroups (upval), compareNames (upval), movePrimaryGroupToFront (upval), Effects (ref)
			cleanup()
			Signal2({
				isLoading = true,
				loadFailure = false,
				groupsList = nil,
				canCreateGroup = true
			})
			local UserGroupsWithRoles, UserGroupsWithRoles2 = GroupsWebApiModule.GetUserGroupsWithRoles(p2)
			local GroupsMetadata, GroupsMetadata2 = GroupsWebApiModule.GetGroupsMetadata()
			table.insert(List, UserGroupsWithRoles2)
			table.insert(List, GroupsMetadata2)
			local Flag = false
			table.insert(Effects, (SignalsModule.createEffect(function(p3)
				-- upvalues: Flag (ref), UserGroupsWithRoles (copy), Signal2 (upval), collectGroupIds (upval), GroupsWebApiModule (upval), List (upval), SignalsModule (upval), GroupsMetadata (copy), CryoModule (upval), translateResultToGroup (upval), p2 (copy), getVisibleGroups (upval), compareNames (upval), movePrimaryGroupToFront (upval), Effects (upval)
				if Flag then return end
				local UserGroupsWithRolesResult = UserGroupsWithRoles(p3)
				
				if UserGroupsWithRolesResult.status == "Loading" then return end
				if UserGroupsWithRolesResult.status == "Failed" then
					Flag = true
					Signal2({
						isLoading = false,
						loadFailure = true,
						groupsList = nil,
						canCreateGroup = true
					})
					
					return
				end
				local Data = if UserGroupsWithRolesResult.data and UserGroupsWithRolesResult.data.data then UserGroupsWithRolesResult.data.data else {}
				
				if #Data == 0 then
					Flag = true
					Signal2({
						isLoading = false,
						loadFailure = false,
						canCreateGroup = true,
						groupsList = {}
					})
					
					return
				else
					local GroupPolicies, GroupPolicies2 = GroupsWebApiModule.GetGroupPolicies((collectGroupIds(Data)))
					table.insert(List, GroupPolicies2)
					table.insert(Effects, (SignalsModule.createEffect(function(p4)
						-- upvalues: Flag (upval), GroupPolicies (copy), GroupsMetadata (upval), CryoModule (upval), Data (copy), translateResultToGroup (upval), p2 (upval), getVisibleGroups (upval), compareNames (upval), Signal2 (upval), movePrimaryGroupToFront (upval)
						if Flag then return end
						local GroupPoliciesResult = GroupPolicies(p4)
						
						if GroupPoliciesResult.status == "Loading" then return end
						local GroupsMetadataResult = GroupsMetadata(p4)
						local Data1 = if GroupsMetadataResult.status == "Success" then GroupsMetadataResult.data else nil
						Flag = true
						local Data2 = if GroupPoliciesResult.status == "Success" then GroupPoliciesResult.data else nil
						local MapResult = CryoModule.List.map(Data, function(p5)
							-- upvalues: translateResultToGroup (upval), p2 (upval)
							return (translateResultToGroup(p5, p2))
						end)
						local Copy = table.clone(if Data2 then getVisibleGroups(MapResult, Data2) else {})
						table.sort(Copy, function(A, B)
							-- upvalues: compareNames (upval)
							local IsOwner = A.isOwner or false
							local IsOwner1 = B.isOwner or false
							local Name = A.name or ""
							local Name1 = B.name or ""
							
							return if IsOwner and IsOwner1 then compareNames(Name, Name1) elseif IsOwner then true else not IsOwner1 and compareNames(Name, Name1)
						end)
						
						if #Copy == 0 then
							local config = { isLoading = false, loadFailure = false, groupsList = {} }
							local CanCreateGroup = nil
							
							if Data1 then
								local GroupLimit = Data1.groupLimit
								local CurrentGroupCount = Data1.currentGroupCount
								CanCreateGroup = not GroupLimit or not CurrentGroupCount or CurrentGroupCount < GroupLimit
							else
								CanCreateGroup = true
							end
							config.canCreateGroup = CanCreateGroup
							Signal2(config)
							
							return
						else
							local config1 = {
								isLoading = false,
								loadFailure = false,
								groupsList = movePrimaryGroupToFront(Copy)
							}
							local CanCreateGroup = nil
							
							if Data1 then
								local GroupLimit = Data1.groupLimit
								local CurrentGroupCount = Data1.currentGroupCount
								CanCreateGroup = not GroupLimit or not CurrentGroupCount or CurrentGroupCount < GroupLimit
							else
								CanCreateGroup = true
							end
							config1.canCreateGroup = CanCreateGroup
							Signal2(config1)
						end
					end)))
				end
			end)))
		end,
		reset = function()
			-- upvalues: cleanup (copy), Signal2 (copy), config (upval)
			cleanup()
			Signal2(config)
		end
	}
end