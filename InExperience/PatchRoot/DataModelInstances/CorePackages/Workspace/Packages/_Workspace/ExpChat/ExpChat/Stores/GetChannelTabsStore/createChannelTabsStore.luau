local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local signalsModule = require(parent.Signals)
local tutilsModule = require(parent.tutils)
local engineFeatureExpChatGlobalChatEngineTelemetryEnabledModule = require(expChat.Flags.EngineFeatureExpChatGlobalChatEngineTelemetryEnabled)
local getFFlagTextChatEnableUniverseChatTabs = require(parent.ExpChatShared).Flags.GetFFlagTextChatEnableUniverseChatTabs
local createSignal = signalsModule.createSignal
local createComputed = signalsModule.createComputed

local function reorderTabs(value) --[[ line: 52 ]]
	local cloned = table.clone(value)
	local t = {}
	
	for i, v in pairs(cloned) do
		table.insert(t, v)
	end
	table.sort(t, function(p0, p1) --[[ line: 61 ]]
		return p0.tabIndex < p1.tabIndex
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

local function _(p2, p3) --[[ line: 78 | named "insertTabAndReorder" ]]
	-- upvalues: reorderTabs (ref)
	local cloned = table.clone(p2)
	cloned[p3.name] = p3
	
	return reorderTabs(cloned)
end

local _ = function(p4, p5) --[[ line: 88 | named "removeTabAndReorder" ]]
	-- upvalues: reorderTabs (ref)
	local cloned = table.clone(p4)
	cloned[p5.name] = nil
	
	return reorderTabs(cloned)
end

return function() --[[ line: 98 | named "createChannelTabsStore" ]]
	-- upvalues: createSignal (ref), createComputed (ref), tutilsModule (ref), getFFlagTextChatEnableUniverseChatTabs (ref), reorderTabs (ref), engineFeatureExpChatGlobalChatEngineTelemetryEnabledModule (ref)
	local var9, var10 = createSignal({ selectedTabName = nil, allChannelTabs = {} })
	
	return {
		getChannelTabsState = var9,
		getSelectedTabName = createComputed(function(p6) --[[ line: 107 ]]
			-- upvalues: var9 (ref)
			return var9(p6).selectedTabName
		end),
		getUnreadChannels = createComputed(function(p7) --[[ line: 112 ]]
			-- upvalues: var9 (ref)
			local t = {}
			
			for i, v in pairs(var9(p7).allChannelTabs) do
				if v.HasUnreadMessages then
					t[i] = true
				end
			end
			return t
		end, tutilsModule.deepEqual),
		handleIncomingOrOutgoingMessage = function(a, b, p8) --[[ line: 125 ]]
			-- upvalues: getFFlagTextChatEnableUniverseChatTabs (copy), var10 (ref)
			if not getFFlagTextChatEnableUniverseChatTabs() and not a.TextChannel or b then return end
			local name = nil
			
			if getFFlagTextChatEnableUniverseChatTabs() then
				if p8 then
					name = p8
				elseif a.TextChannel then
					name = a.TextChannel.Name
				else
					return
				end
			end
			var10(function(p9) --[[ line: 147 ]]
				-- upvalues: getFFlagTextChatEnableUniverseChatTabs (copy), a (ref), name (write)
				local cloned = table.clone(p9)
				
				if not getFFlagTextChatEnableUniverseChatTabs() then
					local textChannel = a.TextChannel
					
					if textChannel == nil then
						return p9
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
		setSelectedTab = function(value) --[[ line: 187 ]]
			-- upvalues: var10 (ref)
			var10(function(p10) --[[ line: 188 ]]
				-- upvalues: value (ref)
				local cloned = table.clone(p10)
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
		setTargetChannel = function(value, p11) --[[ line: 203 ]]
			-- upvalues: var10 (ref), getFFlagTextChatEnableUniverseChatTabs (copy), reorderTabs (copy), engineFeatureExpChatGlobalChatEngineTelemetryEnabledModule (copy)
			var10(function(p12) --[[ line: 204 ]]
				-- upvalues: getFFlagTextChatEnableUniverseChatTabs (copy), value (ref), p11 (ref), reorderTabs (copy), engineFeatureExpChatGlobalChatEngineTelemetryEnabledModule (copy)
				local var18
				local cloned = table.clone(p12)
				
				if getFFlagTextChatEnableUniverseChatTabs() then
					if value and cloned.allChannelTabs[value] then
						local var17 = cloned.allChannelTabs[value]
						local tabIndex = var17.tabIndex
						
						if p11 then
							var18 = cloned.allChannelTabs.RBXGeneral ~= nil
							local var19 = cloned.allChannelTabs.RBXGlobal ~= nil
							tabIndex = if var17.name == "RBXGeneral" then 1 elseif var17.name == "RBXGlobal" then if var18 then 2 else 1 elseif var18 and var19 then 3 elseif var18 or var19 then 2 else 1
						end
						var18 = {
							HasUnreadMessages = false,
							type = var17.type,
							name = var17.name,
							tabIndex = tabIndex
						}
						local cloned_1 = table.clone(cloned.allChannelTabs)
						cloned_1[var17.name] = nil
						local var21 = reorderTabs(cloned_1)
						local var22 = var21
						
						if p11 and var17.name == "RBXGlobal" and (tabIndex == 2 and var21.RBXGeneral ~= nil) then
							var22 = table.clone(var21)
							
							for i, v in pairs(var21) do
								if i ~= "RBXGeneral" and tabIndex <= v.tabIndex then
									local cloned_2 = table.clone(v)
									cloned_2.tabIndex = v.tabIndex + 1
									var22[i] = cloned_2
								end
							end
						end
						local cloned_2 = table.clone(var22)
						cloned_2[var18.name] = var18
						cloned.allChannelTabs = reorderTabs(cloned_2)
						cloned.selectedTabName = var17.name
						
						return cloned
					elseif engineFeatureExpChatGlobalChatEngineTelemetryEnabledModule then
						if value then
							cloned.selectedTabName = value
							
							return cloned
						end
					else
						cloned.selectedTabName = value
						
						return cloned
					end
				elseif value and cloned.allChannelTabs[value] then
					local var25 = cloned.allChannelTabs[value]
					var18 = {
						HasUnreadMessages = false,
						type = var25.type,
						name = var25.name,
						tabIndex = if p11 then if var25.name == "RBXGeneral" then 1 elseif cloned.allChannelTabs.RBXGeneral ~= nil then 2 else 1 else var25.tabIndex
					}
					local cloned_1 = table.clone(cloned.allChannelTabs)
					cloned_1[var25.name] = nil
					local cloned_2 = table.clone(reorderTabs(cloned_1))
					cloned_2[var18.name] = var18
					cloned.allChannelTabs = reorderTabs(cloned_2)
					cloned.selectedTabName = var25.name
					
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
		addChannelTab = function(p13, p14) --[[ line: 306 ]]
			-- upvalues: var10 (ref), getFFlagTextChatEnableUniverseChatTabs (copy)
			local name = p13.name
			var10(function(p15) --[[ line: 309 ]]
				-- upvalues: p14 (ref), getFFlagTextChatEnableUniverseChatTabs (copy), name (ref), p13 (ref)
				local cloned = table.clone(p15)
				cloned.allChannelTabs = table.clone(cloned.allChannelTabs)
				cloned.allChannelTabs[name] = {
					HasUnreadMessages = false,
					type = p13.type,
					name = name,
					tabIndex = if getFFlagTextChatEnableUniverseChatTabs() and name == "RBXGlobal" then if cloned.allChannelTabs.RBXGeneral then 2 else 1 else p14
				}
				
				if getFFlagTextChatEnableUniverseChatTabs() then
					if not cloned.selectedTabName then
						cloned.selectedTabName = if cloned.allChannelTabs.RBXGeneral then "RBXGeneral" else name
						
						return cloned
					elseif name == "RBXGeneral" and cloned.selectedTabName == "RBXGlobal" then
						cloned.selectedTabName = "RBXGeneral"
						
						return cloned
					end
				elseif not cloned.selectedTabName then
					cloned.selectedTabName = name
				end
				return cloned
			end)
		end,
		removeChannelTab = function(p16) --[[ line: 339 ]]
			-- upvalues: var10 (ref)
			var10(function(p17) --[[ line: 340 ]]
				-- upvalues: p16 (ref)
				local cloned = table.clone(p17)
				cloned.allChannelTabs = table.clone(cloned.allChannelTabs)
				cloned.allChannelTabs[p16] = nil
				
				if cloned.selectedTabName == p16 then
					local var30 = 1e999
					local var31 = nil
					
					for i, v in pairs(cloned.allChannelTabs) do
						if v.tabIndex < var30 then
							var30 = v.tabIndex
							var31 = i
						end
					end
					cloned.selectedTabName = var31
				end
				return cloned
			end)
		end,
		handleChannelRemoved = function(p18) --[[ line: 364 ]]
			-- upvalues: var10 (ref), reorderTabs (copy)
			var10(function(p19) --[[ line: 365 ]]
				-- upvalues: p18 (ref), reorderTabs (copy)
				local var32 = p19.allChannelTabs[p18]
				
				if var32 == nil then
					return p19
				end
				local cloned = table.clone(p19)
				local cloned_1 = table.clone(cloned.allChannelTabs)
				cloned_1[var32.name] = nil
				cloned.allChannelTabs = reorderTabs(cloned_1)
				
				if var32.name == cloned.selectedTabName then
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
		markChannelUnread = function(p20) --[[ line: 174 ]]
			-- upvalues: var10 (ref)
			var10(function(p21) --[[ line: 175 ]]
				-- upvalues: p20 (ref)
				local cloned = table.clone(p21)
				
				if cloned.allChannelTabs[p20] and p20 ~= cloned.selectedTabName then
					cloned.allChannelTabs = table.clone(cloned.allChannelTabs)
					local cloned_1 = table.clone(cloned.allChannelTabs[p20])
					cloned_1.HasUnreadMessages = true
					cloned.allChannelTabs[p20] = cloned_1
				end
				return cloned
			end)
		end
	}
end