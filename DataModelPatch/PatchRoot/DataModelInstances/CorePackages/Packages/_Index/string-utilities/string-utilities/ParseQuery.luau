local RunService = game:GetService("RunService")
local StringSplitModule = require(script.Parent.StringSplit)

function assertIsType(p1, ValueType, p2)
	-- upvalues: RunService (copy)
	if RunService:IsStudio() or _G.__TESTEZ_RUNNING_TEST__ then
		assert(typeof(p1) == ValueType, string.format("expects %s to be a %s! it was: %s", p2, ValueType, (typeof(p1))))
	end
end

local function urlDecode(Text: string): string
	assertIsType(Text, "string", "input")
	
	return (string.gsub(string.gsub(Text, "%%(%x%x)", function(Match): string
		return (string.char((tonumber(Match, 16))))
	end), "+", " "))
end

return function(p1, Callback)
	-- upvalues: StringSplitModule (copy), urlDecode (copy)
	if p1 ~= nil then
		assertIsType(p1, "string", "input")
	end
	if Callback ~= nil then
		assertIsType(Callback, "function", "listKeyMapper")
	end
	local IsFunction = type(Callback) == "function"
	local t = {}
	
	if p1 and #p1 > 0 then
		for _, value in ipairs((StringSplitModule(p1, "[&;]"))) do
			if value and #value > 0 then
				local Unpacked, Unpacked2 = unpack(string.split(value, "="))
				
				if Unpacked2 == nil then
					Unpacked2 = ""
				end
				local UrlDecodeResult = urlDecode(Unpacked)
				local UrlDecodeResult1 = urlDecode(Unpacked2)
				
				if IsFunction then
					if t[UrlDecodeResult] == nil then
						t[UrlDecodeResult] = UrlDecodeResult1
					else
						local CallbackResult = Callback(UrlDecodeResult)
						
						if CallbackResult == nil then
							CallbackResult = UrlDecodeResult
						end
						if type(t[CallbackResult]) ~= "table" then
							t[CallbackResult] = { t[UrlDecodeResult] }
						end
						table.insert(t[CallbackResult], UrlDecodeResult1)
						
						if UrlDecodeResult ~= CallbackResult then
							t[UrlDecodeResult] = UrlDecodeResult1
						end
					end
				else
					if t[UrlDecodeResult] == nil then
						t[UrlDecodeResult] = {}
					end
					table.insert(t[UrlDecodeResult], UrlDecodeResult1)
				end
			end
		end
	end
	return t
end