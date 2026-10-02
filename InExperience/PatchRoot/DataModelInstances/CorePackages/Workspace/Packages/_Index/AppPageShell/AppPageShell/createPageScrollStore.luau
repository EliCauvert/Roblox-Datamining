local appPageShell = script:FindFirstAncestor("AppPageShell")
local parent = appPageShell.Parent
local signalsModule = require(parent.Signals)
local signalsExperimentalModule = require(parent.SignalsExperimental)
local isEndReachedModule = require(appPageShell.isEndReached)
local fFlagSduiFeedScrollBarFixes = require(parent.SharedFlags).FFlagSduiFeedScrollBarFixes

return function()
	-- upvalues: signalsModule (ref), isEndReachedModule (ref), signalsExperimentalModule (ref), fFlagSduiFeedScrollBarFixes (ref)
	local var1, var2 = signalsModule.createSignal(nil)
	local var3, var4 = signalsModule.createSignal(0)
	local var5, var6 = signalsModule.createSignal(0)
	local var7, var8 = signalsModule.createSignal(0)
	local var9, var10 = signalsModule.createSignal(nil)
	
	local function _(p1)
		-- upvalues: var6 (ref), var8 (ref)
		var6(p1.AbsoluteWindowSize.Y)
		var8(p1.AbsoluteCanvasSize.Y)
	end
	
	return {
		getScrollingFrame = var1,
		setScrollingFrame = function(value)
			-- upvalues: var2 (ref), fFlagSduiFeedScrollBarFixes (copy), signalsExperimentalModule (copy), var4 (ref), var6 (ref), var8 (ref)
			var2(value)
			
			if fFlagSduiFeedScrollBarFixes and value ~= nil then
				signalsExperimentalModule.batch(function()
					-- upvalues: value (ref), var4 (copy), var6 (copy), var8 (copy)
					var4(value.CanvasPosition.Y)
					var6(value.AbsoluteWindowSize.Y)
					var8(value.AbsoluteCanvasSize.Y)
				end)
			end
		end,
		getCanvasPosition = var3,
		getViewportHeight = var5,
		getContentHeight = var7,
		setCanvasPosition = var4,
		setViewportHeight = var6,
		setContentHeight = var8,
		setCanvasPositionFromScrollingFrame = function(value)
			-- upvalues: var4 (ref)
			var4(value.CanvasPosition.Y)
		end,
		setViewportHeightFromScrollingFrame = function(value)
			-- upvalues: var6 (ref)
			var6(value.AbsoluteWindowSize.Y)
		end,
		setContentHeightFromScrollingFrame = function(value)
			-- upvalues: var8 (ref)
			var8(value.AbsoluteCanvasSize.Y)
		end,
		setExtentsFromScrollingFrame = function(value)
			-- upvalues: signalsExperimentalModule (copy), var6 (ref), var8 (ref)
			signalsExperimentalModule.batch(function()
				-- upvalues: value (ref), var6 (copy), var8 (copy)
				var6(value.AbsoluteWindowSize.Y)
				var8(value.AbsoluteCanvasSize.Y)
			end)
		end,
		getIsEndReached = signalsModule.createComputed(function(p1)
			-- upvalues: isEndReachedModule (copy), var3 (ref), var5 (ref), var7 (ref), var9 (ref)
			return isEndReachedModule(var3(p1), var5(p1), var7(p1), var9(p1))
		end),
		setEndReachedThreshold = var10
	}
end