local _ = require(script.Parent.FeedTypes)
local momentModule = require(script.Parent.Items.Moment)
local endStateModule = require(script.Parent.Items.EndState)
local t = {}

local function _(p0) --[[ line: 18 | named "register" ]]
	-- upvalues: t (ref)
	for i, v in p0 do
		t[v.kind] = v
	end
end

for i, v in momentModule do
	t[v.kind] = v
end
for i, v_1 in endStateModule do
	t[v_1.kind] = v_1
end
return t