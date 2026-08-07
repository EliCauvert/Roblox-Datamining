local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local roactUtilsModule = require(parent_1.RoactUtils)
local constantsModule = require(parent.Constants)
local promptConnectionsModule = require(parent.Components.CaptureService.PromptConnections)
local promptTypeModule = require(parent.Enums.PromptType)
local saveCapturesPromptModule = require(parent.Components.CaptureService.SaveCapturesPrompt)
local shareCapturePromptModule = require(parent.Components.CaptureService.ShareCapturePrompt)
local capturePermissionsPromptV2Module = require(parent.Components.CaptureService.CapturePermissionsPromptV2)
local _ = require(parent.Types)
local useSelector = roactUtilsModule.Hooks.RoactRodux.useSelector
local t = {
	[promptTypeModule.SaveCaptures] = saveCapturesPromptModule,
	[promptTypeModule.ShareCapture] = shareCapturePromptModule
}

if game:GetEngineFeature("CaptureServiceGalleryPermissionPrompt") then
	t[promptTypeModule.CapturePermissions] = capturePermissionsPromptV2Module
end
return function(_) --[[ line: 30 ]]
	-- upvalues: useSelector (ref), constantsModule (ref), t (ref), reactModule (ref), promptConnectionsModule (ref)
	local var9 = useSelector(function(p0) --[[ line: 31 ]]
		-- upvalues: constantsModule (copy)
		return p0[constantsModule.RoduxKey].Prompts[1]
	end)
	local promptData = var9 and var9.PromptData
	local promptId = var9 and var9.PromptId
	local promptType = var9 and var9.PromptType
	local var13 = nil
	
	if promptType then
		local var14 = t[promptType]
		
		if var14 then
			var13 = reactModule.createElement(var14, { promptData = promptData, promptId = promptId })
		else
			error(`Unexpected prompt type: {promptType}!`)
		end
	end
	return reactModule.createElement(reactModule.Fragment, {}, {
		PromptConnections = reactModule.createElement(promptConnectionsModule),
		Prompt = var13
	})
end