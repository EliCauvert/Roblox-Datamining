return require(script:FindFirstAncestor("VoiceChat").Parent.Rodux).makeActionCreator(script.Name, function(IsUserOptIn)
	return { isUserOptIn = IsUserOptIn }
end)