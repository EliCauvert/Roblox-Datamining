local var1 = tonumber(settings():GetFVariable("PercentReportingNetworkProfileAfterStartup"))
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

function t.track(p1, p2)
	p1.aggregate.queued += p2.queued
	
	if p2.nameLookup >= 0 then
		p1.aggregate.nameLookup += p2.nameLookup
	end
	if p2.connect >= 0 then
		p1.aggregate.connect += p2.connect
	end
	if p2.sslHandshake >= 0 then
		p1.aggregate.sslHandshake += p2.sslHandshake
	end
	if p2.makeRequest >= 0 then
		p1.aggregate.makeRequest += p2.makeRequest
	end
	if p2.receiveResponse >= 0 then
		p1.aggregate.receiveResponse += p2.receiveResponse
	end
end

function t.report(p1, p2)
	-- upvalues: var1 (ref)
	p2("NetworkProfileDuringStartup", "Queued", p1.aggregate.queued, var1)
	p2("NetworkProfileDuringStartup", "NameLookup", p1.aggregate.nameLookup, var1)
	p2("NetworkProfileDuringStartup", "Connect", p1.aggregate.connect, var1)
	p2("NetworkProfileDuringStartup", "SSLHandshake", p1.aggregate.sslHandshake, var1)
	p2("NetworkProfileDuringStartup", "MakeRequest", p1.aggregate.makeRequest, var1)
	p2("NetworkProfileDuringStartup", "ReceiveResponse", p1.aggregate.receiveResponse, var1)
end

return t