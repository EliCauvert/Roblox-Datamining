local HttpService = game:GetService("HttpService")
local Foundation = script:FindFirstAncestor("Foundation")
local FlagsModule = require(Foundation.Utility.Flags)
local StudioUriModule = require(Foundation.Utility.Plugin.StudioUri)
local _ = require(script.Parent.Parent.Types)

local function _(PluginGui, Function)
	if PluginGui:IsA("PluginGui") then
		PluginGui:BindToClose(Function)
	end
end

local _ = function(p1, p2, p3): boolean
	local ParentPopoverId = p3.parentPopoverId
	while ParentPopoverId do
		if ParentPopoverId == p2.id then
			return true
		end
		local v1 = p1[ParentPopoverId]
		
		if not v1 then break end
		ParentPopoverId = v1.parentPopoverId
	end
	return false
end

local PopoverManager = {}
PopoverManager.__index = PopoverManager

function PopoverManager.new(_plugin, _uriScope)
	-- upvalues: PopoverManager (copy), StudioUriModule (copy)
	local self = setmetatable({}, PopoverManager)
	self._uriScope = _uriScope
	self._plugin = _plugin
	self._panels = _plugin:GetPluginComponent("Panels")
	self._pluginUri = StudioUriModule.wrap(_plugin:GetUri())
	self._active = {}
	self._pool = {}
	self._didPrewarm = false
	
	return self
end

function PopoverManager:openAtAsync(p4, p5, p6, p7)
	-- upvalues: FlagsModule (copy)
	local AcquirePanelAsyncResult = self:_acquirePanelAsync(p5, if p6 == nil then 0 else p6, p7)
	AcquirePanelAsyncResult.panel.Enabled = false
	self._panels:SetAttachmentAsync(AcquirePanelAsyncResult.uri, {
		TargetWidgetUri = p4.targetWidgetUri,
		TargetAnchorPoint = p4.targetAnchorPoint,
		SubjectAnchorPoint = p4.subjectAnchorPoint,
		Offset = p4.offset
	})
	self._panels:SetSizeAsync(AcquirePanelAsyncResult.uri, Vector2.new(0, 0))
	AcquirePanelAsyncResult.panel.Enabled = true
	AcquirePanelAsyncResult.open = true
	
	if FlagsModule.FoundationPopoverPluginOverlayMeasurement then
		local Generation = AcquirePanelAsyncResult.generation
		
		return {
			container = AcquirePanelAsyncResult.panel,
			popoverId = AcquirePanelAsyncResult.id,
			setSizeAsync = function(Vector)
				-- upvalues: AcquirePanelAsyncResult (copy), Generation (copy), self (copy)
				if AcquirePanelAsyncResult.generation == Generation and AcquirePanelAsyncResult.open then
					self._panels:SetSizeAsync(AcquirePanelAsyncResult.uri, Vector2.new(math.ceil((math.min(3000, Vector.X))), (math.ceil((math.min(3000, Vector.Y))))))
					
					return
				end
			end,
			updateAsync = function(p8)
				-- upvalues: AcquirePanelAsyncResult (copy), Generation (copy), self (copy)
				if AcquirePanelAsyncResult.generation == Generation and AcquirePanelAsyncResult.open and AcquirePanelAsyncResult.uri then
					self._panels:SetAttachmentAsync(AcquirePanelAsyncResult.uri, {
						TargetWidgetUri = p8.targetWidgetUri,
						TargetAnchorPoint = p8.targetAnchorPoint,
						SubjectAnchorPoint = p8.subjectAnchorPoint,
						Offset = p8.offset
					})
					
					return
				end
			end,
			close = function()
				-- upvalues: self (copy), AcquirePanelAsyncResult (copy), Generation (copy)
				self:_closePopover(AcquirePanelAsyncResult, true, Generation)
			end
		}
	else
		return {
			container = AcquirePanelAsyncResult.panel,
			popoverId = AcquirePanelAsyncResult.id,
			setSizeAsync = function(Vector)
				-- upvalues: self (copy), AcquirePanelAsyncResult (copy)
				self._panels:SetSizeAsync(AcquirePanelAsyncResult.uri, Vector2.new(math.ceil((math.min(3000, Vector.X))), (math.ceil((math.min(3000, Vector.Y))))))
			end,
			updateAsync = function(p8)
				-- upvalues: AcquirePanelAsyncResult (copy), self (copy)
				if AcquirePanelAsyncResult.uri then
					self._panels:SetAttachmentAsync(AcquirePanelAsyncResult.uri, {
						TargetWidgetUri = p8.targetWidgetUri,
						TargetAnchorPoint = p8.targetAnchorPoint,
						SubjectAnchorPoint = p8.subjectAnchorPoint,
						Offset = p8.offset
					})
					
					return
				end
			end,
			close = function()
				-- upvalues: self (copy), AcquirePanelAsyncResult (copy)
				self:_closePopover(AcquirePanelAsyncResult, true)
			end
		}
	end
end

function PopoverManager:_createPanelAsync(Id, Depth: number)
	-- upvalues: StudioUriModule (copy)
	local QWidgetPluginGui = self._plugin:CreateQWidgetPluginGui(Id, {
		InitialEnabled = true,
		Tooltip = true,
		Transparent = true,
		Resizable = true,
		Id = Id,
		Title = Id,
		ZIndex = Depth + 200
	})
	QWidgetPluginGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	
	return QWidgetPluginGui, StudioUriModule.join(self._pluginUri, { Category = "Panels", ItemId = Id })
