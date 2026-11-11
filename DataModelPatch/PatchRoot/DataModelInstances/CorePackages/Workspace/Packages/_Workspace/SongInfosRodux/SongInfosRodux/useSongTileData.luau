local SongInfosRodux = script:FindFirstAncestor("SongInfosRodux")
local Parent = SongInfosRodux.Parent
local _ = require(Parent.DiscoveryTypes)
local SongInfosReducerModule = require(SongInfosRodux.SongInfosReducer)
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local UseSongAlbumArtFunction = require(Parent.Songbird).useSongAlbumArt
local TutilsModule = require(Parent.tutils)

return function(p1)
	-- upvalues: UseSongAlbumArtFunction (copy), UseSelectorFunction (copy), SongInfosReducerModule (copy), TutilsModule (copy)
	return {
		song = UseSelectorFunction(function(p2)
			-- upvalues: SongInfosReducerModule (upval), p1 (copy)
			return p2.Personalization[SongInfosReducerModule.key][p1]
		end, TutilsModule.shallowEqual),
		thumbnail = UseSongAlbumArtFunction(p1).value
	}
end