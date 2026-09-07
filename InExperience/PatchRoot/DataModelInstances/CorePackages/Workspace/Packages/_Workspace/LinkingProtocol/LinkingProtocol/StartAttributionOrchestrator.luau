local _ = require(script.Parent.LinkingProtocolTypes)
local t = {}
local t_1 = {
	AT = true,
	BE = true,
	BG = true,
	CY = true,
	CZ = true,
	DE = true,
	DK = true,
	EE = true,
	ES = true,
	FI = true,
	FR = true,
	GR = true,
	HR = true,
	HU = true,
	IE = true,
	IT = true,
	LT = true,
	LU = true,
	LV = true,
	MT = true,
	NL = true,
	PL = true,
	PT = true,
	RO = true,
	SE = true,
	SI = true,
	SK = true,
	IS = true,
	LI = true,
	NO = true,
	GB = true,
	CH = true
}

local function _(p1)
	-- upvalues: t_1 (ref)
	return p1 == nil or t_1[string.upper(p1)] == true
end

local _ = function(p1, p2)
	-- upvalues: t_1 (ref)
	return {
		isSubjectToGdpr = p2 == nil or t_1[string.upper(p2)] == true,
		consented = p1
	}
end

function t.computeDecision(p1, p2)
	-- upvalues: t_1 (ref)
	return if p1 == nil then { applySharingFilter = true, dmaConsent = nil } else {
		applySharingFilter = not p1,
		dmaConsent = {
			isSubjectToGdpr = p2 == nil or t_1[string.upper(p2)] == true,
			consented = p1
		}
	}
end

local _ = function(_, _)
	return true
end

local _ = function(p1)
	return p1 == nil
end

function t.resolveAndPublish(p1, _, p2, p3)
	-- upvalues: t (ref)
	if p2 == nil then
		return
	end
	p1:adConsentResolved(t.computeDecision(p2, p3))
end

return t