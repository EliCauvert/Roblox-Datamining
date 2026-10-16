local StarterGui = game:GetService("StarterGui")
local LifecycleModule = require(script.Parent.Lifecycle)
local FeatureNameModule = require(script.Parent.FeatureName)
local Module = {}
Module.__index = Module

function Module.new(p1) --[[ Line: 27 ]]
	-- upvalues: Module (copy), StarterGui (copy), LifecycleModule (copy)
	local self = setmetatable({}, Module)
	local v1 = nil
	local CoreGuiType = nil
	
	if p1 then
		CoreGuiType = p1.coreGuiType
		v1 = {
			defaultVisible = p1.defaultVisible or false,
			defaultEnabled = if CoreGuiType then StarterGui:GetCoreGuiEnabled(CoreGuiType) else p1.defaultEnabled or false
		}
	end
	local NewLifecycle = LifecycleModule.new(v1)
	self.lifecycle = NewLifecycle
	
	if CoreGuiType then
		self._coreGuiConnection = StarterGui.CoreGuiChangedSignal:Connect(function(CoreGuiType1, Enabled) --[[ Line: 51 ]]
			-- upvalues: CoreGuiType (ref), NewLifecycle (copy)
			if CoreGuiType1 == CoreGuiType or CoreGuiType1 == Enum.CoreGuiType.All then
				NewLifecycle.setEnabled(Enabled)
			end
		end)
	end
	return self
end

function Module:dispose() --[[ Line: 61 ]]
	if self._coreGuiConnection then
		self._coreGuiConnection:Disconnect()
		self._coreGuiConnection = nil
	end
	self.lifecycle:dispose()
end

local NewResults = {}

return {
	FeatureName = FeatureNameModule,
	registerLifecycle = function(Key, p1) --[[ Line: 75 ]]
		-- upvalues: NewResults (copy), Module (copy)
		assert(not NewResults[Key], `Feature "{Key}" already has a registered lifecycle`)
		local NewModule = Module.new(p1)
		NewResults[Key] = NewModule
		
		return NewModule
	end,
	getFeature = function(p1) --[[ Line: 83 ]]
		-- upvalues: NewResults (copy)
		return NewResults[p1]
	end,
	getVisibility = function(p1) --[[ Line: 87 ]]
		-- upvalues: NewResults (copy)
		local NewResult = NewResults[p1]
		
		return if NewResult then NewResult.lifecycle.getVisible(false) else false
	end,
	setVisibility = function(p1, p2) --[[ Line: 95 ]]
		-- upvalues: NewResults (copy)
		local NewResult = NewResults[p1]
		
		if NewResult then
			NewResult.lifecycle.setVisible(p2)
		end
	end,
	toggleVisibility = function(p1) --[[ Line: 102 ]]
		-- upvalues: NewResults (copy)
		local NewResult = NewResults[p1]
		
		if NewResult then
			NewResult.lifecycle.setVisible(not NewResult.lifecycle.getVisible(false))
		end
	end,
	setEnabled = function(p1, p2) --[[ Line: 109 ]]
		-- upvalues: NewResults (copy)
		local NewResult = NewResults[p1]
		
		if NewResult then
			NewResult.lifecycle.setEnabled(p2)
		end
	end,
	onVisibilityChanged = function(p1, p2) --[[ Line: 116 ]]
		-- upvalues: NewResults (copy)
		local NewResult = NewResults[p1]
		
		return if NewResult then NewResult.lifecycle:onVisibilityChanged(p2) else function() --[[ Line: 121 ]] end
	end,
	onEnabledChanged = function(p1, p2) --[[ Line: 124 ]]
		-- upvalues: NewResults (copy)
		local NewResult = NewResults[p1]
		
		return if NewResult then NewResult.lifecycle:onEnabledChanged(p2) else function() --[[ Line: 129 ]] end
	end
}