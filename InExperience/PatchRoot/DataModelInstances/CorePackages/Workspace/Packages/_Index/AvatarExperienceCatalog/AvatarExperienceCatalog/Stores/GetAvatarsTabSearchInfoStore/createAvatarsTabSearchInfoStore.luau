local Parent = script:FindFirstAncestor("AvatarExperienceCatalog").Parent
local _ = require(Parent.Signals)
local SignalsExperimentalModule = require(Parent.SignalsExperimental)
local CreateSessionScopedSignalFunction = require(Parent.SignalsUtils).createSessionScopedSignal

return function()
	-- upvalues: CreateSessionScopedSignalFunction (copy), SignalsExperimentalModule (copy)
	local SessionScopedSignal, SessionScopedSignal2 = CreateSessionScopedSignalFunction(nil)
	local SessionScopedSignal1, SessionScopedSignal2_1 = CreateSessionScopedSignalFunction(nil)
	
	return {
		getSearchUuid = SessionScopedSignal,
		getKeyword = SessionScopedSignal1,
		setAvatarsTabSearchInfo = function(p1, p2)
			-- upvalues: SignalsExperimentalModule (upval), SessionScopedSignal2 (copy), SessionScopedSignal2_1 (copy)
			SignalsExperimentalModule.batch(function()
				-- upvalues: SessionScopedSignal2 (upval), p1 (copy), SessionScopedSignal2_1 (upval), p2 (copy)
				SessionScopedSignal2(p1)
				SessionScopedSignal2_1(p2)
			end)
		end,
		reset = function()
			-- upvalues: SignalsExperimentalModule (upval), SessionScopedSignal2 (copy), SessionScopedSignal2_1 (copy)
			SignalsExperimentalModule.batch(function()
				-- upvalues: SessionScopedSignal2 (upval), SessionScopedSignal2_1 (upval)
				SessionScopedSignal2(nil)
				SessionScopedSignal2_1(nil)
			end)
		end
	}
end