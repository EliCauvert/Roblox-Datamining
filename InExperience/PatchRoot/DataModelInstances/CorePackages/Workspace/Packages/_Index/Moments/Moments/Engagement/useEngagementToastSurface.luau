local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local GetNextToastCoordinatorModule = require(Moments.Engagement.GetNextToastCoordinator)

return function(p1, p2)
	-- upvalues: ReactModule (copy), SignalsModule (copy), GetNextToastCoordinatorModule (copy)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval)
		local Signal, Signal2 = SignalsModule.createSignal(false)
		
		return { get = Signal, set = Signal2 }
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: UseMemoResult (copy), p2 (copy)
		UseMemoResult.set(p2)
	end, { UseMemoResult, p2 })
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), GetNextToastCoordinatorModule (upval), UseMemoResult (copy)
		return if p1 then GetNextToastCoordinatorModule(false).markSurfaceVisible(UseMemoResult.get) else nil
	end, { UseMemoResult, p1 })
end