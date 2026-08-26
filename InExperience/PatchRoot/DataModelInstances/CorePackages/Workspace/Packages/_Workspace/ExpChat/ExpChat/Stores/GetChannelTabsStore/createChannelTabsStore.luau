local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local signalsModule = require(parent.Signals)
local tutilsModule = require(parent.tutils)
local expChatSharedModule = require(parent.ExpChatShared)
local friendsChatTabNameModule = require(parent.FriendsChat.FriendsChatTabName)
local sharedFlagsModule = require(parent.SharedFlags)
local engineFeatureExpChatGlobalChatEngineTelemetryEnabledModule = require(expChat.Flags.EngineFeatureExpChatGlobalChatEngineTelemetryEnabled)
local getFFlagTextChatEnableUniverseChatTabs = expChatSharedModule.Flags.GetFFlagTextChatEnableUniverseChatTabs
local fFlagExpChatEnableFriendsTab = sharedFlagsModule.FFlagExpChatEnableFriendsTab
local createSignal = signalsModule.createSignal
local createComputed = signalsModule.createComputed
local getFixedTabPriority = nil

local function reorderTabs(value)
	-- upvalues: getFixedTabPriority (write)
	local cloned = table.clone(value)
	local t = {}
	
	for i, v in pairs(cloned) do
		table.insert(t, v)
	end
	table.sort(t, function(p1, p2)
		-- upvalues: getFixedTabPriority (copy)
		local var1 = getFixedTabPriority(p1.name)
		local var2 = getFixedTabPriority(p2.name)
		
		return if var1 and var2 then var1 < var2 elseif var1 then true elseif var2 then false else p1.tabIndex < p2.tabIndex
	end)
	
	for i_1, v_1 in ipairs(t) do
		cloned[v_1.name] = {
			type = v_1.type,
			name = v_1.name,
			tabIndex = i_1,
			HasUnreadMessages = v_1.HasUnreadMessages
		}
	end
	return cloned
end

local function _(p1, p2)
	-- upvalues: reorderTabs (ref)
	local cloned = table.clone(p1)
	cloned[p2.name] = p2
	
	return reorderTabs(cloned)
end

local _ = function(p1, p2)
	-- upvalues: reorderTabs (ref)
	local cloned = table.clone(p1)
	cloned[p2.name] = nil
	
	return reorderTabs(cloned)
end

getFixedTabPriority = function(p1)
	-- upvalues: getFFlagTextChatEnableUniverseChatTabs (ref), friendsChatTabNameModule (ref), fFlagExpChatEnableFriendsTab (ref)
	return if p1 == "RBXGeneral" then 1 elseif p1 == "RBXGlobal" and getFFlagTextChatEnableUniverseChatTabs() then 2 elseif p1 == friendsChatTabNameModule and fFlagExpChatEnableFriendsTab then 3 else nil
end

