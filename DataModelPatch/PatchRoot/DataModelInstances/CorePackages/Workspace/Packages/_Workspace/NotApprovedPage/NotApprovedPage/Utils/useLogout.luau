local NotApprovedPage = script:FindFirstAncestor("NotApprovedPage")
local Parent = NotApprovedPage.Parent
local SendNotApprovedPageEventModule = require(NotApprovedPage.Utils.sendNotApprovedPageEvent)
local EVENTTYPES = require(Parent.NotApprovedPageShared).Constants.EVENT_TYPES
local UseCallbackFunction = require(Parent.React).useCallback
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local RoactNetworking = require(Parent.RoactServiceTags).RoactNetworking
local AppGuiService = require(Parent.RoactServiceTags).AppGuiService
local ResponsiveModule = require(Parent.Responsive)
local UsePreferredInputFunction = ResponsiveModule.usePreferredInput
local LogoutReasonNames = require(Parent.AuthCommon).Enums.LogoutReasonNames
local ConsoleDisconnectFunction = require(Parent.AuthCommon).Thunks.ConsoleDisconnect

return function(Callback1, Callback)
	-- upvalues: UseDispatchFunction (copy), UseRoactServiceFunction (copy), RoactNetworking (copy), AppGuiService (copy), UsePreferredInputFunction (copy), ResponsiveModule (copy), UseCallbackFunction (copy), SendNotApprovedPageEventModule (copy), EVENTTYPES (copy), ConsoleDisconnectFunction (copy), LogoutReasonNames (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseRoactServiceResult = UseRoactServiceFunction(RoactNetworking)
	local UseRoactServiceResult1 = UseRoactServiceFunction(AppGuiService)
	local IsUsePreferredInputResultMatch = UsePreferredInputFunction() == ResponsiveModule.Input.Directional
	
	return (UseCallbackFunction(function()
		-- upvalues: Callback1 (copy), SendNotApprovedPageEventModule (upval), EVENTTYPES (upval), IsUsePreferredInputResultMatch (copy), UseDispatchResult (copy), ConsoleDisconnectFunction (upval), UseRoactServiceResult (copy), UseRoactServiceResult1 (copy), Callback (copy), LogoutReasonNames (upval)
		Callback1(true)
		SendNotApprovedPageEventModule({ eventType = EVENTTYPES.LogoutClicked })
		
		if IsUsePreferredInputResultMatch then
			UseDispatchResult(ConsoleDisconnectFunction(UseRoactServiceResult, UseRoactServiceResult1, Callback))
			
			return
		else
			UseDispatchResult(Callback(UseRoactServiceResult, UseRoactServiceResult1, LogoutReasonNames.Moderation))
		end
	end, {
		UseDispatchResult, UseRoactServiceResult, UseRoactServiceResult1, Callback,
		IsUsePreferredInputResultMatch, Callback1
	}))
end