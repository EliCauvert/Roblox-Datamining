local AppPageShell = script:FindFirstAncestor("AppPageShell")
local Parent = AppPageShell.Parent
local AppCommonLibModule = require(Parent.AppCommonLib)
local SignalsModule = require(Parent.Signals)
local _ = require(AppPageShell.createPageScrollStore)

return function(p1, VerticalScrollingFrameRef)
	-- upvalues: AppCommonLibModule (copy), SignalsModule (copy)
	local NewResult = AppCommonLibModule.Signal.new()
	local Effect = SignalsModule.createEffect(function(p2)
		-- upvalues: p1 (copy), NewResult (copy)
		p1.getCanvasPosition(p2)
		p1.getContentHeight(p2)
		NewResult:fire()
	end)
	
	return {
		scrollViewPositionChangedSignal = NewResult,
		verticalScrollingFrameRef = VerticalScrollingFrameRef,
		destroy = function()
			-- upvalues: Effect (copy)
			Effect()
		end
	}
end