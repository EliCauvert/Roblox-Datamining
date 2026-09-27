return {
	rttMs = {
		label = "Round-trip time",
		unit = "ms",
		plottable = true,
		warnAt = 30,
		group = "Connection"
	},
	incomingStreams = { label = "Incoming streams", group = "Connection" },
	outgoingStreams = { label = "Outgoing streams", group = "Connection" },
	incomingJitterMs = {
		label = "Incoming jitter",
		unit = "ms",
		plottable = true,
		warnAt = 5,
		group = "Incoming"
	},
	outgoingJitterMs = {
		label = "Outgoing jitter",
		unit = "ms",
		plottable = true,
		group = "Outgoing"
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
		group = "Incoming"
	},
	incomingFecPackets = { label = "Incoming FEC packets", group = "Incoming" },
	incomingFecPacketsDiscarded = {
		label = "Incoming FEC packets discarded",
		group = "Incoming"
	},
	incomingBytes = { label = "Incoming bytes", group = "Incoming" },
	outgoingBytes = { label = "Outgoing bytes", group = "Outgoing" },
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
		warnAt = 3,
		group = "Incoming"
	}
}