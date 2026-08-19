local pageGateModule = require(script.PageGate)

return {
	FFlagEnablePLTPrefetchCallbacks = pageGateModule.FFlagEnablePLTPrefetchCallbacks,
	Page = pageGateModule.Page,
	Milestone = pageGateModule.Milestone,
	signal = pageGateModule.signal,
	["jest.config"] = script["jest.config"]
}