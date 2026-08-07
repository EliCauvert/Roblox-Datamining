local t = {
	array = function(p0) --[[ line: 40 ]]
		return { type = "array", array = p0 }
	end,
	mutableSource = function(p1) --[[ line: 47 ]]
		return { type = "mutableSource", methods = p1 }
	end,
	utilities = {}
}

function t.utilities.createGetSimpleCursor(p2, p3) --[[ line: 58 ]]
	return function(p4) --[[ line: 63 ]]
		-- upvalues: p3 (ref), p2 (ref)
		local var1 = p3()
		
		local function getWithCursor(p5) --[[ line: 66 ]]
			-- upvalues: var1 (ref), getWithCursor (ref), p2 (copy)
			return if p5 < 1 or var1 < p5 then nil else {
				before = function() --[[ line: 72 ]]
					-- upvalues: getWithCursor (copy), p5 (ref)
					return getWithCursor(p5 - 1)
				end,
				value = p2(p5),
				after = function() --[[ line: 78 ]]
					-- upvalues: getWithCursor (copy), p5 (ref)
					return getWithCursor(p5 + 1)
				end
			}
		end
		
		return getWithCursor(p4)
	end
end

return t