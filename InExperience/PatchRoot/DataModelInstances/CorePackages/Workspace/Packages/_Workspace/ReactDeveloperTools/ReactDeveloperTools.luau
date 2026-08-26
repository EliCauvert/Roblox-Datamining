local parent = script.Parent
local debugLuaAppEnableReactDevTools = game:DefineFastFlag("DebugLuaAppEnableReactDevTools", false)
local debugLuaAppsReactDevToolsProfileOnStart = game:DefineFastFlag("DebugLuaAppsReactDevToolsProfileOnStart", false)
local debugLuaAppReactDevToolsHost = game:DefineFastString("DebugLuaAppReactDevToolsHost", "localhost")
local debugLuaAppReactDevToolsPort = game:DefineFastInt("DebugLuaAppReactDevToolsPort", 8097)

return {
	startup = function(p1)
		-- upvalues: debugLuaAppEnableReactDevTools (ref), parent (ref), debugLuaAppReactDevToolsHost (ref), debugLuaAppReactDevToolsPort (ref), debugLuaAppsReactDevToolsProfileOnStart (ref)
		if debugLuaAppEnableReactDevTools or p1 then
			_G.__PROFILE__ = true
			_G.__DEV__ = true
			require(parent.Dev.ReactDevtoolsCore).backend.connectToDevtools({
				host = debugLuaAppReactDevToolsHost,
				port = debugLuaAppReactDevToolsPort,
				profileOnStart = debugLuaAppsReactDevToolsProfileOnStart
			})
		end
	end
}