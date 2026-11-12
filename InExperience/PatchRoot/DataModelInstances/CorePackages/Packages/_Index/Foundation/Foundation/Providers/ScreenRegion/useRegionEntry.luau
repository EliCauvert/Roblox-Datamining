local ReactModule = require(script:FindFirstAncestor("Foundation").Parent.React)
local _ = require(script.Parent.ScreenRegion)
local _ = require(script.Parent.ScreenRegionKind)
local ScreenRegionContext = require(script.Parent.ScreenRegionProvider).ScreenRegionContext
local Count = 0
local config = { isVisible = false, isDismissed = false }

return function(p1, p2)
	-- upvalues: ReactModule (copy), ScreenRegionContext (copy), Count (ref), config (copy)
	local UseContextResult = ReactModule.useContext(ScreenRegionContext)
	local UseMemoResult = ReactModule.useMemo(function(): number
		-- upvalues: Count (upval)
		Count += 1
		
		return Count
	end, {})
	local UseStateResult, UseStateResult2 = ReactModule.useState(config)
	ReactModule.useLayoutEffect(function()
		-- upvalues: UseContextResult (copy), p1 (copy), UseMemoResult (copy), p2 (copy), UseStateResult2 (copy)
		if UseContextResult == nil or p1 == nil then
			return nil
		else
			UseContextResult.register(p1, UseMemoResult, p2.kind, UseStateResult2)
			
			return function()
				-- upvalues: UseContextResult (upval), p1 (upval), UseMemoResult (upval)
				UseContextResult.unregister(p1, UseMemoResult)
			end
		end
	end, { UseContextResult, p1, UseMemoResult, p2.kind })
	ReactModule.useLayoutEffect(function()
		-- upvalues: UseContextResult (copy), p1 (copy), UseMemoResult (copy), p2 (copy)
		if UseContextResult ~= nil and p1 ~= nil then
			UseContextResult.update(p1, UseMemoResult, {
				isOpen = p2.isOpen,
				isMounted = p2.isMounted,
				claimKey = p2.claimKey,
				priority = p2.priority
			})
		end
	end, {
		UseContextResult, p1, UseMemoResult, p2.kind, p2.isOpen, p2.isMounted,
		p2.claimKey, p2.priority
	})
	
	return if UseContextResult == nil or p1 == nil then { isDismissed = false, isVisible = p2.isOpen } else UseStateResult
end