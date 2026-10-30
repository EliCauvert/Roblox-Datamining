local Parent = script:FindFirstAncestor("GenericChallenges").Parent
local HttpService = game:GetService("HttpService")
local ReactModule = require(Parent.React)
local Base64 = require(Parent.AuthCommon).Utils.Base64
local RoCaptchaChallengeViewModule = require(script.Parent.RoCaptchaChallengeView)
local RoCaptchaChallengeEventModule = require(script.Parent.RoCaptchaChallengeEvent)
local RoCaptchaChallengeContextModule = require(script.Parent.RoCaptchaChallengeContext)
local ExperienceService = require(Parent.ExperienceService).ExperienceService
local Default = require(Parent.LoggingProtocol).default

return function(p1)
	-- upvalues: ExperienceService (copy), Default (copy), ReactModule (copy), Base64 (copy), HttpService (copy), RoCaptchaChallengeEventModule (copy), RoCaptchaChallengeContextModule (copy), RoCaptchaChallengeViewModule (copy)
	local ExperienceService1 = p1.experienceService or ExperienceService
	local DesiredPlaceId = p1.desiredPlaceId or game.PlaceId
	local Logging = p1.logging or Default
	local ChallengeId = p1.challengeId
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: Base64 (upval), p1 (copy), HttpService (upval)
		local DecodeResult = Base64.Decode(p1.challengeMetadata)
		local Success, Result = pcall(function()
			-- upvalues: HttpService (upval), DecodeResult (copy)
			return HttpService:JSONDecode(DecodeResult)
		end)
		
		return Success and Result and tonumber(Result.challengePlaceId) or nil
	end, { p1.challengeMetadata })
	local UseRefResult = ReactModule.useRef(p1.onChallengeFailed)
	UseRefResult.current = p1.onChallengeFailed
	local UseRefResult1 = ReactModule.useRef(p1.onChallengeAbandoned)
	UseRefResult1.current = p1.onChallengeAbandoned
	local UseRefResult2 = ReactModule.useRef(p1.onChallengeLoaded)
	UseRefResult2.current = p1.onChallengeLoaded
	local UseResult = ReactModule.useCallback(function(Context)
		-- upvalues: Logging (copy), RoCaptchaChallengeEventModule (upval), ChallengeId (copy), UseMemoResult (copy)
		Logging:logRobloxTelemetryEvent(RoCaptchaChallengeEventModule, {}, {
			context = Context,
			challengeId = ChallengeId,
			challengePlaceId = UseMemoResult
		})
	end, { Logging, ChallengeId, UseMemoResult })
	ReactModule.useEffect(function()
		-- upvalues: UseResult (copy), RoCaptchaChallengeContextModule (upval), UseMemoResult (copy), UseRefResult2 (copy), UseRefResult (copy)
		UseResult(RoCaptchaChallengeContextModule.ChallengeInitialized)
		
		if UseMemoResult == nil then
			UseResult(RoCaptchaChallengeContextModule.ChallengeInvalidated)
			
			if UseRefResult2.current then
				UseRefResult2.current(false)
			end
			if UseRefResult.current then
				UseRefResult.current()
				
				return
			end
		else
			UseResult(RoCaptchaChallengeContextModule.ChallengeDisplayed)
			
			if UseRefResult2.current then
				UseRefResult2.current(true)
			end
		end
	end, { UseResult, UseMemoResult })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseResult (copy), RoCaptchaChallengeContextModule (upval), ExperienceService1 (copy), UseMemoResult (copy), HttpService (upval), ChallengeId (copy), DesiredPlaceId (copy)
		UseResult(RoCaptchaChallengeContextModule.ChallengeLaunched)
		ExperienceService1:LaunchExperience({
			placeId = UseMemoResult,
			launchData = HttpService:JSONEncode({
				challengeId = ChallengeId,
				desiredPlaceId = DesiredPlaceId
			})
		}, "RoCaptchaChallenge")
	end, {
		UseResult,
		ExperienceService1,
		ChallengeId,
		UseMemoResult,
		DesiredPlaceId
	})
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: UseResult (copy), RoCaptchaChallengeContextModule (upval), UseRefResult1 (copy)
		UseResult(RoCaptchaChallengeContextModule.ChallengeAbandoned)
		
		if UseRefResult1.current then
			UseRefResult1.current()
		end
	end, { UseResult })
	
	return if UseMemoResult == nil then nil else ReactModule.createElement(RoCaptchaChallengeViewModule, {
		onJoin = UseResult1,
		onAbandon = UseResult2,
		waitForFrame = p1.waitForFrame
	})
end