local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local closeCentralOverlay = require(parent.CentralOverlay).Thunks.CloseCentralOverlay
local responsiveModule = require(parent.Responsive)
local getInputModeStore = responsiveModule.GetInputModeStore
local openInfoPeekView = require(parent.DiscoveryRouting).OpenInfoPeekView
local openCloseOnlyInteractiveAlert = require(parent.DiscoveryRouting).OpenCloseOnlyInteractiveAlert
local sduiResponsiveHelpers = require(parent.SduiCoreSystem).SduiResponsiveHelpers

return function(p0, _, p1)
	-- upvalues: sduiResponsiveHelpers (ref), getInputModeStore (ref), responsiveModule (ref), openInfoPeekView (ref), openCloseOnlyInteractiveAlert (ref), closeCentralOverlay (ref)
	local dispatch = p1.dependencies.dispatch
	local var1 = sduiResponsiveHelpers.isPortraitOrientation()
	local lastInputType = getInputModeStore(false).getLastInputType(false)
	local tooltipInfoText = p0 and (p0.actionParams and (p0.actionParams.tooltipInfoText or ""))
	local tooltipTitle = p0 and (p0.actionParams and (p0.actionParams.tooltipTitle or ""))
	
	if lastInputType == responsiveModule.Input.Touch and var1 then
		dispatch(openInfoPeekView(tooltipTitle, tooltipInfoText))
		
		return
	end
	dispatch(openCloseOnlyInteractiveAlert(tooltipTitle, tooltipInfoText, function()
		-- upvalues: dispatch (ref), closeCentralOverlay (copy)
		return dispatch(closeCentralOverlay())
	end))
end