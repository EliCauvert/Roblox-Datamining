local AuthCommon = script:FindFirstAncestor("AuthCommon")
local Parent = AuthCommon.Parent
local _ = require(Parent.Signals)
local CreateSessionScopedSignalFunction = require(Parent.SignalsUtils).createSessionScopedSignal
local _ = require(AuthCommon.Common.Types)

return function() --[[ Line: 14 ]]
	-- upvalues: CreateSessionScopedSignalFunction (copy)
	local SessionScopedSignal, SessionScopedSignal2 = CreateSessionScopedSignalFunction({})
	
	return {
		getCountryCodeList = SessionScopedSignal,
		setCountryCodeList = function(p1) --[[ Line: 17 ]]
			-- upvalues: SessionScopedSignal2 (copy)
			SessionScopedSignal2(p1)
		end,
		reset = function() --[[ Line: 21 ]]
			-- upvalues: SessionScopedSignal2 (copy)
			SessionScopedSignal2({})
		end
	}
end