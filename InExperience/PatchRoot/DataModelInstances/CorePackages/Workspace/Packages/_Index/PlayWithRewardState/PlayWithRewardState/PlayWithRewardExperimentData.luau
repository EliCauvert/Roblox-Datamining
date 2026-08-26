local httpService = game:GetService("HttpService")
local parent = script:FindFirstAncestor("PlayWithRewardState").Parent
local mutedError = require(parent.Loggers).mutedError
local tModule = require(parent.t)
local fFlagLuaAppEnableContainedRewardUiModule = require(script.Parent.FFlagLuaAppEnableContainedRewardUi)
local var1 = tModule.interface({
	titleText = tModule.string,
	subtitleText = tModule.string,
	buttonText = tModule.string,
	coachmarkTitleText = tModule.string,
	coachmarkSubtitleText = tModule.string,
	showButton = tModule.boolean,
	variantId = tModule.string,
	keepRewardContained = if fFlagLuaAppEnableContainedRewardUiModule then tModule.optional(tModule.boolean) else nil
})
local t = {}
local t_1 = {
	titleText = "",
	subtitleText = "",
	buttonText = "",
	coachmarkTitleText = "",
	coachmarkSubtitleText = "",
	showButton = false,
	variantId = "",
	keepRewardContained = if fFlagLuaAppEnableContainedRewardUiModule then false else nil
}

function t.fromJsonData(p1)
	-- upvalues: t_1 (ref), httpService (ref), var1 (ref), mutedError (ref), fFlagLuaAppEnableContainedRewardUiModule (ref)
	local cloned = table.clone(t_1)
	local ok, status = pcall(function()
		-- upvalues: httpService (copy), p1 (ref)
		return httpService:JSONDecode(p1)
	end)
	
	if ok then
		local var2, var3 = var1(status)
		
		if not var2 then
			mutedError(`PlayWithRewardExperimentData invalid: {tostring(var3)}`)
			
			return cloned
		end
		cloned.titleText = status.titleText
		cloned.subtitleText = status.subtitleText
		cloned.buttonText = status.buttonText
		cloned.coachmarkTitleText = status.coachmarkTitleText
		cloned.coachmarkSubtitleText = status.coachmarkSubtitleText
		cloned.showButton = status.showButton
		cloned.variantId = status.variantId
		
		if fFlagLuaAppEnableContainedRewardUiModule then
			cloned.keepRewardContained = status.keepRewardContained or false
		end
	end
	return cloned
end

return t