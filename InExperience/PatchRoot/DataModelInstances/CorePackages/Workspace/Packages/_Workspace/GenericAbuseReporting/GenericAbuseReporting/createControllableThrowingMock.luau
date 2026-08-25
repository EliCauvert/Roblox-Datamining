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
		wrap = function(p0)
			-- upvalues: t (ref), reactModule (copy)
			return function(p1)
				-- upvalues: t (copy), reactModule (copy), p0 (ref)
				t.renderCount += 1
				local renderCount = t.renderCount
				local _, var2 = reactModule.useState(0)
				reactModule.useEffect(function()
					-- upvalues: t (copy), renderCount (ref), var2 (ref)
					if t.mode == "afterFirst" and renderCount == 1 then
						var2(1)
					end
				end, { renderCount })
				
				if t.mode == "always" then
					error("simulated render error (pre-handle)")
				elseif t.mode == "afterFirst" and renderCount > 1 then
					error("simulated render error (post-handle)")
				end
				return p0(p1)
			end
		end
	}
end