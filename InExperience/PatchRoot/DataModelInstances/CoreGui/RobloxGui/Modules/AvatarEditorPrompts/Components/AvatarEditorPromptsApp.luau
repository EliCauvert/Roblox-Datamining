local corePackagesService = game:GetService("CorePackages")
local coreGuiService = game:GetService("CoreGui")
local guiService = game:GetService("GuiService")
local userInputService = game:GetService("UserInputService")
local playersService = game:GetService("Players")
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local roactGamepadModule = require(corePackagesService.Packages.RoactGamepad)
local tModule = require(corePackagesService.Packages.t)
local externalEventConnection = require(corePackagesService.Workspace.Packages.RoactUtils).ExternalEventConnection
local connectionModule = require(script.Parent.Connection)
local prompts = script.Parent.Prompts
local allowInventoryReadAccessPromptModule = require(prompts.AllowInventoryReadAccessPrompt)
local saveAvatarPromptModule = require(prompts.SaveAvatarPrompt)
local saveAvatarTimeoutPromptModule = require(prompts.SaveAvatarTimeoutPrompt)
local createOutfitPromptModule = require(prompts.CreateOutfitPrompt)
local enterOutfitNamePromptModule = require(prompts.EnterOutfitNamePrompt)
local setFavoritePromptModule = require(prompts.SetFavoritePrompt)
local deleteOutfitPromptModule = require(prompts.DeleteOutfitPrompt)
local renameOutfitPromptModule = require(prompts.RenameOutfitPrompt)
local updateOutfitPromptModule = require(prompts.UpdateOutfitPrompt)
local localPlayer = playersService.LocalPlayer
local parent = script.Parent.Parent
local promptTypeModule = require(parent.PromptType)
local screenSizeUpdatedModule = require(parent.Actions.ScreenSizeUpdated)
local t = {
	[Enum.UserInputType.Gamepad1] = true,
	[Enum.UserInputType.Gamepad2] = true,
	[Enum.UserInputType.Gamepad3] = true,
	[Enum.UserInputType.Gamepad4] = true,
	[Enum.UserInputType.Gamepad5] = true,
	[Enum.UserInputType.Gamepad6] = true,
	[Enum.UserInputType.Gamepad7] = true,
	[Enum.UserInputType.Gamepad8] = true
}
local t_1 = {
	[promptTypeModule.AllowInventoryReadAccess] = allowInventoryReadAccessPromptModule,
	[promptTypeModule.SaveAvatar] = saveAvatarPromptModule,
	[promptTypeModule.CreateOutfit] = createOutfitPromptModule,
	[promptTypeModule.EnterOutfitName] = enterOutfitNamePromptModule,
	[promptTypeModule.SetFavorite] = setFavoritePromptModule,
	[promptTypeModule.DeleteOutfit] = deleteOutfitPromptModule,
	[promptTypeModule.RenameOutfit] = renameOutfitPromptModule,
	[promptTypeModule.UpdateOutfit] = updateOutfitPromptModule,
	[promptTypeModule.SaveAvatarTimeout] = saveAvatarTimeoutPromptModule
}
local avatarEditorPromptsApp = roactModule.PureComponent:extend("AvatarEditorPromptsApp")
avatarEditorPromptsApp.validateProps = tModule.strictInterface({
	promptType = tModule.optional(tModule.userdata),
	screenSizeUpdated = tModule.callback
})

function avatarEditorPromptsApp.init(p0)
	-- upvalues: t (ref), userInputService (ref), roactGamepadModule (ref)
	p0:setState({
		isGamepad = t[userInputService:GetLastInputType()] or false
	})
	
	function p0.absoluteSizeChanged(p1)
		-- upvalues: p0 (ref)
		p0.props.screenSizeUpdated(p1.AbsoluteSize)
	end
	
	p0.focusController = roactGamepadModule.createFocusController()
	p0.selectedCoreGuiObject = nil
	p0.selectedGuiObject = nil
end

function avatarEditorPromptsApp.render(p2)
	-- upvalues: t_1 (ref), roactModule (ref), connectionModule (ref), externalEventConnection (ref), userInputService (ref), t (ref), roactGamepadModule (ref)
	local var24 = nil
	
	if p2.props.promptType then
		local promptType = t_1[p2.props.promptType]
		
		if promptType then
			var24 = roactModule.createElement(promptType)
		else
			error("Unexpected prompt type!")
		end
	end
	return if var24 == nil then nil else roactModule.createElement("ScreenGui", {
		IgnoreGuiInset = true,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
		AutoLocalize = false,
		DisplayOrder = -1,
		[roactModule.Change.AbsoluteSize] = p2.absoluteSizeChanged
	}, {
		Connection = roactModule.createElement(connectionModule),
		LastInputTypeConnection = roactModule.createElement(externalEventConnection, {
			event = userInputService.LastInputTypeChanged,
			callback = function(p3)
				-- upvalues: p2 (ref), t (copy)
				p2:setState({ isGamepad = t[p3] or false })
			end
		}) or nil,
		PromptFrame = roactModule.createElement(roactGamepadModule.Focusable.Frame, {
			BackgroundTransparency = 1,
			focusController = p2.focusController,
			Size = UDim2.fromScale(1, 1)
		}, { Prompt = var24 }) or nil
	})
end

function avatarEditorPromptsApp.revertSelectedGuiObject(p4)
	-- upvalues: localPlayer (ref), coreGuiService (ref), guiService (ref)
	local playerGui = localPlayer and localPlayer:FindFirstChildWhichIsA("PlayerGui")
	
	if p4.selectedCoreGuiObject and p4.selectedCoreGuiObject:IsDescendantOf(coreGuiService) then
		guiService.SelectedCoreObject = p4.selectedCoreGuiObject
	elseif p4.selectedGuiObject and p4.selectedGuiObject:IsDescendantOf(playerGui) then
		guiService.SelectedObject = p4.selectedGuiObject
		guiService.SelectedCoreObject = nil
	else
		guiService.SelectedCoreObject = nil
	end
	p4.selectedCoreGuiObject = nil
	p4.selectedGuiObject = nil
end

function avatarEditorPromptsApp.didUpdate(p5, p6, p7)
	-- upvalues: guiService (ref)
	local var26 = p5.state.isGamepad and p5.props.promptType ~= nil
	
	if var26 ~= (p7.isGamepad and p6.promptType ~= nil) then
		if var26 then
			p5.selectedCoreGuiObject = guiService.SelectedCoreObject
			p5.selectedGuiObject = guiService.SelectedObject
			guiService.SelectedObject = nil
			p5.focusController.captureFocus()
			
			return
		end
		p5.focusController.releaseFocus()
		
		if p5.state.isGamepad then
			p5:revertSelectedGuiObject()
		end
	end
end

function avatarEditorPromptsApp.willUnmount(p8)
	if p8.state.isGamepad then
		p8:revertSelectedGuiObject()
	end
end

return roactRoduxModule.connect(function(p9)
	return { promptType = p9.promptInfo.promptType }
end, function(p10)
	-- upvalues: screenSizeUpdatedModule (ref)
	return {
		screenSizeUpdated = function(p11)
			-- upvalues: p10 (ref), screenSizeUpdatedModule (copy)
			return p10(screenSizeUpdatedModule(p11))
		end
	}
end)(avatarEditorPromptsApp)