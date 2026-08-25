return game:DefineFastFlag("AXCatalogBackgroundsSupport", false) and (require(script.Parent.FFlagAXBackgroundsRoot) and pcall(function()
	return Enum.AvatarAssetType.AvatarBackground
end))