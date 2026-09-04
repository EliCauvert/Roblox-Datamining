local appPageShell = script:FindFirstAncestor("AppPageShell")
local signalsModule = require(appPageShell.Parent.Signals)
local isEndReachedModule = require(appPageShell.isEndReached)

return function()
	-- upvalues: signalsModule (ref), isEndReachedModule (ref)
	local var1, var2 = signalsModule.createSignal(nil)
	local var3, var4 = signalsModule.createSignal(0)
	local var5, var6 = signalsModule.createSignal(0)
	local var7, var8 = signalsModule.createSignal(0)
	local var9, var10 = signalsModule.createSignal(nil)
	
	return {
		getScrollingFrame = var1,
		setScrollingFrame = function(value)
			-- upvalues: var2 (ref)
			var2(value)
		end,
		getCanvasPosition = var3,
		getViewportHeight = var5,
		getContentHeight = var7,
		setCanvasPosition = var4,
		setViewportHeight = var6,
		setContentHeight = var8,
		getIsEndReached = signalsModule.createComputed(function(p1)
			-- upvalues: isEndReachedModule (copy), var3 (ref), var5 (ref), var7 (ref), var9 (ref)
			return isEndReachedModule(var3(p1), var5(p1), var7(p1), var9(p1))
		end),
		setEndReachedThreshold = var10
	}
end