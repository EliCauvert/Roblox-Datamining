local var0 = tonumber(settings():GetFVariable("PercentReportingNetworkProfileAfterStartup"))
local t = {}
t.__index = t
t.aggregate = {
	queued = 0,
	nameLookup = 0,
	connect = 0,
	sslHandshake = 0,
	makeRequest = 0,
	receiveResponse = 0
}

function t.track(p0, p1) --[[ line: 24 ]]
	p0.aggregate.queued += p1.queued
	
	if p1.nameLookup >= 0 then
		p0.aggregate.nameLookup += p1.nameLookup
	end
	if p1.connect >= 0 then
		p0.aggregate.connect += p1.connect
	end
	if p1.sslHandshake >= 0 then
		p0.aggregate.sslHandshake += p1.sslHandshake
	end
	if p1.makeRequest >= 0 then
		p0.aggregate.makeRequest += p1.makeRequest
	end
	if p1.receiveResponse >= 0 then
		p0.aggregate.receiveResponse += p1.receiveResponse
	end
end

function t.report(p2, p3) --[[ line: 43 ]]
	-- upvalues: var0 (ref)
	p3("NetworkProfileDuringStartup", "Queued", p2.aggregate.queued, var0)
	p3("NetworkProfileDuringStartup", "NameLookup", p2.aggregate.nameLookup, var0)
	p3("NetworkProfileDuringStartup", "Connect", p2.aggregate.connect, var0)
	p3("NetworkProfileDuringStartup", "SSLHandshake", p2.aggregate.sslHandshake, var0)
	p3("NetworkProfileDuringStartup", "MakeRequest", p2.aggregate.makeRequest, var0)
	p3("NetworkProfileDuringStartup", "ReceiveResponse", p2.aggregate.receiveResponse, var0)
end

return t