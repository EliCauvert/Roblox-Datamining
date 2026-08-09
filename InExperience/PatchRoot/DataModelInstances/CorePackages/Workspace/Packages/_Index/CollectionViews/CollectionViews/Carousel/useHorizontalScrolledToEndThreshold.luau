local parent = script:FindFirstAncestor("CollectionViews").Parent
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagLuaAppCompositionSupport = sharedFlagsModule.FFlagLuaAppCompositionSupport
local fFlagCollectionViewMathChanges = sharedFlagsModule.FFlagCollectionViewMathChanges

return function(p0, p1, p2, p3) --[[ line: 10 | named "useHorizontalScrolledToEndThreshold" ]]
	-- upvalues: reactModule (ref), fFlagCollectionViewMathChanges (ref), fFlagLuaAppCompositionSupport (ref)
	local var2 = reactModule.useRef(false)
	reactModule.useEffect(function() --[[ line: 25 ]]
		-- upvalues: p3 (ref), p0 (ref), fFlagCollectionViewMathChanges (copy), p2 (ref), p1 (ref), var2 (ref), fFlagLuaAppCompositionSupport (copy)
		if not p3 then
			return nil
		end
		local t = {}
		
		if p0.current ~= nil and (fFlagCollectionViewMathChanges or (p2 ~= nil and p1 ~= nil)) then
			local current = p0.current
			
			local function checkThreshold() --[[ line: 36 ]]
				-- upvalues: current (ref), fFlagCollectionViewMathChanges (copy), p1 (copy), var2 (copy), p2 (copy)
				local var5 = current.AbsoluteCanvasSize.X - current.AbsoluteWindowSize.X - (if fFlagCollectionViewMathChanges then p1 or 0 else p1)
				local x = current.CanvasPosition.X
				
				if x < var5 and var2.current then
					var2.current = false
					
					return
				elseif var5 < x and not var2.current then
					var2.current = true
					
					if fFlagCollectionViewMathChanges then
						if p2 then
							p2()
							
							return
						end
					else
						p2()
					end
				end
			end
			
			table.insert(t, current:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(function() --[[ line: 56 ]]
				-- upvalues: checkThreshold (ref)
				checkThreshold()
			end))
			table.insert(t, current:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(function() --[[ line: 63 ]]
				-- upvalues: checkThreshold (ref)
				checkThreshold()
			end))
			table.insert(t, current:GetPropertyChangedSignal("CanvasPosition"):Connect(function() --[[ line: 69 ]]
				-- upvalues: checkThreshold (ref)
				checkThreshold()
			end))
			
			if fFlagLuaAppCompositionSupport then
				checkThreshold()
			end
		end
		return function() --[[ line: 77 ]]
			-- upvalues: t (ref)
			for i, v in t do
				v:Disconnect()
			end
		end
	end, { p0, p3, p1, p2 })
end