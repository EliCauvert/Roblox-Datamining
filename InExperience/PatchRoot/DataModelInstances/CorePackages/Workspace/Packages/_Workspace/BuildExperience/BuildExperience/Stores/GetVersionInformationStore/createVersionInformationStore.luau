local Parent = script:FindFirstAncestor("BuildExperience").Parent
local _ = require(Parent.Signals)
local CreateSessionScopedSignalFunction = require(Parent.SignalsUtils).createSessionScopedSignal

return function() --[[ Line: 20 | Named "createVersionInformationStore" ]]
	-- upvalues: CreateSessionScopedSignalFunction (copy)
	local SessionScopedSignal, SessionScopedSignal2 = CreateSessionScopedSignalFunction(function() --[[ Line: 22 ]]
		return nil
	end)
	
	return {
		getDraft = SessionScopedSignal,
		setDraft = function(PlaceId, Title, Description) --[[ Line: 27 ]]
			-- upvalues: SessionScopedSignal2 (copy)
			SessionScopedSignal2({
				placeId = PlaceId,
				title = Title,
				description = Description
			})
		end,
		clearDraft = function(PlaceId) --[[ Line: 35 ]]
			-- upvalues: SessionScopedSignal (copy), SessionScopedSignal2 (copy)
			local SessionScopedSignalResult = SessionScopedSignal()
			
			if SessionScopedSignalResult ~= nil and SessionScopedSignalResult.placeId == PlaceId then
				SessionScopedSignal2(nil)
			end
		end,
		reset = function() --[[ Line: 42 ]]
			-- upvalues: SessionScopedSignal2 (copy)
			SessionScopedSignal2(nil)
		end
	}
end