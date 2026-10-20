local HttpService = game:GetService("HttpService")
local Foundation = script:FindFirstAncestor("Foundation")
local DashModule = require(Foundation.Parent.Dash)
local FilterFunction = DashModule.filter
local ValuesFunction = DashModule.values
local FlagsModule = require(Foundation.Utility.Flags)
local StudioUriModule = require(Foundation.Utility.Plugin.StudioUri)
local LoggerModule = require(Foundation.Utility.Logger)
local WidgetManager = {}
WidgetManager.__index = WidgetManager

function WidgetManager.new(_widgetsApi)
	-- upvalues: WidgetManager (copy)
	local self = setmetatable({}, WidgetManager)
	self._widgetsApi = _widgetsApi
	self._pendingRegisters = {}
	self._pendingDeregisters = {}
	self._registeredWidgets = {}
	self._signals = {}
	self._deferredAncestrySignals = {}
	self._running = false
	
	return self
end

local function _(p1)
	local PluginGui = p1:FindFirstAncestorWhichIsA("PluginGui")
	
	return if PluginGui then PluginGui else p1:FindFirstAncestorWhichIsA("ScreenGui")
end

local _ = function(Uri, Frame: Frame, DEPRECATED_PluginGui)
	return {
		Uri = Uri,
		Widget = Frame,
		DEPRECATED_PluginGui = DEPRECATED_PluginGui,
		Position = Frame.AbsolutePosition,
		Size = Frame.AbsoluteSize,
		Visible = Frame:GetStyled("Visible")
	}
end

function WidgetManager:nextId()
	-- upvalues: HttpService (copy)
	return HttpService:GenerateGUID(false)
end

function WidgetManager:flush()
	-- upvalues: FlagsModule (copy)
	if FlagsModule.FoundationWidgetManagerSnapshotFlush then
		local PendingDeregisters = self._pendingDeregisters
		local PendingRegisters = self._pendingRegisters
		self._pendingDeregisters = {}
		self._pendingRegisters = {}
		self:_flushWith(PendingDeregisters, PendingRegisters)
		
		return
	else
		self:_flushWith(self._pendingDeregisters, self._pendingRegisters)
		self._pendingDeregisters = {}
		self._pendingRegisters = {}
	end
end

function WidgetManager:_flushWith(PendingDeregisters, PendingRegisters)
	-- upvalues: FlagsModule (copy), FilterFunction (copy), ValuesFunction (copy), StudioUriModule (copy)
	local List = {}
	
	for i, pendingDeregister in PendingDeregisters do
		table.insert(List, pendingDeregister)
		self._registeredWidgets[i] = nil
	end
	if #List > 0 then
		pcall(function()
			-- upvalues: self (copy), List (copy)
			self._widgetsApi:DeregisterAsync(List)
		end)
	end
	local T = if FlagsModule.FoundationWidgetManagerSnapshotFlush then {} else nil
	local FilterResult = FilterFunction(ValuesFunction(PendingRegisters), function(p1): boolean
		-- upvalues: FlagsModule (upval), T (copy)
		local HasLayerCollector = p1.Widget:FindFirstAncestorWhichIsA("LayerCollector") ~= nil
		
		if FlagsModule.FoundationWidgetManagerSnapshotFlush and not HasLayerCollector then
			table.insert(T, p1)
		end
		return HasLayerCollector
	end)
	
	if FlagsModule.FoundationWidgetManagerSnapshotFlush then
		for _, Registration in T do
			local String = StudioUriModule.toString(Registration.Uri)
			
			if not self._deferredAncestrySignals[String] then
				self._deferredAncestrySignals[String] = Registration.Widget.AncestryChanged:Connect(function(_, NewParent)
					-- upvalues: self (copy), String (copy), Registration (copy)
					if NewParent == nil then
						local DeferredAncestrySignal = self._deferredAncestrySignals[String]
						
						if DeferredAncestrySignal then
							DeferredAncestrySignal:Disconnect()
							self._deferredAncestrySignals[String] = nil
						end
						return
					else
						if Registration.Widget:FindFirstAncestorWhichIsA("LayerCollector") then
							local DeferredAncestrySignal = self._deferredAncestrySignals[String]
							
							if DeferredAncestrySignal then
								DeferredAncestrySignal:Disconnect()
								self._deferredAncestrySignals[String] = nil
							end
							self:register(Registration.Uri, Registration.Widget)
						end
					end
				end)
			end
		end
	end
	local List1 = {}
	
	for _, Registration1 in FilterResult do
		Registration1.Position = Registration1.Widget.AbsolutePosition
		Registration1.Size = Registration1.Widget.AbsoluteSize
		Registration1.Visible = Registration1.Widget:GetStyled("Visible")
		local String1 = StudioUriModule.toString(Registration1.Uri)
		local DEPRECATEDPluginGui = Registration1.DEPRECATED_PluginGui
		local Signal = self._signals[String1]
		
		if Signal then
			if Signal.Widget ~= Registration1.Widget then
				Signal.PositionChanged:Disconnect()
				Signal.SizeChanged:Disconnect()
				Signal.VisibleChanged:Disconnect()
				Signal.AncestryChanged:Disconnect()
			else
				if FlagsModule.FoundationPopoverPluginOverlayMeasurement and Signal.Host ~= DEPRECATEDPluginGui then
					Signal.Host = DEPRECATEDPluginGui
					table.insert(List1, Registration1.Uri)
					continue
				end
				continue
			end
		end
		self._signals[String1] = {
			Widget = Registration1.Widget,
			Host = if FlagsModule.FoundationPopoverPluginOverlayMeasurement then DEPRECATEDPluginGui else nil,
			PositionChanged = Registration1.Widget:GetPropertyChangedSignal("AbsolutePosition"):Connect(function()
				-- upvalues: self (copy), Registration1 (copy)
				self:register(Registration1.Uri, Registration1.Widget)
			end),
			SizeChanged = Registration1.Widget:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
				-- upvalues: self (copy), Registration1 (copy)
				self:register(Registration1.Uri, Registration1.Widget)
			end),
			VisibleChanged = Registration1.Widget:GetStyledPropertyChangedSignal("Visible"):Connect(function()
				-- upvalues: self (copy), Registration1 (copy)
				self:register(Registration1.Uri, Registration1.Widget)
			end),
			AncestryChanged = Registration1.Widget.AncestryChanged:Connect(function(_, NewParent)
				-- upvalues: self (copy), Registration1 (copy)
				if not NewParent then
					self:deregister(Registration1.Uri)
				end
			end)
		}
	end
	if FlagsModule.FoundationPopoverPluginOverlayMeasurement and #List1 > 0 then
		pcall(function()
			-- upvalues: self (copy), List1 (copy)
			self._widgetsApi:DeregisterAsync(List1)
		end)
	end
	if #FilterResult > 0 then
		self._widgetsApi:RegisterAsync(FilterResult)
	end
