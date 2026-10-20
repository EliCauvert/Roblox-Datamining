local SignalsModule = require(game:GetService("CorePackages").Packages.Signals)
local _ = require(script.Parent.EnumReactPage)

return SignalsModule.createComputed(function()
	-- upvalues: SignalsModule (copy)
	local Signal, Signal2 = SignalsModule.createSignal(nil)
	
	return { currentReactPage = Signal, setCurrentReactPage = Signal2 }
end)