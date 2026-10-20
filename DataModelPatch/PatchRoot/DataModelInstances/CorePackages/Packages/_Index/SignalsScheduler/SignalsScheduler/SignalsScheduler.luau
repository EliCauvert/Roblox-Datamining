local Flag = false
local List = {}

local function batch(Callback: () -> ())
	-- upvalues: Flag (ref), List (copy)
	if Flag then
		Callback()
		
		return
	end
	Flag = true
	Callback()
	
	for _, value in List do
		value()
	end
	table.clear(List)
	Flag = false
end

return {
	batch = batch,
	flush = function()
		-- upvalues: batch (copy)
		batch(function() end)
	end,
	schedule = function(p1)
		-- upvalues: List (copy)
		table.insert(List, p1)
	end
}