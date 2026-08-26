return require(script:FindFirstAncestor("PlaceInfoRodux").Parent.Rodux).makeActionCreator(script.Name, function(p1)
	return { placeInfos = p1 }
end)