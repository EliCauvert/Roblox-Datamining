local SignalsModule = require(game:GetService("CorePackages").Packages.Signals)
local _ = require(script.Parent.EnumReactPage)

return SignalsModule.createComputed(function() --[[ Line: 11 | Named "ReactPageSignal" ]]
	-- upvalues: SignalsModule (copy)
	local Signal, Signal2 = SignalsModule.createSignal(nil)
	
	return { currentReactPage = Signal, setCurrentReactPage = Signal2 }
end)