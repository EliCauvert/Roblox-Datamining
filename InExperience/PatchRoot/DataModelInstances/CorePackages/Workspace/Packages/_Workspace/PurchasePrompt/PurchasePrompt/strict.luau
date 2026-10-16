local function invalidKey(p1, p2) --[[ Line: 7 ]]
	error(("%q (%s) is not a valid member of %s"):format(tostring(p2), typeof(p2), (tostring(p1))), 2)
end

return function(p1, p2) --[[ Line: 13 | Named "strict" ]]
	-- upvalues: invalidKey (copy)
	return (setmetatable(p1, {
		__index = invalidKey,
		__newindex = invalidKey,
		__tostring = function() --[[ Line: 17 ]]
			-- upvalues: p2 (copy)
			return p2
		end
	}))
end