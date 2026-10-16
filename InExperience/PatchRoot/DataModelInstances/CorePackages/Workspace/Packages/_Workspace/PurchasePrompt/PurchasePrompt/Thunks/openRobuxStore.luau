local Parent = script.Parent.Parent
local SetPromptStateModule = require(Parent.Actions.SetPromptState)
local PromptStateModule = require(Parent.Enums.PromptState)
local PlatformInterfaceModule = require(Parent.Services.PlatformInterface)
local ThunkModule = require(Parent.Thunk)
local list = { PlatformInterfaceModule }

return function() --[[ Line: 13 | Named "openRobuxStore" ]]
	-- upvalues: ThunkModule (copy), list (copy), PlatformInterfaceModule (copy), SetPromptStateModule (copy), PromptStateModule (copy)
	return ThunkModule.new(script.Name, list, function(p1, p2) --[[ Line: 14 ]]
		-- upvalues: PlatformInterfaceModule (upval), SetPromptStateModule (upval), PromptStateModule (upval)
		local v1 = p2[PlatformInterfaceModule]
		p1:dispatch(SetPromptStateModule(PromptStateModule.UpsellInProgress))
		v1.openRobuxStore()
	end)
end