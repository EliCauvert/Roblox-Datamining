local httpService = game:GetService("HttpService")
local genericChallenges = script:FindFirstAncestor("GenericChallenges")
local parent = genericChallenges.Parent
local reactModule = require(parent.React)
local useRoactService = require(parent.RobloxAppHooks).useRoactService
local appLogging = require(parent.RoactServiceTags).AppLogging
local foundationModule = require(parent.Foundation)
local iconSize = foundationModule.Enums.IconSize
local loading = foundationModule.Loading
local deviceIntegrityChallengeEventModule = require(script.Parent.DeviceIntegrityChallengeEvent)
local getFFlagEnableTransparentDeviceIntegrityChallengeSpinnerModule = require(genericChallenges.Middleware.Flags.GetFFlagEnableTransparentDeviceIntegrityChallengeSpinner)
local getFFlagEnableNewDeviceIntegrityFailureHandlingModule = require(genericChallenges.Middleware.Flags.GetFFlagEnableNewDeviceIntegrityFailureHandling)
local useEffect = reactModule.useEffect
local challengeEventConstantsModule = require(genericChallenges.Utils.ChallengeEventConstants)
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
game:DefineFastInt("DeviceIntegrityNativeTimeoutMilliseconds", 450)

function constructAccountServiceParams(p0)
	-- upvalues: httpService (ref)
	return httpService:JSONEncode({ requestHash = p0 })
end

return function(p1)
	-- upvalues: useRoactService (ref), appLogging (ref), useEffect (ref), httpService (ref), deviceIntegrityChallengeEventModule (ref), challengeEventConstantsModule (ref), getFFlagEnableNewDeviceIntegrityFailureHandlingModule (ref), useSelector (ref), getFFlagEnableTransparentDeviceIntegrityChallengeSpinnerModule (ref), reactModule (ref), loading (ref), iconSize (ref)
	local var8 = useRoactService(appLogging)
	useEffect(function()
		-- upvalues: httpService (copy), p1 (ref), var8 (ref), deviceIntegrityChallengeEventModule (copy), challengeEventConstantsModule (copy), getFFlagEnableNewDeviceIntegrityFailureHandlingModule (copy)
		local challengeMetadata = httpService:JSONDecode(p1.challengeMetadata)
		var8:logRobloxTelemetryEvent(deviceIntegrityChallengeEventModule, {}, {
			context = challengeEventConstantsModule.ChallengeLifecycleEventConstants.ChallengeInitialized,
			challengeId = p1.challengeId,
			integrityType = challengeMetadata.integrityType
		})
		local accountService = p1.accountService
		
		if accountService and accountService:DeviceIntegrityAvailable() then
			local var13
			local _ = nil
			
			if getFFlagEnableNewDeviceIntegrityFailureHandlingModule() then
				local var12 = accountService:GetDeviceIntegrityTokenYield(httpService:JSONEncode({
					requestHash = challengeMetadata.requestHash,
					timeoutMillis = game:GetFastInt("DeviceIntegrityNativeTimeoutMilliseconds")
				}))
				
				if var12 == nil or var12 == "" then
					var8:logRobloxTelemetryEvent(deviceIntegrityChallengeEventModule, {}, {
						context = challengeEventConstantsModule.ChallengeLifecycleEventConstants.ChallengeInvalidated,
						challengeId = p1.challengeId,
						integrityType = challengeMetadata.integrityType
					})
					p1.onChallengeCompleted(httpService:JSONEncode({
						redemptionToken = "",
						integrityType = challengeMetadata.integrityType
					}))
					
					return
				end
				var13 = httpService:JSONDecode(var12)
			else
				var13 = httpService:JSONDecode(accountService:GetDeviceIntegrityTokenYield(constructAccountServiceParams(challengeMetadata.requestHash)))
			end
			p1.onChallengeCompleted(httpService:JSONEncode({
				redemptionToken = var13.token,
				integrityType = challengeMetadata.integrityType
			}))
			var8:logRobloxTelemetryEvent(deviceIntegrityChallengeEventModule, {}, {
				context = challengeEventConstantsModule.ChallengeLifecycleEventConstants.ChallengeCompleted,
				challengeId = p1.challengeId,
				integrityType = challengeMetadata.integrityType,
				result = var13.result
			})
			
			return
		elseif getFFlagEnableNewDeviceIntegrityFailureHandlingModule() then
			var8:logRobloxTelemetryEvent(deviceIntegrityChallengeEventModule, {}, {
				context = challengeEventConstantsModule.ChallengeLifecycleEventConstants.ChallengeInvalidated,
				challengeId = p1.challengeId,
				integrityType = challengeMetadata.integrityType
			})
			p1.onChallengeCompleted(httpService:JSONEncode({
				redemptionToken = "",
				integrityType = challengeMetadata.integrityType
			}))
			
			return
		end
		p1.onChallengeFailed()
		var8:logRobloxTelemetryEvent(deviceIntegrityChallengeEventModule, {}, {
			context = challengeEventConstantsModule.ChallengeLifecycleEventConstants.ChallengeInvalidated,
			challengeId = p1.challengeId,
			integrityType = challengeMetadata.integrityType
		})
	end, {})
	local var9 = useSelector(function(p2)
		return { screenSize = p2.ScreenSize }
	end)
	local uDim2 = UDim2.fromOffset(var9.screenSize.X, var9.screenSize.Y)
	
	return if getFFlagEnableTransparentDeviceIntegrityChallengeSpinnerModule() then reactModule.createElement("Frame", { BackgroundTransparency = 1, Active = true, Size = uDim2 }, {
		Spinner = reactModule.createElement(loading, {
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			size = iconSize.Large
		})
	}) else reactModule.createElement("Frame", {
		BackgroundTransparency = 0.2,
		Active = true,
		Size = uDim2
	}, {
		Spinner = reactModule.createElement(loading, {
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			size = iconSize.Large
		})
	})
end