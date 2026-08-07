local signalsModule = require(game:GetService("CorePackages").Packages.Signals)
local _ = require(script.Parent.EnumReactPage)

return signalsModule.createComputed(function() --[[ line: 11 | named "ReactPageSignal" ]]
	-- upvalues: signalsModule (ref)
	local var1, var2 = signalsModule.createSignal(nil)
	
	return { currentReactPage = var1, setCurrentReactPage = var2 }
end)