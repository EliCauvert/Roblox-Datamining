local roactModule = require(script.Parent.Parent.Parent.Roact)
local t = {}
t.__index = t

function t.new(p1)
	-- upvalues: t (ref)
	local t_1 = {}
	setmetatable(t_1, { __index = t })
	t_1.callback = p1
	t_1.connected = true
	t_1.isMock = 231
	
	return t_1
end

function t:Fire(p1)
	if self.connected then
		self.callback(p1)
	end
end

function t:Disconnect()
	self.connected = false
end

local t_1 = {}
t_1.__index = t_1

function t_1.new()
	-- upvalues: t_1 (ref)
	local t = {}
	setmetatable(t, { __index = t_1 })
	t.connections = {}
	
	return t
end

function t_1:Connect(p1)
	-- upvalues: t (ref)
	local var1 = t.new(p1)
	table.insert(self.connections, var1)
	
	return var1
end

function t_1:Fire(p1)
	for i, v in self.connections do
		v:Fire(p1)
	end
end

local t_2 = {}
t_2.__index = t_2

function t_2.new(p2, p3, p4)
	-- upvalues: t_2 (ref)
	local t = {}
	setmetatable(t, { __index = t_2 })
	t.mockContentProviderProceedWithLoad = false
	t.contentResolved = false
	t.assetFetchStatuses = {}
	t.signals = {}
	t.preloadAsyncCalled = false
	t.isMock = true
	t.ultimatelySuccessfulContentIds = p2 or {}
	t.ultimatelyTimedOutContentIds = p3 or {}
	t.ultimatelyFailedContentIds = p4 or {}
	
	return t
end

function t_2:mockReload(p2, p3)
	self.mockContentProviderProceedWithLoad = false
	self:_staggeredProgress(nil, p2, p3 or Enum.AssetFetchStatus.Success)
end

function t_2:proceedWithLoad()
	-- upvalues: roactModule (ref)
	self.mockContentProviderProceedWithLoad = true
	roactModule.act(function()
		task.wait(0.1)
	end)
end

function t_2:_setAssetFetchStatus(p2, p3)
	self.assetFetchStatuses[p2] = p3
	
	if self.signals[p2] then
		self.signals[p2]:Fire(p3)
	end
end

function t_2:_staggeredProgress(p2, p3, p4)
	self.contentResolved = false
	task.spawn(function()
		-- upvalues: self (ref), p3 (ref), p2 (ref), p4 (ref)
		while true do
			if not self.mockContentProviderProceedWithLoad then
				task.wait()
				continue
			end
			if not self.contentResolved then
				self:_setAssetFetchStatus(p3, Enum.AssetFetchStatus.Loading)
				
				if p2 then
					p2(p3, Enum.AssetFetchStatus.Loading)
				end
				self.contentResolved = true
				self.mockContentProviderProceedWithLoad = false
			end
			self:_setAssetFetchStatus(p3, p4)
			
			if p2 then
				p2(p3, p4)
			end
			self.mockContentProviderProceedWithLoad = false
		end
	end)
end

function t_2._makeMockSignal(_)
	-- upvalues: t_1 (ref)
	return t_1.new()
end

function t_2:GetAssetFetchStatusChangedSignal(p5)
	if self.signals[p5] == nil then
		self.signals[p5] = self:_makeMockSignal()
	end
	return self.signals[p5]
end

function t_2:GetAssetFetchStatus(p5)
	return if self.assetFetchStatuses[p5] == nil then Enum.AssetFetchStatus.None else self.assetFetchStatuses[p5]
end

function t_2:PreloadAsync(p5, p6)
	self.preloadAsyncCalled = true
	
	for i, v in ipairs(p5) do
		if self.ultimatelySuccessfulContentIds[v] then
			self:_staggeredProgress(p6, v, Enum.AssetFetchStatus.Success)
		elseif self.ultimatelyTimedOutContentIds[v] then
			self:_staggeredProgress(p6, v, Enum.AssetFetchStatus.TimedOut)
		elseif self.ultimatelyFailedContentIds[v] then
			self:_staggeredProgress(p6, v, Enum.AssetFetchStatus.Failure)
		else
			task.delay(0, function()
				-- upvalues: self (ref), v (ref), p6 (ref)
				self:_setAssetFetchStatus(v, Enum.AssetFetchStatus.Success)
				
				if p6 then
					p6(v, Enum.AssetFetchStatus.Success)
				end
			end)
		end
	end
end

return t_2