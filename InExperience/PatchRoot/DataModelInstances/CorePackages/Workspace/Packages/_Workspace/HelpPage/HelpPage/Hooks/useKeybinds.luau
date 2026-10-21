local Parent = script.Parent.Parent
local ReactModule = require(Parent.Parent.React)
local _ = require(Parent.Configs.ConfigTypes)
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
	local Controls = {}
	
	for i, control in UseContextResult.controls do
		if i ~= "Jump" then
			Controls[i] = control
		end
	end
	for i1, value in UseAbilitiesModuleResult do
		Controls[i1] = value
	end
	return {
		abilitiesAvailable = true,
		groups = UseContextResult.groups,
		controls = Controls
	}
end