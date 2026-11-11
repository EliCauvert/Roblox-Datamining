local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local MessageBusService = game:GetService("MessageBusService")
local ReactModule = require(CorePackages.Packages.React)
local FoundationModule = require(CorePackages.Packages.Foundation)
local IconSize = FoundationModule.Enums.IconSize
local Loading = FoundationModule.Loading
local AppPageModule = require(Modules.LuaApp.AppPage)
local LoginSingleSignOnModule = require(Modules.LuaApp.Thunks.Authentication.LoginSingleSignOn)
local LaunchAppModule = require(Modules.LuaApp.Thunks.Authentication.LaunchApp)
local ReportEphemeralCounterModule = require(Modules.LuaApp.Analytics.Events.reportEphemeralCounter)
local AppLoginCounterNamesModule = require(Modules.LuaApp.Analytics.Events.AppLoginCounterNames)
local LaunchContextModule = require(Modules.LuaApp.Enum.LaunchContext)
local LoggerModule = require(Modules.LuaApp.Components.Authentication.Logger)
local LoggingProtocolModule = require(CorePackages.Workspace.Packages.LoggingProtocol)
local Default = require(CorePackages.Workspace.Packages.LoggingProtocol).default
local PromiseModule = require(Modules.LuaApp.Promise)
local SetLoginResultModule = require(Modules.LuaApp.Actions.Authentication.SetLoginResult)
local FFlagRemoveUnusedLoginResultRoduxSlice = require(CorePackages.Workspace.Packages.SharedFlags).FFlagRemoveUnusedLoginResultRoduxSlice
local LoginErrorCodeSSOModule = require(Modules.LuaApp.Enum.LoginErrorCodeSSO)
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local RoactAnalyticsModule = require(Modules.LuaApp.Services.RoactAnalytics)
local UseRoactServiceModule = require(Modules.LuaApp.Hooks.useRoactService)
local UseAppPolicyModule = require(Modules.LuaApp.Hooks.useAppPolicy)
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local UseNavigationFunction = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local UseEarlyIsFocusedFunction = require(CorePackages.Workspace.Packages.Navigation).useEarlyIsFocused
local FFlagSSOLoggingProtocolEnabledModule = require(script.Parent.Flags.FFlagSSOLoggingProtocolEnabled)
local TelemetryConfigs = require(CorePackages.Workspace.Packages.AuthAnalytics).TelemetryConfigs
local PreauthPassToLuaFeatureEngineFeature = game:GetEngineFeature("PreauthPassToLuaFeature")

local function handleLoginResult(p1, p2, Callback: (any) -> (), p3, p4)
	-- upvalues: FFlagRemoveUnusedLoginResultRoduxSlice (copy), PreauthPassToLuaFeatureEngineFeature (copy), SetLoginResultModule (copy), ReportEphemeralCounterModule (copy), AppLoginCounterNamesModule (copy), FFlagSSOLoggingProtocolEnabledModule (copy), LaunchAppModule (copy), LaunchContextModule (copy), LoggingProtocolModule (copy)
	if not FFlagRemoveUnusedLoginResultRoduxSlice then
		if PreauthPassToLuaFeatureEngineFeature then
			if p1 then
				Callback(SetLoginResultModule(p1))
			end
		else
			Callback(SetLoginResultModule(p1))
		end
	end
	ReportEphemeralCounterModule(AppLoginCounterNamesModule.Success, 1)
	
	if FFlagSSOLoggingProtocolEnabledModule then
		Callback(LaunchAppModule(p2, nil, p3, p4, LaunchContextModule.Login, LoggingProtocolModule.default))
		
		return
	else
		Callback(LaunchAppModule(p2, nil, p3, p4))
	end
end

