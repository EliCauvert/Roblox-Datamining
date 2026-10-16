local MakeUniqueIdModule = {}
local LuauPolyfillModule = require(script.Parent.Parent.Parent.Parent.LuauPolyfill)
local Boolean = LuauPolyfillModule.Boolean
local NewResult = LuauPolyfillModule.Map.new(nil)
local list = {
	"0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "a", "b", "c", "d", "e", "f",
	"g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v",
	"w", "x", "y", "z"
}
math.randomseed(os.clock())

local function uuid(): string --[[ Line: 59 ]]
	-- upvalues: list (copy)
	local Text = ""
	
	for _ = 1, 11 do
		Text ..= list[math.random(1, 36)]
	end
	return Text
end

MakeUniqueIdModule.uuid = uuid

function MakeUniqueIdModule.makeUniqueId(p1): string --[[ Line: 68 ]]
	-- upvalues: uuid (copy), Boolean (copy), NewResult (copy)
	local UuidResult = uuid()
	local GetResult = Boolean.toJSBoolean(NewResult:get(p1)) and NewResult:get(p1) or 1
	NewResult:set(p1, GetResult + 1)
	
	return ("%s:%s:%s"):format(p1, tostring(GetResult), UuidResult)
end

return MakeUniqueIdModule