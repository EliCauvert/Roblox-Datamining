local guiService = game:GetService("GuiService")
local VRService = game:GetService("VRService")
local parent = script:FindFirstAncestor("Responsive").Parent
local standardBreakpointsModule = require(script.Parent.CommonConfigs.StandardBreakpoints)
local inputModeModule = require(script.Parent.InputMode)
local signal = require(parent.AppCommonLib).Signal
local findFirstAncestorWithTagModule = require(script.Parent.FindFirstAncestorWithTag)
local tbl = setmetatable({}, { __mode = "k" })
local t = {}
t.__index = t
local rules = standardBreakpointsModule.rules
local t_1 = {}
t_1.__index = t_1

function t_1.new(p0)
	-- upvalues: t_1 (ref)
	local t = {
		_hasSizeRules = false,
		_hasInputRules = false,
		_currentKey = "Default",
		_config = p0 or {},
		_currentRule = { Key = "Default" }
	}
	local var9 = false
	local var10 = false
	
	for i, v in p0 do
		var9 = var9 or (if v.minWidth == nil then if v.maxWidth == nil then if v.minHeight == nil then if v.maxHeight == nil then if v.maxRatio == nil then v.minRatio ~= nil else true else true else true else true else true)
		var10 = var10 or (if v.preferredInput == nil then v.lastInput ~= nil else true)
	end
	t._hasSizeRules = var9
	t._hasInputRules = var10
	
	return setmetatable(t, t_1)
end

function t_1:hasSizeRules()
	return self._hasSizeRules
end

function t_1:hasInputRules()
	return self._hasInputRules
end

function t_1:currentRule()
	return self._currentRule
end

function t_1:currentKey()
	return self._currentKey
end

function t_1:resolve(p1, p2, p3, p4, p5)
	local var11 = "Default"
	local t = {}
	local var13 = p1 / p2
	
	for i, v in self._config do
		local var14
		if v.minWidth ~= nil then
			var14 = false
			
			if v.minWidth <= p1 then
				if v.maxWidth ~= nil then
					var14 = false
					
					if p1 <= v.maxWidth then
						if v.minHeight ~= nil then
							var14 = false
							
							if v.minHeight <= p2 then
								if v.maxHeight ~= nil then
									var14 = false
									
									if p2 <= v.maxHeight then
										if v.minRatio ~= nil then
											var14 = false
											
											if v.minRatio <= var13 then
												if v.maxRatio ~= nil then
													var14 = false
													
													if var13 <= v.maxRatio then
														if v.preferredInput ~= nil then
															var14 = false
															
															if p3 == v.preferredInput then
																if v.lastInput ~= nil then
																	var14 = false
																	
																	if p4 == v.lastInput then
																		var14 = if v.spatial ~= nil then p5 == v.spatial else true
																	end
																end
															end
														end
													end
												end
											end
										end
									end
								end
							end
						end
					end
				end
			end
			if var14 then
				t = v
				var11 = v.Key
				break
			end
		end
	end
	if var11 == self._currentKey then
		return false
	end
	self._currentKey = var11
	self._currentRule = t
	
	return true
end

function t.new()
	-- upvalues: VRService (ref), signal (ref), t (ref), inputModeModule (ref)
	local t_1 = {
		_layerCollectorSizeConnection = nil,
		_inputModeConnection = nil,
		_vrEnabledConnection = nil,
		_hasInputRules = false,
		_hasSizeRules = false,
		_refCount = 1,
		_vrEnabled = VRService.VREnabled,
		_changed = signal.new(),
		_absoluteSize = Vector2.zero,
		_configResolvers = { default = {} }
	}
	local tbl = setmetatable(t_1, t)
	t_1._inputModeConnection = inputModeModule.connect(function()
		-- upvalues: t_1 (ref), tbl (ref)
		if t_1._hasInputRules then
			tbl:resolve()
		end
	end)
	t_1._vrEnabledConnection = VRService:GetPropertyChangedSignal("VREnabled"):Connect(function()
		-- upvalues: t_1 (ref), VRService (copy), tbl (ref)
		t_1._vrEnabled = VRService.VREnabled
		tbl:resolve()
	end)
	
	return tbl
end

function t:incRef()
	self._refCount += 1
end

