local RunService = game:GetService("RunService")
while not RunService:IsRunning() do
	wait()
end
local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local CorePackages = game:GetService("CorePackages")
local RobloxReplicatedStorage = game:GetService("RobloxReplicatedStorage")
local ScriptContext = game:GetService("ScriptContext")
local GetFFlagDisplayServerChannelFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagDisplayServerChannel
local GetFFlagExpChatAlwaysRunTCSFunction = require(CorePackages.Workspace.Packages.SharedFlags).getFFlagExpChatAlwaysRunTCS
local GetFFlagEnableReferredPlayerJoinRemoteEventFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagEnableReferredPlayerJoinRemoteEvent
local DebugLogExpchatMigration = game:DefineFastFlag("DebugLogExpchatMigration", false)
local FFlagAXEnableInspectAndBuyBulkPurchase = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXEnableInspectAndBuyBulkPurchase
local FFlagPlatformLeaderboardRccEnabled = require(CorePackages.Workspace.Packages.SharedFlags).FFlagPlatformLeaderboardRccEnabled
local DebugServerPlatformLeaderboardDevMock = game:DefineFastFlag("DebugServerPlatformLeaderboardDevMock", false)
local EmoteSkinningDisableEnabled = game:DefineFastFlag("EmoteSkinningDisableEnabled", false)
local ExpChatRemoveServerTenFootCheck = game:DefineFastFlag("ExpChatRemoveServerTenFootCheck", false)
local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui", 1e999)
assert(RobloxGui ~= nil, "RobloxGui should exist")
local ServerUtilModule = require(RobloxGui.Modules.Server.ServerUtil)

if ServerUtilModule.getFFlagServerCoreScriptSourceCode() then
	ServerUtilModule.initSourceCodeFolder()
end
require(RobloxGui.Modules.Server.RemoteAllowList)()
ScriptContext:AddCoreScriptLocal("ServerCoreScripts/OpenCloud/OpenCloudV2", script.Parent)

if game:DefineFastFlag("OpenCloudClientLibraryCoreScriptEnabled", false) then
	ScriptContext:AddCoreScriptLocal("ServerCoreScripts/OpenCloud/OpenCloudClientLibraryCoreScript", script.Parent)
end
ScriptContext:AddCoreScriptLocal("ServerCoreScripts/ServerInGameMenu", script.Parent)
ScriptContext:AddCoreScriptLocal("ServerCoreScripts/ServerSocialScript", script.Parent)

if EmoteSkinningDisableEnabled then
	ScriptContext:AddCoreScriptLocal("ServerCoreScripts/EmoteSkinningDisable", script.Parent)
end
if DebugServerPlatformLeaderboardDevMock and RunService:IsStudio() then
	ScriptContext:AddCoreScriptLocal("ServerCoreScripts/ServerPlatformLeaderboardDevMock", script.Parent)
elseif FFlagPlatformLeaderboardRccEnabled then
	ScriptContext:AddCoreScriptLocal("ServerCoreScripts/ServerPlatformLeaderboard", script.Parent)
end
ScriptContext:AddCoreScriptLocal("ServerCoreScripts/ServerLeaderstats", script.Parent)
ScriptContext:AddCoreScriptLocal("ServerCoreScripts/PlayerRagdollRigCreator", script.Parent)
game:DefineFastFlag("DebugFreeCameraForAdmins", true)

if FFlagAXEnableInspectAndBuyBulkPurchase then
	ScriptContext:AddCoreScriptLocal("ServerCoreScripts/ServerBulkPurchaseEvent", script.Parent)
end
local SendChatAnalyticsModule: (any) -> () = require(RobloxGui.Modules.Server.SendChatAnalytics)
ScriptContext:AddCoreScriptLocal("ServerCoreScripts/ServerDialog", script.Parent)
local GetServerVersion = Instance.new("RemoteFunction")
GetServerVersion.Name = "GetServerVersion"
GetServerVersion.Parent = RobloxReplicatedStorage
local GetServerChannel = nil

if GetFFlagDisplayServerChannelFunction() then
	GetServerChannel = Instance.new("RemoteFunction")
	GetServerChannel.Name = "GetServerChannel"
	GetServerChannel.Parent = RobloxReplicatedStorage
end
local function getServerChannel() --[[ Line: 118 ]]
	-- upvalues: RunService (copy)
	return RunService:GetRobloxClientChannel()
end

