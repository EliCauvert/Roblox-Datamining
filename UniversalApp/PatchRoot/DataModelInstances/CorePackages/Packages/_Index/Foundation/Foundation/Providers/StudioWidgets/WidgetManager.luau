local httpService = game:GetService("HttpService")
local foundation = script:FindFirstAncestor("Foundation")
local dashModule = require(foundation.Parent.Dash)
local filter = dashModule.filter
local values = dashModule.values
local flagsModule = require(foundation.Utility.Flags)
local studioUriModule = require(foundation.Utility.Plugin.StudioUri)
local loggerModule = require(foundation.Utility.Logger)
local t = {}
t.__index = t

function t.new(p1)
	-- upvalues: t (ref)
	local tbl = setmetatable({}, t)
	tbl._widgetsApi = p1
	tbl._pendingRegisters = {}
	tbl._pendingDeregisters = {}
	tbl._registeredWidgets = {}
	tbl._signals = {}
	tbl._deferredAncestrySignals = {}
	tbl._running = false
	
	return tbl
end

local function _(p1)
	local pluginGui = p1:FindFirstAncestorWhichIsA("PluginGui")
	
	return pluginGui or p1:FindFirstAncestorWhichIsA("ScreenGui")
end

local _ = function(p1, p2, p3)
	return {
		Uri = p1,
		Widget = p2,
		DEPRECATED_PluginGui = p3,
		Position = p2.AbsolutePosition,
		Size = p2.AbsoluteSize,
		Visible = p2:GetStyled("Visible")
	}
end

function t.nextId(_)
	-- upvalues: httpService (ref)
	return httpService:GenerateGUID(false)
end

function t:flush()
	-- upvalues: flagsModule (ref)
	if flagsModule.FoundationWidgetManagerSnapshotFlush then
		local pendingDeregisters = self._pendingDeregisters
		local pendingRegisters = self._pendingRegisters
		self._pendingDeregisters = {}
		self._pendingRegisters = {}
		self:_flushWith(pendingDeregisters, pendingRegisters)
		
		return
	end
	self:_flushWith(self._pendingDeregisters, self._pendingRegisters)
	self._pendingDeregisters = {}
	self._pendingRegisters = {}
end

function t:_flushWith(p1, p2)
	-- upvalues: flagsModule (ref), filter (ref), values (ref), studioUriModule (ref)
	local t = {}
	
	for i, v in p1 do
		table.insert(t, v)
		self._registeredWidgets[i] = nil
	end
	if #t > 0 then
		pcall(function()
			-- upvalues: self (ref), t (ref)
			self._widgetsApi:DeregisterAsync(t)
		end)
	end
	local var1 = if flagsModule.FoundationWidgetManagerSnapshotFlush then {} else nil
	local var2 = filter(values(p2), function(p3)
		-- upvalues: flagsModule (copy), var1 (ref)
		local var3 = p3.Widget:FindFirstAncestorWhichIsA("LayerCollector") ~= nil
		
		if flagsModule.FoundationWidgetManagerSnapshotFlush and not var3 then
			table.insert(var1, p3)
		end
		return var3
	end)
	
	if flagsModule.FoundationWidgetManagerSnapshotFlush then
		for i_1, v_1 in var1 do
			local var3 = studioUriModule.toString(v_1.Uri)
			
			if not self._deferredAncestrySignals[var3] then
				self._deferredAncestrySignals[var3] = v_1.Widget.AncestryChanged:Connect(function(_, p3)
					-- upvalues: self (ref), var3 (ref), v_1 (ref)
					if p3 == nil then
						local var4 = self._deferredAncestrySignals[var3]
						
						if var4 then
							var4:Disconnect()
							self._deferredAncestrySignals[var3] = nil
						end
						return
					elseif v_1.Widget:FindFirstAncestorWhichIsA("LayerCollector") then
						local var5 = self._deferredAncestrySignals[var3]
						
						if var5 then
							var5:Disconnect()
							self._deferredAncestrySignals[var3] = nil
						end
						self:register(v_1.Uri, v_1.Widget)
					end
				end)
			end
		end
	end
	local t_1 = {}
	
	for i_1, v_1 in var2 do
		v_1.Position = v_1.Widget.AbsolutePosition
		v_1.Size = v_1.Widget.AbsoluteSize
		v_1.Visible = v_1.Widget:GetStyled("Visible")
		local var4 = studioUriModule.toString(v_1.Uri)
		local DEPRECATED_PluginGui = v_1.DEPRECATED_PluginGui
		local var5 = self._signals[var4]
		
		if var5 then
			if var5.Widget ~= v_1.Widget then
				var5.PositionChanged:Disconnect()
				var5.SizeChanged:Disconnect()
				var5.VisibleChanged:Disconnect()
				var5.AncestryChanged:Disconnect()
			elseif flagsModule.FoundationPopoverPluginOverlayMeasurement and var5.Host ~= DEPRECATED_PluginGui then
				var5.Host = DEPRECATED_PluginGui
				table.insert(t_1, v_1.Uri)
			end
		end
		self._signals[var4] = {
			Widget = v_1.Widget,
			Host = if flagsModule.FoundationPopoverPluginOverlayMeasurement then DEPRECATED_PluginGui else nil,
			PositionChanged = v_1.Widget:GetPropertyChangedSignal("AbsolutePosition"):Connect(function()
				-- upvalues: self (ref), v_1 (ref)
				self:register(v_1.Uri, v_1.Widget)
			end),
			SizeChanged = v_1.Widget:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
				-- upvalues: self (ref), v_1 (ref)
				self:register(v_1.Uri, v_1.Widget)
			end),
			VisibleChanged = v_1.Widget:GetStyledPropertyChangedSignal("Visible"):Connect(function()
				-- upvalues: self (ref), v_1 (ref)
				self:register(v_1.Uri, v_1.Widget)
			end),
			AncestryChanged = v_1.Widget.AncestryChanged:Connect(function(_, p3)
				-- upvalues: self (ref), v_1 (ref)
				if not p3 then
					self:deregister(v_1.Uri)
				end
			end)
		}
	end
	if flagsModule.FoundationPopoverPluginOverlayMeasurement and #t_1 > 0 then
		pcall(function()
			-- upvalues: self (ref), t_1 (ref)
			self._widgetsApi:DeregisterAsync(t_1)
		end)
	end
	if #var2 > 0 then
		self._widgetsApi:RegisterAsync(var2)
	end
