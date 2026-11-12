local IconName = require(script:FindFirstAncestor("SocialCards").Parent.Foundation).Enums.IconName
local CallCardStatusModule = require(script.Parent.CallCardStatus)

local function _(p1: number): string
	return if p1 >= 60 then `{math.floor(p1 / 60)} min` else `{p1} sec`
end

return function(p1, p2, p3)
	-- upvalues: CallCardStatusModule (copy), IconName (copy)
	local IsStatusMatch: boolean = p1.status == CallCardStatusModule.Ringing or p1.status == CallCardStatusModule.Active
	local PhoneArrowDiagonalUp = if p1.isInitiator then IconName.PhoneArrowDiagonalUp else IconName.PhoneArrowDiagonalDown
	local Title = "Voice call"
	local OnActivated = nil
	local Description = nil
	
	if IsStatusMatch then
		Description = "Ringing"
	elseif p1.status == CallCardStatusModule.Ongoing then
		Description = "Ongoing"
		OnActivated = if p1.enableJoin then p2 else nil
	elseif p1.status == CallCardStatusModule.Answered or p1.status == CallCardStatusModule.Ended then
		if p1.durationSeconds == nil then
			Description = nil
		else
			local DurationSeconds: number = p1.durationSeconds
			Description = if DurationSeconds >= 60 then `{math.floor(DurationSeconds / 60)} min` else `{DurationSeconds} sec`
		end
	elseif p1.isInitiator then
		Description = "No answer"
	else
		Title = "Missed voice call"
		Description = "Tap to call back"
		OnActivated = p3
	end
	return {
		icon = PhoneArrowDiagonalUp,
		title = Title,
		description = Description,
		isRinging = IsStatusMatch,
		onActivated = OnActivated
	}
end