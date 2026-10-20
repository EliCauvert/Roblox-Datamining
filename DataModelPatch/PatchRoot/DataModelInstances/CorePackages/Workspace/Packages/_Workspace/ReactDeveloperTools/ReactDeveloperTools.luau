local Parent = script.Parent
local DebugLuaAppEnableReactDevTools = game:DefineFastFlag("DebugLuaAppEnableReactDevTools", false)
local DebugLuaAppsReactDevToolsProfileOnStart = game:DefineFastFlag("DebugLuaAppsReactDevToolsProfileOnStart", false)
local DebugLuaAppReactDevToolsHost = game:DefineFastString("DebugLuaAppReactDevToolsHost", "localhost")
local DebugLuaAppReactDevToolsPort = game:DefineFastInt("DebugLuaAppReactDevToolsPort", 8097)

return {
	startup = function(p1)
		-- upvalues: DebugLuaAppEnableReactDevTools (copy), Parent (copy), DebugLuaAppReactDevToolsHost (copy), DebugLuaAppReactDevToolsPort (copy), DebugLuaAppsReactDevToolsProfileOnStart (copy)
		if DebugLuaAppEnableReactDevTools or p1 then
			_G.__PROFILE__ = true
			_G.__DEV__ = true
			require(Parent.Dev.ReactDevtoolsCore).backend.connectToDevtools({
				host = DebugLuaAppReactDevToolsHost,
				port = DebugLuaAppReactDevToolsPort,
				profileOnStart = DebugLuaAppsReactDevToolsProfileOnStart
			})
		end
	end
}