return require(script:FindFirstAncestor("CommunityLinks").Parent.Rodux).makeActionCreator(script.Name, function(UniverseId, CommunityLink)
	return { universeId = UniverseId, communityLink = CommunityLink }
end)