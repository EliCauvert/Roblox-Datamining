local Parent = script:FindFirstAncestor("BuildExperience").Parent
local _ = require(Parent.DataHydration.PlaceVersionHistory)
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)

return function(p1, p2, p3)
	-- upvalues: SignalsReactModule (copy), ReactModule (copy)
	local NextCursor = if p3 == nil or not p3.hasMore then nil else p3.nextCursor
	local UseSignalStateResult = SignalsReactModule.useSignalState(p1.getIsFetchingMoreHistory(p2))
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	
	return ReactModule.useCallback(function()
		-- upvalues: NextCursor (copy), UseStateResult (copy), UseSignalStateResult (copy), p1 (copy), p2 (copy), UseStateResult2 (copy)
		if NextCursor ~= nil and NextCursor ~= UseStateResult and not UseSignalStateResult then
			p1.fetchMoreHistory(p2, NextCursor):catch(function()
				-- upvalues: UseStateResult2 (upval), NextCursor (copy)
				UseStateResult2(NextCursor)
			end)
			
			return
		end
	end, {
		p1,
		p2,
		NextCursor,
		UseStateResult,
		UseSignalStateResult
	})
end