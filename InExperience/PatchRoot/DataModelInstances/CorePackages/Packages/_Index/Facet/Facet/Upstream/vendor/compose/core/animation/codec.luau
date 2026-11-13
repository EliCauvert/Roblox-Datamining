local DiagnosticsModule = require("../diagnostics")

return {
	number = {
		arity = 1,
		encode = function(p1, Entry)
			-- upvalues: DiagnosticsModule (copy)
			if type(p1) == "number" then
				Entry[1] = p1
				
				return
			else
				return DiagnosticsModule.raise("animation/no-codec", "numeric motion requires a number", {
					fix = "select runtime.motion(codec) for another value type",
					actual = DiagnosticsModule.describe(p1)
				})
			end
		end,
		decode = function(Entry)
			return Entry[1]
		end
	},
	validate = function(p1)
		-- upvalues: DiagnosticsModule (copy)
		if type(p1) ~= "table" or type(p1.arity) ~= "number" or p1.arity < 1 or p1.arity % 1 ~= 0 then
			return DiagnosticsModule.raise("animation/codec-invalid", "the motion codec is not usable", {
				contract = "a codec needs a positive integer arity, an encode, and a decode"
			})
		elseif type(p1.encode) == "function" and type(p1.decode) == "function" then return end
		return DiagnosticsModule.raise("animation/codec-invalid", "the motion codec is not usable", {
			contract = "a codec needs a positive integer arity, an encode, and a decode"
		})
	end
}