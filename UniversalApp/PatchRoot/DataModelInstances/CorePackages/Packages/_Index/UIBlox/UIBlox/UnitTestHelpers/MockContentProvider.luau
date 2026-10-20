local RoactModule = require(script.Parent.Parent.Parent.Roact)
local Module = {}
Module.__index = Module

function Module.new(Callback)
	-- upvalues: Module (copy)
	local t = {}
	setmetatable(t, { __index = Module })
	t.callback = Callback
	t.connected = true
	t.isMock = 231
	
	return t
end

function Module:Fire(p1)
	if self.connected then
		self.callback(p1)
	end
end

function Module:Disconnect()
	self.connected = false
end

local Module1 = {}
Module1.__index = Module1

function Module1.new()
	-- upvalues: Module1 (copy)
	local t = {}
	setmetatable(t, { __index = Module1 })
	t.connections = {}
	
	return t
end

function Module1:Connect(Callback)
	-- upvalues: Module (copy)
	local NewModule = Module.new(Callback)
	table.insert(self.connections, NewModule)
	
	return NewModule
end

function Module1.Fire(p1, p2)
	for _, connection in p1.connections do
		connection:Fire(p2)
	end
end

local MockContentProviderModule = {}
MockContentProviderModule.__index = MockContentProviderModule

function MockContentProviderModule.new(p3, p4, p5)
	-- upvalues: MockContentProviderModule (copy)
	local t = {}
	setmetatable(t, { __index = MockContentProviderModule })
	t.mockContentProviderProceedWithLoad = false
	t.contentResolved = false
	t.assetFetchStatuses = {}
	t.signals = {}
	t.preloadAsyncCalled = false
	t.isMock = true
	t.ultimatelySuccessfulContentIds = p3 or {}
	t.ultimatelyTimedOutContentIds = p4 or {}
	t.ultimatelyFailedContentIds = p5 or {}
	
	return t
end

function MockContentProviderModule:mockReload(p3, p4)
	self.mockContentProviderProceedWithLoad = false
	self:_staggeredProgress(nil, p3, p4 or Enum.AssetFetchStatus.Success)
end

function MockContentProviderModule:proceedWithLoad()
	-- upvalues: RoactModule (copy)
	self.mockContentProviderProceedWithLoad = true
	RoactModule.act(function()
		task.wait(0.1)
	end)
end

function MockContentProviderModule:_setAssetFetchStatus(p3, Loading)
	self.assetFetchStatuses[p3] = Loading
	
	if self.signals[p3] then
		self.signals[p3]:Fire(Loading)
	end
end

function MockContentProviderModule:_staggeredProgress(Callback, p3, Failure)
	self.contentResolved = false
	task.spawn(function()
		-- upvalues: self (copy), p3 (copy), Callback (copy), Failure (copy)
		while true do
			if self.mockContentProviderProceedWithLoad then
				if self.contentResolved then
					break
				end
				self:_setAssetFetchStatus(p3, Enum.AssetFetchStatus.Loading)
				
				if Callback then
					Callback(p3, Enum.AssetFetchStatus.Loading)
				end
				self.contentResolved = true
				self.mockContentProviderProceedWithLoad = false
			end
			task.wait()
		end
		self:_setAssetFetchStatus(p3, Failure)
		
		if Callback then
			Callback(p3, Failure)
		end
		self.mockContentProviderProceedWithLoad = false
	end)
end

function MockContentProviderModule:_makeMockSignal()
	-- upvalues: Module1 (copy)
	return (Module1.new())
end

function MockContentProviderModule:GetAssetFetchStatusChangedSignal(p4)
	if self.signals[p4] == nil then
		self.signals[p4] = self:_makeMockSignal()
	end
	return self.signals[p4]
end

function MockContentProviderModule.GetAssetFetchStatus(p4, p5)
	return if p4.assetFetchStatuses[p5] == nil then Enum.AssetFetchStatus.None else p4.assetFetchStatuses[p5]
end

function MockContentProviderModule:PreloadAsync(List, Callback)
	self.preloadAsyncCalled = true
	
	for _, value in ipairs(List) do
		if self.ultimatelySuccessfulContentIds[value] then
			self:_staggeredProgress(Callback, value, Enum.AssetFetchStatus.Success)
		elseif self.ultimatelyTimedOutContentIds[value] then
			self:_staggeredProgress(Callback, value, Enum.AssetFetchStatus.TimedOut)
		elseif self.ultimatelyFailedContentIds[value] then
			self:_staggeredProgress(Callback, value, Enum.AssetFetchStatus.Failure)
		else
			task.delay(0, function()
				-- upvalues: self (copy), value (copy), Callback (copy)
				self:_setAssetFetchStatus(value, Enum.AssetFetchStatus.Success)
				
				if Callback then
					Callback(value, Enum.AssetFetchStatus.Success)
				end
			end)
		end
	end
end

return MockContentProviderModule