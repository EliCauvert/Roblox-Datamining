local parent = script:FindFirstAncestor("SiteMessageStore").Parent
local signalsModule = require(parent.Signals)
local signalsExperimentalModule = require(parent.SignalsExperimental)
local signalsUtilsModule = require(parent.SignalsUtils)

return signalsModule.createComputed(function()
	-- upvalues: signalsUtilsModule (ref), signalsExperimentalModule (ref)
	local var1, var2 = signalsUtilsModule.createSessionScopedSignal(nil)
	local var3, var4 = signalsUtilsModule.createSessionScopedSignal(nil)
	local var5, var6 = signalsUtilsModule.createSessionScopedSignal(nil)
	local var7, var8 = signalsUtilsModule.createSessionScopedSignal(false)
	
	return {
		getText = var1,
		getLink = var3,
		getTimestamp = var5,
		getUpdateRequested = var7,
		processSiteAlertInfoPayload = function(p1)
			-- upvalues: signalsExperimentalModule (copy), var2 (ref), var4 (ref), var6 (ref), var8 (ref)
			signalsExperimentalModule.batch(function()
				-- upvalues: var2 (copy), p1 (ref), var4 (copy), var6 (copy), var8 (copy)
				var2(if p1.visible then p1.text else nil)
				var4(if p1.visible then p1.link else nil)
				var6(p1.timestamp or nil)
				var8(false)
			end)
		end,
		refreshSiteAlertInfo = function(p1)
			-- upvalues: var8 (ref)
			var8(p1 == nil or p1)
		end,
		reset = function()
			-- upvalues: signalsExperimentalModule (copy), var2 (ref), var4 (ref), var6 (ref), var8 (ref)
			signalsExperimentalModule.batch(function()
				-- upvalues: var2 (copy), var4 (copy), var6 (copy), var8 (copy)
				var2(nil)
				var4(nil)
				var6(nil)
				var8(false)
			end)
		end
	}
end)