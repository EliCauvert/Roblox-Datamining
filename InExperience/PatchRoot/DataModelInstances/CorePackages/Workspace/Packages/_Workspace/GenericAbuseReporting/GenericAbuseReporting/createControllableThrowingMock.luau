local reactModule = require(script:FindFirstAncestor("GenericAbuseReporting").Parent.React)

return function()
	-- upvalues: reactModule (ref)
	local t = { mode = nil, renderCount = 0 }
	
	return {
		reset = function()
			-- upvalues: t (ref)
			t.mode = nil
			t.renderCount = 0
		end,
		setMode = function(value)
			-- upvalues: t (ref)
			t.mode = value
		end,
		wrap = function(p1)
			-- upvalues: t (ref), reactModule (copy)
			return function(p2)
				-- upvalues: t (copy), reactModule (copy), p1 (ref)
				t.renderCount += 1
				local renderCount = t.renderCount
				local _, var1 = reactModule.useState(0)
				reactModule.useEffect(function()
					-- upvalues: t (copy), renderCount (ref), var1 (ref)
					if t.mode == "afterFirst" and renderCount == 1 then
						var1(1)
					end
				end, { renderCount })
				
				if t.mode == "always" then
					error("simulated render error (pre-handle)")
				elseif t.mode == "afterFirst" and renderCount > 1 then
					error("simulated render error (post-handle)")
				end
				return p1(p2)
			end
		end
	}
end