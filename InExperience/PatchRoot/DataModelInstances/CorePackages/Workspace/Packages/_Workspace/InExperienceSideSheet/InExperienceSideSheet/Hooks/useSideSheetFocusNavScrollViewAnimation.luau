local inExperienceSideSheet = script:FindFirstAncestor("InExperienceSideSheet")
local parent = inExperienceSideSheet.Parent
local reactModule = require(parent.React)
local tweenDuration = require(inExperienceSideSheet.Common.Constants).TweenDuration
local getDrawerVisibleStore = require(parent.Drawer).Stores.GetDrawerVisibleStore
local animateScrollViewToSelectionHelper = require(parent.AppBlox).AnimateScrollViewToSelectionHelper

return function()
	-- upvalues: reactModule (ref), getDrawerVisibleStore (ref), animateScrollViewToSelectionHelper (ref), tweenDuration (ref)
	local var2 = reactModule.useRef({})
	local var3 = reactModule.useRef(nil)
	local var4 = reactModule.useRef(nil)
	local getDrawerAnimating = getDrawerVisibleStore(false).getDrawerAnimating
	local var5 = reactModule.useCallback(function()
		-- upvalues: var2 (ref), var3 (ref)
		if var2.current then
			for i, v in var2.current do
				v:Disconnect()
			end
			var2.current = {}
		end
		if var3.current then
			var3.current:Cancel()
			var3.current = nil
		end
	end, {})
	local var6 = reactModule.useCallback(function(p0)
		-- upvalues: var4 (ref), var5 (ref), var2 (ref), var3 (ref), animateScrollViewToSelectionHelper (copy), tweenDuration (copy), getDrawerAnimating (ref)
		if var4.current == p0 then return end
		if p0 then
			var5()
			var4.current = p0
			local var7, var8 = animateScrollViewToSelectionHelper(p0, tweenDuration, getDrawerAnimating)
			var2.current = var7
			var3.current = var8
			
			return
		end
		var4.current = nil
		var5()
	end, { var2, var5, getDrawerAnimating })
	reactModule.useEffect(function()
		-- upvalues: var5 (ref)
		return var5
	end, { var5 })
	
	return var6
end