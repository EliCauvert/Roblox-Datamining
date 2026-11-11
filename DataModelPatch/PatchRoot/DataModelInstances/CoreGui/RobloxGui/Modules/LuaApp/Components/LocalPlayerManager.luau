local CorePackages = game:GetService("CorePackages")
local Players = game:GetService("Players")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local AppRunService = require(CorePackages.Workspace.Packages.RoactServiceTags).AppRunService
local AppSessionService = require(CorePackages.Workspace.Packages.RoactServiceTags).AppSessionService
local LoggersModule = require(CorePackages.Workspace.Packages.Loggers)
local Logger = LoggersModule.Logger
local MutedErrorFunction = LoggersModule.mutedError
local ExternalEventConnectionModule = require(Modules.Common.RoactUtilities.ExternalEventConnection)
local SetUserMembershipTypeModule = require(Modules.LuaApp.Actions.SetUserMembershipType)
local SetUserHasRobloxSubscriptionFunction = require(CorePackages.Workspace.Packages.UserLib).Actions.SetUserHasRobloxSubscription
local GetLocalUserFunction = require(CorePackages.Workspace.Packages.UserLib).Thunks.GetLocalUser
local SessionType = require(CorePackages.Workspace.Packages.RobloxAppSessionization).SessionType
local UserModule = require(Modules.LuaApp.Thunks.Authentication.User)
local FFlagEnableBlackbirdCheck = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableBlackbirdCheck
local FixWrongLoggedOutSessionSwitch = game:DefineFastFlag("FixWrongLoggedOutSessionSwitch", false)
local TestAndroidWrongLoggedInIssue = game:DefineFastFlag("TestAndroidWrongLoggedInIssue", false)
local FFlagEnableL1SessionStateEngineOwnedModule = require(Modules.LuaApp.Flags.FFlagEnableL1SessionStateEngineOwned)
local LuaAppBacktraceReporterModule = require(Modules.LuaApp.LuaAppBacktraceReporter)
local LocalPlayerManager = RoactModule.Component:extend("LocalPlayerManager")
LocalPlayerManager.defaultProps = {
	backtraceReporter = nil,
	getLocalPlayerUserId = function()
		-- upvalues: Players (copy)
		local UserId = Players.LocalPlayer and Players.LocalPlayer.UserId or nil
		
		return if UserId == nil or UserId <= 0 then nil else tostring(UserId)
	end,
	getCachedUserId = function()
		-- upvalues: UserModule (copy)
		local UserId: number = UserModule.fromLocalStorage().userId
		
		return if UserId > 0 then tostring(UserId) else nil
	end
}

