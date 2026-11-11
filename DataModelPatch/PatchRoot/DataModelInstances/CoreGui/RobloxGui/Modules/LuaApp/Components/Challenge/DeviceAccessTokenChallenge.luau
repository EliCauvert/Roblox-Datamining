local CorePackages = game:GetService("CorePackages")
local HttpService = game:GetService("HttpService")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local UseRoactServiceFunction = require(CorePackages.Workspace.Packages.RobloxAppHooks).useRoactService
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local ReactModule = require(CorePackages.Packages.React)
local UseStateFunction = ReactModule.useState
local UseEffectFunction = ReactModule.useEffect
local RoactModule = require(Modules.Common.Roact)
local RoactNavigationModule = require(CorePackages.Packages.RoactNavigation)
local AppLogging = require(CorePackages.Workspace.Packages.RoactServiceTags).AppLogging
local FoundationModule = require(CorePackages.Packages.Foundation)
local IconSize = FoundationModule.Enums.IconSize
local Loading = FoundationModule.Loading
local DeviceAccessChallengeEventModule = require(Modules.LuaApp.Analytics.RobloxTelemetryConfigs.DeviceAccessChallengeEvent)
local ChallengeEventConstantsModule = require(Modules.LuaApp.Components.Challenge.ChallengeEventConstants)
local GetFFlagLuaAppChallengeMoreTelemetryEnabledModule = require(Modules.LuaApp.Flags.GetFFlagLuaAppChallengeMoreTelemetryEnabled)

return function(p1)
	-- upvalues: UseRoactServiceFunction (copy), AppLogging (copy), HttpService (copy), GetFFlagLuaAppChallengeMoreTelemetryEnabledModule (copy), UseStateFunction (copy), UseEffectFunction (copy), DeviceAccessChallengeEventModule (copy), ChallengeEventConstantsModule (copy), UseSelectorFunction (copy), RoactModule (copy), Loading (copy), IconSize (copy), RoactNavigationModule (copy)
	local UseRoactServiceResult = UseRoactServiceFunction(AppLogging)
	local v1 = nil
	local Callback1 = nil
	local v2 = nil
	local Callback = nil
	local Data = HttpService:JSONDecode(p1.challengeMetadata)
	
	if GetFFlagLuaAppChallengeMoreTelemetryEnabledModule() then
		v1, Callback1 = UseStateFunction(false)
		v2, Callback = UseStateFunction(false)
	end
	UseEffectFunction(function()
		-- upvalues: UseRoactServiceResult (copy), DeviceAccessChallengeEventModule (upval), ChallengeEventConstantsModule (upval), p1 (copy), Data (copy), HttpService (upval), GetFFlagLuaAppChallengeMoreTelemetryEnabledModule (upval), Callback1 (ref), Callback (ref)
		UseRoactServiceResult:logRobloxTelemetryEvent(DeviceAccessChallengeEventModule, {}, {
			context = ChallengeEventConstantsModule.ChallengeLifecycleEventConstants.ChallengeInitialized,
			challengeId = p1.challengeId,
			tokenType = Data.tokenType
		})
		local AccountService = p1.accountService
		local ErrorCode = nil
		
		if AccountService and AccountService:DeviceAccessTokenAvailable() then
			local Data1 = HttpService:JSONDecode(AccountService:GetDeviceAccessToken())
			ErrorCode = Data1.errorCode
			
			if ErrorCode == nil or ErrorCode == "" then
				Data1.accessToken.tokenType = Data.tokenType
				
				if GetFFlagLuaAppChallengeMoreTelemetryEnabledModule() then
					Callback1(true)
				end
				p1.onChallengeCompleted(HttpService:JSONEncode(Data1.accessToken))
				UseRoactServiceResult:logRobloxTelemetryEvent(DeviceAccessChallengeEventModule, {}, {
					context = ChallengeEventConstantsModule.ChallengeLifecycleEventConstants.ChallengeCompleted,
					challengeId = p1.challengeId,
					tokenType = Data.tokenType
				})
				
				return
			end
		end
		if GetFFlagLuaAppChallengeMoreTelemetryEnabledModule() then
			Callback(true)
		end
		p1.onChallengeFailed(ErrorCode)
		UseRoactServiceResult:logRobloxTelemetryEvent(DeviceAccessChallengeEventModule, {}, {
			context = ChallengeEventConstantsModule.ChallengeLifecycleEventConstants.ChallengeInvalidated,
			challengeId = p1.challengeId,
			tokenType = Data.tokenType,
			errorCode = ErrorCode
		})
	end, {})
	local UseSelectorResult = UseSelectorFunction(function(p2)
		return { screenSize = p2.ScreenSize }
	end)
	
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 0.2,
		Active = true,
		Size = UDim2.fromOffset(UseSelectorResult.screenSize.X, UseSelectorResult.screenSize.Y)
	}, {
		Spinner = RoactModule.createElement(Loading, {
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			size = IconSize.Large
		}),
		NavigationEvents = if GetFFlagLuaAppChallengeMoreTelemetryEnabledModule() then RoactModule.createElement(RoactNavigationModule.NavigationEvents, {
			onWillBlur = function()
				-- upvalues: v1 (ref), v2 (ref), UseRoactServiceResult (copy), DeviceAccessChallengeEventModule (upval), ChallengeEventConstantsModule (upval), p1 (copy), Data (copy)
				if not v1 and not v2 then
					UseRoactServiceResult:logRobloxTelemetryEvent(DeviceAccessChallengeEventModule, {}, {
						context = ChallengeEventConstantsModule.ChallengeLifecycleEventConstants.ChallengeAbandoned,
						challengeId = p1.challengeId,
						tokenType = Data.tokenType
					})
				end
			end
		}) else nil
	})
end