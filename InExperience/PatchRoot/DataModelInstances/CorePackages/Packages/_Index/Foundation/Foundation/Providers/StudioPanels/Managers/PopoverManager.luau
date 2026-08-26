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

function t:openAtAsync(p4, p5, p6, p7, p8)
	-- upvalues: flagsModule (ref)
	local var2
	local var3 = if p6 == nil then 0 else p6
	
	if flagsModule.FoundationPopoverPluginFocusable then
		var2 = p8 == true
		var2 = nil
	else
		var2 = false
	end
	local var4 = self:_acquirePanelAsync(p5, var3, p7, var2)
	var4.panel.Enabled = false
	self._panels:SetAttachmentAsync(var4.uri, {
		TargetWidgetUri = p4.targetWidgetUri,
		TargetAnchorPoint = p4.targetAnchorPoint,
		SubjectAnchorPoint = p4.subjectAnchorPoint,
		Offset = p4.offset
	})
	self._panels:SetSizeAsync(var4.uri, Vector2.new(0, 0))
	var4.panel.Enabled = true
	var4.open = true
	local _ = nil
	
	if flagsModule.FoundationPopoverPluginOverlayMeasurement then
		local generation = var4.generation
		
		return {
			container = var4.panel,
			popoverId = var4.id,
			setSizeAsync = function(value)
				-- upvalues: var4 (ref), generation (ref), self (ref)
				if var4.generation == generation and var4.open then
					self._panels:SetSizeAsync(var4.uri, Vector2.new(math.ceil(math.min(3000, value.X)), math.ceil(math.min(3000, value.Y))))
					
					return
				end
			end,
			updateAsync = function(p9)
				-- upvalues: var4 (ref), generation (ref), self (ref)
				if var4.generation == generation and var4.open and var4.uri then
					self._panels:SetAttachmentAsync(var4.uri, {
						TargetWidgetUri = p9.targetWidgetUri,
						TargetAnchorPoint = p9.targetAnchorPoint,
						SubjectAnchorPoint = p9.subjectAnchorPoint,
						Offset = p9.offset
					})
					
					return
				end
			end,
			close = function()
				-- upvalues: self (ref), var4 (ref), generation (ref)
				self:_closePopover(var4, true, generation)
			end
		}
	end
	return {
		container = var4.panel,
		popoverId = var4.id,
		setSizeAsync = function(value)
			-- upvalues: self (ref), var4 (ref)
			self._panels:SetSizeAsync(var4.uri, Vector2.new(math.ceil(math.min(3000, value.X)), math.ceil(math.min(3000, value.Y))))
		end,
		updateAsync = function(p9)
			-- upvalues: var4 (ref), self (ref)
			if var4.uri then
				self._panels:SetAttachmentAsync(var4.uri, {
					TargetWidgetUri = p9.targetWidgetUri,
					TargetAnchorPoint = p9.targetAnchorPoint,
					SubjectAnchorPoint = p9.subjectAnchorPoint,
					Offset = p9.offset
				})
				
				return
			end
		end,
		close = function()
			-- upvalues: self (ref), var4 (ref)
			self:_closePopover(var4, true)
		end
	}
end

function t:_createPanelAsync(p4, p5, p6)
	-- upvalues: flagsModule (ref), studioUriModule (ref)
	local var2 = self._plugin:CreateQWidgetPluginGui(p4, {
		InitialEnabled = true,
		Tooltip = true,
		Transparent = true,
		Resizable = true,
		Id = p4,
		Focusable = if flagsModule.FoundationPopoverPluginFocusable then p6 else nil,
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

function t:_createPopoverAsync(p4, p5, p6)
	-- upvalues: flagsModule (ref)
	local var2, var3 = self:_createPanelAsync(p4, p5, p6)
	local t = {
		open = false,
		generation = 0,
		parentPopoverId = nil,
		onClose = nil,
		id = p4,
		uri = var3,
		panel = var2,
		depth = p5,
		isFocusable = p6
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
	var2.InputBegan:Connect(function(p7)
		-- upvalues: t (ref), self (ref)
		if p7.UserInputType == Enum.UserInputType.MouseButton1 and t.open then
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

function t:_tryAcquireFromPool(p4, p5, p6, p7)
	-- upvalues: flagsModule (ref)
	local var2 = self._pool[p5]
	local removed = nil
	
	if not flagsModule.FoundationPopoverPluginFocusable then
		removed = if var2 then table.remove(var2) else nil
	elseif var2 then
		for i = #var2, 1, -1 do
			if var2[i].isFocusable ~= p7 then
				continue
			end
			removed = table.remove(var2, i)
		end
	end
	if removed then
		self:_activatePopover(removed, p4, p6)
		
		return removed
	end
	return nil
end

function t:_acquirePanelAsync(p8, p9, p10, p11)
	local var3 = self:_tryAcquireFromPool(p8, p9, p10, p11)
	
	if var3 then
		return var3
	end
	local var4 = self:_createPopoverAsync(self:_makePopoverId(), p9, p11)
	self:_activatePopover(var4, p8, p10)
	
	return var4
end

function t:prewarmPoolAsync(p8)
	if self._didPrewarm then return end
	for i = 0, math.max(0, p8) do
		if self._pool[i] == nil then
			self._pool[i] = {}
		end
		local var3 = self._pool[i]
		
		if #var3 == 0 then
			local var4 = self:_createPopoverAsync(self:_makePopoverId(), i, false)
			var4.panel.Enabled = false
			table.insert(var3, var4)
		end
	end
	self._didPrewarm = true
end

function t:_closeChildPopovers(p9)
	local t = {}
	
	for i, v in self._active do
		if v.open and v.id ~= p9.id then
			local var5
			local active = self._active
			local parentPopoverId = v.parentPopoverId
			while parentPopoverId do
				if parentPopoverId == p9.id then
					var5 = true
				else
					local var6 = active[parentPopoverId]
					
					if not var6 then break end
					parentPopoverId = var6.parentPopoverId
				end
				if var5 then
					table.insert(t, v)
				end
			end
			var5 = false
		end
	end
	for i, v in t do
		self:_closePopover(v)
	end
end

function t:_closePopover(p10, p11, p12)
	-- upvalues: flagsModule (ref)
	if flagsModule.FoundationPopoverPluginOverlayMeasurement and p12 ~= nil and p10.generation ~= p12 then return end
	if not p10.open then return end
	p10.open = false
	p10.panel.Enabled = false
	
	if not p11 and p10.onClose then
		p10.onClose()
	end
	self._active[p10.id] = nil
	local depth = p10.depth
	
	if not self._pool[depth] then
		self._pool[depth] = {}
	end
	table.insert(self._pool[depth], p10)
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