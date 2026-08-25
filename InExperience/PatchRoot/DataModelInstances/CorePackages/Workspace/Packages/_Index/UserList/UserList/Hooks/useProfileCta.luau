local userList = script:FindFirstAncestor("UserList")
local parent = userList.Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local _ = require(userList.Common.Types)
local profileCTAService = require(parent.ProfileCtaService).ProfileCTAService
local useSignalState = signalsReactModule.useSignalState

return function(p0)
	-- upvalues: reactModule (ref), profileCTAService (ref), useSignalState (ref)
	local var3 = reactModule.useMemo(function()
		-- upvalues: profileCTAService (copy), p0 (ref)
		return profileCTAService.getProfileCTA(p0)
	end, { p0 })
	
	return useSignalState(var3.data), useSignalState(var3.status)
end