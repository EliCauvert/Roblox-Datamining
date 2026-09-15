local parent = script.Parent.Parent
local reactModule = require(parent.Parent.React)
local keybindContextModule = require(parent.Context.KeybindContext)
local useAbilitiesModule = require(script.Parent.useAbilities)
local fFlagHelpPageCCLModule = require(parent.Flags.FFlagHelpPageCCL)

return function()
	-- upvalues: reactModule (ref), keybindContextModule (ref), fFlagHelpPageCCLModule (ref), useAbilitiesModule (ref)
	local var1 = reactModule.useContext(keybindContextModule)
	local var2 = if fFlagHelpPageCCLModule then useAbilitiesModule() else nil
	
	if var2 == nil or var1.controls == nil then
		return var1
	end
	local cloned = table.clone(var1.controls)
	
	for i, v in var2 do
		cloned[i] = v
	end
	return { groups = var1.groups, controls = cloned }
end