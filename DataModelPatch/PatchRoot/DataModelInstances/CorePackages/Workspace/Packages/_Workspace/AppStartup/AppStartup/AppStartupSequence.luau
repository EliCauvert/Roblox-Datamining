local ScriptContext = game:GetService("ScriptContext")
local LuaAppCompressionEngineFeature = game:GetEngineFeature("LuaAppCompression")
local Signal = require(script:FindFirstAncestor("AppStartup").Parent.AppCommonLib).Signal
local AppStartupSequenceModule = {}
AppStartupSequenceModule.__index = AppStartupSequenceModule

function AppStartupSequenceModule.new()
	-- upvalues: Signal (copy), AppStartupSequenceModule (copy)
	local config = { isInteractive = false, changed = Signal.new() }
	setmetatable(config, AppStartupSequenceModule)
	
	return config
end

function AppStartupSequenceModule:setInteractive()
	-- upvalues: LuaAppCompressionEngineFeature (copy), ScriptContext (copy)
	if self.isInteractive then return end
	self.isInteractive = true
	
	if LuaAppCompressionEngineFeature then
		ScriptContext:CompressLuaApp()
	end
	self.changed:fire()
end

AppStartupSequenceModule.default = AppStartupSequenceModule.new()

return AppStartupSequenceModule