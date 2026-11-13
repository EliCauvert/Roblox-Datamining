local GenericChallenges = script:FindFirstAncestor("GenericChallenges")
local Parent = GenericChallenges.Parent
local ReactModule = require(Parent.React)
local LoggingProtocolModule = require(Parent.LoggingProtocol)
local ChallengeEventConstantsModule = require(GenericChallenges.Utils.ChallengeEventConstants)
local DeniedChallengeViewModule = require(script.Parent.DeniedChallengeView)
local DeniedChallengeEventModule = require(script.Parent.DeniedChallengeEvent)
local ChallengeLifecycleEventConstants = ChallengeEventConstantsModule.ChallengeLifecycleEventConstants
local Default = LoggingProtocolModule.default

return function(p1)
	-- upvalues: Default (copy), ReactModule (copy), DeniedChallengeEventModule (copy), ChallengeLifecycleEventConstants (copy), DeniedChallengeViewModule (copy)
	local Logging = p1.logging or Default
	local ChallengeId = p1.challengeId
	local Reason = p1.reason
	local Prompt = p1.prompt
	local UseRefResult = ReactModule.useRef(p1.onChallengeAbandoned)
	UseRefResult.current = p1.onChallengeAbandoned
	local UseRefResult1 = ReactModule.useRef(p1.onChallengeLoaded)
	UseRefResult1.current = p1.onChallengeLoaded
	local UseResult = ReactModule.useCallback(function(Context)
		-- upvalues: Logging (copy), DeniedChallengeEventModule (upval), ChallengeId (copy), Reason (copy), Prompt (copy)
		Logging:logRobloxTelemetryEvent(DeniedChallengeEventModule, {}, {
			context = Context,
			challengeId = ChallengeId,
			reason = Reason,
			prompt = Prompt
		})
	end, { Logging, ChallengeId, Reason, Prompt })
	ReactModule.useEffect(function()
		-- upvalues: UseResult (copy), ChallengeLifecycleEventConstants (upval), UseRefResult1 (copy)
		UseResult(ChallengeLifecycleEventConstants.ChallengeInitialized)
		UseResult(ChallengeLifecycleEventConstants.ChallengeDisplayed)
		
		if UseRefResult1.current then
			UseRefResult1.current(true)
		end
	end, { UseResult })
	
	return ReactModule.createElement(DeniedChallengeViewModule, {
		prompt = Prompt,
		onAcknowledge = ReactModule.useCallback(function()
			-- upvalues: UseResult (copy), ChallengeLifecycleEventConstants (upval), UseRefResult (copy)
			UseResult(ChallengeLifecycleEventConstants.ChallengeAbandoned)
			
			if UseRefResult.current then
				UseRefResult.current()
			end
		end, { UseResult }),
		opaqueBackdrop = p1.opaqueBackdrop
	})
end