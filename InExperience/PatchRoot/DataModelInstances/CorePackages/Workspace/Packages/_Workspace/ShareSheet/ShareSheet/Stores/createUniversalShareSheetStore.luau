local ShareSheet = script:FindFirstAncestor("ShareSheet")
local Parent = ShareSheet.Parent
local SignalsModule = require(Parent.Signals)
local FFlagShareSheetPeoplePickerEnabledModule = require(ShareSheet.Flags.FFlagShareSheetPeoplePickerEnabled)
local FFlagShareSheetFriendsSort = require(Parent.SharedFlags).FFlagShareSheetFriendsSort
local RecipientSourceModule = require(ShareSheet.Recipients.RecipientSource)
local ShareSheetTelemetryModule = require(ShareSheet.telemetry.ShareSheetTelemetry)

return function()
	-- upvalues: SignalsModule (copy), FFlagShareSheetPeoplePickerEnabledModule (copy), ShareSheetTelemetryModule (copy), FFlagShareSheetFriendsSort (copy), RecipientSourceModule (copy)
	local Signal, Signal2 = SignalsModule.createSignal(false)
	local Signal1, Signal2_1 = SignalsModule.createSignal(nil)
	
	local function hide(Replaced)
		-- upvalues: FFlagShareSheetPeoplePickerEnabledModule (upval), Signal2 (copy), Signal1 (copy), Signal2_1 (copy), ShareSheetTelemetryModule (upval), FFlagShareSheetFriendsSort (upval)
		if FFlagShareSheetPeoplePickerEnabledModule then
			Signal2(false)
		end
		local SignalResult = Signal1(false)
		
		if SignalResult == nil then return end
		Signal2_1(nil)
		ShareSheetTelemetryModule.logLifecycle({
			context = SignalResult.context,
			telemetryId = SignalResult.telemetryId or "",
			lifecycleType = ShareSheetTelemetryModule.LifecycleType.Close,
			closeReason = Replaced or ShareSheetTelemetryModule.CloseReason.Programmatic,
			recipientSource = if FFlagShareSheetFriendsSort then SignalResult.recipientSource else nil
		})
		
		if SignalResult.onHidden then
			SignalResult.onHidden()
		end
	end
	
	return {
		getIsPeoplePickerDisplayed = Signal,
		getRequest = Signal1,
		setIsPeoplePickerDisplayed = Signal2,
		show = function(Tbl)
			-- upvalues: FFlagShareSheetFriendsSort (upval), RecipientSourceModule (upval), hide (copy), ShareSheetTelemetryModule (upval), Signal2_1 (copy)
			if FFlagShareSheetFriendsSort and Tbl.recipientSource ~= nil and not RecipientSourceModule.isValidRecipientSource(Tbl.recipientSource) then
				error(`Invalid recipient source {Tbl.recipientSource}`)
			end
			hide(ShareSheetTelemetryModule.CloseReason.Replaced)
			Signal2_1(table.clone(Tbl))
			ShareSheetTelemetryModule.logLifecycle({
				context = Tbl.context,
				telemetryId = Tbl.telemetryId or "",
				lifecycleType = ShareSheetTelemetryModule.LifecycleType.Open,
				recipientSource = if FFlagShareSheetFriendsSort then Tbl.recipientSource else nil
			})
			
			if Tbl.onShown then
				Tbl.onShown()
			end
		end,
		hide = hide
	}
end