local HttpService = game:GetService("HttpService")
local Foundation = script:FindFirstAncestor("Foundation")
local DashModule = require(Foundation.Parent.Dash)
local FilterFunction = DashModule.filter
local ValuesFunction = DashModule.values
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
	self._running = false
	
	return self
end

function WidgetManager:nextId()
	-- upvalues: HttpService (copy)
	return HttpService:GenerateGUID(false)
end

function WidgetManager:flush()
	-- upvalues: FilterFunction (copy), ValuesFunction (copy), StudioUriModule (copy)
	local List = {}
	
	for i, pendingDeregister in self._pendingDeregisters do
		table.insert(List, pendingDeregister)
		self._registeredWidgets[i] = nil
	end
	if #List > 0 then
		pcall(function()
			-- upvalues: self (copy), List (copy)
			self._widgetsApi:DeregisterAsync(List)
		end)
	end
	self._pendingDeregisters = {}
	local FilterResult = FilterFunction(ValuesFunction(self._pendingRegisters), function(p1): boolean
		return p1.Widget:FindFirstAncestorWhichIsA("LayerCollector") ~= nil
	end)
	
	for _, value in FilterResult do
		value.Position = value.Widget.AbsolutePosition
		value.Size = value.Widget.AbsoluteSize
		value.Visible = value.Widget:GetStyled("Visible")
		local String = StudioUriModule.toString(value.Uri)
		local Signal = self._signals[String]
		
		if Signal then
			if Signal.Widget ~= value.Widget then
				Signal.PositionChanged:Disconnect()
				Signal.SizeChanged:Disconnect()
				Signal.VisibleChanged:Disconnect()
				Signal.AncestryChanged:Disconnect()
			else
				continue
			end
		end
		self._signals[String] = {
			Widget = value.Widget,
			PositionChanged = value.Widget:GetPropertyChangedSignal("AbsolutePosition"):Connect(function()
				-- upvalues: self (copy), value (copy)
				self:register(value.Uri, value.Widget)
			end),
			SizeChanged = value.Widget:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
				-- upvalues: self (copy), value (copy)
				self:register(value.Uri, value.Widget)
			end),
			VisibleChanged = value.Widget:GetStyledPropertyChangedSignal("Visible"):Connect(function()
				-- upvalues: self (copy), value (copy)
				self:register(value.Uri, value.Widget)
			end),
			AncestryChanged = value.Widget.AncestryChanged:Connect(function(_, NewParent)
				-- upvalues: self (copy), value (copy)
				if not NewParent then
					self:deregister(value.Uri)
				end
			end)
		}
	end
	if #FilterResult > 0 then
		self._widgetsApi:RegisterAsync(FilterResult)
	end
	self._pendingRegisters = {}
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
	-- upvalues: StudioUriModule (copy)
	local PluginGui = Widget:FindFirstAncestorWhichIsA("PluginGui") or Widget:FindFirstAncestorWhichIsA("ScreenGui")
	
	if PluginGui then
		local String = StudioUriModule.toString(Uri)
		self._registeredWidgets[String] = Widget
		self._pendingRegisters[String] = {
			Uri = Uri,
			Widget = Widget,
			DEPRECATED_PluginGui = PluginGui
		}
		self._pendingDeregisters[String] = nil
		self:_run()
	end
end

function WidgetManager:deregister(Uri, Widget)
	-- upvalues: StudioUriModule (copy), LoggerModule (copy)
	local String = StudioUriModule.toString(Uri)
	self._pendingDeregisters[String] = Uri
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
	for _, signal in self._signals do
		signal.PositionChanged:Disconnect()
		signal.SizeChanged:Disconnect()
		signal.VisibleChanged:Disconnect()
		signal.AncestryChanged:Disconnect()
	end
	self._signals = {}
	self._pendingRegisters = {}
	self._pendingDeregisters = {}
	self._registeredWidgets = {}
end

return WidgetManager