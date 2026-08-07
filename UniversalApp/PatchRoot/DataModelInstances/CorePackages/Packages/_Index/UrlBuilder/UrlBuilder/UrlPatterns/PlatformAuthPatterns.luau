return function(p0) --[[ line: 1 ]]
	return {
		account = function(p1) --[[ line: 4 ]]
			-- upvalues: p0 (ref)
			return p0.fromString("auth:v1/" .. p1 .. "/account")
		end,
		connect = function(p2) --[[ line: 8 ]]
			-- upvalues: p0 (ref)
			return p0.fromString("auth:v1/" .. p2 .. "/connect")
		end,
		disconnect = function(p3) --[[ line: 12 ]]
			-- upvalues: p0 (ref)
			return p0.fromString("auth:v1/" .. p3 .. "/disconnect")
		end,
		login = function(p4) --[[ line: 16 ]]
			-- upvalues: p0 (ref)
			return p0.fromString("auth:v1/" .. p4 .. "/login")
		end,
		signup = function(p5) --[[ line: 20 ]]
			-- upvalues: p0 (ref)
			return p0.fromString("auth:v1/" .. p5 .. "/signup")
		end
	}
end