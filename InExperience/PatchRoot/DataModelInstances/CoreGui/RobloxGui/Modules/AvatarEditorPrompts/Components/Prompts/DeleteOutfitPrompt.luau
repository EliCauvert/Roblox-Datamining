local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local TModule = require(CorePackages.Packages.t)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local InteractiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local LoadableImage = UIBloxModule.App.Loading.LoadableImage
local _ = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local RobloxTranslatorModule = require(CorePackages.Workspace.Packages.RobloxTranslator)
local Parent = script.Parent.Parent.Parent
local SignalDeleteOutfitPermissionDeniedModule = require(Parent.Thunks.SignalDeleteOutfitPermissionDenied)
local PerformDeleteOutfitModule = require(Parent.Thunks.PerformDeleteOutfit)
local AvatarEditorPromptsPolicyModule = require(Parent.AvatarEditorPromptsPolicy)
local DeleteOutfitPrompt = RoactModule.PureComponent:extend("DeleteOutfitPrompt")
DeleteOutfitPrompt.validateProps = TModule.strictInterface({
	screenSize = TModule.Vector2,
	outfitId = TModule.integer,
	outfitName = TModule.string,
	performDeleteOutfit = TModule.callback,
	signalDeleteOutfitPermissionDenied = TModule.callback,
	showCustomOutfitNames = TModule.boolean
})

function DeleteOutfitPrompt.init(p1) --[[ Line: 43 ]]
	-- upvalues: RoactModule (copy), LoadableImage (copy)
	function p1.renderAlertMiddleContent() --[[ Line: 44 ]]
		-- upvalues: p1 (copy), RoactModule (upval), LoadableImage (upval)
		return RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 150)
		}, {
			Thumnail = RoactModule.createElement(LoadableImage, {
				BackgroundTransparency = 1,
				useShimmerAnimationWhileLoading = true,
				showFailedStateWhenLoadingFailed = true,
				Position = UDim2.fromScale(0.5, 0),
				AnchorPoint = Vector2.new(0.5, 0),
				Size = UDim2.fromOffset(150, 150),
				Image = "rbxthumb://type=Outfit&id=" .. p1.props.outfitId .. "&w=150&h=150"
			})
		})
	end
end

function DeleteOutfitPrompt.render(p1) --[[ Line: 64 ]]
	-- upvalues: RobloxTranslatorModule (copy), RoactModule (copy), InteractiveAlert (copy), ButtonType (copy)
	return RoactModule.createElement(InteractiveAlert, {
		isMiddleContentFocusable = false,
		title = RobloxTranslatorModule:FormatByKey("CoreScripts.AvatarEditorPrompts.DeleteOutfitPromptTitle"),
		bodyText = if p1.props.showCustomOutfitNames then RobloxTranslatorModule:FormatByKey("CoreScripts.AvatarEditorPrompts.DeleteOutfitPromptText", { RBX_NAME = p1.props.outfitName }) else RobloxTranslatorModule:FormatByKey("CoreScripts.AvatarEditorPrompts.DeleteOutfitPromptTextNoName"),
		buttonStackInfo = {
			buttons = {
				{
					isDefaultChild = true,
					props = {
						onActivated = p1.props.signalDeleteOutfitPermissionDenied,
						text = RobloxTranslatorModule:FormatByKey("CoreScripts.AvatarEditorPrompts.DeleteOutfitPromptNo")
					}
				},
				{
					isDefaultChild = false,
					buttonType = ButtonType.PrimarySystem,
					props = {
						onActivated = p1.props.performDeleteOutfit,
						text = RobloxTranslatorModule:FormatByKey("CoreScripts.AvatarEditorPrompts.DeleteOutfitPromptYes")
					}
				}
			}
		},
		position = UDim2.fromScale(0.5, 0.5),
		screenSize = p1.props.screenSize,
		middleContent = p1.renderAlertMiddleContent
	})
end

return (AvatarEditorPromptsPolicyModule.connect(function(p1, _) --[[ Line: 125 ]]
	return { showCustomOutfitNames = p1.getCustomOutfitNames() }
end)((RoactRoduxModule.connect(function(p1) --[[ Line: 103 | Named "mapStateToProps" ]]
	return {
		screenSize = p1.screenSize,
		outfitId = p1.promptInfo.outfitId,
		outfitName = p1.promptInfo.outfitName
	}
end, function(Callback) --[[ Line: 111 | Named "mapDispatchToProps" ]]
	-- upvalues: SignalDeleteOutfitPermissionDeniedModule (copy), PerformDeleteOutfitModule (copy)
	return {
		signalDeleteOutfitPermissionDenied = function() --[[ Line: 113 ]]
			-- upvalues: Callback (copy), SignalDeleteOutfitPermissionDeniedModule (upval)
			return Callback(SignalDeleteOutfitPermissionDeniedModule)
		end,
		performDeleteOutfit = function() --[[ Line: 117 ]]
			-- upvalues: Callback (copy), PerformDeleteOutfitModule (upval)
			return Callback(PerformDeleteOutfitModule)
		end
	}
end)(DeleteOutfitPrompt))))