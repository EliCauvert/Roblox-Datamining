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

function t.new(p0)
	-- upvalues: t (ref)
	local tbl = setmetatable({}, t)
	tbl._widgetsApi = p0
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

local _ = function(p2, p3, p4)
	return {
		Uri = p2,
		Widget = p3,
		DEPRECATED_PluginGui = p4,
		Position = p3.AbsolutePosition,
		Size = p3.AbsoluteSize,
		Visible = p3:GetStyled("Visible")
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

function t:_flushWith(p5, p6)
	-- upvalues: flagsModule (ref), filter (ref), values (ref), studioUriModule (ref)
	local t = {}
	
	for i, v in p5 do
		table.insert(t, v)
		self._registeredWidgets[i] = nil
	end
	if #t > 0 then
		pcall(function()
			-- upvalues: self (ref), t (ref)
			self._widgetsApi:DeregisterAsync(t)
		end)
	end
	local var10 = if flagsModule.FoundationWidgetManagerSnapshotFlush then {} else nil
	local var11 = filter(values(p6), function(p7)
		-- upvalues: flagsModule (copy), var10 (ref)
		local var16 = p7.Widget:FindFirstAncestorWhichIsA("LayerCollector") ~= nil
		
		if flagsModule.FoundationWidgetManagerSnapshotFlush and not var16 then
			table.insert(var10, p7)
		end
		return var16
	end)
	
	if flagsModule.FoundationWidgetManagerSnapshotFlush then
		for i_1, v_1 in var10 do
			local var12 = studioUriModule.toString(v_1.Uri)
			
			if not self._deferredAncestrySignals[var12] then
				self._deferredAncestrySignals[var12] = v_1.Widget.AncestryChanged:Connect(function(_, p8)
					-- upvalues: self (ref), var12 (ref), v_1 (ref)
					if p8 == nil then
						local var17 = self._deferredAncestrySignals[var12]
						
						if var17 then
							var17:Disconnect()
							self._deferredAncestrySignals[var12] = nil
						end
						return
					elseif v_1.Widget:FindFirstAncestorWhichIsA("LayerCollector") then
						local var18 = self._deferredAncestrySignals[var12]
						
						if var18 then
							var18:Disconnect()
							self._deferredAncestrySignals[var12] = nil
						end
						self:register(v_1.Uri, v_1.Widget)
					end
				end)
			end
		end
	end
	local t_1 = {}
	
	for i_1, v_1 in var11 do
		v_1.Position = v_1.Widget.AbsolutePosition
		v_1.Size = v_1.Widget.AbsoluteSize
		v_1.Visible = v_1.Widget:GetStyled("Visible")
		local var14 = studioUriModule.toString(v_1.Uri)
		local DEPRECATED_PluginGui = v_1.DEPRECATED_PluginGui
		local var15 = self._signals[var14]
		
		if var15 then
			if var15.Widget ~= v_1.Widget then
				var15.PositionChanged:Disconnect()
				var15.SizeChanged:Disconnect()
				var15.VisibleChanged:Disconnect()
				var15.AncestryChanged:Disconnect()
			elseif flagsModule.FoundationPopoverPluginOverlayMeasurement and var15.Host ~= DEPRECATED_PluginGui then
				var15.Host = DEPRECATED_PluginGui
				table.insert(t_1, v_1.Uri)
			end
		end
		self._signals[var14] = {
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
			AncestryChanged = v_1.Widget.AncestryChanged:Connect(function(_, p9)
				-- upvalues: self (ref), v_1 (ref)
				if not p9 then
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
	if #var11 > 0 then
		self._widgetsApi:RegisterAsync(var11)
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

function t:register(p10, p11)
	-- upvalues: studioUriModule (ref), flagsModule (ref)
	local pluginGui = p11:FindFirstAncestorWhichIsA("PluginGui")
	local var20 = pluginGui or p11:FindFirstAncestorWhichIsA("ScreenGui")
	
	if var20 then
		local var21 = studioUriModule.toString(p10)
		
		if flagsModule.FoundationWidgetManagerSnapshotFlush then
			local var22 = self._deferredAncestrySignals[var21]
			
			if var22 then
				var22:Disconnect()
				self._deferredAncestrySignals[var21] = nil
			end
		end
		self._registeredWidgets[var21] = p11
		self._pendingRegisters[var21] = { Uri = p10, Widget = p11, DEPRECATED_PluginGui = var20 }
		self._pendingDeregisters[var21] = nil
		self:_run()
	end
end

function t:refreshAsync(p12)
	-- upvalues: studioUriModule (ref)
	local var23 = self._registeredWidgets[studioUriModule.toString(p12)]
	
	if not var23 then
		return false
	end
	local pluginGui = var23:FindFirstAncestorWhichIsA("PluginGui")
	local var25 = pluginGui or var23:FindFirstAncestorWhichIsA("ScreenGui")
	
	if var25 then
		self._widgetsApi:RegisterAsync({
			{
				Uri = p12,
				Widget = var23,
				DEPRECATED_PluginGui = var25,
				Position = var23.AbsolutePosition,
				Size = var23.AbsoluteSize,
				Visible = var23:GetStyled("Visible")
			}
		})
		
		return true
	end
	return false
end

function t:deregister(p13, p14)
	-- upvalues: studioUriModule (ref), flagsModule (ref), loggerModule (ref)
	local var26 = studioUriModule.toString(p13)
	self._pendingDeregisters[var26] = p13
	
	if flagsModule.FoundationWidgetManagerSnapshotFlush then
		self._pendingRegisters[var26] = nil
		local var27 = self._deferredAncestrySignals[var26]
		
		if var27 then
			var27:Disconnect()
			self._deferredAncestrySignals[var26] = nil
		end
	end
	local var28 = self._signals[var26]
	
	if var28 then
		if p14 == nil or var28.Widget == p14 then
			var28.PositionChanged:Disconnect()
			var28.SizeChanged:Disconnect()
			var28.VisibleChanged:Disconnect()
			var28.AncestryChanged:Disconnect()
			self._signals[var26] = nil
		else
			loggerModule:warning(`WidgetManager:deregister called with mismatched widget for uri {var26}`)
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