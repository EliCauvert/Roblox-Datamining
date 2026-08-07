local sessionService = game:GetService("SessionService")
local sessionType = require(script:FindFirstAncestor("SessionizationUtil").Parent.RobloxAppSessionization).SessionType
local t = {}
t.__index = t

function t.new(p0, p1, p2, p3, p4) --[[ line: 40 ]]
	-- upvalues: t (ref)
	local tbl = setmetatable({}, t)
	tbl.level = p0
	tbl.sessionId = p1
	tbl.tagName = p2
	tbl.creationTimestamp = p3
	tbl.metadata = p4 or {}
	
	return tbl
end

function t:__tostring() --[[ line: 63 ]]
	local var3 = 0
	
	for i in pairs(self.metadata) do
		var3 += 1
	end
	return string.format("SessionInfo{level=%s, sessionId=%s, tagName=%s, creationTimestamp=%s, metadata_count=%d}", tostring(self.level), tostring(self.sessionId), tostring(self.tagName), tostring(self.creationTimestamp), var3)
end

function t.getSessionByLevel(p5) --[[ line: 97 ]]
	-- upvalues: sessionType (ref), sessionService (ref), t (ref)
	local rootSID, var6
	local _ = nil
	local _ = nil
	local var4 = sessionType.StructuralIdentifier[p5]
	
	if p5 == sessionType.StructuralIdentifier.Level0 then
		rootSID = sessionService:GetRootSID()
		var6 = nil
	elseif not var4 then
		rootSID = nil
		var6 = nil
	elseif sessionService:SessionExists(var4) then
		rootSID = sessionService:GetSessionID(var4)
		var6 = sessionService:GetSessionTag(var4)
	else
		rootSID = nil
		var6 = nil
	end
	return t.new(p5, rootSID, var6, nil, {})
end

return t