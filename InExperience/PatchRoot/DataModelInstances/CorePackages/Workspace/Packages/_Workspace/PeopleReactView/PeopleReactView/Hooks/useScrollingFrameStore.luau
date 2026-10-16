local PeopleReactView = script:FindFirstAncestor("PeopleReactView")
local Parent = PeopleReactView.Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local GetScrollingFrameStoreModule = require(PeopleReactView.Stores.GetScrollingFrameStore)

return function(p1) --[[ Line: 9 | Named "useScrollingFrameStore" ]]
	-- upvalues: SignalsReactModule (copy), GetScrollingFrameStoreModule (copy), ReactModule (copy)
	local UseSignalStateResult = SignalsReactModule.useSignalState(GetScrollingFrameStoreModule)
	local UseRefResult = ReactModule.useRef(false)
	
	if not UseRefResult.current and p1 then
		UseSignalStateResult.setScrollingFrame(p1)
		UseRefResult.current = true
	end
	ReactModule.useEffect(function() --[[ Line: 18 ]]
		-- upvalues: UseSignalStateResult (copy)
		return function() --[[ Line: 19 ]]
			-- upvalues: UseSignalStateResult (upval)
			UseSignalStateResult.cleanUp()
		end
	end, { UseSignalStateResult })
	
	return UseSignalStateResult
end