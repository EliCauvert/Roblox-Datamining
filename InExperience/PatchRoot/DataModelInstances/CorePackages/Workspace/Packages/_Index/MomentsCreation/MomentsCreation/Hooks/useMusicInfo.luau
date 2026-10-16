local MomentsCreation = script:FindFirstAncestor("MomentsCreation")
local Parent = MomentsCreation.Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local GetMusicStoreModule = require(MomentsCreation.Stores.GetMusicStore)
local _ = require(MomentsCreation.Types.Music)

return function(p1) --[[ Line: 18 | Named "useMusicInfo" ]]
	-- upvalues: GetMusicStoreModule (copy), ReactModule (copy), SignalsModule (copy)
	local MusicStoreModule = GetMusicStoreModule()
	local UseStateResult, UseStateResult2 = ReactModule.useState(MusicStoreModule.getInfoMap(false))
	ReactModule.useEffect(function() --[[ Line: 22 ]]
		-- upvalues: SignalsModule (upval), UseStateResult2 (copy), MusicStoreModule (copy)
		return SignalsModule.createEffect(function(p2) --[[ Line: 23 ]]
			-- upvalues: UseStateResult2 (upval), MusicStoreModule (upval)
			UseStateResult2(MusicStoreModule.getInfoMap(p2))
		end)
	end, { MusicStoreModule })
	local UseStateResultEntry = if p1 == nil then nil else UseStateResult[p1]
	ReactModule.useEffect(function() --[[ Line: 29 ]]
		-- upvalues: p1 (copy), UseStateResultEntry (copy), MusicStoreModule (copy)
		if p1 ~= nil and UseStateResultEntry == nil then
			MusicStoreModule.fetchInfo(p1)
		end
	end, { p1, UseStateResultEntry, MusicStoreModule })
	
	return UseStateResultEntry
end