local peopleReactView = script:FindFirstAncestor("PeopleReactView")
local parent = peopleReactView.Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local getScrollingFrameStoreModule = require(peopleReactView.Stores.GetScrollingFrameStore)

return function(p0) --[[ line: 9 | named "useScrollingFrameStore" ]]
	-- upvalues: signalsReactModule (ref), getScrollingFrameStoreModule (ref), reactModule (ref)
	local var4 = signalsReactModule.useSignalState(getScrollingFrameStoreModule)
	local var5 = reactModule.useRef(false)
	
	if not var5.current and p0 then
		var4.setScrollingFrame(p0)
		var5.current = true
	end
	reactModule.useEffect(function() --[[ line: 18 ]]
		-- upvalues: var4 (ref)
		return function() --[[ line: 19 ]]
			-- upvalues: var4 (copy)
			var4.cleanUp()
		end
	end, { var4 })
	
	return var4
end