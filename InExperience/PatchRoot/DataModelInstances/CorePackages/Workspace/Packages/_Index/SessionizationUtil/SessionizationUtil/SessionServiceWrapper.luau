local sessionService = game:GetService("SessionService")

return {
	SessionChangedSignal = require(script:FindFirstAncestor("SessionizationUtil").Parent.AppCommonLib).Signal.new(),
	GetRootSID = function(_) --[[ line: 15 ]]
		-- upvalues: sessionService (ref)
		return sessionService:GetRootSID()
	end,
	SetSession = function(value, p0, p1, p2) --[[ line: 19 ]]
		-- upvalues: sessionService (ref)
		local var1 = sessionService:GetSessionTag(p1)
		sessionService:SetSession(p0, p1, p2)
		local var2 = sessionService:GetSessionTag(p1)
		
		if var2 ~= var1 then
			value.SessionChangedSignal:fire(p1, var2)
		end
	end,
	ReplaceSession = function(p3, p4, p5) --[[ line: 31 ]]
		-- upvalues: sessionService (ref)
		local var3 = sessionService:GetSessionTag(p4)
		sessionService:ReplaceSession(p4, p5)
		local var4 = sessionService:GetSessionTag(p4)
		
		if var4 ~= var3 then
			p3.SessionChangedSignal:fire(p4, var4)
		end
	end,
	RemoveSession = function(_, p6) --[[ line: 43 ]]
		-- upvalues: sessionService (ref)
		sessionService:RemoveSession(p6)
	end,
	RemoveSessionsWithMetadataKey = function(_, p7) --[[ line: 47 ]]
		-- upvalues: sessionService (ref)
		sessionService:RemoveSessionsWithMetadataKey(p7)
	end,
	GetMetadata = function(_, p8, p9) --[[ line: 51 ]]
		-- upvalues: sessionService (ref)
		return sessionService:GetMetadata(p8, p9)
	end,
	SetMetadata = function(_, p10, p11, p12) --[[ line: 55 ]]
		-- upvalues: sessionService (ref)
		sessionService:SetMetadata(p10, p11, p12)
	end,
	RemoveMetadata = function(_, p13, p14) --[[ line: 59 ]]
		-- upvalues: sessionService (ref)
		sessionService:RemoveMetadata(p13, p14)
	end,
	SessionExists = function(_, p15) --[[ line: 63 ]]
		-- upvalues: sessionService (ref)
		return sessionService:SessionExists(p15)
	end,
	GetSessionTag = function(_, p16) --[[ line: 67 ]]
		-- upvalues: sessionService (ref)
		return sessionService:GetSessionTag(p16)
	end,
	generateSessionInfoString = function(_, p17, p18, p19, p20) --[[ line: 71 ]]
		-- upvalues: sessionService (ref)
		return sessionService:GenerateSessionInfoString(p17, p18, p19, p20)
	end
}