end

function PopoverManager._makePopoverId(p4): string
	-- upvalues: HttpService (copy)
	return `Popovers{if p4._uriScope then `/{p4._uriScope}` else ""}/{HttpService:GenerateGUID(false)}`
end

function PopoverManager:_createPopoverAsync(Id, Depth)
	-- upvalues: FlagsModule (copy)
	local PanelAsync, PanelAsync2 = self:_createPanelAsync(Id, Depth)
	local config = {
		open = false,
		generation = 0,
		parentPopoverId = nil,
		onClose = nil,
		id = Id,
		uri = PanelAsync2,
		panel = PanelAsync,
		depth = Depth
	}
	
	local function Function()
		-- upvalues: FlagsModule (upval), self (copy), config (copy)
		if FlagsModule.FoundationPopoverPluginOverlayMeasurement then
			self:_closePopover(config, false, config.generation)
			
			return
		else
			self:_closePopover(config)
		end
	end
	
	if PanelAsync:IsA("PluginGui") then
		PanelAsync:BindToClose(Function)
	end
	PanelAsync.InputBegan:Connect(function(Input)
		-- upvalues: config (copy), self (copy)
		if Input.UserInputType == Enum.UserInputType.MouseButton1 and config.open then
			self:_closeChildPopovers(config)
		end
	end)
	
	return config
end

function PopoverManager:_activatePopover(PopoverAsync, OnClose, ParentPopoverId)
	-- upvalues: FlagsModule (copy)
	if FlagsModule.FoundationPopoverPluginOverlayMeasurement then
		PopoverAsync.generation += 1
	end
	PopoverAsync.onClose = OnClose
	PopoverAsync.parentPopoverId = ParentPopoverId
	PopoverAsync.open = false
	self._active[PopoverAsync.id] = PopoverAsync
end

function PopoverManager:_tryAcquireFromPool(OnClose, p5, ParentPopoverId)
	local PoolEntry = self._pool[p5]
	local Removed = if PoolEntry then table.remove(PoolEntry) else nil
	
	if Removed then
		self:_activatePopover(Removed, OnClose, ParentPopoverId)
		
		return Removed
	else
		return nil
	end
end

function PopoverManager:_acquirePanelAsync(OnClose, Depth, ParentPopoverId)
	local TryAcquireFromPoolResult = self:_tryAcquireFromPool(OnClose, Depth, ParentPopoverId)
	
	if TryAcquireFromPoolResult then
		return TryAcquireFromPoolResult
	else
		local PopoverAsync = self:_createPopoverAsync(self:_makePopoverId(), Depth)
		self:_activatePopover(PopoverAsync, OnClose, ParentPopoverId)
		
		return PopoverAsync
	end
end

function PopoverManager:prewarmPoolAsync(p5: number)
	if self._didPrewarm then return end
	for i = 0, math.max(0, p5) do
		if self._pool[i] == nil then
			self._pool[i] = {}
		end
		local PoolEntry = self._pool[i]
		
		if #PoolEntry == 0 then
			local PopoverAsync = self:_createPopoverAsync(self:_makePopoverId(), i)
			PopoverAsync.panel.Enabled = false
			table.insert(PoolEntry, PopoverAsync)
		end
	end
	self._didPrewarm = true
end

function PopoverManager:_closeChildPopovers(p6)
	local List = {}
	
	for _, value in self._active do
		if value.open and value.id ~= p6.id then
			local Active = self._active
			local ParentPopoverId = value.parentPopoverId
			local Flag = nil
			while ParentPopoverId do
				if ParentPopoverId == p6.id then
					Flag = true
				else
					local ActiveEntry = Active[ParentPopoverId]
					
					if not ActiveEntry then break end
					ParentPopoverId = ActiveEntry.parentPopoverId
				end
				if Flag then
					table.insert(List, value)
				end
			end
			Flag = false
		end
	end
	for _, value1 in List do
		self:_closePopover(value1)
	end
end

function PopoverManager:_closePopover(AcquirePanelAsyncResult, p7, Generation)
	-- upvalues: FlagsModule (copy)
	if FlagsModule.FoundationPopoverPluginOverlayMeasurement and Generation ~= nil and AcquirePanelAsyncResult.generation ~= Generation then return end
	if not AcquirePanelAsyncResult.open then return end
	AcquirePanelAsyncResult.open = false
	AcquirePanelAsyncResult.panel.Enabled = false
	
	if not p7 and AcquirePanelAsyncResult.onClose then
		AcquirePanelAsyncResult.onClose()
	end
	self._active[AcquirePanelAsyncResult.id] = nil
	local Depth = AcquirePanelAsyncResult.depth
	
	if not self._pool[Depth] then
		self._pool[Depth] = {}
	end
	table.insert(self._pool[Depth], AcquirePanelAsyncResult)
end

function PopoverManager:closeAll()
	local List = {}
	
	for _, value in self._active do
		table.insert(List, value)
	end
	for _, value1 in List do
		self:_closePopover(value1)
	end
end

function PopoverManager:destroy()
	self:closeAll()
	
	for _, value in self._pool do
		for _, value1 in value do
			if value1.panel then
				value1.panel:Destroy()
			end
		end
	end
	self._pool = {}
end

return PopoverManager