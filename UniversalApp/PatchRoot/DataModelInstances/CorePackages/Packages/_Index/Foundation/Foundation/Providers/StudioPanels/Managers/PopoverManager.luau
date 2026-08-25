local httpService = game:GetService("HttpService")
local foundation = script:FindFirstAncestor("Foundation")
local flagsModule = require(foundation.Utility.Flags)
local studioUriModule = require(foundation.Utility.Plugin.StudioUri)
local _ = require(script.Parent.Parent.Types)

local function _(p0, p1)
	if p0:IsA("PluginGui") then
		p0:BindToClose(p1)
	end
end

local _ = function(p2, p3, p4)
	local parentPopoverId = p4.parentPopoverId
	while parentPopoverId do
		if parentPopoverId ~= p3.id then
			local var5 = p2[parentPopoverId]
			
			if not var5 then break end
			parentPopoverId = var5.parentPopoverId
		end
		return true
	end
	return false
end

local t = {}
t.__index = t

function t.new(p5, p6)
	-- upvalues: t (ref), studioUriModule (ref)
	local tbl = setmetatable({}, t)
	tbl._uriScope = p6
	tbl._plugin = p5
	tbl._panels = p5:GetPluginComponent("Panels")
	tbl._pluginUri = studioUriModule.wrap(p5:GetUri())
	tbl._active = {}
	tbl._pool = {}
	tbl._didPrewarm = false
	
	return tbl
end

function t:openAtAsync(p7, p8, p9, p10, p11)
	-- upvalues: flagsModule (ref)
	local var8
	local var7 = if p9 == nil then 0 else p9
	
	if flagsModule.FoundationPopoverPluginFocusable then
		var8 = p11 == true
		var8 = nil
	else
		var8 = false
	end
	local var9 = self:_acquirePanelAsync(p8, var7, p10, var8)
	var9.panel.Enabled = false
	self._panels:SetAttachmentAsync(var9.uri, {
		TargetWidgetUri = p7.targetWidgetUri,
		TargetAnchorPoint = p7.targetAnchorPoint,
		SubjectAnchorPoint = p7.subjectAnchorPoint,
		Offset = p7.offset
	})
	self._panels:SetSizeAsync(var9.uri, Vector2.new(0, 0))
	var9.panel.Enabled = true
	var9.open = true
	local _ = nil
	
	if flagsModule.FoundationPopoverPluginOverlayMeasurement then
		local generation = var9.generation
		
		return {
			container = var9.panel,
			popoverId = var9.id,
			setSizeAsync = function(value)
				-- upvalues: var9 (ref), generation (ref), self (ref)
				if var9.generation == generation and var9.open then
					self._panels:SetSizeAsync(var9.uri, Vector2.new(math.ceil(math.min(3000, value.X)), math.ceil(math.min(3000, value.Y))))
					
					return
				end
			end,
			updateAsync = function(p12)
				-- upvalues: var9 (ref), generation (ref), self (ref)
				if var9.generation == generation and var9.open and var9.uri then
					self._panels:SetAttachmentAsync(var9.uri, {
						TargetWidgetUri = p12.targetWidgetUri,
						TargetAnchorPoint = p12.targetAnchorPoint,
						SubjectAnchorPoint = p12.subjectAnchorPoint,
						Offset = p12.offset
					})
					
					return
				end
			end,
			close = function()
				-- upvalues: self (ref), var9 (ref), generation (ref)
				self:_closePopover(var9, true, generation)
			end
		}
	end
	return {
		container = var9.panel,
		popoverId = var9.id,
		setSizeAsync = function(value)
			-- upvalues: self (ref), var9 (ref)
			self._panels:SetSizeAsync(var9.uri, Vector2.new(math.ceil(math.min(3000, value.X)), math.ceil(math.min(3000, value.Y))))
		end,
		updateAsync = function(p13)
			-- upvalues: var9 (ref), self (ref)
			if var9.uri then
				self._panels:SetAttachmentAsync(var9.uri, {
					TargetWidgetUri = p13.targetWidgetUri,
					TargetAnchorPoint = p13.targetAnchorPoint,
					SubjectAnchorPoint = p13.subjectAnchorPoint,
					Offset = p13.offset
				})
				
				return
			end
		end,
		close = function()
			-- upvalues: self (ref), var9 (ref)
			self:_closePopover(var9, true)
		end
	}
end

