local starterGuiService = game:GetService("StarterGui")
local lifecycleModule = require(script.Parent.Lifecycle)
local featureNameModule = require(script.Parent.FeatureName)
local t = {}
t.__index = t

function t.new(p0)
	-- upvalues: t (ref), starterGuiService (ref), lifecycleModule (ref)
	local tbl = setmetatable({}, t)
	local t_1 = nil
	local coreGuiType = nil
	
	if p0 then
		coreGuiType = p0.coreGuiType
		t_1 = {
			defaultVisible = p0.defaultVisible or false,
			defaultEnabled = if coreGuiType then starterGuiService:GetCoreGuiEnabled(coreGuiType) else p0.defaultEnabled or false
		}
	end
	local var7 = lifecycleModule.new(t_1)
	tbl.lifecycle = var7
	
	if coreGuiType then
		tbl._coreGuiConnection = starterGuiService.CoreGuiChangedSignal:Connect(function(p1, p2)
			-- upvalues: coreGuiType (write), var7 (ref)
			if p1 == coreGuiType or p1 == Enum.CoreGuiType.All then
				var7.setEnabled(p2)
			end
		end)
	end
	return tbl
end

function t:dispose()
	if self._coreGuiConnection then
		self._coreGuiConnection:Disconnect()
		self._coreGuiConnection = nil
	end
	self.lifecycle:dispose()
end

local t_1 = {}

return {
	FeatureName = featureNameModule,
	registerLifecycle = function(p3, p4)
		-- upvalues: t_1 (ref), t (ref)
		assert(not t_1[p3], `Feature "{p3}" already has a registered lifecycle`)
		local var8 = t.new(p4)
		t_1[p3] = var8
		
		return var8
	end,
	getFeature = function(p5)
		-- upvalues: t_1 (ref)
		return t_1[p5]
	end,
	getVisibility = function(p6)
		-- upvalues: t_1 (ref)
		local var9 = t_1[p6]
		
		return if var9 then var9.lifecycle.getVisible(false) else false
	end,
	setVisibility = function(value, p7)
		-- upvalues: t_1 (ref)
		local var10 = t_1[value]
		
		if var10 then
			var10.lifecycle.setVisible(p7)
		end
	end,
	toggleVisibility = function(p8)
		-- upvalues: t_1 (ref)
		local var11 = t_1[p8]
		
		if var11 then
			var11.lifecycle.setVisible(not var11.lifecycle.getVisible(false))
		end
	end,
	setEnabled = function(value, p9)
		-- upvalues: t_1 (ref)
		local var12 = t_1[value]
		
		if var12 then
			var12.lifecycle.setEnabled(p9)
		end
	end,
	onVisibilityChanged = function(p10, p11)
		-- upvalues: t_1 (ref)
		local var13 = t_1[p10]
		
		return if var13 then var13.lifecycle:onVisibilityChanged(p11) else function() end
	end,
	onEnabledChanged = function(p12, p13)
		-- upvalues: t_1 (ref)
		local var14 = t_1[p12]
		
		return if var14 then var14.lifecycle:onEnabledChanged(p13) else function() end
	end
}