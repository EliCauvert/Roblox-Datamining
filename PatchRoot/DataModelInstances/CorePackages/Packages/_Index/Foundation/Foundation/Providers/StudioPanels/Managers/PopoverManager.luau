-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:27 2026 Pacific Standard Time.

local httpService = game:GetService("HttpService")
local foundation = script:FindFirstAncestor("Foundation")
local flagsModule = require(foundation.Utility.Flags)
local studioUriModule = require(foundation.Utility.Plugin.StudioUri)
local _ = require(script.Parent.Parent.Types)

local function _(p0, p1) --[[ line: 19 | named "bindToClose" ]]
	if p0:IsA("PluginGui") then
		p0:BindToClose(p1)
	end
end

local _ = function(p2, p3, p4) --[[ line: 37 | named "isStrictDescendantOf" ]]
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

function t.new(p5, p6) --[[ line: 70 ]]
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

function t:openAtAsync(p7, p8, p9, p10) --[[ line: 100 ]]
	-- upvalues: flagsModule (ref)
	local var7 = self:_acquirePanelAsync(p8, if p9 == nil then 0 else p9, p10)
	var7.panel.Enabled = false
	self._panels:SetAttachmentAsync(var7.uri, {
		TargetWidgetUri = p7.targetWidgetUri,
		TargetAnchorPoint = p7.targetAnchorPoint,
		SubjectAnchorPoint = p7.subjectAnchorPoint,
		Offset = p7.offset
	})
	self._panels:SetSizeAsync(var7.uri, Vector2.new(0, 0))
	var7.panel.Enabled = true
	var7.open = true
	local _ = nil
	
	if flagsModule.FoundationPopoverPluginOverlayMeasurement then
		local generation = var7.generation
		
		return {
			container = var7.panel,
			popoverId = var7.id,
			setSizeAsync = function(value) --[[ line: 130 ]]
				-- upvalues: var7 (ref), generation (ref), self (ref)
				if var7.generation == generation and var7.open then
					self._panels:SetSizeAsync(var7.uri, Vector2.new(math.ceil(math.min(3000, value.X)), math.ceil(math.min(3000, value.Y))))
					
					return
				end
			end,
			updateAsync = function(p11) --[[ line: 138 ]]
				-- upvalues: var7 (ref), generation (ref), self (ref)
				if var7.generation == generation and var7.open and var7.uri then
					self._panels:SetAttachmentAsync(var7.uri, {
						TargetWidgetUri = p11.targetWidgetUri,
						TargetAnchorPoint = p11.targetAnchorPoint,
						SubjectAnchorPoint = p11.subjectAnchorPoint,
						Offset = p11.offset
					})
					
					return
				end
			end,
			close = function() --[[ line: 150 ]]
				-- upvalues: self (ref), var7 (ref), generation (ref)
				self:_closePopover(var7, true, generation)
			end
		}
	end
	return {
		container = var7.panel,
		popoverId = var7.id,
		setSizeAsync = function(value) --[[ line: 158 ]]
			-- upvalues: self (ref), var7 (ref)
			self._panels:SetSizeAsync(var7.uri, Vector2.new(math.ceil(math.min(3000, value.X)), math.ceil(math.min(3000, value.Y))))
		end,
		updateAsync = function(p12) --[[ line: 163 ]]
			-- upvalues: var7 (ref), self (ref)
			if var7.uri then
				self._panels:SetAttachmentAsync(var7.uri, {
					TargetWidgetUri = p12.targetWidgetUri,
					TargetAnchorPoint = p12.targetAnchorPoint,
					SubjectAnchorPoint = p12.subjectAnchorPoint,
					Offset = p12.offset
				})
				
				return
			end
		end,
		close = function() --[[ line: 175 ]]
			-- upvalues: self (ref), var7 (ref)
			self:_closePopover(var7, true)
		end
	}
end

function t:_createPanelAsync(p13, p14) --[[ line: 189 ]]
	-- upvalues: studioUriModule (ref)
	local var8 = self._plugin:CreateQWidgetPluginGui(p13, {
		InitialEnabled = true,
		Tooltip = true,
		Transparent = true,
		Resizable = true,
		Id = p13,
		Title = p13,
		ZIndex = p14 + 200
	})
	var8.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	
	return var8, studioUriModule.join(self._pluginUri, { Category = "Panels", ItemId = p13 })
