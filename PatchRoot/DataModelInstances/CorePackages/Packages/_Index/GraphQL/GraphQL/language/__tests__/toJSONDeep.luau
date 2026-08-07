-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:34 2026 Pacific Standard Time.

local parent = script.Parent.Parent.Parent
local array = require(parent.Parent.LuauPolyfill).Array
local isObjectLike = require(parent.jsutils.isObjectLike).isObjectLike

local function toJSONDeep(p0) --[[ line: 18 ]]
	-- upvalues: isObjectLike (ref), array (ref), toJSONDeep (ref)
	if not isObjectLike(p0) then
		return p0
	elseif type(p0.toJSON) == "function" then
		return p0:toJSON()
	elseif array.isArray(p0) then
		return array.map(p0, toJSONDeep)
	end
	local t = {}
	
	for i, v in pairs(p0) do
		t[i] = toJSONDeep(v)
	end
	return t
end

return { toJSONDeep = toJSONDeep }