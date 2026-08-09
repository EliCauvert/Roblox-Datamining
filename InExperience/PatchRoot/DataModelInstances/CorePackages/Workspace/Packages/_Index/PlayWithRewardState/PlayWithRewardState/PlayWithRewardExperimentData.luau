local httpService = game:GetService("HttpService")
local parent = script:FindFirstAncestor("PlayWithRewardState").Parent
local mutedError = require(parent.Loggers).mutedError
local tModule = require(parent.t)
local var2 = tModule.interface({
	titleText = tModule.string,
	subtitleText = tModule.string,
	buttonText = tModule.string,
	coachmarkTitleText = tModule.string,
	coachmarkSubtitleText = tModule.string,
	showButton = tModule.boolean,
	variantId = tModule.string
})
local t = {}
local t_1 = {
	titleText = "",
	subtitleText = "",
	buttonText = "",
	coachmarkTitleText = "",
	coachmarkSubtitleText = "",
	showButton = false,
	variantId = ""
}

function t.fromJsonData(p0) --[[ line: 39 ]]
	-- upvalues: t_1 (ref), httpService (ref), var2 (ref), mutedError (ref)
	local cloned = table.clone(t_1)
	local ok, status = pcall(function() --[[ line: 42 ]]
		-- upvalues: httpService (copy), p0 (ref)
		return httpService:JSONDecode(p0)
	end)
	
	if ok then
		local var6, var7 = var2(status)
		
		if not var6 then
			mutedError(`PlayWithRewardExperimentData invalid: {tostring(var7)}`)
			
			return cloned
		end
		cloned.titleText = status.titleText
		cloned.subtitleText = status.subtitleText
		cloned.buttonText = status.buttonText
		cloned.coachmarkTitleText = status.coachmarkTitleText
		cloned.coachmarkSubtitleText = status.coachmarkSubtitleText
		cloned.showButton = status.showButton
		cloned.variantId = status.variantId
	end
	return cloned
end

return t