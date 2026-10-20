return require(script:FindFirstAncestor("ExpChat").Parent.Rodux).makeActionCreator(script.Name, function(p1, Character, Humanoid)
	return {
		userId = tostring(p1),
		character = Character,
		humanoid = Humanoid
	}
end)