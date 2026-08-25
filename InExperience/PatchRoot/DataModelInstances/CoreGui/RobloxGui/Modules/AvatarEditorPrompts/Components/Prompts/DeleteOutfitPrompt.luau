local corePackagesService = game:GetService("CorePackages")
local coreGuiService = game:GetService("CoreGui")
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local tModule = require(corePackagesService.Packages.t)
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local interactiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local loadableImage = UIBloxModule.App.Loading.LoadableImage
local _ = coreGuiService:WaitForChild("RobloxGui")
local robloxTranslatorModule = require(corePackagesService.Workspace.Packages.RobloxTranslator)
local parent = script.Parent.Parent.Parent
local signalDeleteOutfitPermissionDeniedModule = require(parent.Thunks.SignalDeleteOutfitPermissionDenied)
local performDeleteOutfitModule = require(parent.Thunks.PerformDeleteOutfit)
local avatarEditorPromptsPolicyModule = require(parent.AvatarEditorPromptsPolicy)
local deleteOutfitPrompt = roactModule.PureComponent:extend("DeleteOutfitPrompt")
deleteOutfitPrompt.validateProps = tModule.strictInterface({
	screenSize = tModule.Vector2,
	outfitId = tModule.integer,
	outfitName = tModule.string,
	performDeleteOutfit = tModule.callback,
	signalDeleteOutfitPermissionDenied = tModule.callback,
	showCustomOutfitNames = tModule.boolean
})

function deleteOutfitPrompt.init(p0)
	-- upvalues: roactModule (ref), loadableImage (ref)
	function p0.renderAlertMiddleContent()
		-- upvalues: p0 (ref), roactModule (copy), loadableImage (copy)
		return roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 150)
		}, {
			Thumnail = roactModule.createElement(loadableImage, {
				BackgroundTransparency = 1,
				useShimmerAnimationWhileLoading = true,
				showFailedStateWhenLoadingFailed = true,
				Position = UDim2.fromScale(0.5, 0),
				AnchorPoint = Vector2.new(0.5, 0),
				Size = UDim2.fromOffset(150, 150),
				Image = "rbxthumb://type=Outfit&id=" .. p0.props.outfitId .. "&w=150&h=150"
			})
		})
	end
end

function deleteOutfitPrompt.render(p1)
	-- upvalues: robloxTranslatorModule (ref), roactModule (ref), interactiveAlert (ref), buttonType (ref)
	return roactModule.createElement(interactiveAlert, {
		isMiddleContentFocusable = false,
		title = robloxTranslatorModule:FormatByKey("CoreScripts.AvatarEditorPrompts.DeleteOutfitPromptTitle"),
		bodyText = if p1.props.showCustomOutfitNames then robloxTranslatorModule:FormatByKey("CoreScripts.AvatarEditorPrompts.DeleteOutfitPromptText", { RBX_NAME = p1.props.outfitName }) else robloxTranslatorModule:FormatByKey("CoreScripts.AvatarEditorPrompts.DeleteOutfitPromptTextNoName"),
		buttonStackInfo = {
			buttons = {
				{
					isDefaultChild = true,
					props = {
						onActivated = p1.props.signalDeleteOutfitPermissionDenied,
						text = robloxTranslatorModule:FormatByKey("CoreScripts.AvatarEditorPrompts.DeleteOutfitPromptNo")
					}
				},
				{
					isDefaultChild = false,
					buttonType = buttonType.PrimarySystem,
					props = {
						onActivated = p1.props.performDeleteOutfit,
						text = robloxTranslatorModule:FormatByKey("CoreScripts.AvatarEditorPrompts.DeleteOutfitPromptYes")
					}
				}
			}
		},
		position = UDim2.fromScale(0.5, 0.5),
		screenSize = p1.props.screenSize,
		middleContent = p1.renderAlertMiddleContent
	})
end

return avatarEditorPromptsPolicyModule.connect(function(p4, _)
	return { showCustomOutfitNames = p4.getCustomOutfitNames() }
end)(roactRoduxModule.connect(function(p2)
	return {
		screenSize = p2.screenSize,
		outfitId = p2.promptInfo.outfitId,
		outfitName = p2.promptInfo.outfitName
	}
end, function(p3)
	-- upvalues: signalDeleteOutfitPermissionDeniedModule (ref), performDeleteOutfitModule (ref)
	return {
		signalDeleteOutfitPermissionDenied = function()
			-- upvalues: p3 (ref), signalDeleteOutfitPermissionDeniedModule (copy)
			return p3(signalDeleteOutfitPermissionDeniedModule)
		end,
		performDeleteOutfit = function()
			-- upvalues: p3 (ref), performDeleteOutfitModule (copy)
			return p3(performDeleteOutfitModule)
		end
	}
end)(deleteOutfitPrompt))