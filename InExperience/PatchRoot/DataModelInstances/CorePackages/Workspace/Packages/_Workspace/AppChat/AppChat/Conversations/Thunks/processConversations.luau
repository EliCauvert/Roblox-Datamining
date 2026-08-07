local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local networkingPresenceModule = require(appChat.Http.NetworkingPresence)
local llama = require(parent.LuaSocialLibrariesDeps).llama
local userModel = require(parent.UserLib).Models.UserModel
local addUsers = require(parent.UserLib).Actions.AddUsers
local fFlagAppChatPresenceStoreMigrationModule = require(appChat.Flags.FFlagAppChatPresenceStoreMigration)

local function extractConversationsAndUsers(p0, p1) --[[ line: 10 ]]
	-- upvalues: userModel (ref), llama (ref)
	local t = {}
	local t_1 = {}
	
	for i, v in p0 do
		local v_1
		table.insert(t, v.id)
		
		if not v.participant_user_ids then
			for i_1, v_1 in ipairs(v.participants) do
				if not t_1[tostring(v_1.targetId)] then
					local targetId = p1[tostring(v_1.targetId)] or userModel.fromDataTable({
						isFriend = false,
						id = v_1.targetId,
						name = v_1.name,
						displayName = v_1.displayName
					})
					t_1[targetId.id] = targetId
				end
			end
		end
		for i_1, v_1 in v.participant_user_ids do
			v_1 = tostring(v_1)
			
			if not t_1[v_1] then
				local userData = v.user_data
				
				if userData then
					local var6 = userData[v_1]
					
					if var6 then
						local var7 = p1[v_1]
						local var8 = userModel.fromDataTable({
							id = var6.id,
							name = var6.name,
							displayName = if var7 then var7.displayName else var6.display_name,
							isFriend = if var7 then var7.isFriend else false
						})
						t_1[var8.id] = var8
					end
				end
			end
		end
	end
	return t, t_1, llama.Dictionary.keys(t_1)
end

return function(p2) --[[ line: 63 ]]
	-- upvalues: extractConversationsAndUsers (ref), addUsers (ref), fFlagAppChatPresenceStoreMigrationModule (ref), networkingPresenceModule (ref)
	return function(p3) --[[ line: 64 ]]
		-- upvalues: p2 (ref), extractConversationsAndUsers (copy), addUsers (copy), fFlagAppChatPresenceStoreMigrationModule (copy), networkingPresenceModule (copy)
		if not p2 then return end
		local _, var10, var11 = extractConversationsAndUsers(p2, p3:getState().Users or {})
		p3:dispatch(addUsers(var10))
		
		if not fFlagAppChatPresenceStoreMigrationModule then
			p3:dispatch(networkingPresenceModule.GetPresencesFromUserIds.API(var11)):catch(function(p4) --[[ line: 74 ]]
				warn("NetworkingPresence failure in processConversations, Status: " .. tostring(p4))
			end)
		end
	end
end