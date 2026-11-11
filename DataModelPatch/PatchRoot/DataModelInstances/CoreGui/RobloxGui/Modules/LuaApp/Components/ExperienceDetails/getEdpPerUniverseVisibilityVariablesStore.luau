local SignalsModule = require(game:GetService("CorePackages").Packages.Signals)

local function _()
	-- upvalues: SignalsModule (copy)
	local Signal, Signal2 = SignalsModule.createSignal(nil)
	
	return {
		getVisibilityVariables = Signal,
		setVisibilityVariables = Signal2
	}
end

local t = {}

return function(Key)
	-- upvalues: t (copy), SignalsModule (copy)
	local Entry = t[Key]
	
	if Entry == nil then
		local Signal, Signal2 = SignalsModule.createSignal(nil)
		t[Key] = {
			getVisibilityVariables = Signal,
			setVisibilityVariables = Signal2
		}
		Entry = t[Key]
	end
	return Entry
end