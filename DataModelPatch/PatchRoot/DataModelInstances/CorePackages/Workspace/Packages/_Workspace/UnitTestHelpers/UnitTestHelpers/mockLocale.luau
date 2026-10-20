local Parent = script.Parent.Parent
local RoactModule = require(Parent.Roact)
local LocalizationProvider = require(Parent.Localization).LocalizationProvider
local Signal = require(Parent.AppCommonLib).Signal

return function(TestElement1)
	-- upvalues: RoactModule (copy), LocalizationProvider (copy), Signal (copy)
	return RoactModule.createElement(LocalizationProvider, {
		localization = {
			Format = function(_, p1, _)
				return p1
			end,
			changed = Signal.new()
		}
	}, { TestElement1 = TestElement1 })
end