function t:destroy()
	-- upvalues: tbl (ref)
	if self._refCount > 1 then
		self._refCount -= 1
		
		return
	elseif self._layerCollectorSizeConnection then
		self._layerCollectorSizeConnection:Disconnect()
		self._layerCollectorSizeConnection = nil
	end
	if self._inputModeConnection then
		self._inputModeConnection:disconnect()
		self._inputModeConnection = nil
	end
	if self._vrEnabledConnection then
		self._vrEnabledConnection:Disconnect()
		self._vrEnabledConnection = nil
	end
	self._changed = nil
	
	for i, v in tbl do
		if v == self then
			tbl[i] = nil
		end
	end
end

function t:connect(p6)
	if self._changed == nil then
		error("Connecting to dead signal!")
	end
	return self._changed:connect(p6)
end

function t:currentRule(p7)
	return self._configResolvers[p7 or "default"]:currentRule()
end

function t:currentKey(p8)
	return self._configResolvers[p8 or "default"]:currentKey()
end

function t:updateAbsoluteSize(p9)
	-- upvalues: guiService (ref)
	local absoluteSize = p9.AbsoluteSize
	
	if p9:IsA("LayerCollector") then
		local ok, status = pcall(function()
			-- upvalues: p9 (ref)
			return p9.IgnoreGuiInset
		end)
		
		if ok and status then
			local guiInset, _ = guiService:GetGuiInset()
			absoluteSize += guiInset
		end
	end
	if absoluteSize.X ~= self._absoluteSize.X or absoluteSize.Y ~= self._absoluteSize.Y then
		self._absoluteSize = absoluteSize
		
		if self._hasSizeRules then
			self:resolve()
		end
	end
end

function t:resolve()
	-- upvalues: inputModeModule (ref)
	if not self._configResolvers then return end
	local x = self._absoluteSize.X or 1
	local y = self._absoluteSize.Y or 1
	local var20 = inputModeModule.preferred()
	local var21 = inputModeModule.last()
	local vrEnabled = self._vrEnabled
	local var22 = false
	
	for i, v in self._configResolvers do
		if v:resolve(x, y, var20, var21, vrEnabled) then
			var22 = true
		end
	end
	if var22 then
		self._changed:fire()
	end
end

function is_array(p10)
	return type(p10) == "table" and p10[1] ~= nil
end

function t:setConfig(p11)
	-- upvalues: t_1 (ref)
	if is_array(p11) then
		p11 = { default = p11 }
	end
	local var23 = false
	local var24 = false
	local t = {}
	
	if p11 then
		for i, v in p11 do
			t[i] = t_1.new(v)
			var23 = var23 or t[i]:hasSizeRules()
			var24 = var24 or t[i]:hasInputRules()
		end
	end
	self._hasInputRules = var24
	self._hasSizeRules = var23
	self._configResolvers = t
	self:resolve()
end

function t:setLocalInstance(p12, p13)
	-- upvalues: findFirstAncestorWithTagModule (ref)
	if typeof(p12) ~= "Instance" then
		error("setLocalInstance arg1 expects Instance")
		
		return
	end
	local var26 = if typeof(p13) == "string" then findFirstAncestorWithTagModule(p12, p13) or p12 elseif typeof(p13) == "Instance" then p13 else p12:FindFirstAncestorWhichIsA("LayerCollector")
	
	if var26 == nil then
		var26 = p12
	end
	if self._layerCollectorSizeConnection then
		self._layerCollectorSizeConnection:Disconnect()
		self._layerCollectorSizeConnection = nil
	end
	if var26 then
		self._layerCollectorSizeConnection = var26:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
			-- upvalues: self (ref), var26 (write)
			self:updateAbsoluteSize(var26)
		end)
		self:updateAbsoluteSize(var26)
	end
end

return {
	DefaultKey = "Default",
	bindContainer = function(p14, p15)
		-- upvalues: tbl (ref), t (ref), rules (ref)
		local var27 = tbl[p14]
		local var28 = p15 == nil
		
		if var28 and var27 then
			var27:incRef()
			
			return var27
		end
		local var29 = t.new()
		var29:setLocalInstance(p14, p14)
		var29:setConfig(p15 or rules)
		
		if var28 then
			tbl[p14] = var29
		end
		return var29
	end
}