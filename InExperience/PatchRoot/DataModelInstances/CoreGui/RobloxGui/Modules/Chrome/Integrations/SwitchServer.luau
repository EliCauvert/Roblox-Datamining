local chrome = script:FindFirstAncestor("Chrome")
local corePackagesService = game:GetService("CorePackages")
local serviceModule = require(chrome.Service)
local commonIconModule = require(chrome.Integrations.CommonIcon)
local sideSheetPlacement = require(corePackagesService.Workspace.Packages.Chrome).Enums.SideSheetPlacement
local constantsModule = require(chrome.ChromeShared.Unibar.Constants)
local mappedSignal = require(chrome.ChromeShared.Service.ChromeUtils).MappedSignal
local switchServerModule = require(corePackagesService.Workspace.Packages.SwitchServer)
local constants = switchServerModule.Constants
local switchServerStore = switchServerModule.GetSwitchServerStore(false)
local signal = require(corePackagesService.Workspace.Packages.AppCommonLib).Signal
local signalsUtilsModule = require(corePackagesService.Workspace.Packages.SignalsUtils)
local var1 = false
local var2 = signal.new()
local var3 = mappedSignal.new(var2, function()
	-- upvalues: var1 (write)
	return var1
end)
signalsUtilsModule.createDetachedEffect(function(p1)
	-- upvalues: switchServerStore (ref), var1 (write), var2 (ref)
	local var4 = switchServerStore.isConfirmationOpen(p1)
	
	if var1 ~= var4 then
		var1 = var4
		var2:fire()
	end
end)
local var4 = serviceModule:register({
	initialAvailability = serviceModule.AvailabilitySignal.Unavailable,
	id = constantsModule.SWITCH_SERVER_ID,
	label = constants.BUTTON.LABEL,
	sideSheetPlacement = sideSheetPlacement.Page,
	activated = function()
		-- upvalues: switchServerStore (ref)
		switchServerStore.setConfirmationOpen(true)
	end,
	isActivated = var3,
	components = {
		Icon = function(_)
			-- upvalues: commonIconModule (ref), var3 (ref)
			return commonIconModule("TwoLocationPinsConnectingArrow", nil, var3)
		end
	}
})
signalsUtilsModule.createDetachedEffect(function(p1)
	-- upvalues: switchServerStore (ref), var4 (ref)
	if switchServerStore.shouldEnableSwitchServer(p1) then
		var4.availability:available()
		
		return
	end
	var4.availability:unavailable()
end)

return var4