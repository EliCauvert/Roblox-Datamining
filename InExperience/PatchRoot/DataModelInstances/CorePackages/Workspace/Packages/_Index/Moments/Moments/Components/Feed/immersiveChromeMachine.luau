return function(p1, p2)
	local NowFunction = p2.now
	local Flag = true
	local Count = 0
	local v1 = nil
	local Count1 = 0
	local Flag1 = true
	local Flag2 = false
	local ForceShow = false
	local ForceHide = false
	local NowResult = NowFunction()
	local v2 = -1e999
	
	local function _(p3)
		-- upvalues: ForceHide (ref), Count (ref), NowResult (ref), NowFunction (copy), Flag (ref), p2 (copy)
		if ForceHide then return end
		Count = 0
		NowResult = NowFunction()
		
		if not Flag then
			Flag = true
			p2.setChromeVisible(true, p3)
			
			return
		end
	end
	
	local _ = function(p3)
		-- upvalues: Flag (ref), v2 (ref), NowFunction (copy), p2 (copy)
		if Flag then
			Flag = false
			v2 = NowFunction()
			p2.setChromeVisible(false, p3 or "advance")
			
			return
		end
	end
	
	local _ = function(p3): boolean
		-- upvalues: ForceShow (ref), Flag (ref), p1 (copy), Flag2 (ref), Flag1 (ref), NowFunction (copy), NowResult (ref)
		return not ForceShow and Flag and (p3 >= p1.hideAfterAdvances and ((not Flag2 or Flag1 or p1.hideAwayFromPausedItem) and p1.shownDwellMs <= NowFunction() - NowResult))
	end
	
	local _ = function()
		-- upvalues: Count (ref), ForceShow (ref), Flag (ref), p1 (copy), Flag2 (ref), Flag1 (ref), NowFunction (copy), NowResult (ref), v2 (ref), p2 (copy)
		if not ForceShow and Flag and (Count >= p1.hideAfterAdvances and ((not Flag2 or Flag1 or p1.hideAwayFromPausedItem) and NowFunction() - NowResult >= p1.shownDwellMs)) then
			if not Flag then return end
			Flag = false
			v2 = NowFunction()
			p2.setChromeVisible(false, "advance")
		end
	end
	
	return {
		onActiveUpdate = function(p3, p4, p5)
			-- upvalues: v1 (ref), Flag1 (ref), Flag2 (ref), Count1 (ref), ForceHide (ref), Count (ref), NowResult (ref), NowFunction (copy), Flag (ref), p2 (copy), ForceShow (ref), p1 (copy), v2 (ref)
			local v3 = v1
			
			if v3 == nil then
				v1 = p3
				Flag1 = p4
				Flag2 = p4
				
				return
			end
			local v4 = p3 - v3
			v1 = p3
			
			if v4 ~= 0 then
				if Count1 > 0 and Count1 <= p3 then
					if not ForceHide then
						Count = 0
						NowResult = NowFunction()
						
						if not Flag then
							Flag = true
							p2.setChromeVisible(true, "endOfFeed")
						end
					end
				elseif v4 == 1 then
					Count += 1
					
					if not ForceShow and Flag and (Count >= p1.hideAfterAdvances and ((not Flag2 or Flag1 or p1.hideAwayFromPausedItem) and NowFunction() - NowResult >= p1.shownDwellMs)) and Flag then
						Flag = false
						v2 = NowFunction()
						p2.setChromeVisible(false, "advance")
					end
				elseif v4 < 0 then
					if not ForceHide then
						Count = 0
						NowResult = NowFunction()
						
						if not Flag then
							Flag = true
							p2.setChromeVisible(true, "reverse")
						end
					end
				else
					Count = 0
				end
				Flag2 = false
				
				return
			elseif p5 then return end
			if p4 then
				local Flag2_1: boolean = not Flag1 and Flag2
				Flag1 = true
				Flag2 = true
				
				if Flag2_1 then
					NowResult = NowFunction()
				end
				return
			elseif not Flag1 then return end
			Flag1 = false
			
			if not Flag2 then return end
			if ForceShow then return end
			if NowFunction() - v2 < p1.hiddenCooldownMs then return end
			if ForceHide then return end
			Count = 0
			NowResult = NowFunction()
			
			if not Flag then
				Flag = true
				p2.setChromeVisible(true, "pause")
				
				return
			end
		end,
		setForceShow = function(Value)
			-- upvalues: ForceShow (ref), ForceHide (ref), Count (ref), NowResult (ref), NowFunction (copy), Flag (ref), p2 (copy)
			if Value == ForceShow then return end
			ForceShow = Value
			
			if ForceShow then
				if ForceHide then return end
				Count = 0
				NowResult = NowFunction()
				
				if Flag then return end
				Flag = true
				p2.setChromeVisible(true, "force")
			end
		end,
		setForceHide = function(Value)
			-- upvalues: ForceHide (ref), Flag (ref), v2 (ref), NowFunction (copy), p2 (copy), Count (ref), NowResult (ref)
			if Value == ForceHide then return end
			ForceHide = Value
			
			if ForceHide then
				if Flag then
					Flag = false
					v2 = NowFunction()
					p2.setChromeVisible(false, "force")
					
					return
				end
				return
			elseif ForceHide then return end
			Count = 0
			NowResult = NowFunction()
			
			if not Flag then
				Flag = true
				p2.setChromeVisible(true, "reveal")
				
				return
			end
		end,
		setCount = function(Value)
			-- upvalues: Count1 (ref)
			Count1 = Value
		end,
		reveal = function()
			-- upvalues: ForceHide (ref), Count (ref), NowResult (ref), NowFunction (copy), Flag (ref), p2 (copy)
			if ForceHide then return end
			Count = 0
			NowResult = NowFunction()
			
			if not Flag then
				Flag = true
				p2.setChromeVisible(true, "reveal")
				
				return
			end
		end,
		willHideOnNextAdvance = function(): boolean
			-- upvalues: v1 (ref), Count1 (ref), Count (ref), ForceShow (ref), Flag (ref), p1 (copy), Flag2 (ref), Flag1 (ref), NowFunction (copy), NowResult (ref)
			return (Count1 <= 0 or Count1 > (v1 or 1) + 1) and (not ForceShow and Flag and (Count + 1 >= p1.hideAfterAdvances and ((not Flag2 or Flag1 or p1.hideAwayFromPausedItem) and p1.shownDwellMs <= NowFunction() - NowResult)))
		end,
		isVisible = function()
			-- upvalues: Flag (ref)
			return Flag
		end
	}
end