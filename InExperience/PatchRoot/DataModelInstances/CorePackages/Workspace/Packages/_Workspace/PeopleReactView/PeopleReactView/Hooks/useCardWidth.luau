local peopleReactView = script:FindFirstAncestor("PeopleReactView")
local reactModule = require(peopleReactView.Parent.React)
local calculateCardLayoutModule = require(peopleReactView.Utils.calculateCardLayout)

return function()
	-- upvalues: reactModule (ref), calculateCardLayoutModule (ref)
	local var1, var2 = reactModule.useBinding(0)
	
	return var1, reactModule.useCallback(function(p1, p2, p3)
		-- upvalues: calculateCardLayoutModule (copy), var2 (ref)
		local var3 = calculateCardLayoutModule(p1, p2, p3)
		var2(var3)
		
		return var3
	end, {})
end