return require(script:FindFirstAncestor("VoiceChat").Parent.Rodux).makeActionCreator(script.Name, function(IsUserOptIn) --[[ Line: 5 ]]
	return { isUserOptIn = IsUserOptIn }
end)