function LocalPlayerManager.init(p1)
	-- upvalues: Players (copy), LuaAppBacktraceReporterModule (copy), TestAndroidWrongLoggedInIssue (copy), RoactModule (copy), Logger (copy), FFlagEnableL1SessionStateEngineOwnedModule (copy), SessionType (copy)
	p1:setState({
		hasLocalPlayer = Players.LocalPlayer ~= nil,
		localPlayerUserId = p1.props.getLocalPlayerUserId()
	})
	p1.backtraceReporter = p1.props.backtraceReporter or LuaAppBacktraceReporterModule
	
	function p1.fetchAndUpdateLocalPlayer()
		-- upvalues: p1 (copy)
		p1.props.fetchLocalUserData()
		p1.updateUserInfoToBacktrace()
		p1.updateLocalPlayerState()
	end
	
	function p1.updateLocalPlayerState()
		-- upvalues: p1 (copy), TestAndroidWrongLoggedInIssue (upval), RoactModule (upval), Players (upval)
		local LocalPlayerUserId = p1.props.getLocalPlayerUserId()
		
		if TestAndroidWrongLoggedInIssue then
			print("[FLog::SessionService] currentLocalPlayerId " .. tostring(LocalPlayerUserId))
		end
		if LocalPlayerUserId ~= p1.state.localPlayerUserId then
			p1:setState({
				localPlayerUserId = LocalPlayerUserId or RoactModule.None,
				hasLocalPlayer = Players.LocalPlayer ~= nil
			})
		end
	end
	
	function p1.updateUserInfoToBacktrace()
		-- upvalues: Players (upval), p1 (copy)
		local LocalPlayer = Players.LocalPlayer
		p1.backtraceReporter:updateSharedAttributes(if LocalPlayer == nil or LocalPlayer.UserId <= 0 then {
			UserLoggedIn = false,
			UserMembershipType = "Unknown",
			UserIsUnder13 = "Unknown",
			CountryCode = "Unknown"
		} else {
			UserLoggedIn = true,
			UserMembershipType = tostring(LocalPlayer.MembershipType),
			UserIsUnder13 = LocalPlayer:GetUnder13(),
			CountryCode = p1.props.countryCode
		})
	end
	
	function p1.syncUserSession(p2)
		-- upvalues: TestAndroidWrongLoggedInIssue (upval), p1 (copy), Logger (upval), FFlagEnableL1SessionStateEngineOwnedModule (upval), SessionType (upval)
		if TestAndroidWrongLoggedInIssue then
			print("[FLog::SessionService] syncUserSession()")
			
			if p2 then
				print("[FLog::SessionService] syncUserSession checkCachedUser True")
			end
		end
		local SessionService = p1.props.sessionService
		local LocalPlayerUserId = p1.state.localPlayerUserId
		
		if p2 then
			local CachedUserId = p1.props.getCachedUserId()
			
			if CachedUserId then
				LocalPlayerUserId = CachedUserId
			end
			Logger:info("LocalPlayerManager:syncUserSession(checkCachedUser==true) localPlayerUserId: {}, cachedUserId: {}", LocalPlayerUserId, CachedUserId)
		end
		if not FFlagEnableL1SessionStateEngineOwnedModule then
			local function v28(LocalPlayerUserId)
				-- upvalues: TestAndroidWrongLoggedInIssue (upval), SessionService (copy), SessionType (upval), Logger (upval)
				if TestAndroidWrongLoggedInIssue then
					print("[FLog::SessionService] handleL1WithUserId")
				end
				if SessionService:SessionExists(SessionType.StructuralIdentifier.Level1) then
					local Metadata = SessionService:GetMetadata(SessionType.StructuralIdentifier.Level1, SessionType.Metadata.User.UserId)
					
					if Metadata ~= LocalPlayerUserId then
						if TestAndroidWrongLoggedInIssue then
							print("[FLog::SessionService] handleL1WithUserId expectedUserId " .. tostring(LocalPlayerUserId) .. " currentL1SessionUserId " .. tostring(Metadata))
						end
						SessionService:SetSession(SessionService:GetRootSID(), SessionType.StructuralIdentifier.Level1, SessionType.Tag.Level1.Default)
						SessionService:SetMetadata(SessionType.StructuralIdentifier.Level1, SessionType.Metadata.User.UserId, LocalPlayerUserId)
						
						return
					end
				else
					if TestAndroidWrongLoggedInIssue then
						print("LocalPlayerManager:syncUserSession, Level1 session is missing!")
					end
					Logger:warning("LocalPlayerManager:syncUserSession, Level1 session is missing!")
					SessionService:SetSession(SessionService:GetRootSID(), SessionType.StructuralIdentifier.Level1, SessionType.Tag.Level1.LoggedOut)
				end
			end
			
			local function v29()
				-- upvalues: TestAndroidWrongLoggedInIssue (upval), SessionService (copy), SessionType (upval)
				if TestAndroidWrongLoggedInIssue then
					print("[FLog::SessionService] handleL1WithNoUserId")
				end
				if not SessionService:SessionExists(SessionType.StructuralIdentifier.Level1) or SessionService:GetSessionTag(SessionType.StructuralIdentifier.Level1) == SessionType.Tag.Level1.Default then
					SessionService:SetSession(SessionService:GetRootSID(), SessionType.StructuralIdentifier.Level1, SessionType.Tag.Level1.LoggedOut)
				end
			end
			
			if LocalPlayerUserId ~= nil then
				v28(LocalPlayerUserId)
				
				return
			end
			v29()
		end
	end
	
	local SessionService = p1.props.sessionService
	
	if p1.props.runService:IsStudio() then
		SessionService:RemoveSession(SessionType.StructuralIdentifier.Level1)
	end
	p1.syncUserSession(true)
end