return function()
	-- upvalues: createSignal (ref), createComputed (ref), tutilsModule (ref), getFFlagTextChatEnableUniverseChatTabs (ref), reorderTabs (ref), engineFeatureExpChatGlobalChatEngineTelemetryEnabledModule (ref), getFixedTabPriority (write), fFlagExpChatEnableFriendsTab (ref)
	local var1, var2 = createSignal({ selectedTabName = nil, allChannelTabs = {} })
	
	return {
		getChannelTabsState = var1,
		getSelectedTabName = createComputed(function(p1)
			-- upvalues: var1 (ref)
			return var1(p1).selectedTabName
		end),
		getUnreadChannels = createComputed(function(p1)
			-- upvalues: var1 (ref)
			local t = {}
			
			for i, v in pairs(var1(p1).allChannelTabs) do
				if v.HasUnreadMessages then
					t[i] = true
				end
			end
			return t
		end, tutilsModule.deepEqual),
		handleIncomingOrOutgoingMessage = function(a, b, p2)
			-- upvalues: getFFlagTextChatEnableUniverseChatTabs (copy), var2 (ref)
			if not getFFlagTextChatEnableUniverseChatTabs() and not a.TextChannel or b then return end
			local name = nil
			
			if getFFlagTextChatEnableUniverseChatTabs() then
				if p2 then
					name = p2
				elseif a.TextChannel then
					name = a.TextChannel.Name
				else
					return
				end
			end
			var2(function(p3)
				-- upvalues: getFFlagTextChatEnableUniverseChatTabs (copy), a (ref), name (write)
				local cloned = table.clone(p3)
				
				if not getFFlagTextChatEnableUniverseChatTabs() then
					local textChannel = a.TextChannel
					
					if textChannel == nil then
						return p3
					end
					name = textChannel.Name
				end
				if name == "RBXSystem" then
					name = "RBXGeneral"
				end
				if cloned.allChannelTabs[name] and name ~= cloned.selectedTabName then
					cloned.allChannelTabs = table.clone(cloned.allChannelTabs)
					local cloned_1 = table.clone(cloned.allChannelTabs[name])
					cloned_1.HasUnreadMessages = true
					cloned.allChannelTabs[name] = cloned_1
				end
				return cloned
			end)
		end,
		setSelectedTab = function(value)
			-- upvalues: var2 (ref)
			var2(function(p2)
				-- upvalues: value (ref)
				local cloned = table.clone(p2)
				cloned.selectedTabName = value
				
				if cloned.allChannelTabs[value] then
					cloned.allChannelTabs = table.clone(cloned.allChannelTabs)
					local cloned_1 = table.clone(cloned.allChannelTabs[value])
					cloned_1.HasUnreadMessages = false
					cloned.allChannelTabs[value] = cloned_1
				end
				return cloned
			end)
		end,
		setTargetChannel = function(value, p2)
			-- upvalues: var2 (ref), reorderTabs (copy), engineFeatureExpChatGlobalChatEngineTelemetryEnabledModule (copy), getFFlagTextChatEnableUniverseChatTabs (copy)
			var2(function(p3)
				-- upvalues: value (ref), p2 (ref), reorderTabs (copy), engineFeatureExpChatGlobalChatEngineTelemetryEnabledModule (copy), getFFlagTextChatEnableUniverseChatTabs (copy)
				local cloned = table.clone(p3)
				
				if value and cloned.allChannelTabs[value] then
					local var3 = cloned.allChannelTabs[value]
					local t = {
						type = var3.type,
						name = var3.name,
						tabIndex = if p2 then 0 else var3.tabIndex,
						HasUnreadMessages = var3.type == "FriendsChat" and var3.HasUnreadMessages
					}
					local cloned_1 = table.clone(cloned.allChannelTabs)
					cloned_1[var3.name] = nil
					local cloned_2 = table.clone(reorderTabs(cloned_1))
					cloned_2[t.name] = t
					cloned.allChannelTabs = reorderTabs(cloned_2)
					cloned.selectedTabName = var3.name
					
					return cloned
				elseif engineFeatureExpChatGlobalChatEngineTelemetryEnabledModule then
					if value then
						cloned.selectedTabName = value
						
						return cloned
					elseif getFFlagTextChatEnableUniverseChatTabs() then
						return cloned
					else
						cloned.selectedTabName = nil
						
						return cloned
					end
				else
					cloned.selectedTabName = value
				end
			end)
		end,
		addChannelTab = function(p2, p3)
			-- upvalues: var2 (ref), reorderTabs (copy), getFixedTabPriority (copy), fFlagExpChatEnableFriendsTab (copy)
			local name = p2.name
			var2(function(p4)
				-- upvalues: p3 (ref), p2 (ref), name (ref), reorderTabs (copy), getFixedTabPriority (copy), fFlagExpChatEnableFriendsTab (copy)
				local cloned = table.clone(p4)
				local allChannelTabs = cloned.allChannelTabs
				
				if p3 ~= nil then
					local t = {}
					
					for i, v in cloned.allChannelTabs do
						if p3 <= v.tabIndex then
							local cloned_1 = table.clone(v)
							cloned_1.tabIndex = v.tabIndex + 1
							t[i] = cloned_1
						else
							t[i] = v
						end
					end
					allChannelTabs = t
				end
				local t = {
					HasUnreadMessages = false,
					type = p2.type,
					name = name,
					tabIndex = p3 or 0
				}
				local cloned_1 = table.clone(allChannelTabs)
				cloned_1[t.name] = t
				cloned.allChannelTabs = reorderTabs(cloned_1)
				local var3 = getFixedTabPriority(name)
				local var4 = getFixedTabPriority(cloned.selectedTabName)
				
				if cloned.selectedTabName == nil then
					cloned.selectedTabName = if cloned.allChannelTabs.RBXGeneral then "RBXGeneral" else name
					
					return cloned
				elseif var3 ~= nil and var3 < (var4 or 1e999) and (not fFlagExpChatEnableFriendsTab or var4 ~= nil) then
					cloned.selectedTabName = name
				end
				return cloned
			end)
		end,
		removeChannelTab = function(p4)
			-- upvalues: var2 (ref)
			var2(function(p5)
				-- upvalues: p4 (ref)
				local cloned = table.clone(p5)
				cloned.allChannelTabs = table.clone(cloned.allChannelTabs)
				cloned.allChannelTabs[p4] = nil
				
				if cloned.selectedTabName == p4 then
					local var3 = 1e999
					local var4 = nil
					
					for i, v in pairs(cloned.allChannelTabs) do
						if v.tabIndex < var3 then
							var3 = v.tabIndex
							var4 = i
						end
					end
					cloned.selectedTabName = var4
				end
				return cloned
			end)
		end,
		handleChannelRemoved = function(p5)
			-- upvalues: var2 (ref), reorderTabs (copy)
			var2(function(p6)
				-- upvalues: p5 (ref), reorderTabs (copy)
				local var3 = p6.allChannelTabs[p5]
				
				if var3 == nil then
					return p6
				end
				local cloned = table.clone(p6)
				local cloned_1 = table.clone(cloned.allChannelTabs)
				cloned_1[var3.name] = nil
				cloned.allChannelTabs = reorderTabs(cloned_1)
				
				if var3.name == cloned.selectedTabName then
					cloned.selectedTabName = if cloned.allChannelTabs.RBXGeneral then "RBXGeneral" else nil
				end
				if cloned.selectedTabName and cloned.allChannelTabs[cloned.selectedTabName] then
					cloned.allChannelTabs = table.clone(cloned.allChannelTabs)
					local cloned_2 = table.clone(cloned.allChannelTabs[cloned.selectedTabName])
					cloned_2.HasUnreadMessages = false
					cloned.allChannelTabs[cloned.selectedTabName] = cloned_2
				end
				return cloned
			end)
		end,
		markChannelUnread = function(p5)
			-- upvalues: var2 (ref)
			var2(function(p6)
				-- upvalues: p5 (ref)
				local cloned = table.clone(p6)
				
				if cloned.allChannelTabs[p5] and p5 ~= cloned.selectedTabName then
					cloned.allChannelTabs = table.clone(cloned.allChannelTabs)
					local cloned_1 = table.clone(cloned.allChannelTabs[p5])
					cloned_1.HasUnreadMessages = true
					cloned.allChannelTabs[p5] = cloned_1
				end
				return cloned
			end)
		end,
		setChannelUnreadStatus = function(value, p5)
			-- upvalues: var2 (ref)
			var2(function(p6)
				-- upvalues: value (ref), p5 (ref)
				if p6.allChannelTabs[value] == nil then
					return p6
				end
				local cloned = table.clone(p6)
				cloned.allChannelTabs = table.clone(cloned.allChannelTabs)
				local cloned_1 = table.clone(cloned.allChannelTabs[value])
				cloned_1.HasUnreadMessages = p5
				cloned.allChannelTabs[value] = cloned_1
				
				return cloned
			end)
		end
	}
end