function t:_createPanelAsync(p14, p15, p16)
	-- upvalues: flagsModule (ref), studioUriModule (ref)
	local var10 = self._plugin:CreateQWidgetPluginGui(p14, {
		InitialEnabled = true,
		Tooltip = true,
		Transparent = true,
		Resizable = true,
		Id = p14,
		Focusable = if flagsModule.FoundationPopoverPluginFocusable then p16 else nil,
		Title = p14,
		ZIndex = p15 + 200
	})
	var10.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	
	return var10, studioUriModule.join(self._pluginUri, { Category = "Panels", ItemId = p14 })
end

function t:_makePopoverId()
	-- upvalues: httpService (ref)
	return `Popovers{if self._uriScope then `/{self._uriScope}` else ""}/{httpService:GenerateGUID(false)}`
end

function t:_createPopoverAsync(p17, p18, p19)
	-- upvalues: flagsModule (ref)
	local var11, var12 = self:_createPanelAsync(p17, p18, p19)
	local t = {
		open = false,
		generation = 0,
		parentPopoverId = nil,
		onClose = nil,
		id = p17,
		uri = var12,
		panel = var11,
		depth = p18,
		isFocusable = p19
	}
	
	local var14 = function()
		-- upvalues: flagsModule (copy), self (ref), t (ref)
		if flagsModule.FoundationPopoverPluginOverlayMeasurement then
			self:_closePopover(t, false, t.generation)
			
			return
		end
		self:_closePopover(t)
	end
	
	if var11:IsA("PluginGui") then
		var11:BindToClose(var14)
	end
	var11.InputBegan:Connect(function(p20)
		-- upvalues: t (ref), self (ref)
		if p20.UserInputType == Enum.UserInputType.MouseButton1 and t.open then
			self:_closeChildPopovers(t)
		end
	end)
	
	return t
end

function t:_activatePopover(p21, p22, p23)
	-- upvalues: flagsModule (ref)
	if flagsModule.FoundationPopoverPluginOverlayMeasurement then
		p21.generation += 1
	end
	p21.onClose = p22
	p21.parentPopoverId = p23
	p21.open = false
	self._active[p21.id] = p21
end

function t:_tryAcquireFromPool(p24, p25, p26, p27)
	-- upvalues: flagsModule (ref)
	local var15 = self._pool[p25]
	local removed = nil
	
	if not flagsModule.FoundationPopoverPluginFocusable then
		removed = if var15 then table.remove(var15) else nil
	elseif var15 then
		for i = #var15, 1, -1 do
			if var15[i].isFocusable ~= p27 then
				continue
			end
			removed = table.remove(var15, i)
		end
	end
	if removed then
		self:_activatePopover(removed, p24, p26)
		
		return removed
	end
	return nil
end

function t:_acquirePanelAsync(p28, p29, p30, p31)
	local var17 = self:_tryAcquireFromPool(p28, p29, p30, p31)
	
	if var17 then
		return var17
	end
	local var18 = self:_createPopoverAsync(self:_makePopoverId(), p29, p31)
	self:_activatePopover(var18, p28, p30)
	
	return var18
end

function t:prewarmPoolAsync(p32)
	if self._didPrewarm then return end
	for i = 0, math.max(0, p32) do
		if self._pool[i] == nil then
			self._pool[i] = {}
		end
		local var19 = self._pool[i]
		
		if #var19 == 0 then
			local var20 = self:_createPopoverAsync(self:_makePopoverId(), i, false)
			var20.panel.Enabled = false
			table.insert(var19, var20)
		end
	end
	self._didPrewarm = true
end

function t:_closeChildPopovers(p33)
	local t = {}
	
	for i, v in self._active do
		if v.open and v.id ~= p33.id then
			local var22
			local active = self._active
			local parentPopoverId = v.parentPopoverId
			while parentPopoverId do
				if parentPopoverId == p33.id then
					var22 = true
				else
					local var23 = active[parentPopoverId]
					
					if not var23 then break end
					parentPopoverId = var23.parentPopoverId
				end
				if var22 then
					table.insert(t, v)
				end
			end
			var22 = false
		end
	end
	for i, v in t do
		self:_closePopover(v)
	end
end

function t:_closePopover(p34, p35, p36)
	-- upvalues: flagsModule (ref)
	if flagsModule.FoundationPopoverPluginOverlayMeasurement and p36 ~= nil and p34.generation ~= p36 then return end
	if not p34.open then return end
	p34.open = false
	p34.panel.Enabled = false
	
	if not p35 and p34.onClose then
		p34.onClose()
	end
	self._active[p34.id] = nil
	local depth = p34.depth
	
	if not self._pool[depth] then
		self._pool[depth] = {}
	end
	table.insert(self._pool[depth], p34)
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