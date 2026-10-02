local t = { [Enum.KeyCode.Up] = true, [Enum.KeyCode.DPadUp] = true }

return function(p1, p2, p3)
	-- upvalues: t (ref)
	return if t[p1] then if p2 then if p3 ~= nil then p3 == "" else true else false else false
end