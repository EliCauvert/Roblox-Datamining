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

return function(p0)
	-- upvalues: useRoactService (ref), appLogging (ref), httpService (ref), getFFlagLuaAppChallengeMoreTelemetryEnabledModule (ref), useState (ref), useEffect (ref), deviceAccessChallengeEventModule (ref), challengeEventConstantsModule (ref), useSelector (ref), roactModule (ref), loading (ref), iconSize (ref), roactNavigationModule (ref)
	local var9 = useRoactService(appLogging)
	local var10 = nil
	local var11 = nil
	local var12 = nil
	local var13 = nil
	local challengeMetadata = httpService:JSONDecode(p0.challengeMetadata)
	
	if getFFlagLuaAppChallengeMoreTelemetryEnabledModule() then
		local var15, var16 = useState(false)
		var10 = var15
		var11 = var16
		local var17, var18 = useState(false)
		var12 = var17
		var13 = var18
	end
	useEffect(function()
		-- upvalues: var9 (ref), deviceAccessChallengeEventModule (copy), challengeEventConstantsModule (copy), p0 (ref), challengeMetadata (ref), httpService (copy), getFFlagLuaAppChallengeMoreTelemetryEnabledModule (copy), var11 (write), var13 (write)
		var9:logRobloxTelemetryEvent(deviceAccessChallengeEventModule, {}, {
			context = challengeEventConstantsModule.ChallengeLifecycleEventConstants.ChallengeInitialized,
			challengeId = p0.challengeId,
			tokenType = challengeMetadata.tokenType
		})
		local accountService = p0.accountService
		local errorCode = nil
		
		if accountService and accountService:DeviceAccessTokenAvailable() then
			local var20 = httpService:JSONDecode(accountService:GetDeviceAccessToken())
			errorCode = var20.errorCode
			
			if errorCode == nil or errorCode == "" then
				var20.accessToken.tokenType = challengeMetadata.tokenType
				
				if getFFlagLuaAppChallengeMoreTelemetryEnabledModule() then
					var11(true)
				end
				p0.onChallengeCompleted(httpService:JSONEncode(var20.accessToken))
				var9:logRobloxTelemetryEvent(deviceAccessChallengeEventModule, {}, {
					context = challengeEventConstantsModule.ChallengeLifecycleEventConstants.ChallengeCompleted,
					challengeId = p0.challengeId,
					tokenType = challengeMetadata.tokenType
				})
				
				return
			elseif getFFlagLuaAppChallengeMoreTelemetryEnabledModule() then
				var13(true)
			end
			p0.onChallengeFailed(errorCode)
			var9:logRobloxTelemetryEvent(deviceAccessChallengeEventModule, {}, {
				context = challengeEventConstantsModule.ChallengeLifecycleEventConstants.ChallengeInvalidated,
				challengeId = p0.challengeId,
				tokenType = challengeMetadata.tokenType,
				errorCode = errorCode
			})
		end
	end, {})
	local var19 = useSelector(function(p1)
		return { screenSize = p1.ScreenSize }
	end)
	
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 0.2,
		Active = true,
		Size = UDim2.fromOffset(var19.screenSize.X, var19.screenSize.Y)
	}, {
		Spinner = roactModule.createElement(loading, {
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			size = iconSize.Large
		}),
		NavigationEvents = if getFFlagLuaAppChallengeMoreTelemetryEnabledModule() then roactModule.createElement(roactNavigationModule.NavigationEvents, {
			onWillBlur = function()
				-- upvalues: var10 (write), var12 (write), var9 (ref), deviceAccessChallengeEventModule (copy), challengeEventConstantsModule (copy), p0 (ref), challengeMetadata (ref)
				if not var10 and not var12 then
					var9:logRobloxTelemetryEvent(deviceAccessChallengeEventModule, {}, {
						context = challengeEventConstantsModule.ChallengeLifecycleEventConstants.ChallengeAbandoned,
						challengeId = p0.challengeId,
						tokenType = challengeMetadata.tokenType
					})
				end
			end
		}) else nil
	})
end