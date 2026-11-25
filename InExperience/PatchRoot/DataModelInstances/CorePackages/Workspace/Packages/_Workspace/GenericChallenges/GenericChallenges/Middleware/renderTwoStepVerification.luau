local GenericChallenges = script:FindFirstAncestor("GenericChallenges")
local ChallengeTypeModule = require(GenericChallenges.Types.ChallengeType)
local _ = require(GenericChallenges.Types.TwoStepVerificationActionType)
local RenderChallengeModule = require(script.Parent.RenderChallenge)

return function(p1)
	-- upvalues: RenderChallengeModule (copy), ChallengeTypeModule (copy)
	local Callbacks = p1.callbacks
	local OnLoadFailed = Callbacks.onLoadFailed or Callbacks.onInvalidated
	local Flag = false
	
	local function _(): boolean
		-- upvalues: Flag (ref)
		if Flag then
			return false
		else
			Flag = true
			
			return true
		end
	end
	
	;(p1.renderChallenge or RenderChallengeModule)({
		title = p1.title or "Authentication.Login.Label.TwoStepVerification",
		challengeType = ChallengeTypeModule.TwoStepVerification,
		challengeParameters = {
			actionType = p1.actionType,
			challengeId = p1.challengeId,
			userId = tostring(p1.userId),
			allowRememberDevice = p1.allowRememberDevice == true,
			clientSupports2svRecovery = p1.clientSupports2svRecovery == true
		},
		callbacks = {
			OnChallengeCompleted = function(p2)
				-- upvalues: Flag (ref), Callbacks (copy)
				local Flag1 = nil
				if Flag then
					Flag1 = false
				else
					Flag = true
					Flag1 = true
				end
				if not Flag1 then return end
				local Data = if typeof(p2) == "table" then p2.data else nil
				local VerificationToken = if typeof(Data) == "table" then Data.verificationToken else nil
				
				if typeof(VerificationToken) == "string" and VerificationToken ~= "" then
					Callbacks.onVerified(VerificationToken, Data.rememberDevice == true)
					
					return
				else
					Callbacks.onInvalidated()
				end
			end,
			OnChallengeAbandoned = function()
				-- upvalues: Flag (ref), Callbacks (copy)
				local Flag1 = nil
				if Flag then
					Flag1 = false
				else
					Flag = true
					Flag1 = true
				end
				if Flag1 then
					Callbacks.onAbandoned()
				end
			end,
			OnChallengeInvalidated = function(_)
				-- upvalues: Flag (ref), Callbacks (copy)
				local Flag1 = nil
				if Flag then
					Flag1 = false
				else
					Flag = true
					Flag1 = true
				end
				if Flag1 then
					Callbacks.onInvalidated()
				end
			end,
			OnChallengeLoadFailed = function(_)
				-- upvalues: Flag (ref), OnLoadFailed (copy)
				local Flag1 = nil
				if Flag then
					Flag1 = false
				else
					Flag = true
					Flag1 = true
				end
				if Flag1 then
					OnLoadFailed()
				end
			end
		}
	})
end