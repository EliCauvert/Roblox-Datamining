local inExperienceSideSheet = script:FindFirstAncestor("InExperienceSideSheet")
local parent = inExperienceSideSheet.Parent
local reactModule = require(parent.React)
local tweenDuration = require(inExperienceSideSheet.Common.Constants).TweenDuration
local getDrawerVisibleStore = require(parent.Drawer).Stores.GetDrawerVisibleStore
local animateScrollViewToSelectionHelper = require(parent.AppBlox).AnimateScrollViewToSelectionHelper

return function()
	-- upvalues: reactModule (ref), getDrawerVisibleStore (ref), animateScrollViewToSelectionHelper (ref), tweenDuration (ref)
	local var1 = reactModule.useRef({})
	local var2 = reactModule.useRef(nil)
	local var3 = reactModule.useRef(nil)
	local getDrawerAnimating = getDrawerVisibleStore(false).getDrawerAnimating
	local var4 = reactModule.useCallback(function()
		-- upvalues: var1 (ref), var2 (ref)
		if var1.current then
			for i, v in var1.current do
				v:Disconnect()
			end
			var1.current = {}
		end
		if var2.current then
			var2.current:Cancel()
			var2.current = nil
		end
	end, {})
	local var5 = reactModule.useCallback(function(p1)
		-- upvalues: var3 (ref), var4 (ref), var1 (ref), var2 (ref), animateScrollViewToSelectionHelper (copy), tweenDuration (copy), getDrawerAnimating (ref)
		if var3.current == p1 then return end
		if p1 then
			var4()
			var3.current = p1
			local var6, var7 = animateScrollViewToSelectionHelper(p1, tweenDuration, getDrawerAnimating)
			var1.current = var6
			var2.current = var7
			
			return
		end
		var3.current = nil
		var4()
	end, { var1, var4, getDrawerAnimating })
	reactModule.useEffect(function()
		-- upvalues: var4 (ref)
		return var4
	end, { var4 })
	
	return var5
end