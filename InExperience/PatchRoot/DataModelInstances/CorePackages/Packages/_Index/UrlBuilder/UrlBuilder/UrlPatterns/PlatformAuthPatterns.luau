return function(p1) --[[ Line: 1 ]]
	return {
		account = function(Text) --[[ Line: 4 ]]
			-- upvalues: p1 (copy)
			return p1.fromString("auth:v1/" .. Text .. "/account")
		end,
		connect = function(Text) --[[ Line: 8 ]]
			-- upvalues: p1 (copy)
			return p1.fromString("auth:v1/" .. Text .. "/connect")
		end,
		disconnect = function(Text) --[[ Line: 12 ]]
			-- upvalues: p1 (copy)
			return p1.fromString("auth:v1/" .. Text .. "/disconnect")
		end,
		login = function(Text) --[[ Line: 16 ]]
			-- upvalues: p1 (copy)
			return p1.fromString("auth:v1/" .. Text .. "/login")
		end,
		signup = function(Text) --[[ Line: 20 ]]
			-- upvalues: p1 (copy)
			return p1.fromString("auth:v1/" .. Text .. "/signup")
		end
	}
end