local shareSheet = script:FindFirstAncestor("ShareSheet")
local parent = shareSheet.Parent
local signalsModule = require(parent.Signals)
local fFlagShareSheetPeoplePickerEnabledModule = require(shareSheet.Flags.FFlagShareSheetPeoplePickerEnabled)
local fFlagShareSheetFriendsSort = require(parent.SharedFlags).FFlagShareSheetFriendsSort
local recipientSourceModule = require(shareSheet.Recipients.RecipientSource)
local shareSheetTelemetryModule = require(shareSheet.telemetry.ShareSheetTelemetry)

return function()
	-- upvalues: signalsModule (ref), fFlagShareSheetPeoplePickerEnabledModule (ref), shareSheetTelemetryModule (ref), fFlagShareSheetFriendsSort (ref), recipientSourceModule (ref)
	local var1, var2 = signalsModule.createSignal(false)
	local var3, var4 = signalsModule.createSignal(nil)
	
	local function hide(p1)
		-- upvalues: fFlagShareSheetPeoplePickerEnabledModule (copy), var2 (ref), var3 (ref), var4 (ref), shareSheetTelemetryModule (copy), fFlagShareSheetFriendsSort (copy)
		if fFlagShareSheetPeoplePickerEnabledModule then
			var2(false)
		end
		local var5 = var3(false)
		
		if var5 == nil then return end
		var4(nil)
		shareSheetTelemetryModule.logLifecycle({
			context = var5.context,
			telemetryId = var5.telemetryId or "",
			lifecycleType = shareSheetTelemetryModule.LifecycleType.Close,
			closeReason = p1 or shareSheetTelemetryModule.CloseReason.Programmatic,
			recipientSource = if fFlagShareSheetFriendsSort then var5.recipientSource else nil
		})
		
		if var5.onHidden then
			var5.onHidden()
		end
	end
	
	return {
		getIsPeoplePickerDisplayed = var1,
		getRequest = var3,
		setIsPeoplePickerDisplayed = var2,
		show = function(p1)
			-- upvalues: fFlagShareSheetFriendsSort (copy), recipientSourceModule (copy), hide (ref), shareSheetTelemetryModule (copy), var4 (ref)
			if fFlagShareSheetFriendsSort and p1.recipientSource ~= nil and not recipientSourceModule.isValidRecipientSource(p1.recipientSource) then
				error(`Invalid recipient source {p1.recipientSource}`)
			end
			hide(shareSheetTelemetryModule.CloseReason.Replaced)
			var4(table.clone(p1))
			shareSheetTelemetryModule.logLifecycle({
				context = p1.context,
				telemetryId = p1.telemetryId or "",
				lifecycleType = shareSheetTelemetryModule.LifecycleType.Open,
				recipientSource = if fFlagShareSheetFriendsSort then p1.recipientSource else nil
			})
			
			if p1.onShown then
				p1.onShown()
			end
		end,
		hide = hide
	}
end