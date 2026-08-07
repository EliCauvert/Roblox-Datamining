local chatService = game:GetService("Chat")
game:DefineFastFlag("DebugExpChatAlwaysRunTCS", false)
local expChatMigrationReplicationFix = game:DefineFastFlag("ExpChatMigrationReplicationFix", false)
local robloxReplicatedStorageService = game:GetService("RobloxReplicatedStorage")
local isAutoMigrated = chatService.IsAutoMigrated

if game:GetService("RunService"):IsServer() then
	robloxReplicatedStorageService:SetAttribute("ChatMigratedToExpChat", chatService.IsAutoMigrated)
	chatService:GetPropertyChangedSignal("IsAutoMigrated"):Connect(function() --[[ line: 17 ]]
		-- upvalues: robloxReplicatedStorageService (ref), chatService (ref), isAutoMigrated (write)
		robloxReplicatedStorageService:SetAttribute("ChatMigratedToExpChat", chatService.IsAutoMigrated)
		isAutoMigrated = chatService.IsAutoMigrated
	end)
else
	isAutoMigrated = robloxReplicatedStorageService:GetAttribute("ChatMigratedToExpChat") == true
	robloxReplicatedStorageService:GetAttributeChangedSignal("ChatMigratedToExpChat"):Connect(function() --[[ line: 23 ]]
		-- upvalues: isAutoMigrated (write), robloxReplicatedStorageService (ref), chatService (ref)
		isAutoMigrated = robloxReplicatedStorageService:GetAttribute("ChatMigratedToExpChat") == true
		chatService.IsAutoMigrated = isAutoMigrated
	end)
end
local function _() --[[ line: 29 | named "IsChatAutoMigrated" ]]
	-- upvalues: expChatMigrationReplicationFix (ref), chatService (ref), isAutoMigrated (write)
	return if game:GetEngineFeature("ChatServiceCompatibilityForAll") then true elseif expChatMigrationReplicationFix and game:GetEngineFeature("TCSMigrationReplicationFix") then chatService.IsAutoMigrated else isAutoMigrated
end

return function() --[[ line: 41 ]]
	-- upvalues: expChatMigrationReplicationFix (ref), chatService (ref), isAutoMigrated (write)
	return (if game:GetEngineFeature("ChatServiceCompatibilityForAll") then true elseif expChatMigrationReplicationFix and game:GetEngineFeature("TCSMigrationReplicationFix") then chatService.IsAutoMigrated else isAutoMigrated) or game:GetFastFlag("DebugExpChatAlwaysRunTCS")
end