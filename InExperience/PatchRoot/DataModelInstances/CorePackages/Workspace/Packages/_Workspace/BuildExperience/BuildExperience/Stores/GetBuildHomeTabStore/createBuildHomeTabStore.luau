local Parent = script:FindFirstAncestor("BuildExperience").Parent
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local config = { Games = "Games", Previews = "Previews" }

return {
	BUILD_HOME_TAB = config,
	createBuildHomeTabStore = function()
		-- upvalues: SignalsModule (copy), config (copy), SignalsReactModule (copy)
		local Signal, Signal2 = SignalsModule.createSignal(config.Games)
		
		return {
			getTab = Signal,
			useTab = function()
				-- upvalues: SignalsReactModule (upval), Signal (copy)
				return SignalsReactModule.useSignalState(Signal)
			end,
			setTab = Signal2
		}
	end
}