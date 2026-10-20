local Parent = script.Parent.Parent
local ReactModule = require(Parent.Parent.React)
local KeybindContextModule = require(Parent.Context.KeybindContext)
local UseAbilitiesModule = require(script.Parent.useAbilities)
local FFlagHelpPageCCLModule = require(Parent.Flags.FFlagHelpPageCCL)

return function()
	-- upvalues: ReactModule (copy), KeybindContextModule (copy), FFlagHelpPageCCLModule (copy), UseAbilitiesModule (copy)
	local UseContextResult = ReactModule.useContext(KeybindContextModule)
	local UseAbilitiesModuleResult = if FFlagHelpPageCCLModule then UseAbilitiesModule() else nil
	
	if UseAbilitiesModuleResult == nil or UseContextResult.controls == nil then
		return UseContextResult
	end
	local Copy = table.clone(UseContextResult.controls)
	
	for i, value in UseAbilitiesModuleResult do
		Copy[i] = value
	end
	return { groups = UseContextResult.groups, controls = Copy }
end