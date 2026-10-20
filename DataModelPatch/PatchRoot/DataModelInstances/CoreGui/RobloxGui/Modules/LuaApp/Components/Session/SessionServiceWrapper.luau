local SessionService = game:GetService("SessionService")
local CorePackages = game:GetService("CorePackages")

return if game:DefineFastFlag("UseSessionServiceWrapperModule", false) then require(CorePackages.Workspace.Packages.SessionizationUtil).SessionServiceWrapper else {
	SessionChangedSignal = require(CorePackages.Workspace.Packages.AppCommonLib).Signal.new(),
	GetRootSID = function(_)
		-- upvalues: SessionService (copy)
		return SessionService:GetRootSID()
	end,
	SetSession = function(p1, ParentSid, Sid, Tag)
		-- upvalues: SessionService (copy)
		local SessionTag = SessionService:GetSessionTag(Sid)
		SessionService:SetSession(ParentSid, Sid, Tag)
		local SessionTag1 = SessionService:GetSessionTag(Sid)
		
		if SessionTag1 ~= SessionTag then
			p1.SessionChangedSignal:fire(Sid, SessionTag1)
		end
	end,
	ReplaceSession = function(p1, Sid, Tag)
		-- upvalues: SessionService (copy)
		local SessionTag = SessionService:GetSessionTag(Sid)
		SessionService:ReplaceSession(Sid, Tag)
		local SessionTag1 = SessionService:GetSessionTag(Sid)
		
		if SessionTag1 ~= SessionTag then
			p1.SessionChangedSignal:fire(Sid, SessionTag1)
		end
	end,
	RemoveSession = function(_, Sid)
		-- upvalues: SessionService (copy)
		SessionService:RemoveSession(Sid)
	end,
	RemoveSessionsWithMetadataKey = function(_, Key)
		-- upvalues: SessionService (copy)
		SessionService:RemoveSessionsWithMetadataKey(Key)
	end,
	GetMetadata = function(_, Sid, Key)
		-- upvalues: SessionService (copy)
		return SessionService:GetMetadata(Sid, Key)
	end,
	SetMetadata = function(_, Sid, Key, Value)
		-- upvalues: SessionService (copy)
		SessionService:SetMetadata(Sid, Key, Value)
	end,
	RemoveMetadata = function(_, Sid, Key)
		-- upvalues: SessionService (copy)
		SessionService:RemoveMetadata(Sid, Key)
	end,
	SessionExists = function(_, Sid)
		-- upvalues: SessionService (copy)
		return SessionService:SessionExists(Sid)
	end,
	GetSessionTag = function(_, Sid)
		-- upvalues: SessionService (copy)
		return SessionService:GetSessionTag(Sid)
	end,
	generateSessionInfoString = function(_, IncludeArbitrarySessions, IncludeTag, IncludeTimestamps, IncludeMetadata)
		-- upvalues: SessionService (copy)
		return SessionService:GenerateSessionInfoString(IncludeArbitrarySessions, IncludeTag, IncludeTimestamps, IncludeMetadata)
	end
}