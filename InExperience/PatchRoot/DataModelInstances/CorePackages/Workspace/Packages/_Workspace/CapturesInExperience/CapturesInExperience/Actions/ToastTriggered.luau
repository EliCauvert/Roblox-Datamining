local parent = script.Parent.Parent
local roduxModule = require(parent.Parent.Rodux)
local _ = require(parent.Enums.CapturesToastType)
local _ = require(parent.Types)

return roduxModule.makeActionCreator(script.Name, function(p0, p1) --[[ line: 16 ]]
	return { toastType = p0, toastConfig = p1 }
end)