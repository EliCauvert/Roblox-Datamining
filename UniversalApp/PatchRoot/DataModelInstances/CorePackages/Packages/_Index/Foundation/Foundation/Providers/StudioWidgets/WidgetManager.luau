local httpService = game:GetService("HttpService")
local foundation = script:FindFirstAncestor("Foundation")
local dashModule = require(foundation.Parent.Dash)
local filter = dashModule.filter
local values = dashModule.values
local studioUriModule = require(foundation.Utility.Plugin.StudioUri)
local loggerModule = require(foundation.Utility.Logger)
local t = {}
t.__index = t

function t.new(p0) --[[ line: 52 ]]
	-- upvalues: t (ref)
	local tbl = setmetatable({}, t)
	tbl._widgetsApi = p0
	tbl._pendingRegisters = {}
	tbl._pendingDeregisters = {}
	tbl._registeredWidgets = {}
	tbl._signals = {}
	tbl._running = false
	
	return tbl
end

function t.nextId(_) --[[ line: 67 ]]
	-- upvalues: httpService (ref)
	return httpService:GenerateGUID(false)
end

function t:flush() --[[ line: 71 ]]
	-- upvalues: filter (ref), values (ref), studioUriModule (ref)
	local t = {}
	
	for i, v in self._pendingDeregisters do
		table.insert(t, v)
		self._registeredWidgets[i] = nil
	end
	if #t > 0 then
		pcall(function() --[[ line: 78 ]]
			-- upvalues: self (ref), t (ref)
			self._widgetsApi:DeregisterAsync(t)
		end)
	end
	self._pendingDeregisters = {}
	local var8 = filter(values(self._pendingRegisters), function(p1) --[[ line: 84 ]]
		return p1.Widget:FindFirstAncestorWhichIsA("LayerCollector") ~= nil
	end)
	
	for i_1, v_1 in var8 do
		v_1.Position = v_1.Widget.AbsolutePosition
		v_1.Size = v_1.Widget.AbsoluteSize
		v_1.Visible = v_1.Widget:GetStyled("Visible")
		local var9 = studioUriModule.toString(v_1.Uri)
		local var10 = self._signals[var9]
		
		if not var10 then
			self._signals[var9] = {
				Widget = v_1.Widget,
				PositionChanged = v_1.Widget:GetPropertyChangedSignal("AbsolutePosition"):Connect(function() --[[ line: 107 ]]
					-- upvalues: self (ref), v_1 (ref)
					self:register(v_1.Uri, v_1.Widget)
				end),
				SizeChanged = v_1.Widget:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ line: 110 ]]
					-- upvalues: self (ref), v_1 (ref)
					self:register(v_1.Uri, v_1.Widget)
				end),
				VisibleChanged = v_1.Widget:GetStyledPropertyChangedSignal("Visible"):Connect(function() --[[ line: 113 ]]
					-- upvalues: self (ref), v_1 (ref)
					self:register(v_1.Uri, v_1.Widget)
				end),
				AncestryChanged = v_1.Widget.AncestryChanged:Connect(function(_, p2) --[[ line: 116 ]]
					-- upvalues: self (ref), v_1 (ref)
					if not p2 then
						self:deregister(v_1.Uri)
					end
				end)
			}
		elseif var10.Widget ~= v_1.Widget then
			var10.PositionChanged:Disconnect()
			var10.SizeChanged:Disconnect()
			var10.VisibleChanged:Disconnect()
			var10.AncestryChanged:Disconnect()
		end
	end
	if #var8 > 0 then
		self._widgetsApi:RegisterAsync(var8)
	end
	self._pendingRegisters = {}
end

function t:_run() --[[ line: 130 ]]
	if self._running then
		return
	end
	self._running = true
	task.defer(function() --[[ line: 135 ]]
		-- upvalues: self (ref)
		self._running = false
		self:flush()
	end)
end

function t:register(p3, p4) --[[ line: 145 ]]
	-- upvalues: studioUriModule (ref)
	local pluginGui = p4:FindFirstAncestorWhichIsA("PluginGui") or p4:FindFirstAncestorWhichIsA("ScreenGui")
	
	if pluginGui then
		local var12 = studioUriModule.toString(p3)
		self._registeredWidgets[var12] = p4
		self._pendingRegisters[var12] = { Uri = p3, Widget = p4, DEPRECATED_PluginGui = pluginGui }
		self._pendingDeregisters[var12] = nil
		self:_run()
	end
end

function t:deregister(p5, p6) --[[ line: 159 ]]
	-- upvalues: studioUriModule (ref), loggerModule (ref)
	local var13 = studioUriModule.toString(p5)
	self._pendingDeregisters[var13] = p5
	local var14 = self._signals[var13]
	
	if var14 then
		if p6 == nil or var14.Widget == p6 then
			var14.PositionChanged:Disconnect()
			var14.SizeChanged:Disconnect()
			var14.VisibleChanged:Disconnect()
			var14.AncestryChanged:Disconnect()
			self._signals[var13] = nil
		else
			loggerModule:warning(`WidgetManager:deregister called with mismatched widget for uri {var13}`)
		end
	end
	self:_run()
end

function t:destroy() --[[ line: 177 ]]
	for i, v in self._signals do
		v.PositionChanged:Disconnect()
		v.SizeChanged:Disconnect()
		v.VisibleChanged:Disconnect()
		v.AncestryChanged:Disconnect()
	end
	self._signals = {}
	self._pendingRegisters = {}
	self._pendingDeregisters = {}
	self._registeredWidgets = {}
end

return t