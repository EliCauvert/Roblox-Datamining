local defaultModule = require(script.Default)
local enumsModule = require(script.enums)
local _ = require(script.types)

return {
	ColorMode = enumsModule.ColorMode,
	Theme = enumsModule.Theme,
	themes = {
		Default = function() --[[ line: 16 ]]
			-- upvalues: defaultModule (ref)
			return defaultModule
		end,
		Kids = function() --[[ line: 19 ]]
			return require(script.Kids)
		end
	}
}