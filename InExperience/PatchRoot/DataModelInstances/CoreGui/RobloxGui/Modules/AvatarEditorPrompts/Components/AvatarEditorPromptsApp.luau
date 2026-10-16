local CorePackages = game:GetService("CorePackages")
local CoreGui = game:GetService("CoreGui")
local GuiService = game:GetService("GuiService")
local UserInputService = game:GetService("UserInputService")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local RoactGamepadModule = require(CorePackages.Packages.RoactGamepad)
local TModule = require(CorePackages.Packages.t)
local ExternalEventConnection = require(CorePackages.Workspace.Packages.RoactUtils).ExternalEventConnection
local ConnectionModule = require(script.Parent.Connection)
local Prompts = script.Parent.Prompts
local LocalPlayer = game:GetService("Players").LocalPlayer
local Parent = script.Parent.Parent
local PromptTypeModule = require(Parent.PromptType)
local ScreenSizeUpdatedModule = require(Parent.Actions.ScreenSizeUpdated)
local config = {
	[Enum.UserInputType.Gamepad1] = true,
	[Enum.UserInputType.Gamepad2] = true,
	[Enum.UserInputType.Gamepad3] = true,
	[Enum.UserInputType.Gamepad4] = true,
	[Enum.UserInputType.Gamepad5] = true,
	[Enum.UserInputType.Gamepad6] = true,
	[Enum.UserInputType.Gamepad7] = true,
	[Enum.UserInputType.Gamepad8] = true
}
local config1 = {
	[PromptTypeModule.AllowInventoryReadAccess] = require(Prompts.AllowInventoryReadAccessPrompt),
	[PromptTypeModule.SaveAvatar] = require(Prompts.SaveAvatarPrompt),
	[PromptTypeModule.CreateOutfit] = require(Prompts.CreateOutfitPrompt),
	[PromptTypeModule.EnterOutfitName] = require(Prompts.EnterOutfitNamePrompt),
	[PromptTypeModule.SetFavorite] = require(Prompts.SetFavoritePrompt),
	[PromptTypeModule.DeleteOutfit] = require(Prompts.DeleteOutfitPrompt),
	[PromptTypeModule.RenameOutfit] = require(Prompts.RenameOutfitPrompt),
	[PromptTypeModule.UpdateOutfit] = require(Prompts.UpdateOutfitPrompt),
	[PromptTypeModule.SaveAvatarTimeout] = require(Prompts.SaveAvatarTimeoutPrompt)
}
local AvatarEditorPromptsApp = RoactModule.PureComponent:extend("AvatarEditorPromptsApp")
AvatarEditorPromptsApp.validateProps = TModule.strictInterface({
	promptType = TModule.optional(TModule.userdata),
	screenSizeUpdated = TModule.callback
})

function AvatarEditorPromptsApp.init(p1) --[[ Line: 70 ]]
	-- upvalues: config (copy), UserInputService (copy), RoactGamepadModule (copy)
	p1:setState({
		isGamepad = config[UserInputService:GetLastInputType()] or false
	})
	
	function p1.absoluteSizeChanged(Frame) --[[ Line: 75 ]]
		-- upvalues: p1 (copy)
		p1.props.screenSizeUpdated(Frame.AbsoluteSize)
	end
	
	p1.focusController = RoactGamepadModule.createFocusController()
	p1.selectedCoreGuiObject = nil
	p1.selectedGuiObject = nil
end

function AvatarEditorPromptsApp.render(p1) --[[ Line: 85 ]]
	-- upvalues: config1 (copy), RoactModule (copy), ConnectionModule (copy), ExternalEventConnection (copy), UserInputService (copy), config (copy), RoactGamepadModule (copy)
	local Element = nil
	
	if p1.props.promptType then
		local Entry = config1[p1.props.promptType]
		
		if Entry then
			Element = RoactModule.createElement(Entry)
		else
			error("Unexpected prompt type!")
		end
	end
	return if Element == nil then nil else RoactModule.createElement("ScreenGui", {
		IgnoreGuiInset = true,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
		AutoLocalize = false,
		DisplayOrder = -1,
		[RoactModule.Change.AbsoluteSize] = p1.absoluteSizeChanged
	}, {
		Connection = RoactModule.createElement(ConnectionModule),
		LastInputTypeConnection = RoactModule.createElement(ExternalEventConnection, {
			event = UserInputService.LastInputTypeChanged,
			callback = function(p2) --[[ Line: 110 ]]
				-- upvalues: p1 (copy), config (upval)
				p1:setState({ isGamepad = config[p2] or false })
			end
		}) or nil,
		PromptFrame = RoactModule.createElement(RoactGamepadModule.Focusable.Frame, {
			BackgroundTransparency = 1,
			focusController = p1.focusController,
			Size = UDim2.fromScale(1, 1)
		}, { Prompt = Element }) or nil
	})
end

function AvatarEditorPromptsApp.revertSelectedGuiObject(p1) --[[ Line: 128 ]]
	-- upvalues: LocalPlayer (copy), CoreGui (copy), GuiService (copy)
	local PlayerGui = LocalPlayer and LocalPlayer:FindFirstChildWhichIsA("PlayerGui")
	
	if p1.selectedCoreGuiObject and p1.selectedCoreGuiObject:IsDescendantOf(CoreGui) then
		GuiService.SelectedCoreObject = p1.selectedCoreGuiObject
	elseif p1.selectedGuiObject and p1.selectedGuiObject:IsDescendantOf(PlayerGui) then
		GuiService.SelectedObject = p1.selectedGuiObject
		GuiService.SelectedCoreObject = nil
	else
		GuiService.SelectedCoreObject = nil
	end
	p1.selectedCoreGuiObject = nil
	p1.selectedGuiObject = nil
end

function AvatarEditorPromptsApp.didUpdate(p1, p2, p3) --[[ Line: 144 ]]
	-- upvalues: GuiService (copy)
	local HasPromptType: boolean = p1.state.isGamepad and p1.props.promptType ~= nil
	
	if HasPromptType ~= (p3.isGamepad and p2.promptType ~= nil) then
		if HasPromptType then
			p1.selectedCoreGuiObject = GuiService.SelectedCoreObject
			p1.selectedGuiObject = GuiService.SelectedObject
			GuiService.SelectedObject = nil
			p1.focusController.captureFocus()
			
			return
		else
			p1.focusController.releaseFocus()
			
			if p1.state.isGamepad then
				p1:revertSelectedGuiObject()
			end
		end
	end
end

function AvatarEditorPromptsApp.willUnmount(p1) --[[ Line: 163 ]]
	if p1.state.isGamepad then
		p1:revertSelectedGuiObject()
	end
end

return RoactRoduxModule.connect(function(p1) --[[ Line: 169 | Named "mapStateToProps" ]]
	return { promptType = p1.promptInfo.promptType }
end, function(Callback) --[[ Line: 175 | Named "mapDispatchToProps" ]]
	-- upvalues: ScreenSizeUpdatedModule (copy)
	return {
		screenSizeUpdated = function(p1) --[[ Line: 177 ]]
			-- upvalues: Callback (copy), ScreenSizeUpdatedModule (upval)
			return Callback(ScreenSizeUpdatedModule(p1))
		end
	}
end)(AvatarEditorPromptsApp)