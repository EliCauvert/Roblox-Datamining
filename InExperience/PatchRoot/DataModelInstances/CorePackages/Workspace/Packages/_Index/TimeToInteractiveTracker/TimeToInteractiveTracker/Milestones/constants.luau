local _ = require(script.Parent.types)

return {
	RenderStarted = "RenderStarted",
	SurfaceMounted = "SurfaceMounted",
	FunctionallyReady = "FunctionallyReady",
	SurfaceReady = "SurfaceReady",
	PrimaryDataStarted = {
		Name = "PrimaryDataStarted",
		Subphase = {
			NetworkQueue = "NetworkQueue",
			NetworkFetch = "NetworkFetch",
			ResponseReceived = "ResponseReceived"
		}
	},
	PrimaryDataReady = {
		Name = "PrimaryDataReady",
		Subphase = {
			NetworkQueue = "NetworkQueue",
			NetworkFetch = "NetworkFetch",
			ResponseReceived = "ResponseReceived"
		}
	},
	DataProcessingStarted = {
		Name = "DataProcessingStarted",
		Subphase = {
			Decode = "Decode",
			DataUpdate = "DataUpdate",
			TreeBuild = "TreeBuild"
		}
	},
	DataProcessingCompleted = {
		Name = "DataProcessingCompleted",
		Subphase = {
			Decode = "Decode",
			DataUpdate = "DataUpdate",
			TreeBuild = "TreeBuild"
		}
	}
}