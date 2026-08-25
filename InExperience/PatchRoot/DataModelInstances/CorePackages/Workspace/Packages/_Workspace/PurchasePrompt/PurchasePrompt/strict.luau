local function invalidKey(p0, p1)
	error(("%q (%s) is not a valid member of %s"):format(tostring(p1), typeof(p1), tostring(p0)), 2)
end

return function(p2, p3)
	-- upvalues: invalidKey (ref)
	return setmetatable(p2, {
		__index = invalidKey,
		__newindex = invalidKey,
		__tostring = function()
			-- upvalues: p3 (ref)
			return p3
		end
	})
end