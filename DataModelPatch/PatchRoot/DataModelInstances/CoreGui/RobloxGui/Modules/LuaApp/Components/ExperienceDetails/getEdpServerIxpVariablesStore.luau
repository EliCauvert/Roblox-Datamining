local SignalsModule = require(game:GetService("CorePackages").Packages.Signals)
local Config = nil

return function()
	-- upvalues: Config (ref), SignalsModule (copy)
	if Config == nil then
		local Signal, Signal2 = SignalsModule.createSignal(nil)
		Config = {
			getEdpServerIxpVariablesGetter = Signal,
			setEdpServerIxpVariables = Signal2
		}
	end
	return Config
end