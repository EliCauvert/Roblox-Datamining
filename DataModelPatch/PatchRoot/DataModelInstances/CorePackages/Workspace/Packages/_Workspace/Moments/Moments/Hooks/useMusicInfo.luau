local Parent = script:FindFirstAncestor("Moments").Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local GetMusicStoreFunction = require(Parent.MomentsCreation).Stores.GetMusicStore

return function(p1)
	-- upvalues: GetMusicStoreFunction (copy), ReactModule (copy), SignalsModule (copy)
	local MusicStore = GetMusicStoreFunction()
	local UseStateResult, UseStateResult2 = ReactModule.useState(MusicStore.getInfoMap(false))
	ReactModule.useEffect(function()
		-- upvalues: SignalsModule (upval), UseStateResult2 (copy), MusicStore (copy)
		return SignalsModule.createEffect(function(p2)
			-- upvalues: UseStateResult2 (upval), MusicStore (upval)
			UseStateResult2(MusicStore.getInfoMap(p2))
		end)
	end, { MusicStore })
	local UseStateResultEntry = if p1 == nil then nil else UseStateResult[p1]
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), UseStateResultEntry (copy), MusicStore (copy)
		if p1 ~= nil and UseStateResultEntry == nil then
			MusicStore.fetchInfo(p1)
		end
	end, { p1, UseStateResultEntry, MusicStore })
	
	return UseStateResultEntry
end