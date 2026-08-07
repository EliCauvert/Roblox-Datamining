local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local signalsModule = require(parent.Signals)
local tutilsModule = require(parent.tutils)
local expChatSharedModule = require(parent.ExpChatShared)
local sharedFlagsModule = require(parent.SharedFlags)
local engineFeatureExpChatGlobalChatEngineTelemetryEnabledModule = require(expChat.Flags.EngineFeatureExpChatGlobalChatEngineTelemetryEnabled)
local getFFlagTextChatEnableUniverseChatTabs = expChatSharedModule.Flags.GetFFlagTextChatEnableUniverseChatTabs
local fFlagExpChatEnableFriendsTab = sharedFlagsModule.FFlagExpChatEnableFriendsTab
local createSignal = signalsModule.createSignal
local createComputed = signalsModule.createComputed
local getFixedTabPriority = nil

local function reorderTabs(value) --[[ line: 67 ]]
	-- upvalues: getFixedTabPriority (write)
	local cloned = table.clone(value)
	local t = {}
	
	for i, v in pairs(cloned) do
		table.insert(t, v)
	end
	table.sort(t, function(p0, p1) --[[ line: 75 ]]
		-- upvalues: getFixedTabPriority (copy)
		local var10 = getFixedTabPriority(p0.name)
		local var11 = getFixedTabPriority(p1.name)
		
		return if var10 and var11 then var10 < var11 elseif var10 then true elseif var11 then false else p0.tabIndex < p1.tabIndex
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

local function _(p2, p3) --[[ line: 102 | named "insertTabAndReorder" ]]
	-- upvalues: reorderTabs (ref)
	local cloned = table.clone(p2)
	cloned[p3.name] = p3
	
	return reorderTabs(cloned)
end

local _ = function(p4, p5) --[[ line: 112 | named "removeTabAndReorder" ]]
	-- upvalues: reorderTabs (ref)
	local cloned = table.clone(p4)
	cloned[p5.name] = nil
	
	return reorderTabs(cloned)
end

getFixedTabPriority = function(p6) --[[ line: 125 | named "getFixedTabPriority" ]]
	-- upvalues: getFFlagTextChatEnableUniverseChatTabs (ref), fFlagExpChatEnableFriendsTab (ref)
	return if p6 == "RBXGeneral" then 1 elseif p6 == "RBXGlobal" and getFFlagTextChatEnableUniverseChatTabs() then 2 elseif p6 == "FriendsChat" and fFlagExpChatEnableFriendsTab then 3 else nil
end

return function() --[[ line: 136 | named "createChannelTabsStore" ]]
	-- upvalues: createSignal (ref), createComputed (ref), tutilsModule (ref), getFFlagTextChatEnableUniverseChatTabs (ref), reorderTabs (ref), engineFeatureExpChatGlobalChatEngineTelemetryEnabledModule (ref), getFixedTabPriority (write), fFlagExpChatEnableFriendsTab (ref)
	local var14, var15 = createSignal({ selectedTabName = nil, allChannelTabs = {} })
	
	return {
		getChannelTabsState = var14,
		getSelectedTabName = createComputed(function(p7) --[[ line: 145 ]]
			-- upvalues: var14 (ref)
			return var14(p7).selectedTabName
		end),
		getUnreadChannels = createComputed(function(p8) --[[ line: 150 ]]
			-- upvalues: var14 (ref)
			local t = {}
			
			for i, v in pairs(var14(p8).allChannelTabs) do
				if v.HasUnreadMessages then
					t[i] = true
				end
			end
			return t
		end, tutilsModule.deepEqual),
		handleIncomingOrOutgoingMessage = function(a, b, p9) --[[ line: 163 ]]
			-- upvalues: getFFlagTextChatEnableUniverseChatTabs (copy), var15 (ref)
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
			var15(function(p10) --[[ line: 185 ]]
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
		setSelectedTab = function(value) --[[ line: 240 ]]
			-- upvalues: var15 (ref)
			var15(function(p11) --[[ line: 241 ]]
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
		setTargetChannel = function(value, p12) --[[ line: 256 ]]
			-- upvalues: var15 (ref), reorderTabs (copy), engineFeatureExpChatGlobalChatEngineTelemetryEnabledModule (copy), getFFlagTextChatEnableUniverseChatTabs (copy)
			var15(function(p13) --[[ line: 257 ]]
				-- upvalues: value (ref), p12 (ref), reorderTabs (copy), engineFeatureExpChatGlobalChatEngineTelemetryEnabledModule (copy), getFFlagTextChatEnableUniverseChatTabs (copy)
				local cloned = table.clone(p13)
				
				if value and cloned.allChannelTabs[value] then
					local var22 = cloned.allChannelTabs[value]
					local t = {
						type = var22.type,
						name = var22.name,
						tabIndex = if p12 then 0 else var22.tabIndex,
						HasUnreadMessages = var22.type == "FriendsChat" and var22.HasUnreadMessages
					}
					local cloned_1 = table.clone(cloned.allChannelTabs)
					cloned_1[var22.name] = nil
					local cloned_2 = table.clone(reorderTabs(cloned_1))
					cloned_2[t.name] = t
					cloned.allChannelTabs = reorderTabs(cloned_2)
					cloned.selectedTabName = var22.name
					
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
		addChannelTab = function(p14, p15) --[[ line: 302 ]]
			-- upvalues: var15 (ref), reorderTabs (copy), getFixedTabPriority (copy), fFlagExpChatEnableFriendsTab (copy)
			local name = p14.name
			var15(function(p16) --[[ line: 305 ]]
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
				local var31 = getFixedTabPriority(name)
				local var32 = getFixedTabPriority(cloned.selectedTabName)
				
				if cloned.selectedTabName == nil then
					cloned.selectedTabName = if cloned.allChannelTabs.RBXGeneral then "RBXGeneral" else name
					
					return cloned
				elseif var31 ~= nil and var31 < (var32 or 1e999) and (not fFlagExpChatEnableFriendsTab or var32 ~= nil) then
					cloned.selectedTabName = name
				end
				return cloned
			end)
		end,
		removeChannelTab = function(p17) --[[ line: 352 ]]
			-- upvalues: var15 (ref)
			var15(function(p18) --[[ line: 353 ]]
				-- upvalues: p17 (ref)
				local cloned = table.clone(p18)
				cloned.allChannelTabs = table.clone(cloned.allChannelTabs)
				cloned.allChannelTabs[p17] = nil
				
				if cloned.selectedTabName == p17 then
					local var34 = 1e999
					local var35 = nil
					
					for i, v in pairs(cloned.allChannelTabs) do
						if v.tabIndex < var34 then
							var34 = v.tabIndex
							var35 = i
						end
					end
					cloned.selectedTabName = var35
				end
				return cloned
			end)
		end,
		handleChannelRemoved = function(p19) --[[ line: 377 ]]
			-- upvalues: var15 (ref), reorderTabs (copy)
			var15(function(p20) --[[ line: 378 ]]
				-- upvalues: p19 (ref), reorderTabs (copy)
				local var36 = p20.allChannelTabs[p19]
				
				if var36 == nil then
					return p20
				end
				local cloned = table.clone(p20)
				local cloned_1 = table.clone(cloned.allChannelTabs)
				cloned_1[var36.name] = nil
				cloned.allChannelTabs = reorderTabs(cloned_1)
				
				if var36.name == cloned.selectedTabName then
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
		markChannelUnread = function(p21) --[[ line: 212 ]]
			-- upvalues: var15 (ref)
			var15(function(p22) --[[ line: 213 ]]
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
		setChannelUnreadStatus = function(value, p23) --[[ line: 225 ]]
			-- upvalues: var15 (ref)
			var15(function(p24) --[[ line: 226 ]]
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