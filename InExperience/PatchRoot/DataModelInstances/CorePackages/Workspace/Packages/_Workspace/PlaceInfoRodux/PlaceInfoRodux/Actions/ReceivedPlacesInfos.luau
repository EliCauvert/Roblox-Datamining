return require(script:FindFirstAncestor("PlaceInfoRodux").Parent.Rodux).makeActionCreator(script.Name, function(p0)
	return { placesInfos = p0 }
end)