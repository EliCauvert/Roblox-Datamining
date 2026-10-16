local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local ConstantsModule = require(Parent.Constants)
local PromptConnectionsModule = require(Parent.Components.CaptureService.PromptConnections)
local PromptTypeModule = require(Parent.Enums.PromptType)
local CapturePermissionsPromptV2Module = require(Parent.Components.CaptureService.CapturePermissionsPromptV2)
local _ = require(Parent.Types)
local UseSelectorFunction = require(Parent1.RoactUtils).Hooks.RoactRodux.useSelector
local config = {
	[PromptTypeModule.SaveCaptures] = require(Parent.Components.CaptureService.SaveCapturesPrompt),
	[PromptTypeModule.ShareCapture] = require(Parent.Components.CaptureService.ShareCapturePrompt)
}

if game:GetEngineFeature("CaptureServiceGalleryPermissionPrompt") then
	config[PromptTypeModule.CapturePermissions] = CapturePermissionsPromptV2Module
end
return function(_) --[[ Line: 30 ]]
	-- upvalues: UseSelectorFunction (copy), ConstantsModule (copy), config (copy), ReactModule (copy), PromptConnectionsModule (copy)
	local UseSelectorResult = UseSelectorFunction(function(p1) --[[ Line: 31 ]]
		-- upvalues: ConstantsModule (upval)
		return p1[ConstantsModule.RoduxKey].Prompts[1]
	end)
	local PromptData = UseSelectorResult and UseSelectorResult.PromptData
	local PromptId = UseSelectorResult and UseSelectorResult.PromptId
	local PromptType = UseSelectorResult and UseSelectorResult.PromptType
	local Element = nil
	
	if PromptType then
		local Entry = config[PromptType]
		
		if Entry then
			Element = ReactModule.createElement(Entry, { promptData = PromptData, promptId = PromptId })
		else
			error(`Unexpected prompt type: {PromptType}!`)
		end
	end
	return ReactModule.createElement(ReactModule.Fragment, {}, {
		PromptConnections = ReactModule.createElement(PromptConnectionsModule),
		Prompt = Element
	})
end