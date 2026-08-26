local parent = script.Parent.Parent.Parent
local array = require(parent.Parent.LuauPolyfill).Array
local isObjectLike = require(parent.jsutils.isObjectLike).isObjectLike

local function toJSONDeep(p1)
	-- upvalues: isObjectLike (ref), array (ref), toJSONDeep (ref)
	if not isObjectLike(p1) then
		return p1
	elseif type(p1.toJSON) == "function" then
		return p1:toJSON()
	elseif array.isArray(p1) then
		return array.map(p1, toJSONDeep)
	end
	local t = {}
	
	for i, v in pairs(p1) do
		t[i] = toJSONDeep(v)
	end
	return t
end

return { toJSONDeep = toJSONDeep }