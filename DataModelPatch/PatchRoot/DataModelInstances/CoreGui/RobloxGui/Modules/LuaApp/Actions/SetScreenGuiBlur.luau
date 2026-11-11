return require(game:GetService("CoreGui").RobloxGui.Modules.Common.Action)(script.Name, function(Source, Blur, DisplayOrder)
	return {
		source = Source,
		blur = Blur,
		displayOrder = DisplayOrder
	}
end)