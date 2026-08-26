local sessionService = game:GetService("SessionService")
local sessionType = require(script:FindFirstAncestor("SessionizationUtil").Parent.RobloxAppSessionization).SessionType
local t = {}
t.__index = t

function t.new(p1, p2, p3, p4, p5)
	-- upvalues: t (ref)
	local tbl = setmetatable({}, t)
	tbl.level = p1
	tbl.sessionId = p2
	tbl.tagName = p3
	tbl.creationTimestamp = p4
	tbl.metadata = p5 or {}
	
	return tbl
end

function t:__tostring()
	local var1 = 0
	
	for i in pairs(self.metadata) do
		var1 += 1
	end
	return string.format("SessionInfo{level=%s, sessionId=%s, tagName=%s, creationTimestamp=%s, metadata_count=%d}", tostring(self.level), tostring(self.sessionId), tostring(self.tagName), tostring(self.creationTimestamp), var1)
end

function t.getSessionByLevel(p1)
	-- upvalues: sessionType (ref), sessionService (ref), t (ref)
	local rootSID, var2
	local _ = nil
	local _ = nil
	local var3 = sessionType.StructuralIdentifier[p1]
	
	if p1 == sessionType.StructuralIdentifier.Level0 then
		rootSID = sessionService:GetRootSID()
		var2 = nil
	elseif not var3 then
		rootSID = nil
		var2 = nil
	elseif sessionService:SessionExists(var3) then
		rootSID = sessionService:GetSessionID(var3)
		var2 = sessionService:GetSessionTag(var3)
	else
		rootSID = nil
		var2 = nil
	end
	return t.new(p1, rootSID, var2, nil, {})
end

return t