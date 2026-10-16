local Parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local CloseCentralOverlayFunction = require(Parent.CentralOverlay).Thunks.CloseCentralOverlay
local ResponsiveModule = require(Parent.Responsive)
local GetInputModeStoreFunction = ResponsiveModule.GetInputModeStore
local OpenInfoPeekViewFunction = require(Parent.DiscoveryRouting).OpenInfoPeekView
local OpenCloseOnlyInteractiveAlertFunction = require(Parent.DiscoveryRouting).OpenCloseOnlyInteractiveAlert
local SduiResponsiveHelpers = require(Parent.SduiCoreSystem).SduiResponsiveHelpers

return function(p1, _, p2) --[[ Line: 18 ]]
	-- upvalues: SduiResponsiveHelpers (copy), GetInputModeStoreFunction (copy), ResponsiveModule (copy), OpenInfoPeekViewFunction (copy), OpenCloseOnlyInteractiveAlertFunction (copy), CloseCentralOverlayFunction (copy)
	local DispatchFunction: (any) -> () = p2.dependencies.dispatch
	local IsPortraitOrientation = SduiResponsiveHelpers.isPortraitOrientation()
	local TooltipInfoText = p1 and p1.actionParams and p1.actionParams.tooltipInfoText or ""
	local TooltipTitle = p1 and p1.actionParams and p1.actionParams.tooltipTitle or ""
	
	if GetInputModeStoreFunction(false).getLastInputType(false) == ResponsiveModule.Input.Touch and IsPortraitOrientation then
		DispatchFunction(OpenInfoPeekViewFunction(TooltipTitle, TooltipInfoText))
		
		return
	else
		DispatchFunction(OpenCloseOnlyInteractiveAlertFunction(TooltipTitle, TooltipInfoText, function() --[[ Line: 34 ]]
			-- upvalues: DispatchFunction (copy), CloseCentralOverlayFunction (upval)
			return DispatchFunction(CloseCentralOverlayFunction())
		end))
	end
end