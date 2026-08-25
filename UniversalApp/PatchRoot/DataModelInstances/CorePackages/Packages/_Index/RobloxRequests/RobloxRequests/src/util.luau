return {
	deprecate = function(p0, p1, p2)
		return function(...)
			-- upvalues: p1 (ref), p2 (ref), p0 (ref)
			if p1 then
				warn(("[http] %s deprecated in version %s. See documentation at http://requests.paric.xyz/"):format(p2, p1 or "Function"))
			else
				warn(("[http] %s deprecated. See documentation at http://requests.paric.xyz/"):format(p2 or "Function"))
			end
			return p0(...)
		end
	end
}