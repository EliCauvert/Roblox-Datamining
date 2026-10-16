local Chat = game:GetService("Chat")
game:DefineFastFlag("DebugExpChatAlwaysRunTCS", false)
local ExpChatMigrationReplicationFix = game:DefineFastFlag("ExpChatMigrationReplicationFix", false)
local RobloxReplicatedStorage = game:GetService("RobloxReplicatedStorage")
local IsAutoMigrated = Chat.IsAutoMigrated

if game:GetService("RunService"):IsServer() then
	RobloxReplicatedStorage:SetAttribute("ChatMigratedToExpChat", Chat.IsAutoMigrated)
	Chat:GetPropertyChangedSignal("IsAutoMigrated"):Connect(function() --[[ Line: 17 ]]
		-- upvalues: RobloxReplicatedStorage (copy), Chat (copy), IsAutoMigrated (ref)
		RobloxReplicatedStorage:SetAttribute("ChatMigratedToExpChat", Chat.IsAutoMigrated)
		IsAutoMigrated = Chat.IsAutoMigrated
	end)
else
	IsAutoMigrated = RobloxReplicatedStorage:GetAttribute("ChatMigratedToExpChat") == true
	RobloxReplicatedStorage:GetAttributeChangedSignal("ChatMigratedToExpChat"):Connect(function() --[[ Line: 23 ]]
		-- upvalues: IsAutoMigrated (ref), RobloxReplicatedStorage (copy), Chat (copy)
		IsAutoMigrated = RobloxReplicatedStorage:GetAttribute("ChatMigratedToExpChat") == true
		Chat.IsAutoMigrated = IsAutoMigrated
	end)
end
local function _() --[[ Line: 29 | Named "IsChatAutoMigrated" ]]
	-- upvalues: ExpChatMigrationReplicationFix (copy), Chat (copy), IsAutoMigrated (ref)
	return if game:GetEngineFeature("ChatServiceCompatibilityForAll") then true elseif ExpChatMigrationReplicationFix and game:GetEngineFeature("TCSMigrationReplicationFix") then Chat.IsAutoMigrated else IsAutoMigrated
end

return function() --[[ Line: 41 ]]
	-- upvalues: ExpChatMigrationReplicationFix (copy), Chat (copy), IsAutoMigrated (ref)
	return (if game:GetEngineFeature("ChatServiceCompatibilityForAll") then true elseif ExpChatMigrationReplicationFix and game:GetEngineFeature("TCSMigrationReplicationFix") then Chat.IsAutoMigrated else IsAutoMigrated) or game:GetFastFlag("DebugExpChatAlwaysRunTCS")
end