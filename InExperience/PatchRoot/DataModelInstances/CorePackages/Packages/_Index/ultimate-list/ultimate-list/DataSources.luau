local t = {
	array = function(p1)
		return { type = "array", array = p1 }
	end,
	mutableSource = function(p1)
		return { type = "mutableSource", methods = p1 }
	end,
	utilities = {}
}

function t.utilities.createGetSimpleCursor(p1, p2)
	return function(p3)
		-- upvalues: p2 (ref), p1 (ref)
		local var1 = p2()
		
		local function getWithCursor(p4)
			-- upvalues: var1 (ref), getWithCursor (ref), p1 (copy)
			return if p4 < 1 or var1 < p4 then nil else {
				before = function()
					-- upvalues: getWithCursor (copy), p4 (ref)
					return getWithCursor(p4 - 1)
				end,
				value = p1(p4),
				after = function()
					-- upvalues: getWithCursor (copy), p4 (ref)
					return getWithCursor(p4 + 1)
				end
			}
		end
		
		return getWithCursor(p3)
	end
end

return t