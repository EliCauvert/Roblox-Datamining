local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local CreateCurrentTimeSignalFunction = require(Parent.SignalsUtils).createCurrentTimeSignal
local GetUserSendEligibilityStatusModule = require(AppChat.Utils.getUserSendEligibilityStatus)

local function areResultsEqual(p1, p2): boolean
	return p1.isEligible == p2.isEligible and p1.isLoading == p2.isLoading
end

return function(p1)
	-- upvalues: ReactModule (copy), CreateCurrentTimeSignalFunction (copy), SignalsModule (copy), GetUserSendEligibilityStatusModule (copy), areResultsEqual (copy), SignalsReactModule (copy)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: CreateCurrentTimeSignalFunction (upval)
		return CreateCurrentTimeSignalFunction(1)
	end, {})
	
	return SignalsReactModule.useSignalState((ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval), p1 (copy), GetUserSendEligibilityStatusModule (upval), UseMemoResult (copy), areResultsEqual (upval)
		return SignalsModule.createComputed(function(Scope)
			-- upvalues: p1 (upval), GetUserSendEligibilityStatusModule (upval), UseMemoResult (upval)
			if p1.isActive then
				local UserSendEligibilityStatusModule = GetUserSendEligibilityStatusModule({
					isAvailable = true,
					currentTimestamp = UseMemoResult(Scope),
					scope = Scope
				})
				
				return {
					isEligible = UserSendEligibilityStatusModule == "eligible",
					isLoading = UserSendEligibilityStatusModule == "loading"
				}
			else
				return { isEligible = false, isLoading = true }
			end
		end, areResultsEqual)
	end, { UseMemoResult, p1.isActive })))
end