end

function WidgetManager:_run()
	if not self._running then
		self._running = true
		task.defer(function()
			-- upvalues: self (copy)
			self._running = false
			self:flush()
		end)
		
		return
	end
end

function WidgetManager:register(Uri, Widget)
	-- upvalues: StudioUriModule (copy), FlagsModule (copy)
	local PluginGui = Widget:FindFirstAncestorWhichIsA("PluginGui")
	local PluginGui1 = if PluginGui then PluginGui else Widget:FindFirstAncestorWhichIsA("ScreenGui")
	
	if PluginGui1 then
		local String = StudioUriModule.toString(Uri)
		
		if FlagsModule.FoundationWidgetManagerSnapshotFlush then
			local DeferredAncestrySignal = self._deferredAncestrySignals[String]
			
			if DeferredAncestrySignal then
				DeferredAncestrySignal:Disconnect()
				self._deferredAncestrySignals[String] = nil
			end
		end
		self._registeredWidgets[String] = Widget
		self._pendingRegisters[String] = {
			Uri = Uri,
			Widget = Widget,
			DEPRECATED_PluginGui = PluginGui1
		}
		self._pendingDeregisters[String] = nil
		self:_run()
	end
end

function WidgetManager:refreshAsync(Uri): boolean
	-- upvalues: StudioUriModule (copy)
	local RegisteredWidget = self._registeredWidgets[StudioUriModule.toString(Uri)]
	
	if not RegisteredWidget then
		return false
	end
	local PluginGui = RegisteredWidget:FindFirstAncestorWhichIsA("PluginGui")
	local PluginGui1 = if PluginGui then PluginGui else RegisteredWidget:FindFirstAncestorWhichIsA("ScreenGui")
	
	if PluginGui1 then
		self._widgetsApi:RegisterAsync({
			{
				Uri = Uri,
				Widget = RegisteredWidget,
				DEPRECATED_PluginGui = PluginGui1,
				Position = RegisteredWidget.AbsolutePosition,
				Size = RegisteredWidget.AbsoluteSize,
				Visible = RegisteredWidget:GetStyled("Visible")
			}
		})
		
		return true
	else
		return false
	end
end

function WidgetManager:deregister(Uri, Widget)
	-- upvalues: StudioUriModule (copy), FlagsModule (copy), LoggerModule (copy)
	local String = StudioUriModule.toString(Uri)
	self._pendingDeregisters[String] = Uri
	
	if FlagsModule.FoundationWidgetManagerSnapshotFlush then
		self._pendingRegisters[String] = nil
		local DeferredAncestrySignal = self._deferredAncestrySignals[String]
		
		if DeferredAncestrySignal then
			DeferredAncestrySignal:Disconnect()
			self._deferredAncestrySignals[String] = nil
		end
	end
	local Signal = self._signals[String]
	
	if Signal then
		if Widget == nil or Signal.Widget == Widget then
			Signal.PositionChanged:Disconnect()
			Signal.SizeChanged:Disconnect()
			Signal.VisibleChanged:Disconnect()
			Signal.AncestryChanged:Disconnect()
			self._signals[String] = nil
		else
			LoggerModule:warning(`WidgetManager:deregister called with mismatched widget for uri {String}`)
		end
	end
	self:_run()
end

function WidgetManager:destroy()
	-- upvalues: FlagsModule (copy)
	for _, signal in self._signals do
		signal.PositionChanged:Disconnect()
		signal.SizeChanged:Disconnect()
		signal.VisibleChanged:Disconnect()
		signal.AncestryChanged:Disconnect()
	end
	if FlagsModule.FoundationWidgetManagerSnapshotFlush then
		for _, deferredAncestrySignal in self._deferredAncestrySignals do
			deferredAncestrySignal:Disconnect()
		end
		self._deferredAncestrySignals = {}
	end
	self._signals = {}
	self._pendingRegisters = {}
	self._pendingDeregisters = {}
	self._registeredWidgets = {}
end

return WidgetManager