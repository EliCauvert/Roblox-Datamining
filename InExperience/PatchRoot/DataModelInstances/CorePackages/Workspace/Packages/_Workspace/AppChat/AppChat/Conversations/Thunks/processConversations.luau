local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local networkingPresenceModule = require(appChat.Http.NetworkingPresence)
local llama = require(parent.LuaSocialLibrariesDeps).llama
local userModel = require(parent.UserLib).Models.UserModel
local addUsers = require(parent.UserLib).Actions.AddUsers
local fFlagAppChatPresenceStoreMigrationModule = require(appChat.Flags.FFlagAppChatPresenceStoreMigration)

local function extractConversationsAndUsers(p1, p2)
	-- upvalues: userModel (ref), llama (ref)
	local t = {}
	local t_1 = {}
	
	for i, v in p1 do
		local v_1
		table.insert(t, v.id)
		
		if not v.participant_user_ids then
			for i_1, v_1 in ipairs(v.participants) do
				if not t_1[tostring(v_1.targetId)] then
					local targetId = p2[tostring(v_1.targetId)] or userModel.fromDataTable({
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
					local var1 = userData[v_1]
					
					if var1 then
						local var2 = p2[v_1]
						local var3 = userModel.fromDataTable({
							id = var1.id,
							name = var1.name,
							displayName = if var2 then var2.displayName else var1.display_name,
							isFriend = if var2 then var2.isFriend else false
						})
						t_1[var3.id] = var3
					end
				end
			end
		end
	end
	return t, t_1, llama.Dictionary.keys(t_1)
end

return function(p3)
	-- upvalues: extractConversationsAndUsers (ref), addUsers (ref), fFlagAppChatPresenceStoreMigrationModule (ref), networkingPresenceModule (ref)
	return function(p4)
		-- upvalues: p3 (ref), extractConversationsAndUsers (copy), addUsers (copy), fFlagAppChatPresenceStoreMigrationModule (copy), networkingPresenceModule (copy)
		if not p3 then return end
		local _, var4, var5 = extractConversationsAndUsers(p3, p4:getState().Users or {})
		p4:dispatch(addUsers(var4))
		
		if not fFlagAppChatPresenceStoreMigrationModule then
			p4:dispatch(networkingPresenceModule.GetPresencesFromUserIds.API(var5)):catch(function(p5)
				warn("NetworkingPresence failure in processConversations, Status: " .. tostring(p5))
			end)
		end
	end
end