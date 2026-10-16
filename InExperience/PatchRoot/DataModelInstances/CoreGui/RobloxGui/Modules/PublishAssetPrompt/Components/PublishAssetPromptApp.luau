local CorePackages = game:GetService("CorePackages")
local UserInputService = game:GetService("UserInputService")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local RoactGamepadModule = require(CorePackages.Packages.RoactGamepad)
local TModule = require(CorePackages.Packages.t)
local ExternalEventConnection = require(CorePackages.Workspace.Packages.RoactUtils).ExternalEventConnection
local InputTypeModule = require(CorePackages.Workspace.Packages.InputType)
local GetInputGroupFunction = require(CorePackages.Workspace.Packages.InputType).getInputGroup
local Parent = script.Parent
local PromptTypeModule = require(Parent.Parent.PromptType)
local PublishAssetPromptSingleStepModule = require(Parent.PublishAssetPromptSingleStep)
local PublishAvatarPromptModule = require(Parent.PublishAvatarPrompt.PublishAvatarPrompt)
local PublishAvatarAssetPromptModule = require(Parent.PublishAvatarAssetPrompt.PublishAvatarAssetPrompt)
local PublishMakeupLookPromptModule = require(Parent.PublishMakeupLookPrompt.PublishMakeupLookPrompt)
local ResultModalModule = require(Parent.ResultModal)
local SelectionCursorProvider = require(CorePackages.Packages.UIBlox).App.SelectionImage.SelectionCursorProvider
local ReactFocusNavigationModule = require(CorePackages.Packages.ReactFocusNavigation)
local NewResult = ReactFocusNavigationModule.FocusNavigationService.new(ReactFocusNavigationModule.EngineInterface.CoreGui)
local FocusNavigationUtilsModule = require(CorePackages.Workspace.Packages.FocusNavigationUtils)
local Provider = FocusNavigationUtilsModule.FocusNavigableSurfaceRegistry.Provider
local FocusRoot = FocusNavigationUtilsModule.FocusRoot
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local GetFFlagUploadMakeupSupportModule = require(Parent.Parent.Flags.GetFFlagUploadMakeupSupport)
local PublishAssetPromptApp = RoactModule.PureComponent:extend("PublishAssetPromptApp")
PublishAssetPromptApp.validateProps = TModule.strictInterface({
	assetType = TModule.optional(TModule.enum(Enum.AssetType)),
	assetInstance = TModule.optional(TModule.Instance)
})

local function _(p1): boolean --[[ Line: 50 | Named "isGamepadInput" ]]
	-- upvalues: GetInputGroupFunction (copy), InputTypeModule (copy)
	return GetInputGroupFunction(p1) == InputTypeModule.InputTypeConstants.Gamepad
end

function PublishAssetPromptApp.init(p1) --[[ Line: 55 ]]
	p1:setState({ screenSize = Vector2.new(0, 0) })
	
	function p1.absoluteSizeChanged(Frame: Frame) --[[ Line: 60 ]]
		-- upvalues: p1 (copy)
		if p1.state.screenSize ~= Frame.AbsoluteSize then
			p1:setState({ screenSize = Frame.AbsoluteSize })
		end
	end
	
	p1.selectedCoreGuiObject = nil
	p1.selectedGuiObject = nil
end

function PublishAssetPromptApp.render(p1) --[[ Line: 72 ]]
	-- upvalues: RoactModule (copy), ResultModalModule (copy), PromptTypeModule (copy), PublishAssetPromptSingleStepModule (copy), PublishAvatarPromptModule (copy), PublishAvatarAssetPromptModule (copy), GetFFlagUploadMakeupSupportModule (copy), PublishMakeupLookPromptModule (copy), ExternalEventConnection (copy), UserInputService (copy), GetInputGroupFunction (copy), InputTypeModule (copy), RoactGamepadModule (copy), SelectionCursorProvider (copy), ReactFocusNavigationModule (copy), NewResult (copy), Provider (copy), FocusRoot (copy), FocusNavigableSurfaceIdentifierEnum (copy)
	local Element = if p1.props.resultModalType then RoactModule.createElement(ResultModalModule, { screenSize = p1.state.screenSize }) elseif p1.props.assetInstance then if p1.props.promptType == PromptTypeModule.PublishAssetSingleStep then RoactModule.createElement(PublishAssetPromptSingleStepModule, { screenSize = p1.state.screenSize }) else nil elseif p1.props.promptType == PromptTypeModule.PublishAvatar then RoactModule.createElement(PublishAvatarPromptModule, { screenSize = p1.state.screenSize }) elseif p1.props.promptType == PromptTypeModule.PublishAvatarAsset then RoactModule.createElement(PublishAvatarAssetPromptModule, { screenSize = p1.state.screenSize }) elseif GetFFlagUploadMakeupSupportModule() and p1.props.promptType == PromptTypeModule.PublishMakeupLook then RoactModule.createElement(PublishMakeupLookPromptModule, { screenSize = p1.state.screenSize }) else nil
	
	return if Element == nil then nil else RoactModule.createElement("ScreenGui", {
		IgnoreGuiInset = true,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
		AutoLocalize = false,
		DisplayOrder = -1,
		[RoactModule.Change.AbsoluteSize] = p1.absoluteSizeChanged
	}, {
		LastInputTypeConnection = RoactModule.createElement(ExternalEventConnection, {
			event = UserInputService.LastInputTypeChanged,
			callback = function(p2) --[[ Line: 112 ]]
				-- upvalues: p1 (copy), GetInputGroupFunction (upval), InputTypeModule (upval)
				p1:setState({
					isGamepad = GetInputGroupFunction(p2) == InputTypeModule.InputTypeConstants.Gamepad
				})
			end
		}),
		PromptFrame = RoactModule.createElement(RoactGamepadModule.Focusable.Frame, { BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1) }, {
			CursorProvider = RoactModule.createElement(SelectionCursorProvider, {}, {
				FocusNavigationProvider = RoactModule.createElement(ReactFocusNavigationModule.FocusNavigationContext.Provider, { value = NewResult }, {
					FocusNavigationRegistryProvider = RoactModule.createElement(Provider, nil, {
						FocusNavigationCoreScriptsWrapper = RoactModule.createElement(FocusRoot, {
							isIsolated = true,
							isAutoFocusRoot = true,
							surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.RouterView
						}, { Prompt = Element })
					})
				})
			})
		})
	})
end

return RoactRoduxModule.connect(function(p1) --[[ Line: 150 | Named "mapStateToProps" ]]
	return {
		resultModalType = p1.promptRequest.resultModalType,
		promptType = p1.promptRequest.promptInfo.promptType,
		assetInstance = p1.promptRequest.promptInfo.assetInstance,
		assetType = p1.promptRequest.promptInfo.assetType
	}
end)(PublishAssetPromptApp)