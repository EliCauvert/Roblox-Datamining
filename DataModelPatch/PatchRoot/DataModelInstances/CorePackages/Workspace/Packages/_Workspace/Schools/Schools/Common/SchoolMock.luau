local SchoolMockModule = {
	SchoolStatus = {
		Live = "Live",
		Waitlist = "Waitlist",
		Pending = "Pending"
	}
}
local config = {
	groupId = 1234567,
	name = "UCLA",
	location = "Los Angeles, CA",
	memberCount = 119,
	status = SchoolMockModule.SchoolStatus.Live
}

function SchoolMockModule.getSchool()
	-- upvalues: config (copy)
	return config
end

return SchoolMockModule