local runService = game:GetService("RunService")
while not runService:IsRunning() do
	wait()
end
local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local corePackagesService = game:GetService("CorePackages")
local robloxReplicatedStorageService = game:GetService("RobloxReplicatedStorage")
local scriptContextService = game:GetService("ScriptContext")
local coreGuiService = game:GetService("CoreGui")
local getFFlagDisplayServerChannel = require(corePackagesService.Workspace.Packages.SharedFlags).GetFFlagDisplayServerChannel
local getFFlagExpChatAlwaysRunTCS = require(corePackagesService.Workspace.Packages.SharedFlags).getFFlagExpChatAlwaysRunTCS
local getFFlagEnableReferredPlayerJoinRemoteEvent = require(corePackagesService.Workspace.Packages.SharedFlags).GetFFlagEnableReferredPlayerJoinRemoteEvent
local debugLogExpchatMigration = game:DefineFastFlag("DebugLogExpchatMigration", false)
local fFlagAXEnableInspectAndBuyBulkPurchase = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagAXEnableInspectAndBuyBulkPurchase
local fFlagPlatformLeaderboardRccEnabled = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagPlatformLeaderboardRccEnabled
local emoteSkinningDisableEnabled = game:DefineFastFlag("EmoteSkinningDisableEnabled", false)
local robloxGui = coreGuiService:WaitForChild("RobloxGui", 1e999)
assert(robloxGui ~= nil, "RobloxGui should exist")
local serverUtilModule = require(robloxGui.Modules.Server.ServerUtil)

if serverUtilModule.getFFlagServerCoreScriptSourceCode() then
	serverUtilModule.initSourceCodeFolder()
end
require(robloxGui.Modules.Server.RemoteAllowList)()

if game:DefineFastFlag("OpenCloudCoreScriptLuaEnabled", false) then
	scriptContextService:AddCoreScriptLocal("ServerCoreScripts/OpenCloud/OpenCloudV2", script.Parent)
end
if game:DefineFastFlag("OpenCloudClientLibraryCoreScriptEnabled", false) then
	scriptContextService:AddCoreScriptLocal("ServerCoreScripts/OpenCloud/OpenCloudClientLibraryCoreScript", script.Parent)
end
scriptContextService:AddCoreScriptLocal("ServerCoreScripts/ServerInGameMenu", script.Parent)
scriptContextService:AddCoreScriptLocal("ServerCoreScripts/ServerSocialScript", script.Parent)

if emoteSkinningDisableEnabled then
	scriptContextService:AddCoreScriptLocal("ServerCoreScripts/EmoteSkinningDisable", script.Parent)
end
if fFlagPlatformLeaderboardRccEnabled then
	scriptContextService:AddCoreScriptLocal("ServerCoreScripts/ServerPlatformLeaderboard", script.Parent)
end
scriptContextService:AddCoreScriptLocal("ServerCoreScripts/ServerLeaderstats", script.Parent)
scriptContextService:AddCoreScriptLocal("ServerCoreScripts/PlayerRagdollRigCreator", script.Parent)
game:DefineFastFlag("DebugFreeCameraForAdmins", true)

if fFlagAXEnableInspectAndBuyBulkPurchase then
	scriptContextService:AddCoreScriptLocal("ServerCoreScripts/ServerBulkPurchaseEvent", script.Parent)
end
local sendChatAnalyticsModule = require(robloxGui.Modules.Server.SendChatAnalytics)
scriptContextService:AddCoreScriptLocal("ServerCoreScripts/ServerDialog", script.Parent)
local getServerVersion = Instance.new("RemoteFunction")
getServerVersion.Name = "GetServerVersion"
getServerVersion.Parent = robloxReplicatedStorageService
local getServerChannel = nil

if getFFlagDisplayServerChannel() then
	getServerChannel = Instance.new("RemoteFunction")
	getServerChannel.Name = "GetServerChannel"
	getServerChannel.Parent = robloxReplicatedStorageService
