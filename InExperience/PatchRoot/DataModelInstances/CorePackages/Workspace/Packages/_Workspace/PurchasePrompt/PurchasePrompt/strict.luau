local function invalidKey(p1, p2)
	error(("%q (%s) is not a valid member of %s"):format(tostring(p2), typeof(p2), tostring(p1)), 2)
end

return function(p1, p2)
	-- upvalues: invalidKey (ref)
	return setmetatable(p1, {
		__index = invalidKey,
		__newindex = invalidKey,
		__tostring = function()
			-- upvalues: p2 (ref)
			return p2
		end
	})
end