-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:30:59 2026 Pacific Standard Time.

local t = {}
t.__index = t

function t.new(p0, p1, p2, p3, p4) --[[ line: 4 ]]
	-- upvalues: t (ref)
	local t_1 = {
		_browserTrackerLoadingStatus = Enum.IXPLoadingStatus.Initialized,
		_userLoadingStatus = if p2 then Enum.IXPLoadingStatus.Initialized else Enum.IXPLoadingStatus.None,
		_userId = p4 or 0,
		_browserTrackerLayerData = p0,
		_userLayerData = p1,
		_initializeDelay = p3 or 0.1,
		_exposureEventsFired = {},
		_browserTrackerBindableEvent = Instance.new("BindableEvent")
	}
	t_1.OnBrowserTrackerLayerLoadingStatusChanged = t_1._browserTrackerBindableEvent.Event
	t_1._userBindableEvent = Instance.new("BindableEvent")
	t_1.OnUserLayerLoadingStatusChanged = t_1._userBindableEvent.Event
	setmetatable(t_1, t)
	
	return t_1
end

function t:_SetBrowserTrackerIXPLoadingStatus(p5) --[[ line: 32 ]]
	if self._browserTrackerLoadingStatus ~= p5 then
		self._browserTrackerLoadingStatus = p5
		self._browserTrackerBindableEvent:Fire(p5)
	end
end

function t:_SetUserIXPLoadingStatus(p6, p7) --[[ line: 39 ]]
	if self._userLoadingStatus ~= p6 or self._userId ~= p7 then
		self._userLoadingStatus = p6
		self._userId = p7
		self._userBindableEvent:Fire(self._userLoadingStatus, self._userId)
	end
end

function t.RegisterUserLayers(_, _) --[[ line: 47 ]] end

function t:InitializeUserLayers(p8) --[[ line: 49 ]]
	if self._userLoadingStatus ~= Enum.IXPLoadingStatus.Initialized or self._userId ~= 0 and p8 ~= self._userId then
		self:_SetUserIXPLoadingStatus(Enum.IXPLoadingStatus.Pending, p8)
		spawn(function() --[[ line: 56 ]]
			-- upvalues: self (ref), p8 (ref)
			wait(self._initializeDelay)
			self:_SetUserIXPLoadingStatus(Enum.IXPLoadingStatus.Initialized, p8)
		end)
	end
end

function t:GetBrowserTrackerLayerVariables(p9) --[[ line: 63 ]]
	return if self._browserTrackerLoadingStatus == Enum.IXPLoadingStatus.Initialized then self._browserTrackerLayerData[p9] else {}
end

function t:GetUserLayerVariables(p10) --[[ line: 70 ]]
	return if self._userLoadingStatus == Enum.IXPLoadingStatus.Initialized then self._userLayerData[p10] else {}
end

function t:ClearUserLayers() --[[ line: 77 ]]
	self._userLoadingStatus = Enum.IXPLoadingStatus.None
	self._userId = 0
	self._userBindableEvent:Fire(self._userLoadingStatus, self._userId)
end

function t:GetBrowserTrackerLayerLoadingStatus() --[[ line: 83 ]]
	return self._browserTrackerLoadingStatus
end

function t:GetUserLayerLoadingStatus() --[[ line: 87 ]]
	return self._userLoadingStatus
end

function t:GetBrowserTrackerStatusForLayer(_) --[[ line: 91 ]]
	return self._browserTrackerLoadingStatus
end

function t:GetUserStatusForLayer(_) --[[ line: 95 ]]
	return self._userLoadingStatus
end

function t:LogUserLayerExposure(p11) --[[ line: 99 ]]
	table.insert(self._exposureEventsFired, p11)
end

function t:LogBrowserTrackerLayerExposure(p12) --[[ line: 103 ]]
	table.insert(self._exposureEventsFired, p12)
end

return t