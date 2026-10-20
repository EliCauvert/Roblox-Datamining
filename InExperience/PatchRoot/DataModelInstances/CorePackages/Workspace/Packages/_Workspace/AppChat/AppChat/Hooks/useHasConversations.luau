local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local GetDeepValueModule = require(AppChat.Utils.getDeepValue)
local CryoModule = require(Parent.Cryo)

return function()
	-- upvalues: UseSelectorFunction (copy), CryoModule (copy), GetDeepValueModule (copy)
	return UseSelectorFunction(function(p1): boolean
		-- upvalues: CryoModule (upval), GetDeepValueModule (upval)
		return not CryoModule.isEmpty(GetDeepValueModule(p1, "ChatAppReducer.Conversations") or {})
	end)
end