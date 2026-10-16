local Chrome = script:FindFirstAncestor("Chrome")
local CorePackages = game:GetService("CorePackages")
local ServiceModule = require(Chrome.Service)
local CommonIconModule = require(Chrome.Integrations.CommonIcon)
local SideSheetPlacement = require(CorePackages.Workspace.Packages.Chrome).Enums.SideSheetPlacement
local ConstantsModule = require(Chrome.ChromeShared.Unibar.Constants)
local SwitchServerModule = require(CorePackages.Workspace.Packages.SwitchServer)
local Constants = SwitchServerModule.Constants
local SwitchServerStore = SwitchServerModule.GetSwitchServerStore(false)
local IsPioneerLaunchFunction = require(CorePackages.Workspace.Packages.PioneerUtils).isPioneerLaunch
local SignalsUtilsModule = require(CorePackages.Workspace.Packages.SignalsUtils)
local IsConfirmationOpen = false
local NewResult = require(CorePackages.Workspace.Packages.AppCommonLib).Signal.new()
local NewResult1 = require(Chrome.ChromeShared.Service.ChromeUtils).MappedSignal.new(NewResult, function() --[[ Line: 27 ]]
	-- upvalues: IsConfirmationOpen (ref)
	return IsConfirmationOpen
end)
SignalsUtilsModule.createDetachedEffect(function(p1) --[[ Line: 31 ]]
	-- upvalues: SwitchServerStore (copy), IsConfirmationOpen (ref), NewResult (copy)
	local IsConfirmationOpen1 = SwitchServerStore.isConfirmationOpen(p1)
	
	if IsConfirmationOpen ~= IsConfirmationOpen1 then
		IsConfirmationOpen = IsConfirmationOpen1
		NewResult:fire()
	end
end)
local RegisterResult = ServiceModule:register({
	initialAvailability = ServiceModule.AvailabilitySignal.Unavailable,
	id = ConstantsModule.SWITCH_SERVER_ID,
	label = Constants.BUTTON.LABEL,
	sideSheetPlacement = if IsPioneerLaunchFunction() then SideSheetPlacement.SessionAction else SideSheetPlacement.BelowFold,
	activated = function() --[[ Line: 44 ]]
		-- upvalues: SwitchServerStore (copy)
		SwitchServerStore.setConfirmationOpen(true)
	end,
	isActivated = NewResult1,
	components = {
		Icon = function(_) --[[ Line: 49 ]]
			-- upvalues: CommonIconModule (copy), NewResult1 (copy)
			return CommonIconModule("TwoLocationPinsConnectingArrow", nil, NewResult1)
		end
	}
})
SignalsUtilsModule.createDetachedEffect(function(p1) --[[ Line: 55 ]]
	-- upvalues: SwitchServerStore (copy), IsPioneerLaunchFunction (copy), RegisterResult (copy)
	if SwitchServerStore.shouldEnableSwitchServer(p1) or IsPioneerLaunchFunction() then
		RegisterResult.availability:available()
		
		return
	else
		RegisterResult.availability:unavailable()
	end
end)

return RegisterResult