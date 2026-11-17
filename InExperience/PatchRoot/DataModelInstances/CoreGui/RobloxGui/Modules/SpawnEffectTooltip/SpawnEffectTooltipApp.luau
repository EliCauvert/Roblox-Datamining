local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local FoundationModule = require(CorePackages.Packages.Foundation)
local RobloxTranslatorModule = require(CorePackages.Workspace.Packages.RobloxTranslator)
local SnackbarDEPRECATED = FoundationModule.Snackbar_DEPRECATED
local View = FoundationModule.View
local IconName = FoundationModule.Enums.IconName
local SpawnEffectTooltipDurationSeconds = game:DefineFastInt("SpawnEffectTooltipDurationSeconds", 4)

return function(p1)
	-- upvalues: ReactModule (copy), SpawnEffectTooltipDurationSeconds (copy), View (copy), SnackbarDEPRECATED (copy), RobloxTranslatorModule (copy), IconName (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(true)
	ReactModule.useEffect(function()
		-- upvalues: SpawnEffectTooltipDurationSeconds (upval), UseStateResult2 (copy), p1 (copy)
		local DelayedThread = task.delay(SpawnEffectTooltipDurationSeconds, function()
			-- upvalues: UseStateResult2 (upval), p1 (upval)
			UseStateResult2(false)
			p1.onDismissed()
		end)
		
		return function()
			-- upvalues: DelayedThread (copy)
			task.cancel(DelayedThread)
		end
	end, { p1.onDismissed })
	
	return if UseStateResult then ReactModule.createElement(View, {
		tag = "col align-x-center anchor-bottom-center size-full-0 auto-y",
		Position = UDim2.fromScale(0.5, 0.9)
	}, {
		SnackbarContent = ReactModule.createElement(SnackbarDEPRECATED, {
			title = RobloxTranslatorModule:FormatByKey("Feature.RobloxSubscription.Notification.SpawnEffectFTUX"),
			icon = IconName.RobloxPlus
		})
	}) else nil
end