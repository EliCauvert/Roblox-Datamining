return function(p0)
	return {
		moderationDetail = p0.fromString("usermoderation:v1/not-approved"),
		reactivate = p0.fromString("usermoderation:v1/not-approved/reactivate"),
		reminder = p0.fromString("usermoderation:v1/reminder"),
		dismissIntervention = p0.fromString("usermoderation:v1/dismiss-intervention"),
		accessDetail = p0.fromString("usermoderation:v2/not-approved")
	}
end