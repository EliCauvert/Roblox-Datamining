local Parent = script:FindFirstAncestor("BuildExperience").Parent
local _ = require(Parent.Signals)
local CreateSessionScopedSignalFunction = require(Parent.SignalsUtils).createSessionScopedSignal

return function()
	-- upvalues: CreateSessionScopedSignalFunction (copy)
	local SessionScopedSignal, SessionScopedSignal2 = CreateSessionScopedSignalFunction(function()
		return nil
	end)
	
	return {
		getDraft = SessionScopedSignal,
		setDraft = function(PlaceId, Title, Description)
			-- upvalues: SessionScopedSignal2 (copy)
			SessionScopedSignal2({
				placeId = PlaceId,
				title = Title,
				description = Description
			})
		end,
		clearDraft = function(PlaceId)
			-- upvalues: SessionScopedSignal (copy), SessionScopedSignal2 (copy)
			local SessionScopedSignalResult = SessionScopedSignal()
			
			if SessionScopedSignalResult ~= nil and SessionScopedSignalResult.placeId == PlaceId then
				SessionScopedSignal2(nil)
			end
		end,
		reset = function()
			-- upvalues: SessionScopedSignal2 (copy)
			SessionScopedSignal2(nil)
		end
	}
end