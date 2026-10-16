return {
	deprecate = function(Callback, p1, p2) --[[ Line: 4 ]]
		return function(...) --[[ Line: 5 ]]
			-- upvalues: p1 (copy), p2 (copy), Callback (copy)
			if p1 then
				warn(("[http] %s deprecated in version %s. See documentation at http://requests.paric.xyz/"):format(p2, p1 or "Function"))
			else
				warn(("[http] %s deprecated. See documentation at http://requests.paric.xyz/"):format(p2 or "Function"))
			end
			return Callback(...)
		end
	end
}