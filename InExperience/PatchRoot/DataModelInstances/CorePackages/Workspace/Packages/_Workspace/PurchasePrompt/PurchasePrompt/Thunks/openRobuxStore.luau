local parent = script.Parent.Parent
local setPromptStateModule = require(parent.Actions.SetPromptState)
local promptStateModule = require(parent.Enums.PromptState)
local platformInterfaceModule = require(parent.Services.PlatformInterface)
local thunkModule = require(parent.Thunk)
local list = { platformInterfaceModule }

return function() --[[ line: 13 | named "openRobuxStore" ]]
	-- upvalues: thunkModule (ref), list (ref), platformInterfaceModule (ref), setPromptStateModule (ref), promptStateModule (ref)
	return thunkModule.new(script.Name, list, function(p0, p1) --[[ line: 14 ]]
		-- upvalues: platformInterfaceModule (copy), setPromptStateModule (copy), promptStateModule (copy)
		local var5 = p1[platformInterfaceModule]
		p0:dispatch(setPromptStateModule(promptStateModule.UpsellInProgress))
		var5.openRobuxStore()
	end)
end