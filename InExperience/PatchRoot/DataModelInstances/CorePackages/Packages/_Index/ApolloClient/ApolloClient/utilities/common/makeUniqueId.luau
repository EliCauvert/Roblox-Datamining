local t = {}
local luauPolyfillModule = require(script.Parent.Parent.Parent.Parent.LuauPolyfill)
local boolean = luauPolyfillModule.Boolean
local var2 = luauPolyfillModule.Map.new(nil)
local list = {
	"0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "a", "b", "c", "d", "e", "f",
	"g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v",
	"w", "x", "y", "z"
}
math.randomseed(os.clock())

local function uuid() --[[ line: 59 ]]
	-- upvalues: list (ref)
	local var6 = ""
	
	for _ = 1, 11 do
		var6 ..= list[math.random(1, 36)]
	end
	return var6
end

local function makeUniqueId(p0) --[[ line: 68 ]]
	-- upvalues: uuid (ref), boolean (ref), var2 (ref)
	local var7 = uuid()
	local var8 = boolean.toJSBoolean(var2:get(p0)) and var2:get(p0) or 1
	var2:set(p0, var8 + 1)
	
	return ("%s:%s:%s"):format(p0, tostring(var8), var7)
end

t.uuid = uuid
t.makeUniqueId = makeUniqueId

return t