local reactModule = require(script.Parent.Parent.Parent.React)
local presenceContextModule = require(script.Parent.PresenceContext)
local isPresent = require(script.Parent.PresenceUtils).isPresent

return function()
	-- upvalues: reactModule (ref), presenceContextModule (ref), isPresent (ref)
	local var2 = reactModule.useContext(presenceContextModule)
	local id = var2.id
	local _ = var2.isPresent
	local onExitComplete = var2.onExitComplete
	
	return {
		isPresent = isPresent(var2),
		id = id,
		onExitComplete = reactModule.useCallback(function()
			-- upvalues: onExitComplete (ref), id (ref)
			if onExitComplete then
				onExitComplete(id)
			end
		end, { onExitComplete, id }),
		passThroughData = var2.passThroughData
	}
end