function LocalPlayerManager.render(p1)
	-- upvalues: FFlagEnableBlackbirdCheck (copy), FixWrongLoggedOutSessionSwitch (copy), RoactModule (copy), ExternalEventConnectionModule (copy), Players (copy), TestAndroidWrongLoggedInIssue (copy), MutedErrorFunction (copy)
	local SetUserMembershipTypeFunction = p1.props.setUserMembershipType
	local SetUserHasRobloxSubscription = if FFlagEnableBlackbirdCheck then p1.props.setUserHasRobloxSubscription else nil
	local Config = if TestAndroidWrongLoggedInIssue then {
		PlayerRemovingConnection = RoactModule.createElement(ExternalEventConnectionModule, {
			event = Players.PlayerRemoving,
			callback = function()
				-- upvalues: p1 (copy)
				print("[FLog::SessionService] Players.PlayerRemoving updateLocalPlayerState()")
				p1.updateLocalPlayerState()
			end
		})
	} elseif FixWrongLoggedOutSessionSwitch then {} else {
		PlayerRemovingConnection = RoactModule.createElement(ExternalEventConnectionModule, {
			event = Players.PlayerRemoving,
			callback = function()
				-- upvalues: p1 (copy), Players (upval), RoactModule (upval)
				p1:setState({
					hasLocalPlayer = Players.LocalPlayer ~= nil,
					localPlayerUserId = RoactModule.None
				})
			end
		}),
		PlayerAddedConnection = RoactModule.createElement(ExternalEventConnectionModule, {
			event = Players.PlayerAdded,
			callback = function()
				-- upvalues: p1 (copy), Players (upval), RoactModule (upval)
				p1:setState({
					hasLocalPlayer = Players.LocalPlayer ~= nil,
					localPlayerUserId = p1.props.getLocalPlayerUserId() or RoactModule.None
				})
			end
		})
	}
	
	if p1.state.hasLocalPlayer then
		table.insert(Config, RoactModule.createElement(ExternalEventConnectionModule, {
			event = Players.LocalPlayer:GetPropertyChangedSignal("MembershipType"),
			callback = function()
				-- upvalues: Players (upval), SetUserMembershipTypeFunction (copy), p1 (copy)
				local LocalPlayer = Players.LocalPlayer
				SetUserMembershipTypeFunction(tostring(LocalPlayer.UserId), LocalPlayer.MembershipType)
				p1.updateUserInfoToBacktrace()
			end
		}))
		
		if FFlagEnableBlackbirdCheck and game:GetEngineFeature("ReadHasRobloxSubscriptionLua") then
			table.insert(Config, RoactModule.createElement(ExternalEventConnectionModule, {
				event = Players.LocalPlayer:GetPropertyChangedSignal("HasRobloxSubscription"),
				callback = function()
					-- upvalues: Players (upval), MutedErrorFunction (upval), SetUserHasRobloxSubscription (copy)
					local LocalPlayer = Players.LocalPlayer
					local Text = tostring(LocalPlayer.UserId)
					local Success, Result = pcall(function()
						-- upvalues: LocalPlayer (copy)
						return LocalPlayer.HasRobloxSubscription
					end)
					
					if not Success then
						MutedErrorFunction("[LocalPlayerManager] Failed to read HasRobloxSubscription: " .. tostring(Result))
					end
					SetUserHasRobloxSubscription(Text, Success and Result == true)
				end
			}))
		end
	end
	return RoactModule.createElement("Folder", {}, Config)
end

function LocalPlayerManager.didMount(p1)
	-- upvalues: Players (copy)
	if p1.state.hasLocalPlayer then
		p1.props.fetchLocalUserData()
	end
	p1.updateUserInfoToBacktrace()
	p1.updateLocalPlayerState()
	p1.localPlayerConnection = Players:GetPropertyChangedSignal("LocalPlayer"):Connect(p1.fetchAndUpdateLocalPlayer)
end

function LocalPlayerManager.didUpdate(p1, p2, p3)
	if p3.localPlayerUserId ~= p1.state.localPlayerUserId then
		p1.syncUserSession()
	end
	if p2.countryCode ~= p1.props.countryCode then
		p1.updateUserInfoToBacktrace()
	end
end

function LocalPlayerManager.willUnmount(p1)
	if p1.localPlayerConnection ~= nil then
		p1.localPlayerConnection:Disconnect()
		p1.localPlayerConnection = nil
	end
end

return RoactRoduxModule.connect(function(p1, _)
	return {
		countryCode = string.len(p1.CountryCode) > 0 and p1.CountryCode or "Unknown"
	}
end, function(Callback)
	-- upvalues: SetUserMembershipTypeModule (copy), FFlagEnableBlackbirdCheck (copy), SetUserHasRobloxSubscriptionFunction (copy), GetLocalUserFunction (copy)
	return {
		setUserMembershipType = function(p1, p2)
			-- upvalues: Callback (copy), SetUserMembershipTypeModule (upval)
			Callback(SetUserMembershipTypeModule(p1, p2))
		end,
		setUserHasRobloxSubscription = if FFlagEnableBlackbirdCheck then function(p1, p2)
			-- upvalues: Callback (copy), SetUserHasRobloxSubscriptionFunction (upval)
			Callback(SetUserHasRobloxSubscriptionFunction(p1, p2))
		end else nil,
		fetchLocalUserData = function()
			-- upvalues: Callback (copy), GetLocalUserFunction (upval)
			Callback(GetLocalUserFunction())
		end
	}
end)((RoactServices.connect({
	sessionService = AppSessionService,
	runService = AppRunService
})(LocalPlayerManager)))