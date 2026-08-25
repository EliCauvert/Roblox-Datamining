local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local getDeepValueModule = require(appChat.Utils.getDeepValue)
local cryoModule = require(parent.Cryo)

return function()
	-- upvalues: useSelector (ref), cryoModule (ref), getDeepValueModule (ref)
	return useSelector(function(p0)
		-- upvalues: cryoModule (copy), getDeepValueModule (copy)
		return not cryoModule.isEmpty(getDeepValueModule(p0, "ChatAppReducer.Conversations") or {})
	end)
end