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
return function(_)
	-- upvalues: useSelector (ref), constantsModule (ref), t (ref), reactModule (ref), promptConnectionsModule (ref)
	local var1 = useSelector(function(p1)
		-- upvalues: constantsModule (copy)
		return p1[constantsModule.RoduxKey].Prompts[1]
	end)
	local promptData = var1 and var1.PromptData
	local promptId = var1 and var1.PromptId
	local promptType = var1 and var1.PromptType
	local var2 = nil
	
	if promptType then
		local var3 = t[promptType]
		
		if var3 then
			var2 = reactModule.createElement(var3, { promptData = promptData, promptId = promptId })
		else
			error(`Unexpected prompt type: {promptType}!`)
		end
	end
	return reactModule.createElement(reactModule.Fragment, {}, {
		PromptConnections = reactModule.createElement(promptConnectionsModule),
		Prompt = var2
	})
end