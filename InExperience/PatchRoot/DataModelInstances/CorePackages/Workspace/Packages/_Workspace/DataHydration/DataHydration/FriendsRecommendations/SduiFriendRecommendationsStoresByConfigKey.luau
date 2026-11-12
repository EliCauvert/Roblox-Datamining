local CreateSduiFriendRecommendationsStoreModule = require(script.Parent.createSduiFriendRecommendationsStore)
local t = {}

return {
	get = function(p1)
		-- upvalues: t (copy), CreateSduiFriendRecommendationsStoreModule (copy)
		local P0 = p1 or "Home"
		local Entry = t[P0]
		
		if Entry == nil then
			Entry = CreateSduiFriendRecommendationsStoreModule()
			t[P0] = Entry
		end
		return Entry
	end,
	dispose = function(Key)
		-- upvalues: t (copy)
		local Entry = t[Key]
		
		if Entry then
			Entry.dispose()
			t[Key] = nil
		end
	end
}