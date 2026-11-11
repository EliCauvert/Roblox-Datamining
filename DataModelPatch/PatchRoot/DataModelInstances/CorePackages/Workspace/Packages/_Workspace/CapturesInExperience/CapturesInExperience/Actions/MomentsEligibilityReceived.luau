return require(script.Parent.Parent.Parent.Rodux).makeActionCreator(script.Name, function(UniverseId, IsEligible)
	return { universeId = UniverseId, isEligible = IsEligible }
end)