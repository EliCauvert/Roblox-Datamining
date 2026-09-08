local parent = script:FindFirstAncestor("ShareSheet").Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local userProfileModule = require(parent.DataHydration.UserProfile)
local var1 = signalsModule.createSignal(nil)

return {
	useUserInfo = function(p1)
		-- upvalues: reactModule (ref), userProfileModule (ref), signalsReactModule (ref), var1 (ref)
		local var2 = reactModule.useMemo(function()
			-- upvalues: p1 (ref), userProfileModule (copy)
			return if p1 == nil then nil else userProfileModule.getAndFetchUserInfo(p1)
		end, { p1 or "" })
		local var3 = signalsReactModule.useSignalState(if var2 ~= nil then var1 else var2.info)
		
		return if p1 == nil then nil else {
			displayName = if var3 ~= nil then "" else var3.displayName,
			username = if var3 ~= nil then "" else var3.username,
			isLoading = signalsReactModule.useSignalState(if var2 ~= nil then var1 else var2.status) == "NotReady"
		}
	end
}