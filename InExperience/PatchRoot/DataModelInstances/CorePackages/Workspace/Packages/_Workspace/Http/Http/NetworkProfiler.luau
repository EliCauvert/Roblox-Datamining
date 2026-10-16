local Number: number? = tonumber(settings():GetFVariable("PercentReportingNetworkProfileAfterStartup"))
local NetworkProfilerModule = {}
NetworkProfilerModule.__index = NetworkProfilerModule
NetworkProfilerModule.aggregate = {
	queued = 0,
	nameLookup = 0,
	connect = 0,
	sslHandshake = 0,
	makeRequest = 0,
	receiveResponse = 0
}

function NetworkProfilerModule.track(p1, Aggregate) --[[ Line: 24 ]]
	p1.aggregate.queued += Aggregate.queued
	
	if Aggregate.nameLookup >= 0 then
		p1.aggregate.nameLookup += Aggregate.nameLookup
	end
	if Aggregate.connect >= 0 then
		p1.aggregate.connect += Aggregate.connect
	end
	if Aggregate.sslHandshake >= 0 then
		p1.aggregate.sslHandshake += Aggregate.sslHandshake
	end
	if Aggregate.makeRequest >= 0 then
		p1.aggregate.makeRequest += Aggregate.makeRequest
	end
	if Aggregate.receiveResponse >= 0 then
		p1.aggregate.receiveResponse += Aggregate.receiveResponse
	end
end

function NetworkProfilerModule.report(p1, Callback: (any, any, any, any) -> ()) --[[ Line: 43 ]]
	-- upvalues: Number (copy)
	Callback("NetworkProfileDuringStartup", "Queued", p1.aggregate.queued, Number)
	Callback("NetworkProfileDuringStartup", "NameLookup", p1.aggregate.nameLookup, Number)
	Callback("NetworkProfileDuringStartup", "Connect", p1.aggregate.connect, Number)
	Callback("NetworkProfileDuringStartup", "SSLHandshake", p1.aggregate.sslHandshake, Number)
	Callback("NetworkProfileDuringStartup", "MakeRequest", p1.aggregate.makeRequest, Number)
	Callback("NetworkProfileDuringStartup", "ReceiveResponse", p1.aggregate.receiveResponse, Number)
end

return NetworkProfilerModule