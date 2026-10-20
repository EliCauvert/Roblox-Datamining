local AppMusicPlayer = script:FindFirstAncestor("AppMusicPlayer")
local CryoModule = require(AppMusicPlayer.Parent.Cryo)
local UseSelectorFunction = require(AppMusicPlayer.Parent.RoactUtils).Hooks.RoactRodux.useSelector
local TopicContentsReducer = require(AppMusicPlayer.Parent.TopicContentsRodux).TopicContentsReducer
local UseMemoFunction = require(AppMusicPlayer.Parent.React).useMemo

return function()
	-- upvalues: UseSelectorFunction (copy), TopicContentsReducer (copy), UseMemoFunction (copy), CryoModule (copy)
	local UseSelectorResult = UseSelectorFunction(function(p1)
		-- upvalues: TopicContentsReducer (upval)
		local Personalization = p1.Personalization
		local PersonalizationEntry = if Personalization then Personalization[TopicContentsReducer.key] else nil
		local MusicTop100 = if PersonalizationEntry then PersonalizationEntry["music-top-100"] else nil
		
		return if MusicTop100 then MusicTop100.entries else nil
	end)
	
	return (UseMemoFunction(function()
		-- upvalues: UseSelectorResult (copy), CryoModule (upval)
		return if UseSelectorResult then CryoModule.List.map(UseSelectorResult, function(p1): string
			return (tostring(p1.contentId))
		end) else {}
	end, { UseSelectorResult }))
end