function GetServerVersion.OnServerInvoke() --[[ Line: 97 ]]
	-- upvalues: RunService (copy)
	local RobloxVersion = RunService:GetRobloxVersion()
	local DEBUGSERVER = if RobloxVersion == "?" then "DEBUG_SERVER" elseif RunService:IsStudio() then "ROBLOX Studio" else RobloxVersion
	
	return if RunService:IsStudio() then DEBUGSERVER else string.format("%s (%.6s)", DEBUGSERVER, RunService.ClientGitHash)
end

if GetFFlagDisplayServerChannelFunction() then
	GetServerChannel.OnServerInvoke = getServerChannel
end
if (function(): boolean --[[ Line: 126 | Named "shouldLoadLuaChat" ]]
	-- upvalues: ExpChatRemoveServerTenFootCheck (copy)
	return if ExpChatRemoveServerTenFootCheck then game:GetService("Chat").LoadDefaultChat and game:GetService("TextChatService").ChatVersion == Enum.ChatVersion.LegacyChatService else game:GetService("Chat").LoadDefaultChat and (game:GetService("TextChatService").ChatVersion == Enum.ChatVersion.LegacyChatService and not game:GetService("GuiService"):IsTenFootInterface())
end)() then
	require(game:GetService("CoreGui").RobloxGui.Modules.Server.ClientChat.ChatWindowInstaller)()
	require(game:GetService("CoreGui").RobloxGui.Modules.Server.ServerChat.ChatServiceInstaller)()
else
	SendChatAnalyticsModule("NoLoadDefaultChat")
end
if game:GetFastFlag("DebugFreeCameraForAdmins") then
	require(game:GetService("CoreGui").RobloxGui.Modules.Server.FreeCamera.FreeCameraInstaller)()
end
require(game:GetService("CoreGui").RobloxGui.Modules.Server.ServerSound.SoundDispatcherInstaller)()
require(game:GetService("CoreGui").RobloxGui.Modules.Server.UGCValidation.UGCValidationFunctionInstaller)()
local ChatVersion = game:GetService("TextChatService").ChatVersion

if GetFFlagExpChatAlwaysRunTCSFunction() or ChatVersion == Enum.ChatVersion.TextChatService then
	require(CorePackages.Workspace.Packages.ExpChatServer).mountServerApp({})
elseif ChatVersion == Enum.ChatVersion.LegacyChatService then
	local Chat = game:GetService("Chat")
	Chat:GetPropertyChangedSignal("IsAutoMigrated"):Connect(function() --[[ Line: 160 ]]
		-- upvalues: Chat (copy), DebugLogExpchatMigration (copy), CorePackages (copy)
		if Chat.IsAutoMigrated then
			if DebugLogExpchatMigration then
				print("Migrating to ExpChat")
			end
			require(CorePackages.Workspace.Packages.ExpChatServer).mountServerApp({})
		end
	end)
end
if RunService:IsStudio() == false then
	RbxAnalyticsService:ReportCounter(if ChatVersion == Enum.ChatVersion.TextChatService then "textChatServiceChatVersionTextChatService" else "textChatServiceChatVersionLegacy", 1)
end
if game:DefineFastFlag("VersionedFlags_Dev", false) then
	ScriptContext:AddCoreScriptLocal("ServerCoreScripts/VersionedFlagTest", script.Parent)
end
if game:DefineFastFlag("AppBuildReloadRemote", false) then
	ScriptContext:AddCoreScriptLocal("ServerCoreScripts/ServerBuildExperiencePlaytestTeleport", script.Parent)
end
local FStringRoCaptchaUniverseIdsModule = require(RobloxGui.Modules.Common.Flags.FStringRoCaptchaUniverseIds)

if game:DefineFastFlag("RoCaptchaServerHandlerEnabled", false) and FStringRoCaptchaUniverseIdsModule ~= "" then
	ScriptContext:AddCoreScriptLocal("ServerCoreScripts/ServerRoCaptchaHandler", script.Parent)
end
ScriptContext:AddCoreScriptLocal("ServerCoreScripts/PlayerViewCapability", script.Parent)

if require(RobloxGui.Modules.Common.Flags.GetFFlagEnableVoiceDefaultServerScript)() then
	ScriptContext:AddCoreScriptLocal("ServerCoreScripts/VoiceDefault", script.Parent)
end
if GetFFlagEnableReferredPlayerJoinRemoteEventFunction() then
	ScriptContext:AddCoreScriptLocal("ServerCoreScripts/ReferredByPlayerRemoteEvent", script.Parent)
end
require(game:GetService("CoreGui").RobloxGui.Modules.Server.VR.VRAvatarGesturesServer).new()