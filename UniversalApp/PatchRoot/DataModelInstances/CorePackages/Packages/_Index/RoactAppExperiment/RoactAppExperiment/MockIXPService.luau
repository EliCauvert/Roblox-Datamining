local MockIXPService = {}
MockIXPService.__index = MockIXPService

function MockIXPService.new(_browserTrackerLayerData, _userLayerData, p1, p2, p3) --[[ Line: 4 ]]
	-- upvalues: MockIXPService (copy)
	local config = {
		_browserTrackerLoadingStatus = Enum.IXPLoadingStatus.Initialized,
		_userLoadingStatus = p1 and Enum.IXPLoadingStatus.Initialized or Enum.IXPLoadingStatus.None,
		_userId = p3 or 0,
		_browserTrackerLayerData = _browserTrackerLayerData,
		_userLayerData = _userLayerData,
		_initializeDelay = p2 or 0.1,
		_exposureEventsFired = {},
		_browserTrackerBindableEvent = Instance.new("BindableEvent")
	}
	config.OnBrowserTrackerLayerLoadingStatusChanged = config._browserTrackerBindableEvent.Event
	config._userBindableEvent = Instance.new("BindableEvent")
	config.OnUserLayerLoadingStatusChanged = config._userBindableEvent.Event
	setmetatable(config, MockIXPService)
	
	return config
end

function MockIXPService:_SetBrowserTrackerIXPLoadingStatus(_browserTrackerLoadingStatus) --[[ Line: 32 ]]
	if self._browserTrackerLoadingStatus ~= _browserTrackerLoadingStatus then
		self._browserTrackerLoadingStatus = _browserTrackerLoadingStatus
		self._browserTrackerBindableEvent:Fire(_browserTrackerLoadingStatus)
	end
end

function MockIXPService:_SetUserIXPLoadingStatus(_userLoadingStatus, UserId) --[[ Line: 39 ]]
	if self._userLoadingStatus ~= _userLoadingStatus or self._userId ~= UserId then
		self._userLoadingStatus = _userLoadingStatus
		self._userId = UserId
		self._userBindableEvent:Fire(self._userLoadingStatus, self._userId)
	end
end

function MockIXPService:RegisterUserLayers(_) --[[ Line: 47 ]] end

function MockIXPService:InitializeUserLayers(UserId) --[[ Line: 49 ]]
	if self._userLoadingStatus ~= Enum.IXPLoadingStatus.Initialized or self._userId ~= 0 and UserId ~= self._userId then
		self:_SetUserIXPLoadingStatus(Enum.IXPLoadingStatus.Pending, UserId)
		spawn(function() --[[ Line: 56 ]]
			-- upvalues: self (copy), UserId (copy)
			wait(self._initializeDelay)
			self:_SetUserIXPLoadingStatus(Enum.IXPLoadingStatus.Initialized, UserId)
		end)
	end
end

function MockIXPService.GetBrowserTrackerLayerVariables(p1, p2) --[[ Line: 63 ]]
	return if p1._browserTrackerLoadingStatus == Enum.IXPLoadingStatus.Initialized then p1._browserTrackerLayerData[p2] else {}
end

function MockIXPService.GetUserLayerVariables(p1, p2) --[[ Line: 70 ]]
	return if p1._userLoadingStatus == Enum.IXPLoadingStatus.Initialized then p1._userLayerData[p2] else {}
end

function MockIXPService:ClearUserLayers() --[[ Line: 77 ]]
	self._userLoadingStatus = Enum.IXPLoadingStatus.None
	self._userId = 0
	self._userBindableEvent:Fire(self._userLoadingStatus, self._userId)
end

function MockIXPService:GetBrowserTrackerLayerLoadingStatus() --[[ Line: 83 ]]
	return self._browserTrackerLoadingStatus
end

function MockIXPService:GetUserLayerLoadingStatus() --[[ Line: 87 ]]
	return self._userLoadingStatus
end

function MockIXPService:GetBrowserTrackerStatusForLayer(_) --[[ Line: 91 ]]
	return self._browserTrackerLoadingStatus
end

function MockIXPService:GetUserStatusForLayer(_) --[[ Line: 95 ]]
	return self._userLoadingStatus
end

function MockIXPService:LogUserLayerExposure(p1) --[[ Line: 99 ]]
	table.insert(self._exposureEventsFired, p1)
end

function MockIXPService:LogBrowserTrackerLayerExposure(p1) --[[ Line: 103 ]]
	table.insert(self._exposureEventsFired, p1)
end

return MockIXPService