return function(p1)
	return {
		moderationDetail = p1.fromString("usermoderation:v1/not-approved"),
		reactivate = p1.fromString("usermoderation:v1/not-approved/reactivate"),
		reminder = p1.fromString("usermoderation:v1/reminder"),
		dismissIntervention = p1.fromString("usermoderation:v1/dismiss-intervention"),
		accessDetail = p1.fromString("usermoderation:v2/not-approved")
	}
end