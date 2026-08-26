local starterGuiService = game:GetService("StarterGui")
local lifecycleModule = require(script.Parent.Lifecycle)
local featureNameModule = require(script.Parent.FeatureName)
local t = {}
t.__index = t

function t.new(p1)
	-- upvalues: t (ref), starterGuiService (ref), lifecycleModule (ref)
	local tbl = setmetatable({}, t)
	local t_1 = nil
	local coreGuiType = nil
	
	if p1 then
		coreGuiType = p1.coreGuiType
		t_1 = {
			defaultVisible = p1.defaultVisible or false,
			defaultEnabled = if coreGuiType then starterGuiService:GetCoreGuiEnabled(coreGuiType) else p1.defaultEnabled or false
		}
	end
	local var1 = lifecycleModule.new(t_1)
	tbl.lifecycle = var1
	
	if coreGuiType then
		tbl._coreGuiConnection = starterGuiService.CoreGuiChangedSignal:Connect(function(p2, p3)
			-- upvalues: coreGuiType (write), var1 (ref)
			if p2 == coreGuiType or p2 == Enum.CoreGuiType.All then
				var1.setEnabled(p3)
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
	registerLifecycle = function(p1, p2)
		-- upvalues: t_1 (ref), t (ref)
		assert(not t_1[p1], `Feature "{p3}" already has a registered lifecycle`)
		local var1 = t.new(p2)
		t_1[p1] = var1
		
		return var1
	end,
	getFeature = function(p1)
		-- upvalues: t_1 (ref)
		return t_1[p1]
	end,
	getVisibility = function(p1)
		-- upvalues: t_1 (ref)
		local var1 = t_1[p1]
		
		return if var1 then var1.lifecycle.getVisible(false) else false
	end,
	setVisibility = function(value, p1)
		-- upvalues: t_1 (ref)
		local var1 = t_1[value]
		
		if var1 then
			var1.lifecycle.setVisible(p1)
		end
	end,
	toggleVisibility = function(p1)
		-- upvalues: t_1 (ref)
		local var1 = t_1[p1]
		
		if var1 then
			var1.lifecycle.setVisible(not var1.lifecycle.getVisible(false))
		end
	end,
	setEnabled = function(value, p1)
		-- upvalues: t_1 (ref)
		local var1 = t_1[value]
		
		if var1 then
			var1.lifecycle.setEnabled(p1)
		end
	end,
	onVisibilityChanged = function(p1, p2)
		-- upvalues: t_1 (ref)
		local var1 = t_1[p1]
		
		return if var1 then var1.lifecycle:onVisibilityChanged(p2) else function() end
	end,
	onEnabledChanged = function(p1, p2)
		-- upvalues: t_1 (ref)
		local var1 = t_1[p1]
		
		return if var1 then var1.lifecycle:onEnabledChanged(p2) else function() end
	end
}