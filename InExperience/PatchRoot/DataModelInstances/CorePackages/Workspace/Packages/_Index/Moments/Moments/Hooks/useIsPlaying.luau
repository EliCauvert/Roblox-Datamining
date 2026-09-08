local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local momentContextModule = require(moments.Components.Feed.Items.Moment.MomentContext)
local useSignalState = require(parent.SignalsReact).useSignalState

return function()
	-- upvalues: momentContextModule (ref), reactModule (ref), signalsModule (ref), useSignalState (ref)
	local controller = momentContextModule.useMoment().controller
	
	return useSignalState(reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), controller (ref)
		return signalsModule.createComputed(function(p1)
			-- upvalues: controller (copy)
			return if controller == nil then false else controller.getState(p1).isPlaying
		end)
	end, { controller }))
end