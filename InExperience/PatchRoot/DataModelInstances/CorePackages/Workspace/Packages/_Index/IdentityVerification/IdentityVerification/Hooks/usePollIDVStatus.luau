local parent = script:FindFirstAncestor("IdentityVerification").Parent
local reactModule = require(parent.React)
local promiseModule = require(parent.Promise)
local IDVApiProviderModule = require(script.Parent.Parent.Utils.IDVApiProvider)
local enumsModule = require(script.Parent.Parent.Common.Enums)
local IDVSessionStatusEnum = enumsModule.IDVSessionStatusEnum
local IDVSessionErrorEnum = enumsModule.IDVSessionErrorEnum
local getFIntIDVPollDelayModule = require(script.Parent.Parent.Flags.GetFIntIDVPollDelay)
local getFIntIDVMaxRetriesModule = require(script.Parent.Parent.Flags.GetFIntIDVMaxRetries)
local getFFlagIDVGuardStartPollingAfterUnmountModule = require(script.Parent.Parent.Flags.GetFFlagIDVGuardStartPollingAfterUnmount)
local var1 = getFIntIDVPollDelayModule()
local var2 = getFIntIDVMaxRetriesModule()
local var3 = getFFlagIDVGuardStartPollingAfterUnmountModule()

local function _(p1)
	-- upvalues: IDVSessionStatusEnum (ref)
	return if p1 ~= IDVSessionStatusEnum.RequiresManualReview then if p1 ~= IDVSessionStatusEnum.RequiresRetry then p1 == IDVSessionStatusEnum.Expired else true else true
end

return function(p1)
	-- upvalues: var2 (ref), var1 (ref), reactModule (ref), IDVSessionStatusEnum (ref), IDVApiProviderModule (ref), IDVSessionErrorEnum (ref), promiseModule (ref), var3 (ref)
	local retries = p1.retries or var2
	local delay = p1.delay or var1
	local onStatusUpdate = p1.onStatusUpdate
	local var4 = nil
	var4 = reactModule.useCallback(function(p2, p3, p4, p5)
		-- upvalues: IDVSessionStatusEnum (copy), IDVApiProviderModule (copy), onStatusUpdate (ref), IDVSessionErrorEnum (copy), delay (ref), var4 (write)
		if p3 == 0 then
			p5({ sessionStatus = IDVSessionStatusEnum.Expired })
			
			return
		end
		IDVApiProviderModule.getVerifiedStatus(p2):andThen(function(p6)
			-- upvalues: onStatusUpdate (copy), p3 (ref), IDVSessionStatusEnum (copy), IDVSessionErrorEnum (copy), p5 (ref), p4 (ref), delay (copy), var4 (copy), p2 (ref)
			local isVerified = p6.isVerified
			local sessionStatus = p6.sessionStatus
			local sessionErrorCode = p6.sessionErrorCode
			local ageEstimationNextStep = p6.ageEstimationNextStep
			
			if onStatusUpdate then
				onStatusUpdate({ sessionStatus = sessionStatus, retriesLeft = p3 })
			end
			if isVerified and sessionStatus == IDVSessionStatusEnum.Stored then
				return if sessionErrorCode == IDVSessionErrorEnum.UnknownError and ageEstimationNextStep == nil then p5({ sessionStatus = IDVSessionStatusEnum.Failure }) else p4()
			elseif if sessionStatus ~= IDVSessionStatusEnum.RequiresManualReview then if sessionStatus ~= IDVSessionStatusEnum.RequiresRetry then sessionStatus == IDVSessionStatusEnum.Expired else true else true then
				p5({ sessionStatus = sessionStatus })
				
				return
			end
			task.spawn(function()
				-- upvalues: delay (copy), var4 (copy), p2 (copy), p3 (copy), p4 (copy), p5 (copy)
				task.wait(delay)
				
				if var4 then
					var4(p2, p3 - 1, p4, p5)
				end
			end)
		end):catch(function(_)
			-- upvalues: p5 (ref), IDVSessionStatusEnum (copy)
			p5({ sessionStatus = IDVSessionStatusEnum.RequiresRetry })
		end)
	end, { delay, onStatusUpdate })
	
	return reactModule.useCallback(function(p2)
		-- upvalues: promiseModule (copy), var3 (copy), var4 (write), retries (ref)
		return promiseModule.new(function(p3, p4)
			-- upvalues: var3 (copy), var4 (copy), p2 (ref), retries (copy)
			if not var3 then
				var4(p2, retries, p3, p4)
				
				return
			elseif var4 then
				var4(p2, retries, p3, p4)
				
				return
			end
			p3()
		end)
	end, { var4, retries }), reactModule.useCallback(function()
		-- upvalues: var4 (write)
		var4 = nil
	end, {})
end