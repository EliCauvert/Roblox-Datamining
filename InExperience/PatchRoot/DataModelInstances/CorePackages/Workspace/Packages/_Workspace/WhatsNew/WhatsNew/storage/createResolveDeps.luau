local entryStorageModule = require(script.Parent.EntryStorage)
local _ = require(script:FindFirstAncestor("WhatsNew").Types)

local function createResolveDeps(p0) --[[ line: 24 ]]
	-- upvalues: entryStorageModule (ref)
	return {
		storage = entryStorageModule.getEntries(),
		meta = entryStorageModule.getMeta(),
		currentTime = (p0 or {}).currentTime or DateTime.now().UnixTimestamp
	}
end

return {
	createResolveDeps = createResolveDeps,
	bootstrapPersistedResolveDeps = function(p1) --[[ line: 33 ]]
		-- upvalues: entryStorageModule (ref), createResolveDeps (ref)
		entryStorageModule.runMigration(if p1 then p1.runMigrationOptions else nil)
		
		return createResolveDeps({ currentTime = if p1 then p1.currentTime else nil })
	end
}