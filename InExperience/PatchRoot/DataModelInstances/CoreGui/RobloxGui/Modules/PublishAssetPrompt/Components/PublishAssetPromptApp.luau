local corePackagesService = game:GetService("CorePackages")
local userInputService = game:GetService("UserInputService")
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local roactGamepadModule = require(corePackagesService.Packages.RoactGamepad)
local tModule = require(corePackagesService.Packages.t)
local externalEventConnection = require(corePackagesService.Workspace.Packages.RoactUtils).ExternalEventConnection
local inputTypeModule = require(corePackagesService.Workspace.Packages.InputType)
local getInputGroup = require(corePackagesService.Workspace.Packages.InputType).getInputGroup
local parent = script.Parent
local promptTypeModule = require(parent.Parent.PromptType)
local publishAssetPromptSingleStepModule = require(parent.PublishAssetPromptSingleStep)
local publishAvatarPromptModule = require(parent.PublishAvatarPrompt.PublishAvatarPrompt)
local publishAvatarAssetPromptModule = require(parent.PublishAvatarAssetPrompt.PublishAvatarAssetPrompt)
local publishMakeupLookPromptModule = require(parent.PublishMakeupLookPrompt.PublishMakeupLookPrompt)
local resultModalModule = require(parent.ResultModal)
local selectionCursorProvider = require(corePackagesService.Packages.UIBlox).App.SelectionImage.SelectionCursorProvider
local reactFocusNavigationModule = require(corePackagesService.Packages.ReactFocusNavigation)
local var1 = reactFocusNavigationModule.FocusNavigationService.new(reactFocusNavigationModule.EngineInterface.CoreGui)
local focusNavigationUtilsModule = require(corePackagesService.Workspace.Packages.FocusNavigationUtils)
local provider = focusNavigationUtilsModule.FocusNavigableSurfaceRegistry.Provider
local focusRoot = focusNavigationUtilsModule.FocusRoot
local focusNavigableSurfaceIdentifierEnum = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local getFFlagUploadMakeupSupportModule = require(parent.Parent.Flags.GetFFlagUploadMakeupSupport)
local publishAssetPromptApp = roactModule.PureComponent:extend("PublishAssetPromptApp")
publishAssetPromptApp.validateProps = tModule.strictInterface({
	assetType = tModule.optional(tModule.enum(Enum.AssetType)),
	assetInstance = tModule.optional(tModule.Instance)
})

local function _(p1)
	-- upvalues: getInputGroup (ref), inputTypeModule (ref)
	return getInputGroup(p1) == inputTypeModule.InputTypeConstants.Gamepad
end

function publishAssetPromptApp.init(p1)
	p1:setState({ screenSize = Vector2.new(0, 0) })
	
	function p1.absoluteSizeChanged(p2)
		-- upvalues: p1 (ref)
		if p1.state.screenSize ~= p2.AbsoluteSize then
			p1:setState({ screenSize = p2.AbsoluteSize })
		end
	end
	
	p1.selectedCoreGuiObject = nil
	p1.selectedGuiObject = nil
end

function publishAssetPromptApp.render(p1)
	-- upvalues: roactModule (ref), resultModalModule (ref), promptTypeModule (ref), publishAssetPromptSingleStepModule (ref), publishAvatarPromptModule (ref), publishAvatarAssetPromptModule (ref), getFFlagUploadMakeupSupportModule (ref), publishMakeupLookPromptModule (ref), externalEventConnection (ref), userInputService (ref), getInputGroup (ref), inputTypeModule (ref), roactGamepadModule (ref), selectionCursorProvider (ref), reactFocusNavigationModule (ref), var1 (ref), provider (ref), focusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref)
	local var2 = nil
	
	if p1.props.resultModalType then
		var2 = roactModule.createElement(resultModalModule, { screenSize = p1.state.screenSize })
	elseif p1.props.assetInstance then
		if p1.props.promptType == promptTypeModule.PublishAssetSingleStep then
			var2 = roactModule.createElement(publishAssetPromptSingleStepModule, { screenSize = p1.state.screenSize })
		end
	elseif p1.props.promptType == promptTypeModule.PublishAvatar then
		var2 = roactModule.createElement(publishAvatarPromptModule, { screenSize = p1.state.screenSize })
	elseif p1.props.promptType == promptTypeModule.PublishAvatarAsset then
		var2 = roactModule.createElement(publishAvatarAssetPromptModule, { screenSize = p1.state.screenSize })
	elseif getFFlagUploadMakeupSupportModule() and p1.props.promptType == promptTypeModule.PublishMakeupLook then
		var2 = roactModule.createElement(publishMakeupLookPromptModule, { screenSize = p1.state.screenSize })
	end
	return if var2 == nil then nil else roactModule.createElement("ScreenGui", {
		IgnoreGuiInset = true,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
		AutoLocalize = false,
		DisplayOrder = -1,
		[roactModule.Change.AbsoluteSize] = p1.absoluteSizeChanged
	}, {
		LastInputTypeConnection = roactModule.createElement(externalEventConnection, {
			event = userInputService.LastInputTypeChanged,
			callback = function(p2)
				-- upvalues: p1 (ref), getInputGroup (copy), inputTypeModule (copy)
				p1:setState({
					isGamepad = getInputGroup(p2) == inputTypeModule.InputTypeConstants.Gamepad
				})
			end
		}),
		PromptFrame = roactModule.createElement(roactGamepadModule.Focusable.Frame, { BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1) }, {
			CursorProvider = roactModule.createElement(selectionCursorProvider, {}, {
				FocusNavigationProvider = roactModule.createElement(reactFocusNavigationModule.FocusNavigationContext.Provider, { value = var1 }, {
					FocusNavigationRegistryProvider = roactModule.createElement(provider, nil, {
						FocusNavigationCoreScriptsWrapper = roactModule.createElement(focusRoot, {
							isIsolated = true,
							isAutoFocusRoot = true,
							surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.RouterView
						}, { Prompt = var2 })
					})
				})
			})
		})
	})
end

return roactRoduxModule.connect(function(p1)
	return {
		resultModalType = p1.promptRequest.resultModalType,
		promptType = p1.promptRequest.promptInfo.promptType,
		assetInstance = p1.promptRequest.promptInfo.assetInstance,
		assetType = p1.promptRequest.promptInfo.assetType
	}
end)(publishAssetPromptApp)