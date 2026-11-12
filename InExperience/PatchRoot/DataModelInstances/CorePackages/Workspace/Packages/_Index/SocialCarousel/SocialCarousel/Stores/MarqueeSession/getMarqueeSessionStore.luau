local CreateMarqueeSessionStoreModule = require(script.Parent.createMarqueeSessionStore)
local Tbl = {}

return {
	getMarqueeSessionStore = function(Key)
		-- upvalues: Tbl (copy), CreateMarqueeSessionStoreModule (copy)
		local Entry = Tbl[Key]
		
		if Entry == nil then
			local MarqueeSessionStoreModule = CreateMarqueeSessionStoreModule()
			Tbl[Key] = MarqueeSessionStoreModule
			
			return MarqueeSessionStoreModule
		else
			return Entry
		end
	end,
	resetMarqueeSessionStores = function()
		-- upvalues: Tbl (copy)
		table.clear(Tbl)
	end
}