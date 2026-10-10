local t = { warn = 150, error = 300 }
local t_1 = { warn = 30, error = 50 }
local var1 = nil

return {
	rttMs = {
		label = "Round-trip time",
		unit = "ms",
		plottable = true,
		group = "Connection",
		thresholds = t
	},
	incomingStreams = { label = "Incoming streams", group = "Connection" },
	outgoingStreams = { label = "Outgoing streams", group = "Connection" },
	incomingJitterMs = {
		label = "Incoming jitter",
		unit = "ms",
		plottable = true,
		group = "Incoming",
		thresholds = t_1
	},
	outgoingJitterMs = {
		label = "Outgoing jitter",
		unit = "ms",
		plottable = true,
		group = "Outgoing",
		thresholds = t_1
	},
	incomingPackets = { label = "Incoming packets", group = "Incoming" },
	outgoingPackets = { label = "Outgoing packets", group = "Outgoing" },
	incomingPacketsLost = { label = "Incoming packets lost", group = "Incoming" },
	outgoingPacketsLost = { label = "Outgoing packets lost", group = "Outgoing" },
	incomingPacketsDiscarded = { label = "Incoming packets discarded", group = "Incoming" },
	outgoingPacketsDiscarded = { label = "Outgoing packets discarded", group = "Outgoing" },
	jitterBufferDelayMs = {
		label = "Jitter buffer delay",
		unit = "ms",
		group = "Incoming",
		thresholds = { warn = 60, error = 150 }
	},
	incomingFecPackets = { label = "Incoming FEC packets", group = "Incoming" },
	incomingFecPacketsDiscarded = {
		label = "Incoming FEC packets discarded",
		group = "Incoming"
	},
	totalConcealmentEvents = { label = "Concealment events", group = "Incoming" },
	incomingBytes = { label = "Incoming bytes", group = "Incoming" },
	outgoingBytes = { label = "Outgoing bytes", group = "Outgoing" },
	lastPublisherAudioLevelDbov = {
		label = "Publisher audio level",
		unit = "dBov",
		group = "Outgoing"
	},
	lastSubscriberAudioLevelDbov = {
		label = "Subscriber audio level",
		unit = "dBov",
		group = "Incoming"
	},
	incomingBitrateKbps = {
		label = "Incoming bitrate",
		unit = "kbps",
		plottable = true,
		group = "Incoming"
	},
	outgoingBitrateKbps = {
		label = "Outgoing bitrate",
		unit = "kbps",
		plottable = true,
		group = "Outgoing"
	},
	outgoingCodec = { label = "Outgoing codec", group = "Outgoing" },
	incomingLossPercent = {
		label = "Incoming loss",
		unit = "%",
		plottable = true,
		group = "Incoming",
		thresholds = { warn = 3, error = 1e999 }
	},
	getFieldSeverity = function(p1, p2)
		-- upvalues: var1 (write)
		local var2 = var1[p1]
		local thresholds = var2 and var2.thresholds
		
		return if not (not thresholds or type(p2) ~= "number") then if thresholds.error <= p2 then "error" elseif thresholds.warn <= p2 then "warn" else "ok" else nil
	end
}