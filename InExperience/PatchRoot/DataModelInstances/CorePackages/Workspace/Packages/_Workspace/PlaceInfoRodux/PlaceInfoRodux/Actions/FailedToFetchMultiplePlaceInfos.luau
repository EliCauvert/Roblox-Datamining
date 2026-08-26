return require(script:FindFirstAncestor("PlaceInfoRodux").Parent.Rodux).makeActionCreator(script.Name, function(p1)
	return { placeIds = p1 }
end)