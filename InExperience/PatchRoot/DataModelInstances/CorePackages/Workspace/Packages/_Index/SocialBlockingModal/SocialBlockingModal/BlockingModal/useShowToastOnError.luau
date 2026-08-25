local parent = script:FindFirstAncestor("SocialBlockingModal").Parent
local reactModule = require(parent.React)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local useLocalization = require(parent.Localization).Hooks.useLocalization
local setCurrentToastMessage = require(parent.ToastRodux).Actions.SetCurrentToastMessage
local _ = {
	BLOCK_TARGET_ALREADY_BLOCKED_ERROR = 1,
	USER_BLOCKING_LIMIT_REACHED_API_ERROR = 2,
	UNBLOCK_TARGET_NOT_BLOCKED_ERROR = 4,
	PARENT_BLOCKED_TARGET_USER_ERROR = 14
}

return function()
	-- upvalues: useDispatch (ref), useLocalization (ref), reactModule (ref), setCurrentToastMessage (ref)
	local var1 = useDispatch()
	local var2 = useLocalization({
		somethingIsWrongToast = "Feature.Toast.NetworkingError.SomethingIsWrong",
		blockLimitReachedToast = "Feature.Profile.Message.BlockError",
		blocktargetAlreadyBlockedToast = "Feature.Friends.Error.TargetAlreadyBlockedError"
	})
	
	return reactModule.useCallback(function(p0)
		-- upvalues: var1 (ref), setCurrentToastMessage (copy), var2 (ref)
		local body
		if p0 then
			body = p0.Body and (tonumber(p0.Body) or nil)
		end
		if body == 1 then
			var1(setCurrentToastMessage({
				isLocalized = true,
				toastMessage = var2.blocktargetAlreadyBlockedToast
			}))
			
			return
		elseif body == 2 then
			var1(setCurrentToastMessage({
				isLocalized = true,
				toastMessage = var2.blockLimitReachedToast
			}))
			
			return
		end
		var1(setCurrentToastMessage({
			isLocalized = true,
			toastMessage = var2.somethingIsWrongToast
		}))
	end, { var1, var2 })
end