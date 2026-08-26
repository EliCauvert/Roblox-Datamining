local var1 = false
local t = {}

local function batch(p1)
	-- upvalues: var1 (write), t (ref)
	if var1 then
		p1()
		
		return
	end
	var1 = true
	p1()
	
	for i, v in t do
		v()
	end
	table.clear(t)
	var1 = false
end

return {
	batch = batch,
	flush = function()
		-- upvalues: batch (ref)
		batch(function() end)
	end,
	schedule = function(p2)
		-- upvalues: t (ref)
		table.insert(t, p2)
	end
}