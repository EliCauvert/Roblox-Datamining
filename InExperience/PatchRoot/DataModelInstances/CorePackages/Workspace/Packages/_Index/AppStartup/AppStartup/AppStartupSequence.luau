local scriptContextService = game:GetService("ScriptContext")
local luaAppCompressionEngineFeature = game:GetEngineFeature("LuaAppCompression")
local signal = require(script:FindFirstAncestor("AppStartup").Parent.AppCommonLib).Signal
local t = {}
t.__index = t

function t.new()
	-- upvalues: signal (ref), t (ref)
	local t_1 = { isInteractive = false, changed = signal.new() }
	setmetatable(t_1, t)
	
	return t_1
end

function t:setInteractive()
	-- upvalues: luaAppCompressionEngineFeature (ref), scriptContextService (ref)
	if self.isInteractive then return end
	self.isInteractive = true
	
	if luaAppCompressionEngineFeature then
		scriptContextService:CompressLuaApp()
	end
	self.changed:fire()
end

t.default = t.new()

return t