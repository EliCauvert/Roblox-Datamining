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

local function reorderTabs(value) --[[ line: 68 ]]
	-- upvalues: getFixedTabPriority (write)
	local cloned = table.clone(value)
	local t = {}
	
	for i, v in pairs(cloned) do
		table.insert(t, v)
	end
	table.sort(t, function(p0, p1) --[[ line: 76 ]]
		-- upvalues: getFixedTabPriority (copy)
		local var11 = getFixedTabPriority(p0.name)
		local var12 = getFixedTabPriority(p1.name)
		
		return if var11 and var12 then var11 < var12 elseif var11 then true elseif var12 then false else p0.tabIndex < p1.tabIndex
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

local function _(p2, p3) --[[ line: 103 | named "insertTabAndReorder" ]]
	-- upvalues: reorderTabs (ref)
	local cloned = table.clone(p2)
	cloned[p3.name] = p3
	
	return reorderTabs(cloned)
end

local _ = function(p4, p5) --[[ line: 113 | named "removeTabAndReorder" ]]
	-- upvalues: reorderTabs (ref)
	local cloned = table.clone(p4)
	cloned[p5.name] = nil
	
	return reorderTabs(cloned)
end

getFixedTabPriority = function(p6) --[[ line: 126 | named "getFixedTabPriority" ]]
	-- upvalues: getFFlagTextChatEnableUniverseChatTabs (ref), friendsChatTabNameModule (ref), fFlagExpChatEnableFriendsTab (ref)
	return if p6 == "RBXGeneral" then 1 elseif p6 == "RBXGlobal" and getFFlagTextChatEnableUniverseChatTabs() then 2 elseif p6 == friendsChatTabNameModule and fFlagExpChatEnableFriendsTab then 3 else nil
end

return function() --[[ line: 137 | named "createChannelTabsStore" ]]
	-- upvalues: createSignal (ref), createComputed (ref), tutilsModule (ref), getFFlagTextChatEnableUniverseChatTabs (ref), reorderTabs (ref), engineFeatureExpChatGlobalChatEngineTelemetryEnabledModule (ref), getFixedTabPriority (write), fFlagExpChatEnableFriendsTab (ref)
	local var15, var16 = createSignal({ selectedTabName = nil, allChannelTabs = {} })
	
	return {
		getChannelTabsState = var15,
		getSelectedTabName = createComputed(function(p7) --[[ line: 146 ]]
			-- upvalues: var15 (ref)
			return var15(p7).selectedTabName
		end),
		getUnreadChannels = createComputed(function(p8) --[[ line: 151 ]]
			-- upvalues: var15 (ref)
			local t = {}
			
			for i, v in pairs(var15(p8).allChannelTabs) do
				if v.HasUnreadMessages then
					t[i] = true
				end
			end
			return t
		end, tutilsModule.deepEqual),
		handleIncomingOrOutgoingMessage = function(a, b, p9) --[[ line: 164 ]]
			-- upvalues: getFFlagTextChatEnableUniverseChatTabs (copy), var16 (ref)
			if not getFFlagTextChatEnableUniverseChatTabs() and not a.TextChannel or b then return end
			local name = nil
			
			if getFFlagTextChatEnableUniverseChatTabs() then
				if p9 then
					name = p9
				elseif a.TextChannel then
					name = a.TextChannel.Name
				else
					return
				end
			end
			var16(function(p10) --[[ line: 186 ]]
				-- upvalues: getFFlagTextChatEnableUniverseChatTabs (copy), a (ref), name (write)
				local cloned = table.clone(p10)
				
				if not getFFlagTextChatEnableUniverseChatTabs() then
					local textChannel = a.TextChannel
					
					if textChannel == nil then
						return p10
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
		setSelectedTab = function(value) --[[ line: 241 ]]
			-- upvalues: var16 (ref)
			var16(function(p11) --[[ line: 242 ]]
				-- upvalues: value (ref)
				local cloned = table.clone(p11)
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
		setTargetChannel = function(value, p12) --[[ line: 257 ]]
			-- upvalues: var16 (ref), reorderTabs (copy), engineFeatureExpChatGlobalChatEngineTelemetryEnabledModule (copy), getFFlagTextChatEnableUniverseChatTabs (copy)
			var16(function(p13) --[[ line: 258 ]]
				-- upvalues: value (ref), p12 (ref), reorderTabs (copy), engineFeatureExpChatGlobalChatEngineTelemetryEnabledModule (copy), getFFlagTextChatEnableUniverseChatTabs (copy)
				local cloned = table.clone(p13)
				
				if value and cloned.allChannelTabs[value] then
					local var23 = cloned.allChannelTabs[value]
					local t = {
						type = var23.type,
						name = var23.name,
						tabIndex = if p12 then 0 else var23.tabIndex,
						HasUnreadMessages = var23.type == "FriendsChat" and var23.HasUnreadMessages
					}
					local cloned_1 = table.clone(cloned.allChannelTabs)
					cloned_1[var23.name] = nil
					local cloned_2 = table.clone(reorderTabs(cloned_1))
					cloned_2[t.name] = t
					cloned.allChannelTabs = reorderTabs(cloned_2)
					cloned.selectedTabName = var23.name
					
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
		addChannelTab = function(p14, p15) --[[ line: 303 ]]
			-- upvalues: var16 (ref), reorderTabs (copy), getFixedTabPriority (copy), fFlagExpChatEnableFriendsTab (copy)
			local name = p14.name
			var16(function(p16) --[[ line: 306 ]]
				-- upvalues: p15 (ref), p14 (ref), name (ref), reorderTabs (copy), getFixedTabPriority (copy), fFlagExpChatEnableFriendsTab (copy)
				local cloned = table.clone(p16)
				local allChannelTabs = cloned.allChannelTabs
				
				if p15 ~= nil then
					local t = {}
					
					for i, v in cloned.allChannelTabs do
						if p15 <= v.tabIndex then
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
					type = p14.type,
					name = name,
					tabIndex = p15 or 0
				}
				local cloned_1 = table.clone(allChannelTabs)
				cloned_1[t.name] = t
				cloned.allChannelTabs = reorderTabs(cloned_1)
				local var32 = getFixedTabPriority(name)
				local var33 = getFixedTabPriority(cloned.selectedTabName)
				
				if cloned.selectedTabName == nil then
					cloned.selectedTabName = if cloned.allChannelTabs.RBXGeneral then "RBXGeneral" else name
					
					return cloned
				elseif var32 ~= nil and var32 < (var33 or 1e999) and (not fFlagExpChatEnableFriendsTab or var33 ~= nil) then
					cloned.selectedTabName = name
				end
				return cloned
			end)
		end,
		removeChannelTab = function(p17) --[[ line: 353 ]]
			-- upvalues: var16 (ref)
			var16(function(p18) --[[ line: 354 ]]
				-- upvalues: p17 (ref)
				local cloned = table.clone(p18)
				cloned.allChannelTabs = table.clone(cloned.allChannelTabs)
				cloned.allChannelTabs[p17] = nil
				
				if cloned.selectedTabName == p17 then
					local var35 = 1e999
					local var36 = nil
					
					for i, v in pairs(cloned.allChannelTabs) do
						if v.tabIndex < var35 then
							var35 = v.tabIndex
							var36 = i
						end
					end
					cloned.selectedTabName = var36
				end
				return cloned
			end)
		end,
		handleChannelRemoved = function(p19) --[[ line: 378 ]]
			-- upvalues: var16 (ref), reorderTabs (copy)
			var16(function(p20) --[[ line: 379 ]]
				-- upvalues: p19 (ref), reorderTabs (copy)
				local var37 = p20.allChannelTabs[p19]
				
				if var37 == nil then
					return p20
				end
				local cloned = table.clone(p20)
				local cloned_1 = table.clone(cloned.allChannelTabs)
				cloned_1[var37.name] = nil
				cloned.allChannelTabs = reorderTabs(cloned_1)
				
				if var37.name == cloned.selectedTabName then
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
		markChannelUnread = function(p21) --[[ line: 213 ]]
			-- upvalues: var16 (ref)
			var16(function(p22) --[[ line: 214 ]]
				-- upvalues: p21 (ref)
				local cloned = table.clone(p22)
				
				if cloned.allChannelTabs[p21] and p21 ~= cloned.selectedTabName then
					cloned.allChannelTabs = table.clone(cloned.allChannelTabs)
					local cloned_1 = table.clone(cloned.allChannelTabs[p21])
					cloned_1.HasUnreadMessages = true
					cloned.allChannelTabs[p21] = cloned_1
				end
				return cloned
			end)
		end,
		setChannelUnreadStatus = function(value, p23) --[[ line: 226 ]]
			-- upvalues: var16 (ref)
			var16(function(p24) --[[ line: 227 ]]
				-- upvalues: value (ref), p23 (ref)
				if p24.allChannelTabs[value] == nil then
					return p24
				end
				local cloned = table.clone(p24)
				cloned.allChannelTabs = table.clone(cloned.allChannelTabs)
				local cloned_1 = table.clone(cloned.allChannelTabs[value])
				cloned_1.HasUnreadMessages = p23
				cloned.allChannelTabs[value] = cloned_1
				
				return cloned
			end)
		end
	}
end