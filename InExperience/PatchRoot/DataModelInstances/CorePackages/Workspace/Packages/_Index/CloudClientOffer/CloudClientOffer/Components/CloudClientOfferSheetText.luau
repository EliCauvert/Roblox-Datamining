local _ = require(script:FindFirstAncestor("CloudClientOffer").createCloudClientOffer)

return {
	RobloxReality = {
		title = "Try Roblox Reality",
		body = "Roblox Reality gives your favorite games a fresh look. Try an early preview, then tell us what you think.",
		accept = "Play",
		decline = "Play without Roblox Reality",
		features = {
			"15 minute demo",
			"Graphics that look like real life",
			"Only for Plus subscribers"
		}
	},
	CloudPlay = {
		title = "Play with Cloud Play",
		body = "Cloud Play runs the game on Roblox's computers, so it may load faster and have fewer crashes. It only lasts while you're playing this game.",
		accept = "Play",
		decline = "Play without Cloud Play",
		features = {}
	}
}