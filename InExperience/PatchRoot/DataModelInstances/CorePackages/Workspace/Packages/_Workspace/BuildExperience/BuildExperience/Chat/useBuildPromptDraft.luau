local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local fFlagBuildExperienceMonetizationNativeUIModule = require(buildExperience.Flags.FFlagBuildExperienceMonetizationNativeUI)
local getBuildPromptDraftStoreModule = require(buildExperience.Stores.GetBuildPromptDraftStore)

return function(p1, p2, p3, p4, p5)
	-- upvalues: getBuildPromptDraftStoreModule (ref), signalsReactModule (ref), reactModule (ref), fFlagBuildExperienceMonetizationNativeUIModule (ref)
	local var1 = getBuildPromptDraftStoreModule()
	local var2 = signalsReactModule.useSignalState(var1.getPendingDraft)
	reactModule.useEffect(function()
		-- upvalues: fFlagBuildExperienceMonetizationNativeUIModule (copy), p5 (ref), var1 (ref), var2 (ref), p1 (ref), p2 (ref), p3 (ref), p4 (ref)
		if fFlagBuildExperienceMonetizationNativeUIModule and (p5 == false or var1.getPendingDraft() ~= var2) then return end
		if var2 == nil or var2.universeId ~= p1 or var2.sessionId ~= nil and var2.sessionId ~= p2 then return end
		p3(var2.text)
		
		if var2.autoSend == true and (p4 == nil or not p4()) then
			return
		end
		var1.consumeDraft(p1, p2)
	end, if fFlagBuildExperienceMonetizationNativeUIModule then {
		var2 or false, var1, p1 or false, p2 or false, p3, p4 or false, p5 ~= false
	} else {
		var2, var1, p1, p2, p3, p4
	})
end