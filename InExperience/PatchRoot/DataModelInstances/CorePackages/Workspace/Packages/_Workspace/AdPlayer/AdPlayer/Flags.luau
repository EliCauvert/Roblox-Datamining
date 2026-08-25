game:DefineFastString("AdPlayerExitButton", "icons/navigation/close")
game:DefineFastString("AdDropdownButtonDefault", "rbxassetid://85625850440429")
game:DefineFastString("AdDropdownButtonOpen", "rbxassetid://85625850440429")

return {
	GetAdPlayerExitButton = function()
		return game:GetFastString("AdPlayerExitButton")
	end,
	GetAdDropdownButtonDefault = function()
		return game:GetFastString("AdDropdownButtonDefault")
	end,
	GetAdDropdownButtonOpen = function()
		return game:GetFastString("AdDropdownButtonOpen")
	end,
	GetEnableLuaRewardTimerUI = function()
		return game:GetEngineFeature("EnableLuaRewardTimerUI")
	end
}