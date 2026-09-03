return table.freeze({
	External = table.freeze({
		Activate = "Activate",
		SetActive = "SetActive",
		SetScrollOffset = "SetScrollOffset",
		ObserveScrollOffset = "ObserveScrollOffset",
		ScrollToIndex = "ScrollToIndex",
		ScrollToOffset = "ScrollToOffset",
		ScrollBy = "ScrollBy",
		RestoreScrollAnchorSnapshot = "RestoreScrollAnchorSnapshot",
		SetViewportSize = "SetViewportSize",
		SetPolicy = "SetPolicy",
		SetDataSource = "SetDataSource",
		SetLayout = "SetLayout",
		SetDataSourceAndLayout = "SetDataSourceAndLayout",
		ApplyScrollAnchorOffset = "ApplyScrollAnchorOffset",
		Refresh = "Refresh",
		Destroy = "Destroy",
		SubmitMeasurements = "SubmitMeasurements"
	}),
	Internal = table.freeze({
		ApplyDataSourceChange = "ApplyDataSourceChange",
		SubmitLogicalMeasurements = "SubmitLogicalMeasurements"
	})
})