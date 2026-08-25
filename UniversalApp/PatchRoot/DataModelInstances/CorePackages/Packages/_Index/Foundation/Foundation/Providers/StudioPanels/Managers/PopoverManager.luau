local httpService = game:GetService("HttpService")
local foundation = script:FindFirstAncestor("Foundation")
local flagsModule = require(foundation.Utility.Flags)
local studioUriModule = require(foundation.Utility.Plugin.StudioUri)
local _ = require(script.Parent.Parent.Types)

local function _(p1, p2)
	if p1:IsA("PluginGui") then
		p1:BindToClose(p2)
	end
end

local _ = function(p1, p2, p3)
	local parentPopoverId = p3.parentPopoverId
	while parentPopoverId do
		if parentPopoverId ~= p2.id then
			local var1 = p1[parentPopoverId]
			
			if not var1 then break end
			parentPopoverId = var1.parentPopoverId
		end
		return true
	end
	return false
end

local t = {}
t.__index = t

function t.new(p1, p2)
	-- upvalues: t (ref), studioUriModule (ref)
	local tbl = setmetatable({}, t)
	tbl._uriScope = p2
	tbl._plugin = p1
	tbl._panels = p1:GetPluginComponent("Panels")
	tbl._pluginUri = studioUriModule.wrap(p1:GetUri())
	tbl._active = {}
	tbl._pool = {}
	tbl._didPrewarm = false
	
	return tbl
end

function t:openAtAsync(p1, p2, p3, p4)
	-- upvalues: flagsModule (ref)
	local var1 = self:_acquirePanelAsync(p2, if p3 == nil then 0 else p3, p4)
	var1.panel.Enabled = false
	self._panels:SetAttachmentAsync(var1.uri, {
		TargetWidgetUri = p1.targetWidgetUri,
		TargetAnchorPoint = p1.targetAnchorPoint,
		SubjectAnchorPoint = p1.subjectAnchorPoint,
		Offset = p1.offset
	})
	self._panels:SetSizeAsync(var1.uri, Vector2.new(0, 0))
	var1.panel.Enabled = true
	var1.open = true
	local _ = nil
	
	if flagsModule.FoundationPopoverPluginOverlayMeasurement then
		local generation = var1.generation
		
		return {
			container = var1.panel,
			popoverId = var1.id,
			setSizeAsync = function(value)
				-- upvalues: var1 (ref), generation (ref), self (ref)
				if var1.generation == generation and var1.open then
					self._panels:SetSizeAsync(var1.uri, Vector2.new(math.ceil(math.min(3000, value.X)), math.ceil(math.min(3000, value.Y))))
					
					return
				end
			end,
			updateAsync = function(p1)
				-- upvalues: var1 (ref), generation (ref), self (ref)
				if var1.generation == generation and var1.open and var1.uri then
					self._panels:SetAttachmentAsync(var1.uri, {
						TargetWidgetUri = p1.targetWidgetUri,
						TargetAnchorPoint = p1.targetAnchorPoint,
						SubjectAnchorPoint = p1.subjectAnchorPoint,
						Offset = p1.offset
					})
					
					return
				end
			end,
			close = function()
				-- upvalues: self (ref), var1 (ref), generation (ref)
				self:_closePopover(var1, true, generation)
			end
		}
	end
	return {
		container = var1.panel,
		popoverId = var1.id,
		setSizeAsync = function(value)
			-- upvalues: self (ref), var1 (ref)
			self._panels:SetSizeAsync(var1.uri, Vector2.new(math.ceil(math.min(3000, value.X)), math.ceil(math.min(3000, value.Y))))
		end,
		updateAsync = function(p1)
			-- upvalues: var1 (ref), self (ref)
			if var1.uri then
				self._panels:SetAttachmentAsync(var1.uri, {
					TargetWidgetUri = p1.targetWidgetUri,
					TargetAnchorPoint = p1.targetAnchorPoint,
					SubjectAnchorPoint = p1.subjectAnchorPoint,
					Offset = p1.offset
				})
				
				return
			end
		end,
		close = function()
			-- upvalues: self (ref), var1 (ref)
			self:_closePopover(var1, true)
		end
	}
end

function t:_createPanelAsync(p1, p2)
	-- upvalues: studioUriModule (ref)
	local var1 = self._plugin:CreateQWidgetPluginGui(p1, {
		InitialEnabled = true,
		Tooltip = true,
		Transparent = true,
		Resizable = true,
		Id = p1,
		Title = p1,
		ZIndex = p2 + 200
	})
	var1.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	
	return var1, studioUriModule.join(self._pluginUri, { Category = "Panels", ItemId = p1 })
