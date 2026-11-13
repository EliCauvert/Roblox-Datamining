local UserList = script:FindFirstAncestor("UserList")
local Parent = UserList.Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local ProfileCtaServiceModule = require(Parent.ProfileCtaService)
local _ = require(UserList.Common.Types)
local ProfileCTAService = ProfileCtaServiceModule.ProfileCTAService
local UseSignalStateFunction = SignalsReactModule.useSignalState

return function(p1)
	-- upvalues: ReactModule (copy), ProfileCTAService (copy), UseSignalStateFunction (copy)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: ProfileCTAService (upval), p1 (copy)
		return ProfileCTAService.getProfileCTA(p1)
	end, { p1 })
	
	return UseSignalStateFunction(UseMemoResult.data), (UseSignalStateFunction(UseMemoResult.status))
end