return require(script:FindFirstAncestor("PlaceInfoRodux").Parent.Rodux).makeActionCreator(script.Name, function(PlaceIds) --[[ Line: 6 ]]
	return { placeIds = PlaceIds }
end)