end

function t:_makePopoverId()
	-- upvalues: httpService (ref)
	return `Popovers{if self._uriScope then `/{self._uriScope}` else ""}/{httpService:GenerateGUID(false)}`
end

function t:_createPopoverAsync(p1, p2)
	-- upvalues: flagsModule (ref)
	local var1, var2 = self:_createPanelAsync(p1, p2)
	local t = {
		open = false,
		generation = 0,
		parentPopoverId = nil,
		onClose = nil,
		id = p1,
		uri = var2,
		panel = var1,
		depth = p2
	}
	
	local var3 = function()
		-- upvalues: flagsModule (copy), self (ref), t (ref)
		if flagsModule.FoundationPopoverPluginOverlayMeasurement then
			self:_closePopover(t, false, t.generation)
			
			return
		end
		self:_closePopover(t)
	end
	
	if var1:IsA("PluginGui") then
		var1:BindToClose(var3)
	end
	var1.InputBegan:Connect(function(p1)
		-- upvalues: t (ref), self (ref)
		if p1.UserInputType == Enum.UserInputType.MouseButton1 and t.open then
			self:_closeChildPopovers(t)
		end
	end)
	
	return t
end

function t:_activatePopover(p1, p2, p3)
	-- upvalues: flagsModule (ref)
	if flagsModule.FoundationPopoverPluginOverlayMeasurement then
		p1.generation += 1
	end
	p1.onClose = p2
	p1.parentPopoverId = p3
	p1.open = false
	self._active[p1.id] = p1
end

function t:_tryAcquireFromPool(p1, p2, p3)
	local var1 = self._pool[p2]
	local var2 = if var1 then table.remove(var1) else nil
	
	if var2 then
		self:_activatePopover(var2, p1, p3)
		
		return var2
	end
	return nil
end

function t:_acquirePanelAsync(p1, p2, p3)
	local var1 = self:_tryAcquireFromPool(p1, p2, p3)
	
	if var1 then
		return var1
	end
	local var2 = self:_createPopoverAsync(self:_makePopoverId(), p2)
	self:_activatePopover(var2, p1, p3)
	
	return var2
end

function t:prewarmPoolAsync(p1)
	if self._didPrewarm then return end
	for i = 0, math.max(0, p1) do
		if self._pool[i] == nil then
			self._pool[i] = {}
		end
		local var1 = self._pool[i]
		
		if #var1 == 0 then
			local var2 = self:_createPopoverAsync(self:_makePopoverId(), i)
			var2.panel.Enabled = false
			table.insert(var1, var2)
		end
	end
	self._didPrewarm = true
end

function t:_closeChildPopovers(p1)
	local t = {}
	
	for i, v in self._active do
		if v.open and v.id ~= p1.id then
			local var1
			local active = self._active
			local parentPopoverId = v.parentPopoverId
			while parentPopoverId do
				if parentPopoverId == p1.id then
					var1 = true
				else
					local var2 = active[parentPopoverId]
					
					if not var2 then break end
					parentPopoverId = var2.parentPopoverId
				end
				if var1 then
					table.insert(t, v)
				end
			end
			var1 = false
		end
	end
	for i, v in t do
		self:_closePopover(v)
	end
end

function t:_closePopover(p1, p2, p3)
	-- upvalues: flagsModule (ref)
	if flagsModule.FoundationPopoverPluginOverlayMeasurement and p3 ~= nil and p1.generation ~= p3 then return end
	if not p1.open then return end
	p1.open = false
	p1.panel.Enabled = false
	
	if not p2 and p1.onClose then
		p1.onClose()
	end
	self._active[p1.id] = nil
	local depth = p1.depth
	
	if not self._pool[depth] then
		self._pool[depth] = {}
	end
	table.insert(self._pool[depth], p1)
end

function t:closeAll()
	local t = {}
	
	for i, v in self._active do
		table.insert(t, v)
	end
	for i, v_1 in t do
		self:_closePopover(v_1)
	end
end

function t:destroy()
	self:closeAll()
	
	for i, v in self._pool do
		for i_1, v_1 in v do
			if v_1.panel then
				v_1.panel:Destroy()
			end
		end
	end
	self._pool = {}
end

return t