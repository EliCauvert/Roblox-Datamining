local _ = require(script.Parent.LinkingProtocolTypes)
local t = {
	computeDecision = function(p0, _) --[[ line: 93 ]]
		return if p0 == nil then { applySharingFilter = true, dmaConsent = nil } else {
			applySharingFilter = not p0,
			dmaConsent = { isSubjectToGdpr = true, consented = p0 }
		}
	end
}

local function _(_) --[[ line: 60 | named "isSubjectToGdpr" ]]
	return true
end

local _ = function(p1, _) --[[ line: 74 | named "toDmaConsent" ]]
	return { isSubjectToGdpr = true, consented = p1 }
end

local _ = function(_, _) --[[ line: 114 | named "shouldPublish" ]]
	return true
end

local _ = function(p2) --[[ line: 128 | named "isAwaitingConsent" ]]
	return p2 == nil
end

function t.resolveAndPublish(p3, _, p4, p5) --[[ line: 151 ]]
	-- upvalues: t (ref)
	if p4 == nil then
		return
	end
	p3:adConsentResolved(t.computeDecision(p4, p5))
end

return t