local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local ContentProvider = game:GetService("ContentProvider")
local CoreGui = game:GetService("CoreGui")
local CorePackages = game:GetService("CorePackages")
local HttpRbxApiService = game:GetService("HttpRbxApiService")
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local RobloxReplicatedStorage = game:GetService("RobloxReplicatedStorage")
local RunService = game:GetService("RunService")
local StarterPlayer = game:GetService("StarterPlayer")
local RobloxGui = CoreGui:WaitForChild("RobloxGui")
local InGameMenuDependenciesModule = require(CorePackages.Packages.InGameMenuDependencies)
local Roact = InGameMenuDependenciesModule.Roact
local T = InGameMenuDependenciesModule.t
local Skeleton = require(CorePackages.Packages.Foundation).Skeleton
local PlayerPermissionsModule = require(CoreGui.RobloxGui.Modules.PlayerPermissionsModule)
local Parent = script.Parent.Parent.Parent
local ConstantsModule = require(Parent.Resources.Constants)
local DividerModule = require(Parent.Components.Divider)
local ThemedTextLabelModule = require(Parent.Components.ThemedTextLabel)
local ExternalEventConnectionModule = require(Parent.Utility.ExternalEventConnection)
local WithLocalizationModule = require(Parent.Localization.withLocalization)
local CoreScriptVersionEnabledEngineFeature = game:GetEngineFeature("CoreScriptVersionEnabled")
local GetFFlagNewEventIngestPlayerScriptsDimensionsModule = require(RobloxGui.Modules.Flags.GetFFlagNewEventIngestPlayerScriptsDimensions)
local GetFFlagRemoveAssetVersionEndpointModule = require(RobloxGui.Modules.Flags.GetFFlagRemoveAssetVersionEndpoint)
local VersionReporter = Roact.PureComponent:extend("VersionReporter")
VersionReporter.validateProps = T.strictInterface({ LayoutOrder = T.integer })

local function inferPlayerScriptStatus(Object)
	-- upvalues: ConstantsModule (copy), RbxAnalyticsService (copy), GetFFlagNewEventIngestPlayerScriptsDimensionsModule (copy)
	local PlayerScriptsLoader = Object:FindFirstChild("PlayerScriptsLoader")
	local PlayerModule = Object:FindFirstChild("PlayerModule")
	local Custom = nil
	
	if PlayerScriptsLoader == nil or PlayerModule == nil then
		local ControlScript = Object:FindFirstChild("ControlScript")
		Custom = if Object:FindFirstChild("CameraScript") == nil and ControlScript == nil then ConstantsModule.PlayerScriptStatusStrings.Custom else ConstantsModule.PlayerScriptStatusStrings.CustomOld
	else
		Custom = if PlayerModule.Archivable or PlayerScriptsLoader.Archivable then ConstantsModule.PlayerScriptStatusStrings.PossiblyCustom else ConstantsModule.PlayerScriptStatusStrings.Default
	end
	RbxAnalyticsService:SetRBXEventStream(ConstantsModule.AnalyticsTargetName, "player_scripts_status", "player_scripts_status_action", {
		defaultPlayerScripts = Custom == ConstantsModule.PlayerScriptStatusStrings.Default,
		placeID = tostring(game.PlaceId),
		rawValue = if GetFFlagNewEventIngestPlayerScriptsDimensionsModule() then Custom else nil,
		context = if GetFFlagNewEventIngestPlayerScriptsDimensionsModule() then "IGMv2" else nil
	})
	
	return Custom
end

