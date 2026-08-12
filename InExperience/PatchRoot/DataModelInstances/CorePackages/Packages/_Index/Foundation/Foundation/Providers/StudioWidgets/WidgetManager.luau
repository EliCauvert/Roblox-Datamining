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

function t.new(p0) --[[ line: 54 ]]
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

function t.nextId(_) --[[ line: 70 ]]
	-- upvalues: httpService (ref)
	return httpService:GenerateGUID(false)
end

function t:flush() --[[ line: 74 ]]
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

function t:_flushWith(p1, p2) --[[ line: 89 ]]
	-- upvalues: flagsModule (ref), filter (ref), values (ref), studioUriModule (ref)
	local t = {}
	
	for i, v in p1 do
		table.insert(t, v)
		self._registeredWidgets[i] = nil
	end
	if #t > 0 then
		pcall(function() --[[ line: 100 ]]
			-- upvalues: self (ref), t (ref)
			self._widgetsApi:DeregisterAsync(t)
		end)
	end
	local var9 = if flagsModule.FoundationWidgetManagerSnapshotFlush then {} else nil
	local var10 = filter(values(p2), function(p3) --[[ line: 106 ]]
		-- upvalues: flagsModule (copy), var9 (ref)
		local var15 = p3.Widget:FindFirstAncestorWhichIsA("LayerCollector") ~= nil
		
		if flagsModule.FoundationWidgetManagerSnapshotFlush and not var15 then
			table.insert(var9, p3)
		end
		return var15
	end)
	
	if flagsModule.FoundationWidgetManagerSnapshotFlush then
		for i_1, v_1 in var9 do
			local var11 = studioUriModule.toString(v_1.Uri)
			
			if not self._deferredAncestrySignals[var11] then
				self._deferredAncestrySignals[var11] = v_1.Widget.AncestryChanged:Connect(function(_, p4) --[[ line: 118 ]]
					-- upvalues: self (ref), var11 (ref), v_1 (ref)
					if p4 == nil then
						local var16 = self._deferredAncestrySignals[var11]
						
						if var16 then
							var16:Disconnect()
							self._deferredAncestrySignals[var11] = nil
						end
						return
					elseif v_1.Widget:FindFirstAncestorWhichIsA("LayerCollector") then
						local var17 = self._deferredAncestrySignals[var11]
						
						if var17 then
							var17:Disconnect()
							self._deferredAncestrySignals[var11] = nil
						end
						self:register(v_1.Uri, v_1.Widget)
					end
				end)
			end
		end
	end
	local t_1 = {}
	
	for i_1, v_1 in var10 do
		v_1.Position = v_1.Widget.AbsolutePosition
		v_1.Size = v_1.Widget.AbsoluteSize
		v_1.Visible = v_1.Widget:GetStyled("Visible")
		local var13 = studioUriModule.toString(v_1.Uri)
		local DEPRECATED_PluginGui = v_1.DEPRECATED_PluginGui
		local var14 = self._signals[var13]
		
		if var14 then
			if var14.Widget ~= v_1.Widget then
				var14.PositionChanged:Disconnect()
				var14.SizeChanged:Disconnect()
				var14.VisibleChanged:Disconnect()
				var14.AncestryChanged:Disconnect()
			elseif flagsModule.FoundationPopoverPluginOverlayMeasurement and var14.Host ~= DEPRECATED_PluginGui then
				var14.Host = DEPRECATED_PluginGui
				table.insert(t_1, v_1.Uri)
			end
		end
		self._signals[var13] = {
			Widget = v_1.Widget,
			Host = if flagsModule.FoundationPopoverPluginOverlayMeasurement then DEPRECATED_PluginGui else nil,
			PositionChanged = v_1.Widget:GetPropertyChangedSignal("AbsolutePosition"):Connect(function() --[[ line: 167 ]]
				-- upvalues: self (ref), v_1 (ref)
				self:register(v_1.Uri, v_1.Widget)
			end),
			SizeChanged = v_1.Widget:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ line: 170 ]]
				-- upvalues: self (ref), v_1 (ref)
				self:register(v_1.Uri, v_1.Widget)
			end),
			VisibleChanged = v_1.Widget:GetStyledPropertyChangedSignal("Visible"):Connect(function() --[[ line: 173 ]]
				-- upvalues: self (ref), v_1 (ref)
				self:register(v_1.Uri, v_1.Widget)
			end),
			AncestryChanged = v_1.Widget.AncestryChanged:Connect(function(_, p5) --[[ line: 176 ]]
				-- upvalues: self (ref), v_1 (ref)
				if not p5 then
					self:deregister(v_1.Uri)
				end
			end)
		}
	end
	if flagsModule.FoundationPopoverPluginOverlayMeasurement and #t_1 > 0 then
		pcall(function() --[[ line: 185 ]]
			-- upvalues: self (ref), t_1 (ref)
			self._widgetsApi:DeregisterAsync(t_1)
		end)
	end
	if #var10 > 0 then
		self._widgetsApi:RegisterAsync(var10)
	end
end

function t:_run() --[[ line: 195 ]]
	if self._running then
		return
	end
	self._running = true
	task.defer(function() --[[ line: 200 ]]
		-- upvalues: self (ref)
		self._running = false
		self:flush()
	end)
end

function t:register(p6, p7) --[[ line: 210 ]]
	-- upvalues: studioUriModule (ref), flagsModule (ref)
	local pluginGui = p7:FindFirstAncestorWhichIsA("PluginGui") or p7:FindFirstAncestorWhichIsA("ScreenGui")
	
	if pluginGui then
		local var19 = studioUriModule.toString(p6)
		
		if flagsModule.FoundationWidgetManagerSnapshotFlush then
			local var20 = self._deferredAncestrySignals[var19]
			
			if var20 then
				var20:Disconnect()
				self._deferredAncestrySignals[var19] = nil
			end
		end
		self._registeredWidgets[var19] = p7
		self._pendingRegisters[var19] = { Uri = p6, Widget = p7, DEPRECATED_PluginGui = pluginGui }
		self._pendingDeregisters[var19] = nil
		self:_run()
	end
end

function t:deregister(p8, p9) --[[ line: 231 ]]
	-- upvalues: studioUriModule (ref), flagsModule (ref), loggerModule (ref)
	local var21 = studioUriModule.toString(p8)
	self._pendingDeregisters[var21] = p8
	
	if flagsModule.FoundationWidgetManagerSnapshotFlush then
		self._pendingRegisters[var21] = nil
		local var22 = self._deferredAncestrySignals[var21]
		
		if var22 then
			var22:Disconnect()
			self._deferredAncestrySignals[var21] = nil
		end
	end
	local var23 = self._signals[var21]
	
	if var23 then
		if p9 == nil or var23.Widget == p9 then
			var23.PositionChanged:Disconnect()
			var23.SizeChanged:Disconnect()
			var23.VisibleChanged:Disconnect()
			var23.AncestryChanged:Disconnect()
			self._signals[var21] = nil
		else
			loggerModule:warning(`WidgetManager:deregister called with mismatched widget for uri {var21}`)
		end
	end
	self:_run()
end

function t:destroy() --[[ line: 257 ]]
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