local parent = script.Parent.Parent
local setPromptStateModule = require(parent.Actions.SetPromptState)
local promptStateModule = require(parent.Enums.PromptState)
local platformInterfaceModule = require(parent.Services.PlatformInterface)
local thunkModule = require(parent.Thunk)
local list = { platformInterfaceModule }

return function()
	-- upvalues: thunkModule (ref), list (ref), platformInterfaceModule (ref), setPromptStateModule (ref), promptStateModule (ref)
	return thunkModule.new(script.Name, list, function(p1, p2)
		-- upvalues: platformInterfaceModule (copy), setPromptStateModule (copy), promptStateModule (copy)
		local var1 = p2[platformInterfaceModule]
		p1:dispatch(setPromptStateModule(promptStateModule.UpsellInProgress))
		var1.openRobuxStore()
	end)
end