function VersionReporter.init(p1)
	-- upvalues: StarterPlayer (copy), inferPlayerScriptStatus (copy), ContentProvider (copy), RunService (copy), CoreScriptVersionEnabledEngineFeature (copy)
	local PlayerScriptStatus = "PlayerScript Status: Unknown"
	local StarterPlayerScripts = StarterPlayer:FindFirstChild("StarterPlayerScripts")
	
	if StarterPlayerScripts then
		PlayerScriptStatus = inferPlayerScriptStatus(StarterPlayerScripts)
	else
		p1.playerScriptsAddedConnection = StarterPlayer.ChildAdded:Connect(function(Child)
			-- upvalues: p1 (copy), inferPlayerScriptStatus (upval)
			if Child.Name == "StarterPlayerScripts" then
				p1.playerScriptsAddedConnection:Disconnect()
				p1.playerScriptsAddedConnection = nil
				p1:setState({ playerScriptStatus = inferPlayerScriptStatus(Child) })
			end
		end)
	end
	p1:setState({
		isAdmin = false,
		latestPlaceVersion = nil,
		serverVersion = nil,
		baseUrl = ContentProvider.BaseUrl,
		clientVersion = RunService:GetRobloxVersion(),
		placeVersion = game.PlaceVersion,
		playerScriptStatus = PlayerScriptStatus,
		coreScriptVersion = CoreScriptVersionEnabledEngineFeature and RunService:GetCoreScriptVersion() or nil
	})
end

function VersionReporter.render(p1)
	-- upvalues: WithLocalizationModule (copy), CoreScriptVersionEnabledEngineFeature (copy), RunService (copy), Roact (copy), ThemedTextLabelModule (copy), Skeleton (copy), DividerModule (copy), ExternalEventConnectionModule (copy)
	local HasServerVersion = p1.state.serverVersion ~= nil
	local HasLatestPlaceVersion = p1.state.latestPlaceVersion ~= nil
	local Inverted = not p1.state.baseUrl:find("www.roblox.com")
	local Inverted1 = Inverted or p1.state.isAdmin
	
	return WithLocalizationModule({
		clientVersion = {
			"CoreScripts.InGameMenu.GameSettings.ClientVersion",
			CLIENT_VERSION = p1.state.clientVersion
		},
		serverVersion = {
			"CoreScripts.InGameMenu.GameSettings.ServerVersion",
			SERVER_VERSION = p1.state.serverVersion
		},
		placeVersion = {
			if HasLatestPlaceVersion then "CoreScripts.InGameMenu.GameSettings.PlaceVersionWithLatest" else "CoreScripts.InGameMenu.GameSettings.PlaceVersion",
			PLACE_VERSION = p1.state.placeVersion,
			LATEST_PLACE_VERSION = p1.state.latestPlaceVersion
		},
		coreScriptVersion = CoreScriptVersionEnabledEngineFeature and {
			"CoreScripts.InGameMenu.GameSettings.ClientCoreScriptVersion",
			CLIENT_CORESCRIPT_VERSION = p1.state.coreScriptVersion
		} or nil
	})(function(p2)
		-- upvalues: RunService (upval), Roact (upval), p1 (copy), ThemedTextLabelModule (upval), HasServerVersion (copy), Skeleton (upval), Inverted (copy), Inverted1 (copy), DividerModule (upval), CoreScriptVersionEnabledEngineFeature (upval), ExternalEventConnectionModule (upval)
		local ClientVersion = p2.clientVersion
		local Success, Result = pcall(function()
			-- upvalues: RunService (upval)
			return RunService.ClientGitHash
		end)
		
		if Success then
			ClientVersion = string.format("%s (%.6s)", ClientVersion, Result)
		end
		return Roact.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 80),
			LayoutOrder = p1.props.LayoutOrder
		}, {
			Padding = Roact.createElement("UIPadding", {
				PaddingTop = UDim.new(0, 14),
				PaddingLeft = UDim.new(0, 24),
				PaddingBottom = UDim.new(0, 14)
			}),
			Layout = Roact.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, 10)
			}),
			ClientVersion = Roact.createElement(ThemedTextLabelModule, {
				themeKey = "TextDefault",
				fontKey = "Footer",
				LayoutOrder = 1,
				Text = ClientVersion,
				Size = UDim2.new(1, -24, 0, 14)
			}),
			ServerVersion = Roact.createElement(ThemedTextLabelModule, {
				themeKey = "TextDefault",
				fontKey = "Footer",
				LayoutOrder = 2,
				Text = HasServerVersion and p2.serverVersion or "",
				Size = UDim2.new(1, -24, 0, 14)
			}, {
				not HasServerVersion and Roact.createElement(Skeleton, { Size = UDim2.new(1, 0, 1, 0) })
			}),
			PlaceVersion = Roact.createElement(ThemedTextLabelModule, {
				themeKey = "TextDefault",
				fontKey = "Footer",
				LayoutOrder = 3,
				Text = p2.placeVersion,
				Size = UDim2.new(1, -24, 0, 14)
			}),
			Divider = if Inverted then Roact.createElement(DividerModule, { LayoutOrder = 4, Size = UDim2.new(1, 0, 0, 1) }) else Inverted1 and Roact.createElement(DividerModule, { LayoutOrder = 4, Size = UDim2.new(1, 0, 0, 1) }),
			PlayerScriptStatus = Inverted1 and Roact.createElement(ThemedTextLabelModule, {
				themeKey = "TextDefault",
				fontKey = "Footer",
				LayoutOrder = 5,
				Text = p1.state.playerScriptStatus,
				Size = UDim2.new(1, -24, 0, 14)
			}),
			Environment = Inverted and Roact.createElement(ThemedTextLabelModule, {
				themeKey = "TextDefault",
				fontKey = "Footer",
				LayoutOrder = 6,
				Text = ("Base URL: %s"):format(p1.state.baseUrl),
				Size = UDim2.new(1, -24, 0, 14)
			}),
			Divider2 = CoreScriptVersionEnabledEngineFeature and Roact.createElement(DividerModule, { LayoutOrder = 7, Size = UDim2.new(1, 0, 0, 1) }),
			CoreScriptVersion = CoreScriptVersionEnabledEngineFeature and Roact.createElement(ThemedTextLabelModule, {
				themeKey = "TextDefault",
				fontKey = "Footer",
				LayoutOrder = 8,
				Text = p2.coreScriptVersion,
				Size = UDim2.new(1, -24, 0, 14)
			}),
			VersionWatcher = Roact.createElement(ExternalEventConnectionModule, {
				event = game:GetPropertyChangedSignal("PlaceVersion"),
				callback = function()
					-- upvalues: p1 (upval)
					p1:setState({ placeVersion = game.PlaceVersion })
				end
			})
		})
	end)
