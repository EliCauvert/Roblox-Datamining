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
	-- upvalues: PopoverManager (copy), StudioUriModule (copy), FlagsModule (copy)
	local self = setmetatable({}, PopoverManager)
	self._uriScope = _uriScope
	self._plugin = _plugin
	self._panels = _plugin:GetPluginComponent("Panels")
	self._pluginUri = StudioUriModule.wrap(_plugin:GetUri())
	self._active = {}
	self._pool = {}
	self._didPrewarm = false
	
	if FlagsModule.FoundationPopoverPluginPoolReclaim then
		self._destroyed = false
	end
	return self
end

function PopoverManager:openAtAsync(Tbl, p4, p5, p6, Enabled, p7)
	-- upvalues: FlagsModule (copy), StudioUriModule (copy)
	local AcquirePanelAsyncResult = self:_acquirePanelAsync(p4, if p5 == nil then 0 else p5, p6, if FlagsModule.FoundationPopoverPluginFocusable then Enabled == true else false)
	AcquirePanelAsyncResult.panel.Enabled = false
	self._panels:SetAttachmentAsync(AcquirePanelAsyncResult.uri, {
		TargetWidgetUri = Tbl.targetWidgetUri,
		TargetAnchorPoint = Tbl.targetAnchorPoint,
		SubjectAnchorPoint = Tbl.subjectAnchorPoint,
		Offset = Tbl.offset
	})
	local v2: Vector2? = nil
	
	if FlagsModule.FoundationPopoverPluginPoolReclaim then
		local P11 = p7 or Vector2.new(0, 0)
		v2 = Vector2.new(math.ceil((math.min(3000, P11.X))), (math.ceil((math.min(3000, P11.Y)))))
		self._panels:SetSizeAsync(AcquirePanelAsyncResult.uri, v2)
	else
		self._panels:SetSizeAsync(AcquirePanelAsyncResult.uri, Vector2.new(0, 0))
	end
	AcquirePanelAsyncResult.panel.Enabled = true
	AcquirePanelAsyncResult.open = true
	
	if FlagsModule.FoundationPopoverPluginPoolReclaim then
		AcquirePanelAsyncResult.openingThread = nil
	end
	if FlagsModule.FoundationPopoverPluginPoolReclaim then
		local Generation = AcquirePanelAsyncResult.generation
		local Copy = table.clone(Tbl)
		local Close: Vector2 = v2
		local Count = 0
		local Count1 = 0
		
		return {
			container = AcquirePanelAsyncResult.panel,
			popoverId = AcquirePanelAsyncResult.id,
			setSizeAsync = function(Vector)
				-- upvalues: AcquirePanelAsyncResult (copy), Generation (copy), Close (ref), Count1 (ref), self (copy)
				if AcquirePanelAsyncResult.generation ~= Generation or not AcquirePanelAsyncResult.open then return end
				local _Vector2 = Vector2.new(math.ceil((math.min(3000, Vector.X))), (math.ceil((math.min(3000, Vector.Y)))))
				
				if Close == _Vector2 then return end
				Close = nil
				Count1 += 1
				local Count: number = Count1
				self._panels:SetSizeAsync(AcquirePanelAsyncResult.uri, _Vector2)
				
				if Count1 == Count then
					Close = _Vector2
				end
			end,
			updateAsync = function(Tbl)
				-- upvalues: AcquirePanelAsyncResult (copy), Generation (copy), Copy (ref), StudioUriModule (upval), Count (ref), self (copy)
				if AcquirePanelAsyncResult.generation ~= Generation or not AcquirePanelAsyncResult.open then return end
				if Copy and StudioUriModule.equals(Copy.targetWidgetUri, Tbl.targetWidgetUri) and Copy.targetAnchorPoint == Tbl.targetAnchorPoint and Copy.subjectAnchorPoint == Tbl.subjectAnchorPoint and Copy.offset == Tbl.offset then return end
				local Copy1 = table.clone(Tbl)
				Copy = nil
				Count += 1
				local Count1: number = Count
				self._panels:SetAttachmentAsync(AcquirePanelAsyncResult.uri, {
					TargetWidgetUri = Copy1.targetWidgetUri,
					TargetAnchorPoint = Copy1.targetAnchorPoint,
					SubjectAnchorPoint = Copy1.subjectAnchorPoint,
					Offset = Copy1.offset
				})
				
				if Count == Count1 then
					Copy = Copy1
				end
			end,
			close = function()
				-- upvalues: self (copy), AcquirePanelAsyncResult (copy), Generation (copy)
				self:_closePopover(AcquirePanelAsyncResult, true, Generation)
			end
		}
	else
		local Generation1 = AcquirePanelAsyncResult.generation
		local Close = AcquirePanelAsyncResult.panel
		Close = AcquirePanelAsyncResult.id
		
		Close = function(Vector)
			-- upvalues: AcquirePanelAsyncResult (copy), Generation1 (copy), self (copy)
			if AcquirePanelAsyncResult.generation == Generation1 and AcquirePanelAsyncResult.open then
				self._panels:SetSizeAsync(AcquirePanelAsyncResult.uri, Vector2.new(math.ceil((math.min(3000, Vector.X))), (math.ceil((math.min(3000, Vector.Y))))))
				
				return
			end
		end
		
		Close = function(p8)
			-- upvalues: AcquirePanelAsyncResult (copy), Generation1 (copy), self (copy)
			if AcquirePanelAsyncResult.generation == Generation1 and AcquirePanelAsyncResult.open and AcquirePanelAsyncResult.uri then
				self._panels:SetAttachmentAsync(AcquirePanelAsyncResult.uri, {
					TargetWidgetUri = p8.targetWidgetUri,
					TargetAnchorPoint = p8.targetAnchorPoint,
					SubjectAnchorPoint = p8.subjectAnchorPoint,
					Offset = p8.offset
				})
				
				return
			end
		end
		
		Close = function()
			-- upvalues: self (copy), AcquirePanelAsyncResult (copy), Generation1 (copy)
			self:_closePopover(AcquirePanelAsyncResult, true, Generation1)
		end
		
		local Copy = {
			container = Close,
			popoverId = Close,
			setSizeAsync = Close,
			updateAsync = Close,
			close = Close
		}
		
		return Copy
	end
