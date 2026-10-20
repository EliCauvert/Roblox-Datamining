local _ = require(script:FindFirstAncestor("Schools").Api.Types)

local function _(p1)
	return {
		countryCode = p1.countryCode,
		state = p1.state,
		city = p1.city
	}
end

local _ = function(p1)
	return {
		graduationYear = p1.graduationYear,
		roleSetId = p1.roleSetId
	}
end

local function decodeSchool(p1)
	local Buffer = table.create(#p1.cohortOptions)
	
	for _, cohortOption in p1.cohortOptions do
		table.insert(Buffer, {
			graduationYear = cohortOption.graduationYear,
			roleSetId = cohortOption.roleSetId
		})
	end
	local Location = p1.location
	
	return {
		schoolId = p1.schoolId,
		schoolName = p1.schoolName,
		schoolNickname = p1.schoolNickname,
		schoolType = p1.schoolType,
		location = {
			countryCode = Location.countryCode,
			state = Location.state,
			city = Location.city
		},
		supportedVerificationMethods = table.clone(p1.supportedVerificationMethods),
		cohortOptions = Buffer
	}
end

return {
	decodeSchoolVerification = function(p2)
		-- upvalues: decodeSchool (copy)
		local Buffer = table.create(#p2.school)
		
		for _, value in p2.school do
			table.insert(Buffer, (decodeSchool(value)))
		end
		return { schools = Buffer }
	end,
	decodeSchool = decodeSchool,
	decodeRequestOtp = function(p3)
		return { resendAvailableAt = p3.resendAvailableAt }
	end,
	decodeVerifyOtp = function(p3)
		return { schoolId = p3.schoolId, groupId = p3.groupId }
	end,
	decodeVerifiedSchool = function(p3)
		return {
			groupId = p3.groupId,
			name = p3.name,
			nickname = p3.nickname,
			description = p3.description,
			memberCount = p3.memberCount,
			subtype = p3.subtype,
			country = p3.country,
			state = p3.state,
			city = p3.city,
			supportedVerificationMethods = table.clone(p3.supportedVerificationMethods),
			schoolStatus = p3.schoolStatus
		}
	end,
	schoolToListItem = function(p3)
		return {
			id = p3.schoolId,
			name = p3.schoolName,
			city = p3.location.city,
			state = p3.location.state
		}
	end
}