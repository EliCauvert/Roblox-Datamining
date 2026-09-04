local appPageShell = script:FindFirstAncestor("AppPageShell")
local parent = appPageShell.Parent
local appCommonLibModule = require(parent.AppCommonLib)
local signalsModule = require(parent.Signals)
local _ = require(appPageShell.createPageScrollStore)

return function(p1, p2)
	-- upvalues: appCommonLibModule (ref), signalsModule (ref)
	local var1 = appCommonLibModule.Signal.new()
	local var2 = signalsModule.createEffect(function(p3)
		-- upvalues: p1 (ref), var1 (ref)
		p1.getCanvasPosition(p3)
		p1.getContentHeight(p3)
		var1:fire()
	end)
	
	return {
		scrollViewPositionChangedSignal = var1,
		verticalScrollingFrameRef = p2,
		destroy = function()
			-- upvalues: var2 (ref)
			var2()
		end
	}
end