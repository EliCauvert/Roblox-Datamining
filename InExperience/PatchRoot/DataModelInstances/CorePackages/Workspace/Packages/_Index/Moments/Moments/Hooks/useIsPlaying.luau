local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local MomentContextModule = require(Moments.Components.Feed.Items.Moment.MomentContext)
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState

return function()
	-- upvalues: MomentContextModule (copy), ReactModule (copy), SignalsModule (copy), UseSignalStateFunction (copy)
	local Controller = MomentContextModule.useMoment().controller
	
	return UseSignalStateFunction((ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval), Controller (copy)
		return SignalsModule.createComputed(function(p1)
			-- upvalues: Controller (upval)
			return Controller ~= nil and Controller.getState(p1).isPlaying
		end)
	end, { Controller })))
end