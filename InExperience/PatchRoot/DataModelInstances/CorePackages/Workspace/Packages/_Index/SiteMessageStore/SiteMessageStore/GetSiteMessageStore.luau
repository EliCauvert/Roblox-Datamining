local Parent = script:FindFirstAncestor("SiteMessageStore").Parent
local SignalsExperimentalModule = require(Parent.SignalsExperimental)
local SignalsUtilsModule = require(Parent.SignalsUtils)

return require(Parent.Signals).createComputed(function() --[[ Line: 14 ]]
	-- upvalues: SignalsUtilsModule (copy), SignalsExperimentalModule (copy)
	local SessionScopedSignal, SessionScopedSignal2 = SignalsUtilsModule.createSessionScopedSignal(nil)
	local SessionScopedSignal1, SessionScopedSignal2_1 = SignalsUtilsModule.createSessionScopedSignal(nil)
	local SessionScopedSignal3, SessionScopedSignal2_2 = SignalsUtilsModule.createSessionScopedSignal(nil)
	local SessionScopedSignal4, SessionScopedSignal2_3 = SignalsUtilsModule.createSessionScopedSignal(false)
	
	return {
		getText = SessionScopedSignal,
		getLink = SessionScopedSignal1,
		getTimestamp = SessionScopedSignal3,
		getUpdateRequested = SessionScopedSignal4,
		processSiteAlertInfoPayload = function(p1) --[[ Line: 20 ]]
			-- upvalues: SignalsExperimentalModule (upval), SessionScopedSignal2 (copy), SessionScopedSignal2_1 (copy), SessionScopedSignal2_2 (copy), SessionScopedSignal2_3 (copy)
			SignalsExperimentalModule.batch(function() --[[ Line: 21 ]]
				-- upvalues: SessionScopedSignal2 (upval), p1 (copy), SessionScopedSignal2_1 (upval), SessionScopedSignal2_2 (upval), SessionScopedSignal2_3 (upval)
				SessionScopedSignal2(p1.visible and p1.text or nil)
				SessionScopedSignal2_1(p1.visible and p1.link or nil)
				SessionScopedSignal2_2(p1.timestamp or nil)
				SessionScopedSignal2_3(false)
			end)
		end,
		refreshSiteAlertInfo = function(p1) --[[ Line: 29 ]]
			-- upvalues: SessionScopedSignal2_3 (copy)
			SessionScopedSignal2_3(p1 == nil or p1)
		end,
		reset = function() --[[ Line: 34 ]]
			-- upvalues: SignalsExperimentalModule (upval), SessionScopedSignal2 (copy), SessionScopedSignal2_1 (copy), SessionScopedSignal2_2 (copy), SessionScopedSignal2_3 (copy)
			SignalsExperimentalModule.batch(function() --[[ Line: 35 ]]
				-- upvalues: SessionScopedSignal2 (upval), SessionScopedSignal2_1 (upval), SessionScopedSignal2_2 (upval), SessionScopedSignal2_3 (upval)
				SessionScopedSignal2(nil)
				SessionScopedSignal2_1(nil)
				SessionScopedSignal2_2(nil)
				SessionScopedSignal2_3(false)
			end)
		end
	}
end)