end

function t:_makePopoverId() --[[ line: 210 ]]
	-- upvalues: httpService (ref)
	return `Popovers{if self._uriScope then `/{self._uriScope}` else ""}/{httpService:GenerateGUID(false)}`
end

function t:_createPopoverAsync(p15, p16) --[[ line: 215 ]]
	-- upvalues: flagsModule (ref)
	local var9, var10 = self:_createPanelAsync(p15, p16)
	local t = {
		open = false,
		generation = 0,
		parentPopoverId = nil,
		onClose = nil,
		id = p15,
		uri = var10,
		panel = var9,
		depth = p16
	}
	
	local var12 = function() --[[ line: 228 ]]
		-- upvalues: flagsModule (copy), self (ref), t (ref)
		if flagsModule.FoundationPopoverPluginOverlayMeasurement then
			self:_closePopover(t, false, t.generation)
			
			return
		end
		self:_closePopover(t)
	end
	
	if var9:IsA("PluginGui") then
		var9:BindToClose(var12)
	end
	var9.InputBegan:Connect(function(p17) --[[ line: 241 ]]
		-- upvalues: t (ref), self (ref)
		if p17.UserInputType == Enum.UserInputType.MouseButton1 and t.open then
			self:_closeChildPopovers(t)
		end
	end)
	
	return t
end

function t:_activatePopover(p18, p19, p20) --[[ line: 250 ]]
	-- upvalues: flagsModule (ref)
	if flagsModule.FoundationPopoverPluginOverlayMeasurement then
		p18.generation += 1
	end
	p18.onClose = p19
	p18.parentPopoverId = p20
	p18.open = false
	self._active[p18.id] = p18
end

function t:_tryAcquireFromPool(p21, p22, p23) --[[ line: 269 ]]
	local var13 = self._pool[p22]
	local var14 = if var13 then table.remove(var13) else nil
	
	if var14 then
		self:_activatePopover(var14, p21, p23)
		
		return var14
	end
	return nil
end

function t:_acquirePanelAsync(p24, p25, p26) --[[ line: 289 ]]
	local var15 = self:_tryAcquireFromPool(p24, p25, p26)
	
	if var15 then
		return var15
	end
	local var16 = self:_createPopoverAsync(self:_makePopoverId(), p25)
	self:_activatePopover(var16, p24, p26)
	
	return var16
end

function t:prewarmPoolAsync(p27) --[[ line: 310 ]]
	if self._didPrewarm then return end
	for i = 0, math.max(0, p27) do
		if self._pool[i] == nil then
			self._pool[i] = {}
		end
		local var17 = self._pool[i]
		
		if #var17 == 0 then
			local var18 = self:_createPopoverAsync(self:_makePopoverId(), i)
			var18.panel.Enabled = false
			table.insert(var17, var18)
		end
	end
	self._didPrewarm = true
end

function t:_closeChildPopovers(p28) --[[ line: 336 ]]
	local t = {}
	
	for i, v in self._active do
		if v.open and v.id ~= p28.id then
			local var20
			local active = self._active
			local parentPopoverId = v.parentPopoverId
			while parentPopoverId do
				if parentPopoverId == p28.id then
					var20 = true
				else
					local var21 = active[parentPopoverId]
					
					if not var21 then break end
					parentPopoverId = var21.parentPopoverId
				end
				if var20 then
					table.insert(t, v)
				end
			end
			var20 = false
		end
	end
	for i, v in t do
		self:_closePopover(v)
	end
end

function t:_closePopover(p29, p30, p31) --[[ line: 362 ]]
	-- upvalues: flagsModule (ref)
	if flagsModule.FoundationPopoverPluginOverlayMeasurement and p31 ~= nil and p29.generation ~= p31 then return end
	if not p29.open then return end
	p29.open = false
	p29.panel.Enabled = false
	
	if not p30 and p29.onClose then
		p29.onClose()
	end
	self._active[p29.id] = nil
	local depth = p29.depth
	
	if not self._pool[depth] then
		self._pool[depth] = {}
	end
	table.insert(self._pool[depth], p29)
end

function t:closeAll() --[[ line: 396 ]]
	local t = {}
	
	for i, v in self._active do
		table.insert(t, v)
	end
	for i, v_1 in t do
		self:_closePopover(v_1)
	end
end

function t:destroy() --[[ line: 410 ]]
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