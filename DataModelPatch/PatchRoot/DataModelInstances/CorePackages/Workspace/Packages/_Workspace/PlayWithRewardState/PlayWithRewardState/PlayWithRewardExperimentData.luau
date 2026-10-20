local HttpService = game:GetService("HttpService")
local Parent = script:FindFirstAncestor("PlayWithRewardState").Parent
local MutedErrorFunction = require(Parent.Loggers).mutedError
local TModule = require(Parent.t)
local FFlagLuaAppEnableContainedRewardUiModule = require(script.Parent.FFlagLuaAppEnableContainedRewardUi)
local InterfaceResult = TModule.interface({
	titleText = TModule.string,
	subtitleText = TModule.string,
	buttonText = TModule.string,
	coachmarkTitleText = TModule.string,
	coachmarkSubtitleText = TModule.string,
	showButton = TModule.boolean,
	variantId = TModule.string,
	keepRewardContained = if FFlagLuaAppEnableContainedRewardUiModule then TModule.optional(TModule.boolean) else nil
})
local config = {
	titleText = "",
	subtitleText = "",
	buttonText = "",
	coachmarkTitleText = "",
	coachmarkSubtitleText = "",
	showButton = false,
	variantId = "",
	keepRewardContained = not FFlagLuaAppEnableContainedRewardUiModule and nil
}

return {
	fromJsonData = function(Input)
		-- upvalues: config (copy), HttpService (copy), InterfaceResult (copy), MutedErrorFunction (copy), FFlagLuaAppEnableContainedRewardUiModule (copy)
		local Copy = table.clone(config)
		local Success, Result = pcall(function()
			-- upvalues: HttpService (upval), Input (copy)
			return HttpService:JSONDecode(Input)
		end)
		
		if Success then
			local InterfaceResultResult, InterfaceResultResult2 = InterfaceResult(Result)
			
			if not InterfaceResultResult then
				MutedErrorFunction(`PlayWithRewardExperimentData invalid: {tostring(InterfaceResultResult2)}`)
				
				return Copy
			end
			Copy.titleText = Result.titleText
			Copy.subtitleText = Result.subtitleText
			Copy.buttonText = Result.buttonText
			Copy.coachmarkTitleText = Result.coachmarkTitleText
			Copy.coachmarkSubtitleText = Result.coachmarkSubtitleText
			Copy.showButton = Result.showButton
			Copy.variantId = Result.variantId
			
			if FFlagLuaAppEnableContainedRewardUiModule then
				Copy.keepRewardContained = Result.keepRewardContained or false
			end
		end
		return Copy
	end
}