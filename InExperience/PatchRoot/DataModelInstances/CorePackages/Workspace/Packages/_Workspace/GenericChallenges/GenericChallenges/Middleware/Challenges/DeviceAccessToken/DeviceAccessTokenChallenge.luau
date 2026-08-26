local httpService = game:GetService("HttpService")
local genericChallenges = script:FindFirstAncestor("GenericChallenges")
local parent = genericChallenges.Parent
local useRoactService = require(parent.RobloxAppHooks).useRoactService
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local reactModule = require(parent.React)
local useState = reactModule.useState
local useEffect = reactModule.useEffect
local roactModule = require(parent.Roact)
local roactNavigationModule = require(parent.RoactNavigation)
local appLogging = require(parent.RoactServiceTags).AppLogging
local foundationModule = require(parent.Foundation)
local iconSize = foundationModule.Enums.IconSize
local loading = foundationModule.Loading
local deviceAccessChallengeEventModule = require(script.Parent.DeviceAccessChallengeEvent)
local challengeEventConstantsModule = require(genericChallenges.Utils.ChallengeEventConstants)
local getFFlagLuaAppChallengeMoreTelemetryEnabledModule = require(genericChallenges.Middleware.Flags.GetFFlagLuaAppChallengeMoreTelemetryEnabled)

return function(p1)
	-- upvalues: useRoactService (ref), appLogging (ref), httpService (ref), getFFlagLuaAppChallengeMoreTelemetryEnabledModule (ref), useState (ref), useEffect (ref), deviceAccessChallengeEventModule (ref), challengeEventConstantsModule (ref), useSelector (ref), roactModule (ref), loading (ref), iconSize (ref), roactNavigationModule (ref)
	local var1 = useRoactService(appLogging)
	local var2 = nil
	local var3 = nil
	local var4 = nil
	local var5 = nil
	local challengeMetadata = httpService:JSONDecode(p1.challengeMetadata)
	
	if getFFlagLuaAppChallengeMoreTelemetryEnabledModule() then
		local var6, var7 = useState(false)
		var2 = var6
		var3 = var7
		local var8, var9 = useState(false)
		var4 = var8
		var5 = var9
	end
	useEffect(function()
		-- upvalues: var1 (ref), deviceAccessChallengeEventModule (copy), challengeEventConstantsModule (copy), p1 (ref), challengeMetadata (ref), httpService (copy), getFFlagLuaAppChallengeMoreTelemetryEnabledModule (copy), var3 (write), var5 (write)
		var1:logRobloxTelemetryEvent(deviceAccessChallengeEventModule, {}, {
			context = challengeEventConstantsModule.ChallengeLifecycleEventConstants.ChallengeInitialized,
			challengeId = p1.challengeId,
			tokenType = challengeMetadata.tokenType
		})
		local accountService = p1.accountService
		local errorCode = nil
		
		if accountService and accountService:DeviceAccessTokenAvailable() then
			local var10 = httpService:JSONDecode(accountService:GetDeviceAccessToken())
			errorCode = var10.errorCode
			
			if errorCode == nil or errorCode == "" then
				var10.accessToken.tokenType = challengeMetadata.tokenType
				
				if getFFlagLuaAppChallengeMoreTelemetryEnabledModule() then
					var3(true)
				end
				p1.onChallengeCompleted(httpService:JSONEncode(var10.accessToken))
				var1:logRobloxTelemetryEvent(deviceAccessChallengeEventModule, {}, {
					context = challengeEventConstantsModule.ChallengeLifecycleEventConstants.ChallengeCompleted,
					challengeId = p1.challengeId,
					tokenType = challengeMetadata.tokenType
				})
				
				return
			elseif getFFlagLuaAppChallengeMoreTelemetryEnabledModule() then
				var5(true)
			end
			p1.onChallengeFailed(errorCode)
			var1:logRobloxTelemetryEvent(deviceAccessChallengeEventModule, {}, {
				context = challengeEventConstantsModule.ChallengeLifecycleEventConstants.ChallengeInvalidated,
				challengeId = p1.challengeId,
				tokenType = challengeMetadata.tokenType,
				errorCode = errorCode
			})
		end
	end, {})
	local var10 = useSelector(function(p2)
		return { screenSize = p2.ScreenSize }
	end)
	
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 0.2,
		Active = true,
		Size = UDim2.fromOffset(var10.screenSize.X, var10.screenSize.Y)
	}, {
		Spinner = roactModule.createElement(loading, {
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			size = iconSize.Large
		}),
		NavigationEvents = if getFFlagLuaAppChallengeMoreTelemetryEnabledModule() then roactModule.createElement(roactNavigationModule.NavigationEvents, {
			onWillBlur = function()
				-- upvalues: var2 (write), var4 (write), var1 (ref), deviceAccessChallengeEventModule (copy), challengeEventConstantsModule (copy), p1 (ref), challengeMetadata (ref)
				if not var2 and not var4 then
					var1:logRobloxTelemetryEvent(deviceAccessChallengeEventModule, {}, {
						context = challengeEventConstantsModule.ChallengeLifecycleEventConstants.ChallengeAbandoned,
						challengeId = p1.challengeId,
						tokenType = challengeMetadata.tokenType
					})
				end
			end
		}) else nil
	})
end