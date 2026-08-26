local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local contentProviderService = game:GetService("ContentProvider")
local coreGuiService = game:GetService("CoreGui")
local corePackagesService = game:GetService("CorePackages")
local httpRbxApiService = game:GetService("HttpRbxApiService")
local httpService = game:GetService("HttpService")
local playersService = game:GetService("Players")
local robloxReplicatedStorageService = game:GetService("RobloxReplicatedStorage")
local runService = game:GetService("RunService")
local starterPlayerService = game:GetService("StarterPlayer")
local robloxGui = coreGuiService:WaitForChild("RobloxGui")
local inGameMenuDependenciesModule = require(corePackagesService.Packages.InGameMenuDependencies)
local roact = inGameMenuDependenciesModule.Roact
local t = inGameMenuDependenciesModule.t
local skeleton = require(corePackagesService.Packages.Foundation).Skeleton
local playerPermissionsModule = require(coreGuiService.RobloxGui.Modules.PlayerPermissionsModule)
local parent = script.Parent.Parent.Parent
local constantsModule = require(parent.Resources.Constants)
local dividerModule = require(parent.Components.Divider)
local themedTextLabelModule = require(parent.Components.ThemedTextLabel)
local externalEventConnectionModule = require(parent.Utility.ExternalEventConnection)
local withLocalizationModule = require(parent.Localization.withLocalization)
local coreScriptVersionEnabledEngineFeature = game:GetEngineFeature("CoreScriptVersionEnabled")
local getFFlagNewEventIngestPlayerScriptsDimensionsModule = require(robloxGui.Modules.Flags.GetFFlagNewEventIngestPlayerScriptsDimensions)
local getFFlagRemoveAssetVersionEndpointModule = require(robloxGui.Modules.Flags.GetFFlagRemoveAssetVersionEndpoint)
local versionReporter = roact.PureComponent:extend("VersionReporter")
versionReporter.validateProps = t.strictInterface({ LayoutOrder = t.integer })

local function inferPlayerScriptStatus(p1)
	-- upvalues: constantsModule (ref), rbxAnalyticsService (ref), getFFlagNewEventIngestPlayerScriptsDimensionsModule (ref)
	local playerScriptsLoader = p1:FindFirstChild("PlayerScriptsLoader")
	local playerModule = p1:FindFirstChild("PlayerModule")
	local _ = nil
	local var1 = if playerScriptsLoader == nil or playerModule == nil then if p1:FindFirstChild("CameraScript") == nil and p1:FindFirstChild("ControlScript") == nil then constantsModule.PlayerScriptStatusStrings.Custom else constantsModule.PlayerScriptStatusStrings.CustomOld elseif playerModule.Archivable or playerScriptsLoader.Archivable then constantsModule.PlayerScriptStatusStrings.PossiblyCustom else constantsModule.PlayerScriptStatusStrings.Default
	rbxAnalyticsService:SetRBXEventStream(constantsModule.AnalyticsTargetName, "player_scripts_status", "player_scripts_status_action", {
		defaultPlayerScripts = var1 == constantsModule.PlayerScriptStatusStrings.Default,
		placeID = tostring(game.PlaceId),
		rawValue = if getFFlagNewEventIngestPlayerScriptsDimensionsModule() then var1 else nil,
		context = if getFFlagNewEventIngestPlayerScriptsDimensionsModule() then "IGMv2" else nil
	})
	
	return var1
end

function versionReporter.init(p1)
	-- upvalues: starterPlayerService (ref), inferPlayerScriptStatus (ref), contentProviderService (ref), runService (ref), coreScriptVersionEnabledEngineFeature (ref)
	local var1 = "PlayerScript Status: Unknown"
	local starterPlayerScripts = starterPlayerService:FindFirstChild("StarterPlayerScripts")
	
	if starterPlayerScripts then
		var1 = inferPlayerScriptStatus(starterPlayerScripts)
	else
		p1.playerScriptsAddedConnection = starterPlayerService.ChildAdded:Connect(function(p2)
			-- upvalues: p1 (ref), inferPlayerScriptStatus (copy)
			if p2.Name == "StarterPlayerScripts" then
				p1.playerScriptsAddedConnection:Disconnect()
				p1.playerScriptsAddedConnection = nil
				p1:setState({ playerScriptStatus = inferPlayerScriptStatus(p2) })
			end
		end)
	end
	p1:setState({
		isAdmin = false,
		latestPlaceVersion = nil,
		serverVersion = nil,
		baseUrl = contentProviderService.BaseUrl,
		clientVersion = runService:GetRobloxVersion(),
		placeVersion = game.PlaceVersion,
		playerScriptStatus = var1,
		coreScriptVersion = coreScriptVersionEnabledEngineFeature and runService:GetCoreScriptVersion() or nil
	})
