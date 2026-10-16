local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local GetMomentsShellStackStoreModule = require(Moments.Stores.GetMomentsShellStackStore)

return function(Callback): boolean --[[ Line: 19 | Named "useIsTopMomentsShell" ]]
	-- upvalues: GetMomentsShellStackStoreModule (copy), ReactModule (copy), SignalsReactModule (copy)
	local MomentsShellStackStoreModule = GetMomentsShellStackStoreModule(false)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	ReactModule.useLayoutEffect(function() --[[ Line: 22 ]]
		-- upvalues: MomentsShellStackStoreModule (copy), Callback (copy), UseStateResult2 (copy)
		if MomentsShellStackStoreModule.getTopShellId(false) ~= nil then
			Callback("pushed")
		end
		local PushShellResult, PushShellResult2 = MomentsShellStackStoreModule.pushShell()
		UseStateResult2(PushShellResult)
		
		return function() --[[ Line: 28 ]]
			-- upvalues: MomentsShellStackStoreModule (upval), PushShellResult (copy), Callback (upval), PushShellResult2 (copy)
			if MomentsShellStackStoreModule.getTopShellId(false) == PushShellResult then
				Callback("popped")
			end
			PushShellResult2()
		end
	end, { MomentsShellStackStoreModule, Callback })
	local UseSignalStateResult = SignalsReactModule.useSignalState(MomentsShellStackStoreModule.getTopShellId)
	
	return UseStateResult ~= nil and UseStateResult == UseSignalStateResult
end