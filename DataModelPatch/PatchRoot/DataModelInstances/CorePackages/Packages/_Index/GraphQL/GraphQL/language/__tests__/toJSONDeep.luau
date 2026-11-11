local Parent = script.Parent.Parent.Parent
local Array = require(Parent.Parent.LuauPolyfill).Array
local IsObjectLikeFunction = require(Parent.jsutils.isObjectLike).isObjectLike

local function toJSONDeep(List)
	-- upvalues: IsObjectLikeFunction (copy), Array (copy), toJSONDeep (copy)
	if not IsObjectLikeFunction(List) then
		return List
	end
	if type(List.toJSON) == "function" then
		return List:toJSON()
	end
	if Array.isArray(List) then
		return Array.map(List, toJSONDeep)
	end
	local t = {}
	
	for i, value in pairs(List) do
		t[i] = toJSONDeep(value)
	end
	return t
end

return { toJSONDeep = toJSONDeep }