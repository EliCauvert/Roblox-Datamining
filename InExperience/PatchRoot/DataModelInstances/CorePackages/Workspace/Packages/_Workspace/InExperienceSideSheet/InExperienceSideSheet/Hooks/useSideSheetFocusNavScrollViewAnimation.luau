local InExperienceSideSheet = script:FindFirstAncestor("InExperienceSideSheet")
local Parent = InExperienceSideSheet.Parent
local ReactModule = require(Parent.React)
local TweenDuration = require(InExperienceSideSheet.Common.Constants).TweenDuration
local GetDrawerVisibleStoreFunction = require(Parent.Drawer).Stores.GetDrawerVisibleStore
local AnimateScrollViewToSelectionHelperFunction = require(Parent.AppBlox).AnimateScrollViewToSelectionHelper

return function()
	-- upvalues: ReactModule (copy), GetDrawerVisibleStoreFunction (copy), AnimateScrollViewToSelectionHelperFunction (copy), TweenDuration (copy)
	local UseRefResult = ReactModule.useRef({})
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseRefResult2 = ReactModule.useRef(nil)
	local GetDrawerAnimating = GetDrawerVisibleStoreFunction(false).getDrawerAnimating
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseRefResult (copy), UseRefResult1 (copy)
		if UseRefResult.current then
			for _, Connection in UseRefResult.current do
				Connection:Disconnect()
			end
			UseRefResult.current = {}
		end
		if UseRefResult1.current then
			UseRefResult1.current:Cancel()
			UseRefResult1.current = nil
		end
	end, {})
	local UseResult1 = ReactModule.useCallback(function(Current)
		-- upvalues: UseRefResult2 (copy), UseResult (copy), UseRefResult (copy), UseRefResult1 (copy), AnimateScrollViewToSelectionHelperFunction (upval), TweenDuration (upval), GetDrawerAnimating (copy)
		if UseRefResult2.current == Current then return end
		if Current then
			UseResult()
			UseRefResult2.current = Current
			UseRefResult.current, UseRefResult1.current = AnimateScrollViewToSelectionHelperFunction(Current, TweenDuration, GetDrawerAnimating)
			
			return
		else
			UseRefResult2.current = nil
			UseResult()
		end
	end, { UseRefResult, UseResult, GetDrawerAnimating })
	ReactModule.useEffect(function()
		-- upvalues: UseResult (copy)
		return UseResult
	end, { UseResult })
	
	return UseResult1
end