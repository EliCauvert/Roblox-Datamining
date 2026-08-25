local roactModule = require(script.Parent.Parent.Parent.Roact)
local t = {}
t.__index = t

function t.new(p0)
	-- upvalues: t (ref)
	local t_1 = {}
	setmetatable(t_1, { __index = t })
	t_1.callback = p0
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

function t_1:Connect(p2)
	-- upvalues: t (ref)
	local var6 = t.new(p2)
	table.insert(self.connections, var6)
	
	return var6
end

function t_1:Fire(p3)
	for i, v in self.connections do
		v:Fire(p3)
	end
end

local t_2 = {}
t_2.__index = t_2

function t_2.new(p4, p5, p6)
	-- upvalues: t_2 (ref)
	local t = {}
	setmetatable(t, { __index = t_2 })
	t.mockContentProviderProceedWithLoad = false
	t.contentResolved = false
	t.assetFetchStatuses = {}
	t.signals = {}
	t.preloadAsyncCalled = false
	t.isMock = true
	t.ultimatelySuccessfulContentIds = p4 or {}
	t.ultimatelyTimedOutContentIds = p5 or {}
	t.ultimatelyFailedContentIds = p6 or {}
	
	return t
end

function t_2:mockReload(p7, p8)
	self.mockContentProviderProceedWithLoad = false
	self:_staggeredProgress(nil, p7, p8 or Enum.AssetFetchStatus.Success)
end

function t_2:proceedWithLoad()
	-- upvalues: roactModule (ref)
	self.mockContentProviderProceedWithLoad = true
	roactModule.act(function()
		task.wait(0.1)
	end)
end

function t_2:_setAssetFetchStatus(p9, p10)
	self.assetFetchStatuses[p9] = p10
	
	if self.signals[p9] then
		self.signals[p9]:Fire(p10)
	end
end

function t_2:_staggeredProgress(p11, p12, p13)
	self.contentResolved = false
	task.spawn(function()
		-- upvalues: self (ref), p12 (ref), p11 (ref), p13 (ref)
		while true do
			if not self.mockContentProviderProceedWithLoad then
				task.wait()
				continue
			end
			if not self.contentResolved then
				self:_setAssetFetchStatus(p12, Enum.AssetFetchStatus.Loading)
				
				if p11 then
					p11(p12, Enum.AssetFetchStatus.Loading)
				end
				self.contentResolved = true
				self.mockContentProviderProceedWithLoad = false
			end
			self:_setAssetFetchStatus(p12, p13)
			
			if p11 then
				p11(p12, p13)
			end
			self.mockContentProviderProceedWithLoad = false
		end
	end)
end

function t_2._makeMockSignal(_)
	-- upvalues: t_1 (ref)
	return t_1.new()
end

function t_2:GetAssetFetchStatusChangedSignal(p14)
	if self.signals[p14] == nil then
		self.signals[p14] = self:_makeMockSignal()
	end
	return self.signals[p14]
end

function t_2:GetAssetFetchStatus(p15)
	return if self.assetFetchStatuses[p15] == nil then Enum.AssetFetchStatus.None else self.assetFetchStatuses[p15]
end

function t_2:PreloadAsync(p16, p17)
	self.preloadAsyncCalled = true
	
	for i, v in ipairs(p16) do
		if self.ultimatelySuccessfulContentIds[v] then
			self:_staggeredProgress(p17, v, Enum.AssetFetchStatus.Success)
		elseif self.ultimatelyTimedOutContentIds[v] then
			self:_staggeredProgress(p17, v, Enum.AssetFetchStatus.TimedOut)
		elseif self.ultimatelyFailedContentIds[v] then
			self:_staggeredProgress(p17, v, Enum.AssetFetchStatus.Failure)
		else
			task.delay(0, function()
				-- upvalues: self (ref), v (ref), p17 (ref)
				self:_setAssetFetchStatus(v, Enum.AssetFetchStatus.Success)
				
				if p17 then
					p17(v, Enum.AssetFetchStatus.Success)
				end
			end)
		end
	end
end

return t_2