end

function t:_run()
	if self._running then
		return
	end
	self._running = true
	task.defer(function()
		-- upvalues: self (ref)
		self._running = false
		self:flush()
	end)
end

function t:register(p3, p4)
	-- upvalues: studioUriModule (ref), flagsModule (ref)
	local pluginGui = p4:FindFirstAncestorWhichIsA("PluginGui")
	local var6 = pluginGui or p4:FindFirstAncestorWhichIsA("ScreenGui")
	
	if var6 then
		local var7 = studioUriModule.toString(p3)
		
		if flagsModule.FoundationWidgetManagerSnapshotFlush then
			local var8 = self._deferredAncestrySignals[var7]
			
			if var8 then
				var8:Disconnect()
				self._deferredAncestrySignals[var7] = nil
			end
		end
		self._registeredWidgets[var7] = p4
		self._pendingRegisters[var7] = { Uri = p3, Widget = p4, DEPRECATED_PluginGui = var6 }
		self._pendingDeregisters[var7] = nil
		self:_run()
	end
end

function t:refreshAsync(p3)
	-- upvalues: studioUriModule (ref)
	local var6 = self._registeredWidgets[studioUriModule.toString(p3)]
	
	if not var6 then
		return false
	end
	local pluginGui = var6:FindFirstAncestorWhichIsA("PluginGui")
	local var7 = pluginGui or var6:FindFirstAncestorWhichIsA("ScreenGui")
	
	if var7 then
		self._widgetsApi:RegisterAsync({
			{
				Uri = p3,
				Widget = var6,
				DEPRECATED_PluginGui = var7,
				Position = var6.AbsolutePosition,
				Size = var6.AbsoluteSize,
				Visible = var6:GetStyled("Visible")
			}
		})
		
		return true
	end
	return false
end

function t:deregister(p3, p4)
	-- upvalues: studioUriModule (ref), flagsModule (ref), loggerModule (ref)
	local var6 = studioUriModule.toString(p3)
	self._pendingDeregisters[var6] = p3
	
	if flagsModule.FoundationWidgetManagerSnapshotFlush then
		self._pendingRegisters[var6] = nil
		local var7 = self._deferredAncestrySignals[var6]
		
		if var7 then
			var7:Disconnect()
			self._deferredAncestrySignals[var6] = nil
		end
	end
	local var8 = self._signals[var6]
	
	if var8 then
		if p4 == nil or var8.Widget == p4 then
			var8.PositionChanged:Disconnect()
			var8.SizeChanged:Disconnect()
			var8.VisibleChanged:Disconnect()
			var8.AncestryChanged:Disconnect()
			self._signals[var6] = nil
		else
			loggerModule:warning(`WidgetManager:deregister called with mismatched widget for uri {var6}`)
		end
	end
	self:_run()
end

function t:destroy()
	-- upvalues: flagsModule (ref)
	for i, v in self._signals do
		v.PositionChanged:Disconnect()
		v.SizeChanged:Disconnect()
		v.VisibleChanged:Disconnect()
		v.AncestryChanged:Disconnect()
	end
	if flagsModule.FoundationWidgetManagerSnapshotFlush then
		for i, v_1 in self._deferredAncestrySignals do
			v_1:Disconnect()
		end
		self._deferredAncestrySignals = {}
	end
	self._signals = {}
	self._pendingRegisters = {}
	self._pendingDeregisters = {}
	self._registeredWidgets = {}
end

return t