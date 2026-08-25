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

local function _(p0)
	-- upvalues: t_1 (ref)
	return p0 == nil or t_1[string.upper(p0)] == true
end

local _ = function(p1, p2)
	-- upvalues: t_1 (ref)
	return {
		isSubjectToGdpr = p2 == nil or t_1[string.upper(p2)] == true,
		consented = p1
	}
end

function t.computeDecision(p3, p4)
	-- upvalues: t_1 (ref)
	return if p3 == nil then { applySharingFilter = true, dmaConsent = nil } else {
		applySharingFilter = not p3,
		dmaConsent = {
			isSubjectToGdpr = p4 == nil or t_1[string.upper(p4)] == true,
			consented = p3
		}
	}
end

local _ = function(_, _)
	return true
end

local _ = function(p5)
	return p5 == nil
end

function t.resolveAndPublish(p6, _, p7, p8)
	-- upvalues: t (ref)
	if p7 == nil then
		return
	end
	p6:adConsentResolved(t.computeDecision(p7, p8))
end

return t