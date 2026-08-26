local peopleReactView = script:FindFirstAncestor("PeopleReactView")
local parent = peopleReactView.Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local getScrollingFrameStoreModule = require(peopleReactView.Stores.GetScrollingFrameStore)

return function(p1)
	-- upvalues: signalsReactModule (ref), getScrollingFrameStoreModule (ref), reactModule (ref)
	local var1 = signalsReactModule.useSignalState(getScrollingFrameStoreModule)
	local var2 = reactModule.useRef(false)
	
	if not var2.current and p1 then
		var1.setScrollingFrame(p1)
		var2.current = true
	end
	reactModule.useEffect(function()
		-- upvalues: var1 (ref)
		return function()
			-- upvalues: var1 (copy)
			var1.cleanUp()
		end
	end, { var1 })
	
	return var1
end