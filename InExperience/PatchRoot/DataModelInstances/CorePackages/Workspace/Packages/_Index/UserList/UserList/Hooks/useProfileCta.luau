local userList = script:FindFirstAncestor("UserList")
local parent = userList.Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local _ = require(userList.Common.Types)
local profileCTAService = require(parent.ProfileCtaService).ProfileCTAService
local useSignalState = signalsReactModule.useSignalState

return function(p1)
	-- upvalues: reactModule (ref), profileCTAService (ref), useSignalState (ref)
	local var1 = reactModule.useMemo(function()
		-- upvalues: profileCTAService (copy), p1 (ref)
		return profileCTAService.getProfileCTA(p1)
	end, { p1 })
	
	return useSignalState(var1.data), useSignalState(var1.status)
end