local RoactModule = require(script.Parent.Parent.Parent.Roact)
local Module = {}
Module.__index = Module

function Module.new(Callback) --[[ Line: 38 ]]
	-- upvalues: Module (copy)
	local t = {}
	setmetatable(t, { __index = Module })
	t.callback = Callback
	t.connected = true
	t.isMock = 231
	
	return t
end

function Module:Fire(p1) --[[ Line: 50 ]]
	if self.connected then
		self.callback(p1)
	end
end

function Module:Disconnect() --[[ Line: 56 ]]
	self.connected = false
end

local Module1 = {}
Module1.__index = Module1

function Module1.new() --[[ Line: 65 ]]
	-- upvalues: Module1 (copy)
	local t = {}
	setmetatable(t, { __index = Module1 })
	t.connections = {}
	
	return t
end

function Module1:Connect(Callback) --[[ Line: 75 ]]
	-- upvalues: Module (copy)
	local NewModule = Module.new(Callback)
	table.insert(self.connections, NewModule)
	
	return NewModule
end

function Module1.Fire(p1, p2) --[[ Line: 81 ]]
	for _, connection in p1.connections do
		connection:Fire(p2)
	end
end

local MockContentProviderModule = {}
MockContentProviderModule.__index = MockContentProviderModule

function MockContentProviderModule.new(p3, p4, p5) --[[ Line: 92 ]]
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

function MockContentProviderModule:mockReload(p3, p4) --[[ Line: 114 ]]
	self.mockContentProviderProceedWithLoad = false
	self:_staggeredProgress(nil, p3, p4 or Enum.AssetFetchStatus.Success)
end

function MockContentProviderModule:proceedWithLoad() --[[ Line: 120 ]]
	-- upvalues: RoactModule (copy)
	self.mockContentProviderProceedWithLoad = true
	RoactModule.act(function() --[[ Line: 122 ]]
		task.wait(0.1)
	end)
end

function MockContentProviderModule:_setAssetFetchStatus(p3, Loading) --[[ Line: 127 ]]
	self.assetFetchStatuses[p3] = Loading
	
	if self.signals[p3] then
		self.signals[p3]:Fire(Loading)
	end
end

function MockContentProviderModule:_staggeredProgress(Callback, p3, Failure) --[[ Line: 134 ]]
	self.contentResolved = false
	task.spawn(function() --[[ Line: 137 ]]
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

function MockContentProviderModule:_makeMockSignal() --[[ Line: 161 ]]
	-- upvalues: Module1 (copy)
	return (Module1.new())
end

function MockContentProviderModule:GetAssetFetchStatusChangedSignal(p4) --[[ Line: 166 ]]
	if self.signals[p4] == nil then
		self.signals[p4] = self:_makeMockSignal()
	end
	return self.signals[p4]
end

function MockContentProviderModule.GetAssetFetchStatus(p4, p5) --[[ Line: 173 ]]
	return if p4.assetFetchStatuses[p5] == nil then Enum.AssetFetchStatus.None else p4.assetFetchStatuses[p5]
end

function MockContentProviderModule:PreloadAsync(List, Callback) --[[ Line: 181 ]]
	self.preloadAsyncCalled = true
	
	for _, value in ipairs(List) do
		if self.ultimatelySuccessfulContentIds[value] then
			self:_staggeredProgress(Callback, value, Enum.AssetFetchStatus.Success)
		elseif self.ultimatelyTimedOutContentIds[value] then
			self:_staggeredProgress(Callback, value, Enum.AssetFetchStatus.TimedOut)
		elseif self.ultimatelyFailedContentIds[value] then
			self:_staggeredProgress(Callback, value, Enum.AssetFetchStatus.Failure)
		else
			task.delay(0, function() --[[ Line: 191 ]]
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