local var0 = false
local t = {}

local function batch(p0)
	-- upvalues: var0 (write), t (ref)
	if var0 then
		p0()
		
		return
	end
	var0 = true
	p0()
	
	for i, v in t do
		v()
	end
	table.clear(t)
	var0 = false
end

return {
	batch = batch,
	flush = function()
		-- upvalues: batch (ref)
		batch(function() end)
	end,
	schedule = function(p1)
		-- upvalues: t (ref)
		table.insert(t, p1)
	end
}