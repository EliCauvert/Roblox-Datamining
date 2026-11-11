local HttpClientModule = require(script:FindFirstAncestor("Schools").Parent.HttpClient)

local function _(): string
	return (os.date("!%Y-%m-%dT%H:%M:%SZ", os.time() + 30))
end

local config = {
	school = {
		{
			schoolId = "rbx-school-1001",
			schoolName = "Lakeside University",
			schoolNickname = "Lakeside",
			schoolType = "University",
			location = { countryCode = "US", state = "CA", city = "San Mateo" },
			supportedVerificationMethods = { "EmailOtp" },
			cohortOptions = {
				{ graduationYear = 2027, roleSetId = "12301" },
				{ graduationYear = 2028, roleSetId = "12302" }
			}
		},
		{
			schoolId = "rbx-school-1002",
			schoolName = "Stanford University",
			schoolNickname = "Stanford",
			schoolType = "University",
			location = { countryCode = "US", state = "CA", city = "Stanford" },
			supportedVerificationMethods = { "EmailOtp" },
			cohortOptions = {
				{ graduationYear = 2026, roleSetId = "12310" },
				{ graduationYear = 2027, roleSetId = "12311" },
				{ graduationYear = 2028, roleSetId = "12312" }
			}
		},
		{
			schoolId = "rbx-school-1003",
			schoolName = "Stanley College",
			schoolNickname = "Stanley",
			schoolType = "College",
			location = { countryCode = "US", state = "CA", city = "Palo Alto" },
			supportedVerificationMethods = { "EmailOtp" },
			cohortOptions = {
				{ graduationYear = 2026, roleSetId = "12320" },
				{ graduationYear = 2027, roleSetId = "12321" }
			}
		},
		{
			schoolId = "rbx-school-1004",
			schoolName = "Skyline High School",
			schoolNickname = "Skyline",
			schoolType = "HighSchool",
			location = { countryCode = "US", state = "CA", city = "San Bruno" },
			supportedVerificationMethods = { "EmailOtp" },
			cohortOptions = {
				{ graduationYear = 2027, roleSetId = "12340" },
				{ graduationYear = 2028, roleSetId = "12341" }
			}
		}
	}
}
local config1 = {
	groupId = "987654321",
	name = "Lakeside University",
	nickname = "Lakeside",
	description = "Go Lakers! The official Lakeside University community.",
	memberCount = 119,
	subtype = "University",
	country = "US",
	state = "CA",
	city = "San Mateo",
	schoolStatus = "Active",
	supportedVerificationMethods = { "EmailOtp" }
}

return {
	createNetwork = function()
		-- upvalues: config (copy), config1 (copy), HttpClientModule (copy)
		return HttpClientModule.createMockNetwork({
			routes = {
				{
					pattern = "/v1/email/otp",
					respond = function()
						return { schoolId = "rbx-school-1001", groupId = "987654321" }
					end
				},
				{
					pattern = "/v1/email/resend",
					respond = function()
						return {
							resendAvailableAt = os.date("!%Y-%m-%dT%H:%M:%SZ", os.time() + 30)
						}
					end
				},
				{
					pattern = "/v1/email",
					respond = function()
						-- upvalues: config (upval)
						return config
					end
				},
				{
					pattern = "/v1/request",
					respond = function()
						return {
							resendAvailableAt = os.date("!%Y-%m-%dT%H:%M:%SZ", os.time() + 30)
						}
					end
				},
				{
					pattern = "/v1/school",
					respond = function()
						-- upvalues: config1 (upval)
						return config1
					end
				}
			}
		})
	end
}