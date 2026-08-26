local t = {}
t.__index = t

function t.new(p1, p2, p3, p4, p5)
	-- upvalues: t (ref)
	local t_1 = {
		_browserTrackerLoadingStatus = Enum.IXPLoadingStatus.Initialized,
		_userLoadingStatus = if p3 then Enum.IXPLoadingStatus.Initialized else Enum.IXPLoadingStatus.None,
		_userId = p5 or 0,
		_browserTrackerLayerData = p1,
		_userLayerData = p2,
		_initializeDelay = p4 or 0.1,
		_exposureEventsFired = {},
		_browserTrackerBindableEvent = Instance.new("BindableEvent")
	}
	t_1.OnBrowserTrackerLayerLoadingStatusChanged = t_1._browserTrackerBindableEvent.Event
	t_1._userBindableEvent = Instance.new("BindableEvent")
	t_1.OnUserLayerLoadingStatusChanged = t_1._userBindableEvent.Event
	setmetatable(t_1, t)
	
	return t_1
end

function t:_SetBrowserTrackerIXPLoadingStatus(p1)
	if self._browserTrackerLoadingStatus ~= p1 then
		self._browserTrackerLoadingStatus = p1
		self._browserTrackerBindableEvent:Fire(p1)
	end
end

function t:_SetUserIXPLoadingStatus(p1, p2)
	if self._userLoadingStatus ~= p1 or self._userId ~= p2 then
		self._userLoadingStatus = p1
		self._userId = p2
		self._userBindableEvent:Fire(self._userLoadingStatus, self._userId)
	end
end

function t.RegisterUserLayers(_, _) end

function t:InitializeUserLayers(p1)
	if self._userLoadingStatus ~= Enum.IXPLoadingStatus.Initialized or self._userId ~= 0 and p1 ~= self._userId then
		self:_SetUserIXPLoadingStatus(Enum.IXPLoadingStatus.Pending, p1)
		spawn(function()
			-- upvalues: self (ref), p1 (ref)
			wait(self._initializeDelay)
			self:_SetUserIXPLoadingStatus(Enum.IXPLoadingStatus.Initialized, p1)
		end)
	end
end

function t:GetBrowserTrackerLayerVariables(p1)
	return if self._browserTrackerLoadingStatus == Enum.IXPLoadingStatus.Initialized then self._browserTrackerLayerData[p1] else {}
end

function t:GetUserLayerVariables(p1)
	return if self._userLoadingStatus == Enum.IXPLoadingStatus.Initialized then self._userLayerData[p1] else {}
end

function t:ClearUserLayers()
	self._userLoadingStatus = Enum.IXPLoadingStatus.None
	self._userId = 0
	self._userBindableEvent:Fire(self._userLoadingStatus, self._userId)
end

function t:GetBrowserTrackerLayerLoadingStatus()
	return self._browserTrackerLoadingStatus
end

function t:GetUserLayerLoadingStatus()
	return self._userLoadingStatus
end

function t:GetBrowserTrackerStatusForLayer(_)
	return self._browserTrackerLoadingStatus
end

function t:GetUserStatusForLayer(_)
	return self._userLoadingStatus
end

function t:LogUserLayerExposure(p1)
	table.insert(self._exposureEventsFired, p1)
end

function t:LogBrowserTrackerLayerExposure(p1)
	table.insert(self._exposureEventsFired, p1)
end

return t