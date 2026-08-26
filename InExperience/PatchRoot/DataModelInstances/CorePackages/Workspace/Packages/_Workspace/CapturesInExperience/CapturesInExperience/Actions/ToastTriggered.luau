local parent = script.Parent.Parent
local roduxModule = require(parent.Parent.Rodux)
local _ = require(parent.Enums.CapturesToastType)
local _ = require(parent.Types)

return roduxModule.makeActionCreator(script.Name, function(p1, p2)
	return { toastType = p1, toastConfig = p2 }
end)