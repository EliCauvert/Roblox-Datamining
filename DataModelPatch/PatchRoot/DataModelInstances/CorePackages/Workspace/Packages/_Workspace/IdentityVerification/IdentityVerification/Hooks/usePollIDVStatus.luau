local Parent = script:FindFirstAncestor("IdentityVerification").Parent
local ReactModule = require(Parent.React)
local PromiseModule = require(Parent.Promise)
local IDVApiProviderModule = require(script.Parent.Parent.Utils.IDVApiProvider)
local EnumsModule = require(script.Parent.Parent.Common.Enums)
local IDVSessionStatusEnum = EnumsModule.IDVSessionStatusEnum
local IDVSessionErrorEnum = EnumsModule.IDVSessionErrorEnum
local v1 = require(script.Parent.Parent.Flags.GetFIntIDVPollDelay)()
local v2 = require(script.Parent.Parent.Flags.GetFIntIDVMaxRetries)()
local v3 = require(script.Parent.Parent.Flags.GetFFlagIDVGuardStartPollingAfterUnmount)()

local function _(Expired): boolean
	-- upvalues: IDVSessionStatusEnum (copy)
	return Expired == IDVSessionStatusEnum.RequiresManualReview or (Expired == IDVSessionStatusEnum.RequiresRetry or Expired == IDVSessionStatusEnum.Expired)
end

return function(p1)
	-- upvalues: v2 (copy), v1 (copy), ReactModule (copy), IDVSessionStatusEnum (copy), IDVApiProviderModule (copy), IDVSessionErrorEnum (copy), PromiseModule (copy), v3 (copy)
	local Retries = p1.retries or v2
	local Delay = p1.delay or v1
	local OnStatusUpdateFunction = p1.onStatusUpdate
	local Callback = nil
	Callback = ReactModule.useCallback(function(p2, RetriesLeft, Callback2, Callback1: (any) -> ())
		-- upvalues: IDVSessionStatusEnum (upval), IDVApiProviderModule (upval), OnStatusUpdateFunction (copy), IDVSessionErrorEnum (upval), Delay (copy), Callback (ref)
		if RetriesLeft == 0 then
			Callback1({ sessionStatus = IDVSessionStatusEnum.Expired })
			
			return
		else
			IDVApiProviderModule.getVerifiedStatus(p2):andThen(function(Result)
				-- upvalues: OnStatusUpdateFunction (upval), RetriesLeft (copy), IDVSessionStatusEnum (upval), IDVSessionErrorEnum (upval), Callback1 (copy), Callback2 (copy), Delay (upval), Callback (upval), p2 (copy)
				local IsVerified = Result.isVerified
				local SessionStatus = Result.sessionStatus
				local SessionErrorCode = Result.sessionErrorCode
				local AgeEstimationNextStep = Result.ageEstimationNextStep
				
				if OnStatusUpdateFunction then
					OnStatusUpdateFunction({ sessionStatus = SessionStatus, retriesLeft = RetriesLeft })
				end
				if IsVerified and SessionStatus == IDVSessionStatusEnum.Stored then
					return if SessionErrorCode == IDVSessionErrorEnum.UnknownError and AgeEstimationNextStep == nil then Callback1({ sessionStatus = IDVSessionStatusEnum.Failure }) else Callback2()
				elseif SessionStatus == IDVSessionStatusEnum.RequiresManualReview or (SessionStatus == IDVSessionStatusEnum.RequiresRetry or SessionStatus == IDVSessionStatusEnum.Expired) then
					Callback1({ sessionStatus = SessionStatus })
					
					return
				else
					task.spawn(function()
						-- upvalues: Delay (upval), Callback (upval), p2 (upval), RetriesLeft (upval), Callback2 (upval), Callback1 (upval)
						task.wait(Delay)
						
						if Callback then
							Callback(p2, RetriesLeft - 1, Callback2, Callback1)
						end
					end)
				end
			end):catch(function(_)
				-- upvalues: Callback1 (copy), IDVSessionStatusEnum (upval)
				Callback1({ sessionStatus = IDVSessionStatusEnum.RequiresRetry })
			end)
		end
	end, { Delay, OnStatusUpdateFunction })
	
	return ReactModule.useCallback(function(p2)
		-- upvalues: PromiseModule (upval), v3 (upval), Callback (ref), Retries (copy)
		return PromiseModule.new(function(Callback1: () -> (), p3)
			-- upvalues: v3 (upval), Callback (upval), p2 (copy), Retries (upval)
			if not v3 then
				Callback(p2, Retries, Callback1, p3)
				
				return
			end
			if Callback then
				Callback(p2, Retries, Callback1, p3)
				
				return
			else
				Callback1()
			end
		end)
	end, { Callback, Retries }), (ReactModule.useCallback(function()
		-- upvalues: Callback (ref)
		Callback = nil
	end, {}))
end