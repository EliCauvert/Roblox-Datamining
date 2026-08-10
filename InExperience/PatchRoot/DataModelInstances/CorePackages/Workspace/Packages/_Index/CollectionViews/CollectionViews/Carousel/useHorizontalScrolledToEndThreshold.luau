local parent = script:FindFirstAncestor("CollectionViews").Parent
local reactModule = require(parent.React)
local fFlagCollectionViewMathChanges = require(parent.SharedFlags).FFlagCollectionViewMathChanges

return function(p0, p1, p2, p3) --[[ line: 9 | named "useHorizontalScrolledToEndThreshold" ]]
	-- upvalues: reactModule (ref), fFlagCollectionViewMathChanges (ref)
	local var1 = reactModule.useRef(false)
	reactModule.useEffect(function() --[[ line: 24 ]]
		-- upvalues: p3 (ref), p0 (ref), fFlagCollectionViewMathChanges (copy), p2 (ref), p1 (ref), var1 (ref)
		if not p3 then
			return nil
		end
		local t = {}
		
		if p0.current ~= nil and (fFlagCollectionViewMathChanges or (p2 ~= nil and p1 ~= nil)) then
			local current = p0.current
			
			local function checkThreshold() --[[ line: 35 ]]
				-- upvalues: current (ref), fFlagCollectionViewMathChanges (copy), p1 (copy), var1 (copy), p2 (copy)
				local var4 = current.AbsoluteCanvasSize.X - current.AbsoluteWindowSize.X - (if fFlagCollectionViewMathChanges then p1 or 0 else p1)
				local x = current.CanvasPosition.X
				
				if x < var4 and var1.current then
					var1.current = false
					
					return
				elseif var4 < x and not var1.current then
					var1.current = true
					
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
			
			table.insert(t, current:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(function() --[[ line: 55 ]]
				-- upvalues: checkThreshold (ref)
				checkThreshold()
			end))
			table.insert(t, current:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(function() --[[ line: 62 ]]
				-- upvalues: checkThreshold (ref)
				checkThreshold()
			end))
			table.insert(t, current:GetPropertyChangedSignal("CanvasPosition"):Connect(function() --[[ line: 68 ]]
				-- upvalues: checkThreshold (ref)
				checkThreshold()
			end))
			checkThreshold()
		end
		return function() --[[ line: 74 ]]
			-- upvalues: t (ref)
			for i, v in t do
				v:Disconnect()
			end
		end
	end, { p0, p3, p1, p2 })
end