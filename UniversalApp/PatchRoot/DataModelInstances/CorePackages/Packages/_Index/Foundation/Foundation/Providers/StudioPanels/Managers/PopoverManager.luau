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

function t.new(p4, p5)
	-- upvalues: t (ref), studioUriModule (ref)
	local tbl = setmetatable({}, t)
	tbl._uriScope = p5
	tbl._plugin = p4
	tbl._panels = p4:GetPluginComponent("Panels")
	tbl._pluginUri = studioUriModule.wrap(p4:GetUri())
	tbl._active = {}
	tbl._pool = {}
	tbl._didPrewarm = false
	
	return tbl
end

function t:openAtAsync(p4, p5, p6, p7)
	-- upvalues: flagsModule (ref)
	local var2 = self:_acquirePanelAsync(p5, if p6 == nil then 0 else p6, p7)
	var2.panel.Enabled = false
	self._panels:SetAttachmentAsync(var2.uri, {
		TargetWidgetUri = p4.targetWidgetUri,
		TargetAnchorPoint = p4.targetAnchorPoint,
		SubjectAnchorPoint = p4.subjectAnchorPoint,
		Offset = p4.offset
	})
	self._panels:SetSizeAsync(var2.uri, Vector2.new(0, 0))
	var2.panel.Enabled = true
	var2.open = true
	local _ = nil
	
	if flagsModule.FoundationPopoverPluginOverlayMeasurement then
		local generation = var2.generation
		
		return {
			container = var2.panel,
			popoverId = var2.id,
			setSizeAsync = function(value)
				-- upvalues: var2 (ref), generation (ref), self (ref)
				if var2.generation == generation and var2.open then
					self._panels:SetSizeAsync(var2.uri, Vector2.new(math.ceil(math.min(3000, value.X)), math.ceil(math.min(3000, value.Y))))
					
					return
				end
			end,
			updateAsync = function(p8)
				-- upvalues: var2 (ref), generation (ref), self (ref)
				if var2.generation == generation and var2.open and var2.uri then
					self._panels:SetAttachmentAsync(var2.uri, {
						TargetWidgetUri = p8.targetWidgetUri,
						TargetAnchorPoint = p8.targetAnchorPoint,
						SubjectAnchorPoint = p8.subjectAnchorPoint,
						Offset = p8.offset
					})
					
					return
				end
			end,
			close = function()
				-- upvalues: self (ref), var2 (ref), generation (ref)
				self:_closePopover(var2, true, generation)
			end
		}
	end
	return {
		container = var2.panel,
		popoverId = var2.id,
		setSizeAsync = function(value)
			-- upvalues: self (ref), var2 (ref)
			self._panels:SetSizeAsync(var2.uri, Vector2.new(math.ceil(math.min(3000, value.X)), math.ceil(math.min(3000, value.Y))))
		end,
		updateAsync = function(p8)
			-- upvalues: var2 (ref), self (ref)
			if var2.uri then
				self._panels:SetAttachmentAsync(var2.uri, {
					TargetWidgetUri = p8.targetWidgetUri,
					TargetAnchorPoint = p8.targetAnchorPoint,
					SubjectAnchorPoint = p8.subjectAnchorPoint,
					Offset = p8.offset
				})
				
				return
			end
		end,
		close = function()
			-- upvalues: self (ref), var2 (ref)
			self:_closePopover(var2, true)
		end
	}
end

function t:_createPanelAsync(p4, p5)
	-- upvalues: studioUriModule (ref)
	local var2 = self._plugin:CreateQWidgetPluginGui(p4, {
		InitialEnabled = true,
		Tooltip = true,
		Transparent = true,
		Resizable = true,
		Id = p4,
		Title = p4,
		ZIndex = p5 + 200
	})
	var2.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	
	return var2, studioUriModule.join(self._pluginUri, { Category = "Panels", ItemId = p4 })
end

function t:_makePopoverId()
	-- upvalues: httpService (ref)
	return `Popovers{if self._uriScope then `/{self._uriScope}` else ""}/{httpService:GenerateGUID(false)}`
end

function t:_createPopoverAsync(p4, p5)
	-- upvalues: flagsModule (ref)
	local var2, var3 = self:_createPanelAsync(p4, p5)
	local t = {
		open = false,
		generation = 0,
		parentPopoverId = nil,
		onClose = nil,
		id = p4,
		uri = var3,
		panel = var2,
		depth = p5
	}
	
	local var4 = function()
		-- upvalues: flagsModule (copy), self (ref), t (ref)
		if flagsModule.FoundationPopoverPluginOverlayMeasurement then
			self:_closePopover(t, false, t.generation)
			
			return
		end
		self:_closePopover(t)
	end
	
	if var2:IsA("PluginGui") then
		var2:BindToClose(var4)
	end
	var2.InputBegan:Connect(function(p6)
		-- upvalues: t (ref), self (ref)
		if p6.UserInputType == Enum.UserInputType.MouseButton1 and t.open then
			self:_closeChildPopovers(t)
		end
	end)
	
	return t
end

function t:_activatePopover(p4, p5, p6)
	-- upvalues: flagsModule (ref)
	if flagsModule.FoundationPopoverPluginOverlayMeasurement then
		p4.generation += 1
	end
	p4.onClose = p5
	p4.parentPopoverId = p6
	p4.open = false
	self._active[p4.id] = p4
end

function t:_tryAcquireFromPool(p4, p5, p6)
	local var2 = self._pool[p5]
	local var3 = if var2 then table.remove(var2) else nil
	
	if var3 then
		self:_activatePopover(var3, p4, p6)
		
		return var3
	end
	return nil
end

function t:_acquirePanelAsync(p4, p5, p6)
	local var2 = self:_tryAcquireFromPool(p4, p5, p6)
	
	if var2 then
		return var2
	end
	local var3 = self:_createPopoverAsync(self:_makePopoverId(), p5)
	self:_activatePopover(var3, p4, p6)
	
	return var3
end

function t:prewarmPoolAsync(p4)
	if self._didPrewarm then return end
	for i = 0, math.max(0, p4) do
		if self._pool[i] == nil then
			self._pool[i] = {}
		end
		local var2 = self._pool[i]
		
		if #var2 == 0 then
			local var3 = self:_createPopoverAsync(self:_makePopoverId(), i)
			var3.panel.Enabled = false
			table.insert(var2, var3)
		end
	end
	self._didPrewarm = true
end

function t:_closeChildPopovers(p5)
	local t = {}
	
	for i, v in self._active do
		if v.open and v.id ~= p5.id then
			local var4
			local active = self._active
			local parentPopoverId = v.parentPopoverId
			while parentPopoverId do
				if parentPopoverId == p5.id then
					var4 = true
				else
					local var5 = active[parentPopoverId]
					
					if not var5 then break end
					parentPopoverId = var5.parentPopoverId
				end
				if var4 then
					table.insert(t, v)
				end
			end
			var4 = false
		end
	end
	for i, v in t do
		self:_closePopover(v)
	end
end

function t:_closePopover(p6, p7, p8)
	-- upvalues: flagsModule (ref)
	if flagsModule.FoundationPopoverPluginOverlayMeasurement and p8 ~= nil and p6.generation ~= p8 then return end
	if not p6.open then return end
	p6.open = false
	p6.panel.Enabled = false
	
	if not p7 and p6.onClose then
		p6.onClose()
	end
	self._active[p6.id] = nil
	local depth = p6.depth
	
	if not self._pool[depth] then
		self._pool[depth] = {}
	end
	table.insert(self._pool[depth], p6)
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