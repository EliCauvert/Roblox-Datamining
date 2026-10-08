return table.freeze({
	EventKind = table.freeze({
		RangeChanged = "rangeChanged",
		PoolChanged = "poolChanged",
		ItemViewsSynchronized = "itemViewsSynchronized",
		MeasurementsProcessingStarted = "measurementsProcessingStarted",
		MeasurementsProcessed = "measurementsProcessed",
		ScrollCorrection = "scrollCorrection"
	}),
	PoolAction = table.freeze({
		Create = "create",
		Acquire = "acquire",
		Release = "release",
		Evict = "evict"
	}),
	RangeKind = table.freeze({ Visible = "visible", Rendered = "rendered" }),
	ScrollCorrectionSource = table.freeze({
		Data = "data",
		Measurement = "measurement",
		ProgrammaticScroll = "programmaticScroll"
	})
})