local function v28(Callback, p1, p2, p3, Callback1, Callback2)
	-- upvalues: PreauthPassToLuaFeatureEngineFeature (copy), MessageBusService (copy), LoggerModule (copy), handleLoginResult (copy), PromiseModule (copy), LoginSingleSignOnModule (copy), Default (copy), TelemetryConfigs (copy), LoginErrorCodeSSOModule (copy)
	if PreauthPassToLuaFeatureEngineFeature then
		MessageBusService:MakeRequest("Account", "consumePreauthStatus", {}, function(p4)
			-- upvalues: LoggerModule (upval), handleLoginResult (upval), p1 (copy), Callback (copy), p2 (copy), p3 (copy), PromiseModule (upval), LoginSingleSignOnModule (upval), Default (upval), TelemetryConfigs (upval), LoginErrorCodeSSOModule (upval), Callback1 (copy), Callback2 (copy)
			if p4 and p4.success then
				LoggerModule:error("Detected preauth successful, skipping Lua SSO.")
				handleLoginResult(nil, p1, Callback, p2, p3)
				
				return PromiseModule.resolve()
			else
				return Callback(LoginSingleSignOnModule(p1)):andThen(function(Result)
					-- upvalues: handleLoginResult (upval), p1 (upval), Callback (upval), p2 (upval), p3 (upval), Default (upval), TelemetryConfigs (upval), PromiseModule (upval)
					if Result then
						handleLoginResult(Result, p1, Callback, p2, p3)
						spawn(function()
							-- upvalues: Default (upval), TelemetryConfigs (upval)
							Default:logRobloxTelemetryCounter(TelemetryConfigs.ConsoleSSOAttemptedTelemetryConfig, 1, { status = "success" })
						end)
					end
					return PromiseModule.resolve()
				end, function(p5)
					-- upvalues: LoggerModule (upval), LoginErrorCodeSSOModule (upval), Default (upval), TelemetryConfigs (upval), Callback1 (upval), PromiseModule (upval), Callback2 (upval)
					local ErrorCode = p5.errorCode
					LoggerModule:warning(string.format("Single sign on failed error: %s", (tostring(ErrorCode))))
					
					if ErrorCode and (ErrorCode == LoginErrorCodeSSOModule.NoAccountConnected or ErrorCode == LoginErrorCodeSSOModule.NoAccountConnectedXbox) then
						pcall(function()
							-- upvalues: Default (upval), TelemetryConfigs (upval)
							Default:logRobloxTelemetryCounter(TelemetryConfigs.ConsoleSSOAttemptedTelemetryConfig, 1, { status = "noAccountFailure" })
						end)
						Callback1()
						
						return PromiseModule.resolve()
					else
						pcall(function()
							-- upvalues: Default (upval), TelemetryConfigs (upval)
							Default:logRobloxTelemetryCounter(TelemetryConfigs.ConsoleSSOAttemptedTelemetryConfig, 1, { status = "otherFailure" })
						end)
						Callback2()
						
						return PromiseModule.reject(p5)
					end
				end)
			end
		end, {})
		
		return PromiseModule.resolve()
	else
		return Callback(LoginSingleSignOnModule(p1)):andThen(function(Result)
			-- upvalues: Default (upval), TelemetryConfigs (upval), handleLoginResult (upval), p1 (copy), Callback (copy), p2 (copy), p3 (copy), PromiseModule (upval)
			if Result then
				pcall(function()
					-- upvalues: Default (upval), TelemetryConfigs (upval)
					Default:logRobloxTelemetryCounter(TelemetryConfigs.ConsoleSSOAttemptedTelemetryConfig, 1, { status = "success" })
				end)
				handleLoginResult(Result, p1, Callback, p2, p3)
			end
			return PromiseModule.resolve()
		end, function(p4)
			-- upvalues: LoggerModule (upval), LoginErrorCodeSSOModule (upval), Default (upval), TelemetryConfigs (upval), Callback1 (copy), PromiseModule (upval), Callback2 (copy)
			local ErrorCode = p4.errorCode
			LoggerModule:warning(string.format("Single sign on failed error: %s", (tostring(ErrorCode))))
			
			if ErrorCode and (ErrorCode == LoginErrorCodeSSOModule.NoAccountConnected or LoginErrorCodeSSOModule.NoAccountConnectedXbox) then
				pcall(function()
					-- upvalues: Default (upval), TelemetryConfigs (upval)
					Default:logRobloxTelemetryCounter(TelemetryConfigs.ConsoleSSOAttemptedTelemetryConfig, 1, { status = "noAccountFailure" })
				end)
				Callback1()
				
				return PromiseModule.resolve()
			else
				pcall(function()
					-- upvalues: Default (upval), TelemetryConfigs (upval)
					Default:logRobloxTelemetryCounter(TelemetryConfigs.ConsoleSSOAttemptedTelemetryConfig, 1, { status = "otherFailure" })
				end)
				Callback2()
				
				return PromiseModule.reject(p4)
			end
		end)
	end
end

local function v29(p1)
	return p1
end

return function(_)
	-- upvalues: UseNavigationFunction (copy), UseDispatchFunction (copy), UseRoactServiceModule (copy), RoactNetworkingModule (copy), RoactAnalyticsModule (copy), UseAppPolicyModule (copy), v29 (copy), ReactModule (copy), AppPageModule (copy), UseEarlyIsFocusedFunction (copy), Default (copy), v28 (copy), PromiseModule (copy), Loading (copy), IconSize (copy)
	local UseNavigationResult = UseNavigationFunction()
	local UseDispatchResult = UseDispatchFunction()
	local UseRoactServiceModuleResult = UseRoactServiceModule(RoactNetworkingModule)
	local UseRoactServiceModuleResult1 = UseRoactServiceModule(RoactAnalyticsModule)
	local UseAppPolicyModuleResult = UseAppPolicyModule(v29)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseNavigationResult (copy), AppPageModule (upval)
		return UseNavigationResult.replace(AppPageModule.Landing)
	end, { UseNavigationResult })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseNavigationResult (copy), AppPageModule (upval)
		return UseNavigationResult.navigate(AppPageModule.SingleSignOnError)
	end, { UseNavigationResult })
	local UseEarlyIsFocusedResult = UseEarlyIsFocusedFunction()
	ReactModule.useEffect(function()
		-- upvalues: Default (upval)
		Default:logEventOnce("single_sign_on_container_page_did_mount")
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: UseEarlyIsFocusedResult (copy), v28 (upval), UseDispatchResult (copy), UseRoactServiceModuleResult (copy), UseRoactServiceModuleResult1 (copy), UseAppPolicyModuleResult (copy), UseResult (copy), UseResult1 (copy), PromiseModule (upval)
		if UseEarlyIsFocusedResult then
			v28(UseDispatchResult, UseRoactServiceModuleResult, UseRoactServiceModuleResult1, UseAppPolicyModuleResult, UseResult, UseResult1):andThen(function(_)
				-- upvalues: PromiseModule (upval)
				return PromiseModule.resolve()
			end, function(_)
				-- upvalues: PromiseModule (upval)
				return PromiseModule.resolve()
			end)
		end
	end, { UseEarlyIsFocusedResult })
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		ZIndex = 1,
		Size = UDim2.fromScale(1, 1)
	}, {
		LoadingBar = ReactModule.createElement(Loading, {
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			size = IconSize.Large
		})
	})
end