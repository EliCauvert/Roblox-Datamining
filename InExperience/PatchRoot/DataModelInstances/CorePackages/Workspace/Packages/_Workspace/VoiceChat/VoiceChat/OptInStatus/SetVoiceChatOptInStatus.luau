return require(script:FindFirstAncestor("VoiceChat").Parent.Rodux).makeActionCreator(script.Name, function(p1)
	return { isUserOptIn = p1 }
end)