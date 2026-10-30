local ViewRecyclerReact = script:FindFirstAncestor("ViewRecyclerReact")
local _ = require(ViewRecyclerReact.ReactAdapter.Private.CompositionPlacement)
local _ = require(ViewRecyclerReact.ReactAdapter.Private.RecyclableViewRegistry)
local SignalsModule = require(ViewRecyclerReact.Parent.Signals)

return function(Callback1, Callback)
	-- upvalues: SignalsModule (copy)
	if type(Callback1) == "function" then
		return SignalsModule.createComputed(function(p1)
			-- upvalues: Callback (copy), Callback1 (copy)
			return Callback(Callback1(p1))
		end)
	else
		local CallbackResult = Callback(Callback1)
		
		return function(_)
			-- upvalues: CallbackResult (copy)
			return CallbackResult
		end
	end
end