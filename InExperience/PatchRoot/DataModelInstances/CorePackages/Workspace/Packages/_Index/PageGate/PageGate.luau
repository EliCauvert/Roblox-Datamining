local PageGateModule = require(script.PageGate)

return {
	FFlagEnablePLTPrefetchCallbacks = PageGateModule.FFlagEnablePLTPrefetchCallbacks,
	Page = PageGateModule.Page,
	Milestone = PageGateModule.Milestone,
	signal = PageGateModule.signal,
	["jest.config"] = script["jest.config"]
}