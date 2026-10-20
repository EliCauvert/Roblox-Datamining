return function(p1)
	return {
		account = function(Text)
			-- upvalues: p1 (copy)
			return p1.fromString("auth:v1/" .. Text .. "/account")
		end,
		connect = function(Text)
			-- upvalues: p1 (copy)
			return p1.fromString("auth:v1/" .. Text .. "/connect")
		end,
		disconnect = function(Text)
			-- upvalues: p1 (copy)
			return p1.fromString("auth:v1/" .. Text .. "/disconnect")
		end,
		login = function(Text)
			-- upvalues: p1 (copy)
			return p1.fromString("auth:v1/" .. Text .. "/login")
		end,
		signup = function(Text)
			-- upvalues: p1 (copy)
			return p1.fromString("auth:v1/" .. Text .. "/signup")
		end
	}
end