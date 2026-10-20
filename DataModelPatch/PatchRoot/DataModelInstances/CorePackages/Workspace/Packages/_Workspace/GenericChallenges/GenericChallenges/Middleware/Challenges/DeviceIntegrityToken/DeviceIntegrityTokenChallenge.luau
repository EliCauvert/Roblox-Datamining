local HttpService = game:GetService("HttpService")
local GenericChallenges = script:FindFirstAncestor("GenericChallenges")
local Parent = GenericChallenges.Parent
local ReactModule = require(Parent.React)
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local AppLogging = require(Parent.RoactServiceTags).AppLogging
local FoundationModule = require(Parent.Foundation)
local IconSize = FoundationModule.Enums.IconSize
local Loading = FoundationModule.Loading
local DeviceIntegrityChallengeEventModule = require(script.Parent.DeviceIntegrityChallengeEvent)
local GetFFlagEnableTransparentDeviceIntegrityChallengeSpinnerModule = require(GenericChallenges.Middleware.Flags.GetFFlagEnableTransparentDeviceIntegrityChallengeSpinner)
local GetFFlagEnableNewDeviceIntegrityFailureHandlingModule = require(GenericChallenges.Middleware.Flags.GetFFlagEnableNewDeviceIntegrityFailureHandling)
local UseEffectFunction = ReactModule.useEffect
local ChallengeEventConstantsModule = require(GenericChallenges.Utils.ChallengeEventConstants)
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
game:DefineFastInt("DeviceIntegrityNativeTimeoutMilliseconds", 450)

function constructAccountServiceParams(RequestHash)
	-- upvalues: HttpService (copy)
	return HttpService:JSONEncode({ requestHash = RequestHash })
end

return function(p1)
	-- upvalues: UseRoactServiceFunction (copy), AppLogging (copy), UseEffectFunction (copy), HttpService (copy), DeviceIntegrityChallengeEventModule (copy), ChallengeEventConstantsModule (copy), GetFFlagEnableNewDeviceIntegrityFailureHandlingModule (copy), UseSelectorFunction (copy), GetFFlagEnableTransparentDeviceIntegrityChallengeSpinnerModule (copy), ReactModule (copy), Loading (copy), IconSize (copy)
	local UseRoactServiceResult = UseRoactServiceFunction(AppLogging)
	UseEffectFunction(function()
		-- upvalues: HttpService (upval), p1 (copy), UseRoactServiceResult (copy), DeviceIntegrityChallengeEventModule (upval), ChallengeEventConstantsModule (upval), GetFFlagEnableNewDeviceIntegrityFailureHandlingModule (upval)
		local Data = HttpService:JSONDecode(p1.challengeMetadata)
		UseRoactServiceResult:logRobloxTelemetryEvent(DeviceIntegrityChallengeEventModule, {}, {
			context = ChallengeEventConstantsModule.ChallengeLifecycleEventConstants.ChallengeInitialized,
			challengeId = p1.challengeId,
			integrityType = Data.integrityType
		})
		local AccountService = p1.accountService
		
		if AccountService and AccountService:DeviceIntegrityAvailable() then
			local Data1 = nil
			if GetFFlagEnableNewDeviceIntegrityFailureHandlingModule() then
				local DeviceIntegrityTokenYield = AccountService:GetDeviceIntegrityTokenYield((HttpService:JSONEncode({
					requestHash = Data.requestHash,
					timeoutMillis = game:GetFastInt("DeviceIntegrityNativeTimeoutMilliseconds")
				})))
				
				if DeviceIntegrityTokenYield == nil or DeviceIntegrityTokenYield == "" then
					UseRoactServiceResult:logRobloxTelemetryEvent(DeviceIntegrityChallengeEventModule, {}, {
						context = ChallengeEventConstantsModule.ChallengeLifecycleEventConstants.ChallengeInvalidated,
						challengeId = p1.challengeId,
						integrityType = Data.integrityType
					})
					p1.onChallengeCompleted(HttpService:JSONEncode({ redemptionToken = "", integrityType = Data.integrityType }))
					
					return
				end
				Data1 = HttpService:JSONDecode(DeviceIntegrityTokenYield)
			else
				Data1 = HttpService:JSONDecode(AccountService:GetDeviceIntegrityTokenYield(constructAccountServiceParams(Data.requestHash)))
			end
			p1.onChallengeCompleted(HttpService:JSONEncode({
				redemptionToken = Data1.token,
				integrityType = Data.integrityType
			}))
			UseRoactServiceResult:logRobloxTelemetryEvent(DeviceIntegrityChallengeEventModule, {}, {
				context = ChallengeEventConstantsModule.ChallengeLifecycleEventConstants.ChallengeCompleted,
				challengeId = p1.challengeId,
				integrityType = Data.integrityType,
				result = Data1.result
			})
			
			return
		elseif GetFFlagEnableNewDeviceIntegrityFailureHandlingModule() then
			UseRoactServiceResult:logRobloxTelemetryEvent(DeviceIntegrityChallengeEventModule, {}, {
				context = ChallengeEventConstantsModule.ChallengeLifecycleEventConstants.ChallengeInvalidated,
				challengeId = p1.challengeId,
				integrityType = Data.integrityType
			})
			p1.onChallengeCompleted(HttpService:JSONEncode({ redemptionToken = "", integrityType = Data.integrityType }))
			
			return
		else
			p1.onChallengeFailed()
			UseRoactServiceResult:logRobloxTelemetryEvent(DeviceIntegrityChallengeEventModule, {}, {
				context = ChallengeEventConstantsModule.ChallengeLifecycleEventConstants.ChallengeInvalidated,
				challengeId = p1.challengeId,
				integrityType = Data.integrityType
			})
		end
	end, {})
	local UseSelectorResult = UseSelectorFunction(function(p2)
		return { screenSize = p2.ScreenSize }
	end)
	local _UDim2 = UDim2.fromOffset(UseSelectorResult.screenSize.X, UseSelectorResult.screenSize.Y)
	
	return if GetFFlagEnableTransparentDeviceIntegrityChallengeSpinnerModule() then ReactModule.createElement("Frame", { BackgroundTransparency = 1, Active = true, Size = _UDim2 }, {
		Spinner = ReactModule.createElement(Loading, {
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			size = IconSize.Large
		})
	}) else ReactModule.createElement("Frame", {
		BackgroundTransparency = 0.2,
		Active = true,
		Size = _UDim2
	}, {
		Spinner = ReactModule.createElement(Loading, {
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			size = IconSize.Large
		})
	})
end