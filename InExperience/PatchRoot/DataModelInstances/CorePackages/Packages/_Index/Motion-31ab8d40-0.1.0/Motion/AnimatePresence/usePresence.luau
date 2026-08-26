local reactModule = require(script.Parent.Parent.Parent.React)
local presenceContextModule = require(script.Parent.PresenceContext)
local isPresent = require(script.Parent.PresenceUtils).isPresent

return function()
	-- upvalues: reactModule (ref), presenceContextModule (ref), isPresent (ref)
	local var1 = reactModule.useContext(presenceContextModule)
	local id = var1.id
	local _ = var1.isPresent
	local onExitComplete = var1.onExitComplete
	
	return {
		isPresent = isPresent(var1),
		id = id,
		onExitComplete = reactModule.useCallback(function()
			-- upvalues: onExitComplete (ref), id (ref)
			if onExitComplete then
				onExitComplete(id)
			end
		end, { onExitComplete, id }),
		passThroughData = var1.passThroughData
	}
end