end

function VersionReporter.didMount(p2)
	-- upvalues: RobloxReplicatedStorage (copy), GetFFlagRemoveAssetVersionEndpointModule (copy), HttpRbxApiService (copy), HttpService (copy), PlayerPermissionsModule (copy), Players (copy)
	p2.mounted = true
	coroutine.wrap(function()
		-- upvalues: RobloxReplicatedStorage (upval), p2 (copy)
		local ServerResult = RobloxReplicatedStorage:WaitForChild("GetServerVersion", 1e999):InvokeServer()
		
		if p2.mounted then
			p2:setState({ serverVersion = ServerResult })
		end
	end)()
	
	if not GetFFlagRemoveAssetVersionEndpointModule() then
		coroutine.wrap(function()
			-- upvalues: HttpRbxApiService (upval), HttpService (upval), p2 (copy)
			pcall(function()
				-- upvalues: HttpRbxApiService (upval), HttpService (upval), p2 (upval)
				local VersionNumber = HttpService:JSONDecode((HttpRbxApiService:GetAsync(string.format("assets/%d/versions", game.PlaceId))))[1].VersionNumber
				
				if p2.mounted then
					p2:setState({ latestPlaceVersion = VersionNumber })
				end
			end)
		end)()
	end
	coroutine.wrap(function()
		-- upvalues: PlayerPermissionsModule (upval), Players (upval), p2 (copy)
		local IsPlayerAdminAsync = PlayerPermissionsModule.IsPlayerAdminAsync(Players.LocalPlayer)
		
		if p2.mounted then
			p2:setState({ isAdmin = IsPlayerAdminAsync })
		end
	end)()
end

function VersionReporter.willUnmount(p2)
	p2.mounted = false
	
	if p2.playerScriptsAddedConnection then
		p2.playerScriptsAddedConnection:Disconnect()
	end
end

return VersionReporter