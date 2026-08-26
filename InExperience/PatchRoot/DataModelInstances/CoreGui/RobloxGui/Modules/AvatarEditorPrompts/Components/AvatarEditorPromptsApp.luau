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

function avatarEditorPromptsApp.init(p1)
	-- upvalues: t (ref), userInputService (ref), roactGamepadModule (ref)
	p1:setState({
		isGamepad = t[userInputService:GetLastInputType()] or false
	})
	
	function p0.absoluteSizeChanged(p2)
		-- upvalues: p1 (ref)
		p1.props.screenSizeUpdated(p2.AbsoluteSize)
	end
	
	p1.focusController = roactGamepadModule.createFocusController()
	p1.selectedCoreGuiObject = nil
	p1.selectedGuiObject = nil
end

function avatarEditorPromptsApp.render(p1)
	-- upvalues: t_1 (ref), roactModule (ref), connectionModule (ref), externalEventConnection (ref), userInputService (ref), t (ref), roactGamepadModule (ref)
	local var1 = nil
	
	if p1.props.promptType then
		local promptType = t_1[p1.props.promptType]
		
		if promptType then
			var1 = roactModule.createElement(promptType)
		else
			error("Unexpected prompt type!")
		end
	end
	return if var1 == nil then nil else roactModule.createElement("ScreenGui", {
		IgnoreGuiInset = true,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
		AutoLocalize = false,
		DisplayOrder = -1,
		[roactModule.Change.AbsoluteSize] = p1.absoluteSizeChanged
	}, {
		Connection = roactModule.createElement(connectionModule),
		LastInputTypeConnection = roactModule.createElement(externalEventConnection, {
			event = userInputService.LastInputTypeChanged,
			callback = function(p2)
				-- upvalues: p1 (ref), t (copy)
				p1:setState({ isGamepad = t[p2] or false })
			end
		}) or nil,
		PromptFrame = roactModule.createElement(roactGamepadModule.Focusable.Frame, {
			BackgroundTransparency = 1,
			focusController = p1.focusController,
			Size = UDim2.fromScale(1, 1)
		}, { Prompt = var1 }) or nil
	})
end

function avatarEditorPromptsApp.revertSelectedGuiObject(p1)
	-- upvalues: localPlayer (ref), coreGuiService (ref), guiService (ref)
	local playerGui = localPlayer and localPlayer:FindFirstChildWhichIsA("PlayerGui")
	
	if p1.selectedCoreGuiObject and p1.selectedCoreGuiObject:IsDescendantOf(coreGuiService) then
		guiService.SelectedCoreObject = p1.selectedCoreGuiObject
	elseif p1.selectedGuiObject and p1.selectedGuiObject:IsDescendantOf(playerGui) then
		guiService.SelectedObject = p1.selectedGuiObject
		guiService.SelectedCoreObject = nil
	else
		guiService.SelectedCoreObject = nil
	end
	p1.selectedCoreGuiObject = nil
	p1.selectedGuiObject = nil
end

function avatarEditorPromptsApp.didUpdate(p1, p2, p3)
	-- upvalues: guiService (ref)
	local var1 = p1.state.isGamepad and p1.props.promptType ~= nil
	
	if var1 ~= (p3.isGamepad and p2.promptType ~= nil) then
		if var1 then
			p1.selectedCoreGuiObject = guiService.SelectedCoreObject
			p1.selectedGuiObject = guiService.SelectedObject
			guiService.SelectedObject = nil
			p1.focusController.captureFocus()
			
			return
		end
		p1.focusController.releaseFocus()
		
		if p1.state.isGamepad then
			p1:revertSelectedGuiObject()
		end
	end
end

function avatarEditorPromptsApp.willUnmount(p1)
	if p1.state.isGamepad then
		p1:revertSelectedGuiObject()
	end
end

return roactRoduxModule.connect(function(p1)
	return { promptType = p1.promptInfo.promptType }
end, function(p1)
	-- upvalues: screenSizeUpdatedModule (ref)
	return {
		screenSizeUpdated = function(p2)
			-- upvalues: p1 (ref), screenSizeUpdatedModule (copy)
			return p1(screenSizeUpdatedModule(p2))
		end
	}
end)(avatarEditorPromptsApp)