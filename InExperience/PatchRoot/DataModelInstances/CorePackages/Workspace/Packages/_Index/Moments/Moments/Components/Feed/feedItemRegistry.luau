local _ = require(script.Parent.FeedTypes)
local momentModule = require(script.Parent.Items.Moment)
local t = {}

local function _(p0) --[[ line: 17 | named "register" ]]
	-- upvalues: t (ref)
	for i, v in p0 do
		t[v.kind] = v
	end
end

for i, v in momentModule do
	t[v.kind] = v
end
return t