end

function versionReporter.render(p1)
	-- upvalues: withLocalizationModule (ref), coreScriptVersionEnabledEngineFeature (ref), runService (ref), roact (ref), themedTextLabelModule (ref), skeleton (ref), dividerModule (ref), externalEventConnectionModule (ref)
	local var1 = p1.state.serverVersion ~= nil
	local var2 = p1.state.latestPlaceVersion ~= nil
	local var3 = not p1.state.baseUrl:find("www.roblox.com")
	local var4 = var3 or p1.state.isAdmin
	
	return withLocalizationModule({
		clientVersion = {
			"CoreScripts.InGameMenu.GameSettings.ClientVersion",
			CLIENT_VERSION = p1.state.clientVersion
		},
		serverVersion = {
			"CoreScripts.InGameMenu.GameSettings.ServerVersion",
			SERVER_VERSION = p1.state.serverVersion
		},
		placeVersion = {
			if var2 then "CoreScripts.InGameMenu.GameSettings.PlaceVersionWithLatest" else "CoreScripts.InGameMenu.GameSettings.PlaceVersion",
			PLACE_VERSION = p1.state.placeVersion,
			LATEST_PLACE_VERSION = p1.state.latestPlaceVersion
		},
		coreScriptVersion = coreScriptVersionEnabledEngineFeature and ({
			"CoreScripts.InGameMenu.GameSettings.ClientCoreScriptVersion",
			CLIENT_CORESCRIPT_VERSION = p1.state.coreScriptVersion
		} or nil)
	})(function(_)
		-- upvalues: runService (copy), roact (copy), p1 (ref), themedTextLabelModule (copy), var1 (ref), skeleton (copy), var3 (ref), var4 (ref), dividerModule (copy), coreScriptVersionEnabledEngineFeature (copy), externalEventConnectionModule (copy)
-- FATAL: Failed to generate AST for `unnamed` function:
runtime : [KeyError] :11990: 48
Traceback:
	runtime : [lunaux]:11990 function decompile_function
	runtime : [lunaux]:1933 function normalize_cfg
	runtime : [lunaux]:1320 function match_weird_patterns
	end)
end

function versionReporter.didMount(p2)
	-- upvalues: robloxReplicatedStorageService (ref), getFFlagRemoveAssetVersionEndpointModule (ref), httpRbxApiService (ref), httpService (ref), playerPermissionsModule (ref), playersService (ref)
	p2.mounted = true
	coroutine.wrap(function()
		-- upvalues: robloxReplicatedStorageService (copy), p2 (ref)
		local var5 = robloxReplicatedStorageService:WaitForChild("GetServerVersion", 1e999):InvokeServer()
		
		if p2.mounted then
			p2:setState({ serverVersion = var5 })
		end
	end)()
	
	if not getFFlagRemoveAssetVersionEndpointModule() then
		coroutine.wrap(function()
			-- upvalues: httpRbxApiService (copy), httpService (copy), p2 (ref)
			pcall(function()
				-- upvalues: httpRbxApiService (copy), httpService (copy), p2 (copy)
				local versionNumber = httpService:JSONDecode(httpRbxApiService:GetAsync(string.format("assets/%d/versions", game.PlaceId)))[1].VersionNumber
				
				if p2.mounted then
					p2:setState({ latestPlaceVersion = versionNumber })
				end
			end)
		end)()
	end
	coroutine.wrap(function()
		-- upvalues: playerPermissionsModule (copy), playersService (copy), p2 (ref)
		local var5 = playerPermissionsModule.IsPlayerAdminAsync(playersService.LocalPlayer)
		
		if p2.mounted then
			p2:setState({ isAdmin = var5 })
		end
	end)()
end

function versionReporter.willUnmount(p2)
	p2.mounted = false
	
	if p2.playerScriptsAddedConnection then
		p2.playerScriptsAddedConnection:Disconnect()
	end
end

return versionReporter