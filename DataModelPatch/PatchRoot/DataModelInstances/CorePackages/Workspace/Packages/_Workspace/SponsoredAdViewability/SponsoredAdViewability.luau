local _ = require(script.sponsoredAdViewabilityRegistry)

return {
	useSponsoredAdViewabilityDetector = require(script.useSponsoredAdViewabilityDetector),
	useTagAsSponsoredAdViewabilityCandidate = require(script.useTagAsSponsoredAdViewabilityCandidate),
	["jest.config"] = script["jest.config"]
}