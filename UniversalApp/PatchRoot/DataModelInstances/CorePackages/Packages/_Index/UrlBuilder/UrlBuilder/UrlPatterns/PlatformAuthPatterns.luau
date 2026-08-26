return function(p1)
	return {
		account = function(p2)
			-- upvalues: p1 (ref)
			return p1.fromString("auth:v1/" .. p1 .. "/account")
		end,
		connect = function(p2)
			-- upvalues: p1 (ref)
			return p1.fromString("auth:v1/" .. p2 .. "/connect")
		end,
		disconnect = function(p2)
			-- upvalues: p1 (ref)
			return p1.fromString("auth:v1/" .. p3 .. "/disconnect")
		end,
		login = function(p2)
			-- upvalues: p1 (ref)
			return p1.fromString("auth:v1/" .. p4 .. "/login")
		end,
		signup = function(p2)
			-- upvalues: p1 (ref)
			return p1.fromString("auth:v1/" .. p5 .. "/signup")
		end
	}
end