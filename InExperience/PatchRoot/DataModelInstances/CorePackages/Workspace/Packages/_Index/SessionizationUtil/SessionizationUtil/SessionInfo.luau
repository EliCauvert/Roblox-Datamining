local SessionService = game:GetService("SessionService")
local SessionType = require(script:FindFirstAncestor("SessionizationUtil").Parent.RobloxAppSessionization).SessionType
local SessionInfoModule = {}
SessionInfoModule.__index = SessionInfoModule

function SessionInfoModule.new(Level, SessionId, TagName, CreationTimestamp, p1) --[[ Line: 40 ]]
	-- upvalues: SessionInfoModule (copy)
	local self = setmetatable({}, SessionInfoModule)
	self.level = Level
	self.sessionId = SessionId
	self.tagName = TagName
	self.creationTimestamp = CreationTimestamp
	self.metadata = p1 or {}
	
	return self
end

function SessionInfoModule:__tostring(): string --[[ Line: 63 ]]
	local Count = 0
	
	for _ in pairs(self.metadata) do
		Count += 1
	end
	return string.format("SessionInfo{level=%s, sessionId=%s, tagName=%s, creationTimestamp=%s, metadata_count=%d}", tostring(self.level), tostring(self.sessionId), tostring(self.tagName), tostring(self.creationTimestamp), Count)
end

function SessionInfoModule.getSessionByLevel(Level) --[[ Line: 97 ]]
	-- upvalues: SessionType (copy), SessionService (copy), SessionInfoModule (copy)
	local StructuralIdentifierEntry = SessionType.StructuralIdentifier[Level]
	local RootSID = nil
	local SessionTag = nil
	
	if Level == SessionType.StructuralIdentifier.Level0 then
		RootSID = SessionService:GetRootSID()
		SessionTag = nil
	elseif StructuralIdentifierEntry then
		if SessionService:SessionExists(StructuralIdentifierEntry) then
			RootSID = SessionService:GetSessionID(StructuralIdentifierEntry)
			SessionTag = SessionService:GetSessionTag(StructuralIdentifierEntry)
		else
			RootSID = nil
			SessionTag = nil
		end
	else
		RootSID = nil
		SessionTag = nil
	end
	return SessionInfoModule.new(Level, RootSID, SessionTag, nil, {})
end

return SessionInfoModule