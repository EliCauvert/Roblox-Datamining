game:DefineFastString("AdPlayerExitButton", "icons/navigation/close")
game:DefineFastString("AdDropdownButtonDefault", "rbxassetid://85625850440429")
game:DefineFastString("AdDropdownButtonOpen", "rbxassetid://85625850440429")

return {
	GetAdPlayerExitButton = function() --[[ Line: 6 ]]
		return game:GetFastString("AdPlayerExitButton")
	end,
	GetAdDropdownButtonDefault = function() --[[ Line: 9 ]]
		return game:GetFastString("AdDropdownButtonDefault")
	end,
	GetAdDropdownButtonOpen = function() --[[ Line: 12 ]]
		return game:GetFastString("AdDropdownButtonOpen")
	end,
	GetEnableLuaRewardTimerUI = function() --[[ Line: 15 ]]
		return game:GetEngineFeature("EnableLuaRewardTimerUI")
	end
}