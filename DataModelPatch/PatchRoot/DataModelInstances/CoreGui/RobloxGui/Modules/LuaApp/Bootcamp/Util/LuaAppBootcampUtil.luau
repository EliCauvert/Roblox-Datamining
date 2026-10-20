local Logging = require(game:GetService("CorePackages").Workspace.Packages.AppCommonLib).Logging
Logging.warn("Lua App Bootcamp Enabled")
local LuaAppIntroBootcampModule = require(script.Parent.Parent.LuaAppIntroBootcamp)

return {
	runBootcamp = function(_)
		-- upvalues: LuaAppIntroBootcampModule (copy), Logging (copy)
		for _, value in ipairs(LuaAppIntroBootcampModule) do
			Logging.warn(value)
		end
	end
}