end

function PopoverManager:_createPanelAsync(Id, Depth: number, IsFocusable)
	-- upvalues: FlagsModule (copy), StudioUriModule (copy)
	local QWidgetPluginGui = self._plugin:CreateQWidgetPluginGui(Id, {
		Tooltip = true,
		Transparent = true,
		Resizable = true,
		Id = Id,
		InitialEnabled = not FlagsModule.FoundationPopoverPluginPoolReclaim,
		Focusable = if FlagsModule.FoundationPopoverPluginFocusable then IsFocusable else nil,
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

function PopoverManager:_createPopoverAsync(Id, Depth, IsFocusable)
	-- upvalues: FlagsModule (copy)
	local PanelAsync, PanelAsync2 = self:_createPanelAsync(Id, Depth, IsFocusable)
	
	if FlagsModule.FoundationPopoverPluginPoolReclaim and self._destroyed then
		PanelAsync:Destroy()
		error("PopoverManager is destroyed")
	end
	local config = {
		open = false,
		generation = 0,
		parentPopoverId = nil,
		onClose = nil,
		id = Id,
		uri = PanelAsync2,
		panel = PanelAsync,
		depth = Depth,
		isFocusable = IsFocusable
	}
	
	local function Function()
		-- upvalues: self (copy), config (copy)
		self:_closePopover(config, false, config.generation)
	end
	
	if PanelAsync:IsA("PluginGui") then
		PanelAsync:BindToClose(Function)
	end
	if PanelAsync:IsA("PluginGui") then
		PanelAsync.InputBegan:Connect(function(Input)
			-- upvalues: config (copy), self (copy)
			if Input.UserInputType == Enum.UserInputType.MouseButton1 and config.open then
				self:_closeChildPopovers(config)
			end
		end)
	end
	return config
end

function PopoverManager:_createTrackedPopoverAsync(PopoverId, p5, p6)
	local CurrentThread = coroutine.running()
	local Flag = false
	local Flag1 = false
	local v2 = false
	local v3 = nil
	task.spawn(function()
		-- upvalues: v2 (ref), v3 (ref), self (copy), PopoverId (copy), p5 (copy), p6 (copy), Flag (ref), CurrentThread (copy), Flag1 (ref)
		v2, v32 = pcall(self._createPopoverAsync, self, PopoverId, p5, p6)
		Flag = true
		
		if v2 then
			local v4 = v3
			v4.openingThread = CurrentThread
			self._active[PopoverId] = v4
			
			if coroutine.status(CurrentThread) == "dead" then
				self:_closePopover(v4, true, v4.generation)
			end
		end
		if Flag1 and coroutine.status(CurrentThread) == "suspended" then
			task.spawn(CurrentThread)
		end
	end)
	
	if not Flag then
		Flag1 = true
		coroutine.yield()
	end
	if not v2 then
		error(v3)
	end
	self._active[PopoverId] = nil
	v3.openingThread = nil
	
	return v3
end

function PopoverManager:_activatePopover(Removed, OnClose, ParentPopoverId)
	-- upvalues: FlagsModule (copy)
	Removed.generation += 1
	Removed.onClose = OnClose
	Removed.parentPopoverId = ParentPopoverId
	Removed.open = false
	
	if FlagsModule.FoundationPopoverPluginPoolReclaim then
		Removed.openingThread = coroutine.running()
	end
	self._active[Removed.id] = Removed
end

function PopoverManager:_reclaimAbandonedPopovers()
	local List = {}
	
	for _, value in self._active do
		local OpeningThread = value.openingThread
		
		if OpeningThread and coroutine.status(OpeningThread) == "dead" then
			table.insert(List, value)
		end
	end
	for _, value1 in List do
		self:_closePopover(value1, true, value1.generation)
	end
end

function PopoverManager:_tryAcquireFromPool(OnClose, p5, ParentPopoverId, IsFocusable)
	-- upvalues: FlagsModule (copy)
	local PoolEntry = self._pool[p5]
	local Removed = nil
	
	if FlagsModule.FoundationPopoverPluginFocusable then
		if PoolEntry then
			for i = #PoolEntry, 1, -1 do
				if PoolEntry[i].isFocusable ~= IsFocusable then
					continue
				end
				Removed = table.remove(PoolEntry, i)
				break
			end
		end
	else
		Removed = if PoolEntry then table.remove(PoolEntry) else nil
	end
	if Removed then
		self:_activatePopover(Removed, OnClose, ParentPopoverId)
		
		return Removed
	else
		return nil
	end
end

function PopoverManager:_acquirePanelAsync(OnClose, Depth, ParentPopoverId, IsFocusable)
	-- upvalues: FlagsModule (copy)
	if FlagsModule.FoundationPopoverPluginPoolReclaim then
		if self._destroyed then
			error("PopoverManager is destroyed")
		end
		self:_reclaimAbandonedPopovers()
	end
	local TryAcquireFromPoolResult = self:_tryAcquireFromPool(OnClose, Depth, ParentPopoverId, IsFocusable)
	
	if TryAcquireFromPoolResult then
		return TryAcquireFromPoolResult
	else
		local PopoverId = self:_makePopoverId()
		local TrackedPopoverAsync = if FlagsModule.FoundationPopoverPluginPoolReclaim then self:_createTrackedPopoverAsync(PopoverId, Depth, IsFocusable) else self:_createPopoverAsync(PopoverId, Depth, IsFocusable)
		self:_activatePopover(TrackedPopoverAsync, OnClose, ParentPopoverId)
		
		return TrackedPopoverAsync
	end
end

function PopoverManager:prewarmPoolAsync(p6: number)
	-- upvalues: FlagsModule (copy)
	if FlagsModule.FoundationPopoverPluginPoolReclaim and self._destroyed then return end
	if self._didPrewarm then return end
	for i = 0, math.max(0, p6) do
		if self._pool[i] == nil then
			self._pool[i] = {}
		end
		local PoolEntry = self._pool[i]
		
		if #PoolEntry == 0 then
			local TrackedPopoverAsync = if FlagsModule.FoundationPopoverPluginPoolReclaim then self:_createTrackedPopoverAsync(self:_makePopoverId(), i, false) else self:_createPopoverAsync(self:_makePopoverId(), i, false)
			TrackedPopoverAsync.panel.Enabled = false
			table.insert(PoolEntry, TrackedPopoverAsync)
		end
	end
	self._didPrewarm = true
end

function PopoverManager:_closeChildPopovers(p7)
	local List = {}
	
	for _, value in self._active do
		if value.open and value.id ~= p7.id then
			local Active = self._active
			local ParentPopoverId = value.parentPopoverId
			local Flag = nil
			while ParentPopoverId do
				if ParentPopoverId == p7.id then
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

function PopoverManager:_closePopover(AcquirePanelAsyncResult, p8, Generation)
	-- upvalues: FlagsModule (copy)
	if Generation ~= nil and AcquirePanelAsyncResult.generation ~= Generation then return end
	if FlagsModule.FoundationPopoverPluginPoolReclaim then
		if self._active[AcquirePanelAsyncResult.id] ~= AcquirePanelAsyncResult then return end
		local OpeningThread = AcquirePanelAsyncResult.openingThread
		
		if OpeningThread then
			if coroutine.status(OpeningThread) == "suspended" then
				task.cancel(OpeningThread)
			end
			AcquirePanelAsyncResult.openingThread = nil
		end
		AcquirePanelAsyncResult.open = false
		AcquirePanelAsyncResult.panel.Enabled = false
		self._active[AcquirePanelAsyncResult.id] = nil
		local OnCloseFunction: () -> () = AcquirePanelAsyncResult.onClose
		AcquirePanelAsyncResult.onClose = nil
		local Depth = AcquirePanelAsyncResult.depth
		
		if not self._pool[Depth] then
			self._pool[Depth] = {}
		end
		table.insert(self._pool[Depth], AcquirePanelAsyncResult)
		
		if not p8 and OnCloseFunction then
			OnCloseFunction()
		end
		return
	else
		if not AcquirePanelAsyncResult.open then return end
		AcquirePanelAsyncResult.open = false
		AcquirePanelAsyncResult.panel.Enabled = false
		
		if not p8 and AcquirePanelAsyncResult.onClose then
			AcquirePanelAsyncResult.onClose()
		end
		self._active[AcquirePanelAsyncResult.id] = nil
		local Depth = AcquirePanelAsyncResult.depth
		
		if not self._pool[Depth] then
			self._pool[Depth] = {}
		end
		table.insert(self._pool[Depth], AcquirePanelAsyncResult)
	end
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
	-- upvalues: FlagsModule (copy)
	if FlagsModule.FoundationPopoverPluginPoolReclaim then
		self._destroyed = true
		self:_reclaimAbandonedPopovers()
	end
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