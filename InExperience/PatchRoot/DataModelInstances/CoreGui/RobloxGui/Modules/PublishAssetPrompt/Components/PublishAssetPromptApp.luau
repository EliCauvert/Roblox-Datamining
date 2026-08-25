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
local var14 = reactFocusNavigationModule.FocusNavigationService.new(reactFocusNavigationModule.EngineInterface.CoreGui)
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

local function _(p0)
	-- upvalues: getInputGroup (ref), inputTypeModule (ref)
	return getInputGroup(p0) == inputTypeModule.InputTypeConstants.Gamepad
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

function publishAssetPromptApp.render(p3)
	-- upvalues: roactModule (ref), resultModalModule (ref), promptTypeModule (ref), publishAssetPromptSingleStepModule (ref), publishAvatarPromptModule (ref), publishAvatarAssetPromptModule (ref), getFFlagUploadMakeupSupportModule (ref), publishMakeupLookPromptModule (ref), externalEventConnection (ref), userInputService (ref), getInputGroup (ref), inputTypeModule (ref), roactGamepadModule (ref), selectionCursorProvider (ref), reactFocusNavigationModule (ref), var14 (ref), provider (ref), focusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref)
	local var18 = nil
	
	if p3.props.resultModalType then
		var18 = roactModule.createElement(resultModalModule, { screenSize = p3.state.screenSize })
	elseif p3.props.assetInstance then
		if p3.props.promptType == promptTypeModule.PublishAssetSingleStep then
			var18 = roactModule.createElement(publishAssetPromptSingleStepModule, { screenSize = p3.state.screenSize })
		end
	elseif p3.props.promptType == promptTypeModule.PublishAvatar then
		var18 = roactModule.createElement(publishAvatarPromptModule, { screenSize = p3.state.screenSize })
	elseif p3.props.promptType == promptTypeModule.PublishAvatarAsset then
		var18 = roactModule.createElement(publishAvatarAssetPromptModule, { screenSize = p3.state.screenSize })
	elseif getFFlagUploadMakeupSupportModule() and p3.props.promptType == promptTypeModule.PublishMakeupLook then
		var18 = roactModule.createElement(publishMakeupLookPromptModule, { screenSize = p3.state.screenSize })
	end
	return if var18 == nil then nil else roactModule.createElement("ScreenGui", {
		IgnoreGuiInset = true,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
		AutoLocalize = false,
		DisplayOrder = -1,
		[roactModule.Change.AbsoluteSize] = p3.absoluteSizeChanged
	}, {
		LastInputTypeConnection = roactModule.createElement(externalEventConnection, {
			event = userInputService.LastInputTypeChanged,
			callback = function(p4)
				-- upvalues: p3 (ref), getInputGroup (copy), inputTypeModule (copy)
				p3:setState({
					isGamepad = getInputGroup(p4) == inputTypeModule.InputTypeConstants.Gamepad
				})
			end
		}),
		PromptFrame = roactModule.createElement(roactGamepadModule.Focusable.Frame, { BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1) }, {
			CursorProvider = roactModule.createElement(selectionCursorProvider, {}, {
				FocusNavigationProvider = roactModule.createElement(reactFocusNavigationModule.FocusNavigationContext.Provider, { value = var14 }, {
					FocusNavigationRegistryProvider = roactModule.createElement(provider, nil, {
						FocusNavigationCoreScriptsWrapper = roactModule.createElement(focusRoot, {
							isIsolated = true,
							isAutoFocusRoot = true,
							surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.RouterView
						}, { Prompt = var18 })
					})
				})
			})
		})
	})
end

return roactRoduxModule.connect(function(p5)
	return {
		resultModalType = p5.promptRequest.resultModalType,
		promptType = p5.promptRequest.promptInfo.promptType,
		assetInstance = p5.promptRequest.promptInfo.assetInstance,
		assetType = p5.promptRequest.promptInfo.assetType
	}
end)(publishAssetPromptApp)