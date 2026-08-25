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

local function inferPlayerScriptStatus(p0)
	-- upvalues: constantsModule (ref), rbxAnalyticsService (ref), getFFlagNewEventIngestPlayerScriptsDimensionsModule (ref)
	local playerScriptsLoader = p0:FindFirstChild("PlayerScriptsLoader")
	local playerModule = p0:FindFirstChild("PlayerModule")
	local _ = nil
	local var25 = if playerScriptsLoader == nil or playerModule == nil then if p0:FindFirstChild("CameraScript") == nil and p0:FindFirstChild("ControlScript") == nil then constantsModule.PlayerScriptStatusStrings.Custom else constantsModule.PlayerScriptStatusStrings.CustomOld elseif playerModule.Archivable or playerScriptsLoader.Archivable then constantsModule.PlayerScriptStatusStrings.PossiblyCustom else constantsModule.PlayerScriptStatusStrings.Default
	rbxAnalyticsService:SetRBXEventStream(constantsModule.AnalyticsTargetName, "player_scripts_status", "player_scripts_status_action", {
		defaultPlayerScripts = var25 == constantsModule.PlayerScriptStatusStrings.Default,
		placeID = tostring(game.PlaceId),
		rawValue = if getFFlagNewEventIngestPlayerScriptsDimensionsModule() then var25 else nil,
		context = if getFFlagNewEventIngestPlayerScriptsDimensionsModule() then "IGMv2" else nil
	})
	
	return var25
end

function versionReporter.init(p1)
	-- upvalues: starterPlayerService (ref), inferPlayerScriptStatus (ref), contentProviderService (ref), runService (ref), coreScriptVersionEnabledEngineFeature (ref)
	local var26 = "PlayerScript Status: Unknown"
	local starterPlayerScripts = starterPlayerService:FindFirstChild("StarterPlayerScripts")
	
	if starterPlayerScripts then
		var26 = inferPlayerScriptStatus(starterPlayerScripts)
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
		playerScriptStatus = var26,
		coreScriptVersion = coreScriptVersionEnabledEngineFeature and runService:GetCoreScriptVersion() or nil
	})
end

function versionReporter.render(p3)
	-- upvalues: withLocalizationModule (ref), coreScriptVersionEnabledEngineFeature (ref), runService (ref), roact (ref), themedTextLabelModule (ref), skeleton (ref), dividerModule (ref), externalEventConnectionModule (ref)
	local var28 = p3.state.serverVersion ~= nil
	local var29 = p3.state.latestPlaceVersion ~= nil
	local var30 = not p3.state.baseUrl:find("www.roblox.com")
	local var30_1 = var30 or p3.state.isAdmin
	
	return withLocalizationModule({
		clientVersion = {
			"CoreScripts.InGameMenu.GameSettings.ClientVersion",
			CLIENT_VERSION = p3.state.clientVersion
		},
		serverVersion = {
			"CoreScripts.InGameMenu.GameSettings.ServerVersion",
			SERVER_VERSION = p3.state.serverVersion
		},
		placeVersion = {
			if var29 then "CoreScripts.InGameMenu.GameSettings.PlaceVersionWithLatest" else "CoreScripts.InGameMenu.GameSettings.PlaceVersion",
			PLACE_VERSION = p3.state.placeVersion,
			LATEST_PLACE_VERSION = p3.state.latestPlaceVersion
		},
		coreScriptVersion = coreScriptVersionEnabledEngineFeature and ({
			"CoreScripts.InGameMenu.GameSettings.ClientCoreScriptVersion",
			CLIENT_CORESCRIPT_VERSION = p3.state.coreScriptVersion
		} or nil)
	})(function(_)
		-- upvalues: runService (copy), roact (copy), p3 (ref), themedTextLabelModule (copy), var28 (ref), skeleton (copy), var30 (ref), var30_1 (ref), dividerModule (copy), coreScriptVersionEnabledEngineFeature (copy), externalEventConnectionModule (copy)
-- FATAL: Failed to generate AST for `unnamed` function:
runtime : [KeyError] :11990: 48
Traceback:
	runtime : [lunaux]:11990 function decompile_function
	runtime : [lunaux]:1933 function normalize_cfg
	runtime : [lunaux]:1320 function match_weird_patterns
	end)
end

function versionReporter.didMount(p4)
	-- upvalues: robloxReplicatedStorageService (ref), getFFlagRemoveAssetVersionEndpointModule (ref), httpRbxApiService (ref), httpService (ref), playerPermissionsModule (ref), playersService (ref)
	p4.mounted = true
	coroutine.wrap(function()
		-- upvalues: robloxReplicatedStorageService (copy), p4 (ref)
		local var32 = robloxReplicatedStorageService:WaitForChild("GetServerVersion", 1e999):InvokeServer()
		
		if p4.mounted then
			p4:setState({ serverVersion = var32 })
		end
	end)()
	
	if not getFFlagRemoveAssetVersionEndpointModule() then
		coroutine.wrap(function()
			-- upvalues: httpRbxApiService (copy), httpService (copy), p4 (ref)
			pcall(function()
				-- upvalues: httpRbxApiService (copy), httpService (copy), p4 (copy)
				local versionNumber = httpService:JSONDecode(httpRbxApiService:GetAsync(string.format("assets/%d/versions", game.PlaceId)))[1].VersionNumber
				
				if p4.mounted then
					p4:setState({ latestPlaceVersion = versionNumber })
				end
			end)
		end)()
	end
	coroutine.wrap(function()
		-- upvalues: playerPermissionsModule (copy), playersService (copy), p4 (ref)
		local var33 = playerPermissionsModule.IsPlayerAdminAsync(playersService.LocalPlayer)
		
		if p4.mounted then
			p4:setState({ isAdmin = var33 })
		end
	end)()
end

function versionReporter.willUnmount(p5)
	p5.mounted = false
	
	if p5.playerScriptsAddedConnection then
		p5.playerScriptsAddedConnection:Disconnect()
	end
end

return versionReporter