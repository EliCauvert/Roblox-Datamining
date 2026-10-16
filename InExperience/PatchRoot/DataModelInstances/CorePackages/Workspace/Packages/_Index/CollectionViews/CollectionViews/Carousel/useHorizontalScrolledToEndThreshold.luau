local parent = script:FindFirstAncestor("CollectionViews").Parent
local reactModule = require(parent.React)
local fFlagCollectionViewMathChanges = require(parent.SharedFlags).FFlagCollectionViewMathChanges

return function(p1, p2, p3, p4)
	-- upvalues: reactModule (ref), fFlagCollectionViewMathChanges (ref)
	local var1 = reactModule.useRef(false)
	reactModule.useEffect(function()
		-- upvalues: p4 (ref), p1 (ref), fFlagCollectionViewMathChanges (copy), p3 (ref), p2 (ref), var1 (ref)
		if not p4 then
			return nil
		end
		local t = {}
		
		if p1.current ~= nil and (fFlagCollectionViewMathChanges or (p3 ~= nil and p2 ~= nil)) then
			local current = p1.current
			
			local function checkThreshold()
				-- upvalues: current (ref), fFlagCollectionViewMathChanges (copy), p2 (copy), var1 (copy), p3 (copy)
				local var2 = current.AbsoluteCanvasSize.X - current.AbsoluteWindowSize.X - (if fFlagCollectionViewMathChanges then p2 or 0 else p2)
				local x = current.CanvasPosition.X
				
				if x < var2 and var1.current then
					var1.current = false
					
					return
				elseif var2 < x and not var1.current then
					var1.current = true
					
					if fFlagCollectionViewMathChanges then
						if p3 then
							p3()
							
							return
						end
					else
						p3()
					end
				end
			end
			
			table.insert(t, current:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(function()
				-- upvalues: checkThreshold (ref)
				checkThreshold()
			end))
			table.insert(t, current:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(function()
				-- upvalues: checkThreshold (ref)
				checkThreshold()
			end))
			table.insert(t, current:GetPropertyChangedSignal("CanvasPosition"):Connect(function()
				-- upvalues: checkThreshold (ref)
				checkThreshold()
			end))
			checkThreshold()
		end
		return function()
			-- upvalues: t (ref)
			for i, v in t do
				v:Disconnect()
			end
		end
	end, { p1, p4, p2, p3 })
end