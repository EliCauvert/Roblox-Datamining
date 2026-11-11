local ReactModule = require(script.Parent.Parent.Parent.React)
local PresenceContextModule = require(script.Parent.PresenceContext)
local IsPresentFunction = require(script.Parent.PresenceUtils).isPresent

return function()
	-- upvalues: ReactModule (copy), PresenceContextModule (copy), IsPresentFunction (copy)
	local UseContextResult = ReactModule.useContext(PresenceContextModule)
	local Id = UseContextResult.id
	local _ = UseContextResult.isPresent
	local OnExitCompleteFunction = UseContextResult.onExitComplete
	
	return {
		isPresent = IsPresentFunction(UseContextResult),
		id = Id,
		onExitComplete = ReactModule.useCallback(function()
			-- upvalues: OnExitCompleteFunction (copy), Id (copy)
			if OnExitCompleteFunction then
				OnExitCompleteFunction(Id)
			end
		end, { OnExitCompleteFunction, Id }),
		passThroughData = UseContextResult.passThroughData
	}
end