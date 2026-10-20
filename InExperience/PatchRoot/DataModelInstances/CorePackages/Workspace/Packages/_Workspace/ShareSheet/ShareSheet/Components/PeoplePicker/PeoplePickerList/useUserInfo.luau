local Parent = script:FindFirstAncestor("ShareSheet").Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local UserProfileModule = require(Parent.DataHydration.UserProfile)
local Signal = require(Parent.Signals).createSignal(nil)

return {
	useUserInfo = function(p1)
		-- upvalues: ReactModule (copy), UserProfileModule (copy), SignalsReactModule (copy), Signal (copy)
		local UseMemoResult = ReactModule.useMemo(function()
			-- upvalues: p1 (copy), UserProfileModule (upval)
			return if p1 == nil then nil else UserProfileModule.getAndFetchUserInfo(p1)
		end, { p1 or "" })
		local UseSignalStateResult = SignalsReactModule.useSignalState(if UseMemoResult == nil then Signal else UseMemoResult.info)
		local UseSignalStateResult1 = SignalsReactModule.useSignalState(if UseMemoResult == nil then Signal else UseMemoResult.status)
		
		return if p1 == nil then nil else {
			displayName = if UseSignalStateResult == nil then "" else UseSignalStateResult.displayName,
			username = if UseSignalStateResult == nil then "" else UseSignalStateResult.username,
			isLoading = UseSignalStateResult1 == "NotReady"
		}
	end
}