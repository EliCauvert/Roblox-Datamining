local t = {}
local luauPolyfillModule = require(script.Parent.Parent.Parent.Parent.LuauPolyfill)
local boolean = luauPolyfillModule.Boolean
local var1 = luauPolyfillModule.Map.new(nil)
local list = {
	"0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "a", "b", "c", "d", "e", "f",
	"g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v",
	"w", "x", "y", "z"
}
math.randomseed(os.clock())

local function uuid()
	-- upvalues: list (ref)
	local var2 = ""
	
	for _ = 1, 11 do
		var2 ..= list[math.random(1, 36)]
	end
	return var2
end

local function makeUniqueId(p1)
	-- upvalues: uuid (ref), boolean (ref), var1 (ref)
	local var3 = uuid()
	local var4 = boolean.toJSBoolean(var1:get(p1)) and var1:get(p1) or 1
	var1:set(p1, var4 + 1)
	
	return ("%s:%s:%s"):format(p1, tostring(var4), var3)
end

t.uuid = uuid
t.makeUniqueId = makeUniqueId

return t