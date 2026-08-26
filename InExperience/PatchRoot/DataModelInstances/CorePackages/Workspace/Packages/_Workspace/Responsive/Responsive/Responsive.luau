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

function t_1.new(p1)
	-- upvalues: t_1 (ref)
	local t = {
		_hasSizeRules = false,
		_hasInputRules = false,
		_currentKey = "Default",
		_config = p1 or {},
		_currentRule = { Key = "Default" }
	}
	local var1 = false
	local var2 = false
	
	for i, v in p1 do
		var1 = var1 or (if v.minWidth == nil then if v.maxWidth == nil then if v.minHeight == nil then if v.maxHeight == nil then if v.maxRatio == nil then v.minRatio ~= nil else true else true else true else true else true)
		var2 = var2 or (if v.preferredInput == nil then v.lastInput ~= nil else true)
	end
	t._hasSizeRules = var1
	t._hasInputRules = var2
	
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

function t_1:resolve(p2, p3, p4, p5, p6)
	local var3 = "Default"
	local t = {}
	local var4 = p2 / p3
	
	for i, v in self._config do
		local var5
		if v.minWidth ~= nil then
			var5 = false
			
			if v.minWidth <= p2 then
				if v.maxWidth ~= nil then
					var5 = false
					
					if p2 <= v.maxWidth then
						if v.minHeight ~= nil then
							var5 = false
							
							if v.minHeight <= p3 then
								if v.maxHeight ~= nil then
									var5 = false
									
									if p3 <= v.maxHeight then
										if v.minRatio ~= nil then
											var5 = false
											
											if v.minRatio <= var4 then
												if v.maxRatio ~= nil then
													var5 = false
													
													if var4 <= v.maxRatio then
														if v.preferredInput ~= nil then
															var5 = false
															
															if p4 == v.preferredInput then
																if v.lastInput ~= nil then
																	var5 = false
																	
																	if p5 == v.lastInput then
																		var5 = if v.spatial ~= nil then p6 == v.spatial else true
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
			if var5 then
				t = v
				var3 = v.Key
				break
			end
		end
	end
	if var3 == self._currentKey then
		return false
	end
	self._currentKey = var3
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

function t:connect(p7)
	if self._changed == nil then
		error("Connecting to dead signal!")
	end
	return self._changed:connect(p7)
end

function t:currentRule(p7)
	return self._configResolvers[p7 or "default"]:currentRule()
end

function t:currentKey(p7)
	return self._configResolvers[p7 or "default"]:currentKey()
end

function t:updateAbsoluteSize(p7)
	-- upvalues: guiService (ref)
	local absoluteSize = p7.AbsoluteSize
	
	if p7:IsA("LayerCollector") then
		local ok, status = pcall(function()
			-- upvalues: p7 (ref)
			return p7.IgnoreGuiInset
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
	local var6 = inputModeModule.preferred()
	local var7 = inputModeModule.last()
	local vrEnabled = self._vrEnabled
	local var8 = false
	
	for i, v in self._configResolvers do
		if v:resolve(x, y, var6, var7, vrEnabled) then
			var8 = true
		end
	end
	if var8 then
		self._changed:fire()
	end
end

function is_array(p7)
	return type(p7) == "table" and p7[1] ~= nil
end

function t:setConfig(p7)
	-- upvalues: t_1 (ref)
	if is_array(p7) then
		p7 = { default = p7 }
	end
	local var9 = false
	local var10 = false
	local t = {}
	
	if p7 then
		for i, v in p7 do
			t[i] = t_1.new(v)
			var9 = var9 or t[i]:hasSizeRules()
			var10 = var10 or t[i]:hasInputRules()
		end
	end
	self._hasInputRules = var10
	self._hasSizeRules = var9
	self._configResolvers = t
	self:resolve()
end

function t:setLocalInstance(p8, p9)
	-- upvalues: findFirstAncestorWithTagModule (ref)
	if typeof(p8) ~= "Instance" then
		error("setLocalInstance arg1 expects Instance")
		
		return
	end
	local var11 = if typeof(p9) == "string" then findFirstAncestorWithTagModule(p8, p9) or p8 elseif typeof(p9) == "Instance" then p9 else p8:FindFirstAncestorWhichIsA("LayerCollector")
	
	if var11 == nil then
		var11 = p8
	end
	if self._layerCollectorSizeConnection then
		self._layerCollectorSizeConnection:Disconnect()
		self._layerCollectorSizeConnection = nil
	end
	if var11 then
		self._layerCollectorSizeConnection = var11:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
			-- upvalues: self (ref), var11 (write)
			self:updateAbsoluteSize(var11)
		end)
		self:updateAbsoluteSize(var11)
	end
end

return {
	DefaultKey = "Default",
	bindContainer = function(p8, p9)
		-- upvalues: tbl (ref), t (ref), rules (ref)
		local var11 = tbl[p8]
		local var12 = p9 == nil
		
		if var12 and var11 then
			var11:incRef()
			
			return var11
		end
		local var13 = t.new()
		var13:setLocalInstance(p8, p8)
		var13:setConfig(p9 or rules)
		
		if var12 then
			tbl[p8] = var13
		end
		return var13
	end
}