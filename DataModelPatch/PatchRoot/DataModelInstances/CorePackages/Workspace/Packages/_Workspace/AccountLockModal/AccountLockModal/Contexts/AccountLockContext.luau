local ReactModule = require(script:FindFirstAncestor("AccountLockModal").Parent.React)
local UseStateFunction = ReactModule.useState
local UseMemoFunction = ReactModule.useMemo
local UseContextFunction = ReactModule.useContext
local UseCallbackFunction = ReactModule.useCallback
local EnumsModule = require(script.Parent.Parent.Common.Enums)
local _ = require(script.Parent.Parent.Common.Types)
local GetFIntRateLimitedRefreshSecModule = require(script.Parent.Parent.Flags.GetFIntRateLimitedRefreshSec)
local Context = ReactModule.createContext({})

return {
	Context = Context,
	Provider = function(p1)
		-- upvalues: UseStateFunction (copy), EnumsModule (copy), UseCallbackFunction (copy), GetFIntRateLimitedRefreshSecModule (copy), UseMemoFunction (copy), ReactModule (copy), Context (copy)
		local UseStateResult, UseStateResult2 = UseStateFunction({
			timeUntilRetry = nil,
			status = EnumsModule.AccountLockStatusEnum.Locked
		})
		local Callback = nil
		Callback = UseCallbackFunction(function(p2)
			-- upvalues: UseStateResult2 (copy), EnumsModule (upval), GetFIntRateLimitedRefreshSecModule (upval), Callback (ref)
			local UnixTimestampDelta = p2.UnixTimestamp - DateTime.now().UnixTimestamp
			
			if UnixTimestampDelta > 0 then
				UseStateResult2({
					status = EnumsModule.AccountLockStatusEnum.RateLimited,
					timeUntilRetry = UnixTimestampDelta
				})
				task.spawn(function()
					-- upvalues: GetFIntRateLimitedRefreshSecModule (upval), Callback (upval), p2 (copy)
					task.wait(GetFIntRateLimitedRefreshSecModule())
					Callback(p2)
				end)
				
				return
			else
				UseStateResult2({
					timeUntilRetry = nil,
					status = EnumsModule.AccountLockStatusEnum.Locked
				})
			end
		end, { UseStateResult2 })
		local UseCallbackResult = UseCallbackFunction(function(p2)
			-- upvalues: EnumsModule (upval), Callback (ref), UseStateResult2 (copy)
			local _DateTime = p2.retryTime and DateTime.fromIsoDate(p2.retryTime)
			
			if p2.status == EnumsModule.AccountLockStatusEnum.RateLimited and _DateTime then
				Callback(_DateTime)
				
				return
			end
			if p2.status == EnumsModule.AccountLockStatusEnum.RateLimited then
				UseStateResult2({
					timeUntilRetry = nil,
					status = EnumsModule.AccountLockStatusEnum.Error
				})
				
				return
			else
				UseStateResult2({ timeUntilRetry = nil, status = p2.status })
			end
		end, { UseStateResult, UseStateResult2 })
		
		return ReactModule.createElement(Context.Provider, {
			value = UseMemoFunction(function()
				-- upvalues: UseStateResult (copy), UseCallbackResult (copy)
				return { state = UseStateResult, reducer = UseCallbackResult }
			end, { UseStateResult, UseCallbackResult })
		}, p1.children)
	end,
	useAccountLockContext = function()
		-- upvalues: UseContextFunction (copy), Context (copy)
		local UseContextResult = UseContextFunction(Context)
		
		return {
			state = UseContextResult.state,
			reducer = UseContextResult.reducer
		}
	end
}