end
local function getServerChannel_1()
	-- upvalues: runService (ref)
	return runService:GetRobloxClientChannel()
end

function getServerVersion.getServerVersion()
	-- upvalues: runService (ref)
	local robloxVersion = runService:GetRobloxVersion()
	local var16 = if robloxVersion == "?" then "DEBUG_SERVER" elseif runService:IsStudio() then "ROBLOX Studio" else robloxVersion
	
	return if runService:IsStudio() then var16 else string.format("%s (%.6s)", var16, runService.ClientGitHash)
end

if getFFlagDisplayServerChannel() then
	getServerChannel.OnServerInvoke = getServerChannel_1
end
if (function()
	return game:GetService("Chat").LoadDefaultChat and (game:GetService("TextChatService").ChatVersion == Enum.ChatVersion.LegacyChatService and not game:GetService("GuiService"):IsTenFootInterface())
end)() then
	require(game:GetService("CoreGui").RobloxGui.Modules.Server.ClientChat.ChatWindowInstaller)()
	require(game:GetService("CoreGui").RobloxGui.Modules.Server.ServerChat.ChatServiceInstaller)()
else
	sendChatAnalyticsModule("NoLoadDefaultChat")
end
if game:GetFastFlag("DebugFreeCameraForAdmins") then
	require(game:GetService("CoreGui").RobloxGui.Modules.Server.FreeCamera.FreeCameraInstaller)()
end
require(game:GetService("CoreGui").RobloxGui.Modules.Server.ServerSound.SoundDispatcherInstaller)()
require(game:GetService("CoreGui").RobloxGui.Modules.Server.UGCValidation.UGCValidationFunctionInstaller)()
local chatVersion = game:GetService("TextChatService").ChatVersion

if getFFlagExpChatAlwaysRunTCS() or chatVersion == Enum.ChatVersion.TextChatService then
	require(corePackagesService.Workspace.Packages.ExpChatServer).mountServerApp({})
elseif chatVersion == Enum.ChatVersion.LegacyChatService then
	local chatService = game:GetService("Chat")
	chatService:GetPropertyChangedSignal("IsAutoMigrated"):Connect(function()
		-- upvalues: chatService (ref), debugLogExpchatMigration (ref), corePackagesService (ref)
		if chatService.IsAutoMigrated then
			if debugLogExpchatMigration then
				print("Migrating to ExpChat")
			end
			require(corePackagesService.Workspace.Packages.ExpChatServer).mountServerApp({})
		end
	end)
end
if runService:IsStudio() == false then
	rbxAnalyticsService:ReportCounter(if chatVersion == Enum.ChatVersion.TextChatService then "textChatServiceChatVersionTextChatService" else "textChatServiceChatVersionLegacy", 1)
end
if game:DefineFastFlag("VersionedFlags_Dev", false) then
	scriptContextService:AddCoreScriptLocal("ServerCoreScripts/VersionedFlagTest", script.Parent)
end
if game:DefineFastFlag("AppBuildReloadRemote", false) then
	scriptContextService:AddCoreScriptLocal("ServerCoreScripts/ServerBuildExperiencePlaytestTeleport", script.Parent)
end
scriptContextService:AddCoreScriptLocal("ServerCoreScripts/PlayerViewCapability", script.Parent)

if require(robloxGui.Modules.Common.Flags.GetFFlagEnableVoiceDefaultServerScript)() then
	scriptContextService:AddCoreScriptLocal("ServerCoreScripts/VoiceDefault", script.Parent)
end
if getFFlagEnableReferredPlayerJoinRemoteEvent() then
	scriptContextService:AddCoreScriptLocal("ServerCoreScripts/ReferredByPlayerRemoteEvent", script.Parent)
end
require(game:GetService("CoreGui").RobloxGui.Modules.Server.VR.VRAvatarGesturesServer).new()