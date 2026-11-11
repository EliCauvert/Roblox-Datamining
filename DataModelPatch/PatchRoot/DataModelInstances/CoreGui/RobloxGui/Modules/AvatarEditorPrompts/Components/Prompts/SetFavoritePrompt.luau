local CorePackages = game:GetService("CorePackages")
local GuiService = game:GetService("GuiService")
local ContextActionService = game:GetService("ContextActionService")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local TModule = require(CorePackages.Packages.t)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local _ = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local RobloxTranslatorModule = require(CorePackages.Workspace.Packages.RobloxTranslator)
local InteractiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local LoadableImage = UIBloxModule.App.Loading.LoadableImage
local Parent = script.Parent.Parent.Parent
local PerformSetFavoriteModule = require(Parent.Thunks.PerformSetFavorite)
local SignalSetFavoritePermissionDeniedModule = require(Parent.Thunks.SignalSetFavoritePermissionDenied)
local CloseFavoritePromptWithB = game:DefineFastFlag("CloseFavoritePromptWithB", false)
local SetFavoritePrompt = RoactModule.PureComponent:extend("SetFavoritePrompt")
SetFavoritePrompt.validateProps = TModule.strictInterface({
	itemId = TModule.integer,
	itemType = TModule.enum(Enum.AvatarItemType),
	itemName = TModule.string,
	shouldFavorite = TModule.boolean,
	screenSize = TModule.Vector2,
	performSetFavorite = TModule.callback,
	signalSetFavoritePermissionDenied = TModule.callback
})

function SetFavoritePrompt.init(p1)
	-- upvalues: RoactModule (copy), LoadableImage (copy), CloseFavoritePromptWithB (copy), GuiService (copy), ContextActionService (copy)
	function p1.renderAlertMiddleContent()
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
				Image = "rbxthumb://type=" .. (if p1.props.itemType == Enum.AvatarItemType.Asset then "Asset" elseif p1.props.itemType == Enum.AvatarItemType.Bundle then "BundleThumbnail" else nil) .. "&id=" .. p1.props.itemId .. "&w=150&h=150"
			})
		})
	end
	
	if CloseFavoritePromptWithB then
		p1.menuKey = "favorite_prompt_" .. p1.props.itemId
		GuiService:SetMenuIsOpen(true, p1.menuKey)
		ContextActionService:BindCoreAction(p1.menuKey, function(_, UserInputState, _)
			-- upvalues: p1 (copy)
			if UserInputState == Enum.UserInputState.End then
				p1.props.signalSetFavoritePermissionDenied()
				
				return Enum.ContextActionResult.Sink
			else
				return Enum.ContextActionResult.Pass
			end
		end, false, Enum.KeyCode.ButtonB, Enum.KeyCode.Escape)
	end
end

function SetFavoritePrompt.willUnmount(p1)
	-- upvalues: CloseFavoritePromptWithB (copy), GuiService (copy), ContextActionService (copy)
	if CloseFavoritePromptWithB then
		GuiService:SetMenuIsOpen(false, p1.menuKey)
		ContextActionService:UnbindCoreAction(p1.menuKey)
	end
end

function SetFavoritePrompt.render(p1)
	-- upvalues: RobloxTranslatorModule (copy), RoactModule (copy), InteractiveAlert (copy), ButtonType (copy)
	local CoreScriptsAvatarEditorPromptsFavouriteItemPromptTitle = nil
	local CoreScriptsAvatarEditorPromptsFavouriteItemPromptText = nil
	if p1.props.shouldFavorite then
		CoreScriptsAvatarEditorPromptsFavouriteItemPromptTitle = RobloxTranslatorModule:FormatByKey("CoreScripts.AvatarEditorPrompts.FavouriteItemPromptTitle")
		CoreScriptsAvatarEditorPromptsFavouriteItemPromptText = RobloxTranslatorModule:FormatByKey("CoreScripts.AvatarEditorPrompts.FavouriteItemPromptText", { RBX_NAME = p1.props.itemName })
	else
		CoreScriptsAvatarEditorPromptsFavouriteItemPromptTitle = RobloxTranslatorModule:FormatByKey("CoreScripts.AvatarEditorPrompts.UnfavouriteItemPromptTitle")
		CoreScriptsAvatarEditorPromptsFavouriteItemPromptText = RobloxTranslatorModule:FormatByKey("CoreScripts.AvatarEditorPrompts.UnfavouriteItemPromptText", { RBX_NAME = p1.props.itemName })
	end
	return RoactModule.createElement(InteractiveAlert, {
		isMiddleContentFocusable = false,
		title = CoreScriptsAvatarEditorPromptsFavouriteItemPromptTitle,
		bodyText = CoreScriptsAvatarEditorPromptsFavouriteItemPromptText,
		buttonStackInfo = {
			buttons = {
				{
					isDefaultChild = true,
					props = {
						onActivated = p1.props.signalSetFavoritePermissionDenied,
						text = RobloxTranslatorModule:FormatByKey("CoreScripts.AvatarEditorPrompts.FavouriteItemPromptNo")
					}
				},
				{
					isDefaultChild = false,
					buttonType = ButtonType.PrimarySystem,
					props = {
						isDelayedInput = true,
						enableInputDelayed = true,
						delayInputSeconds = 3,
						onActivated = p1.props.performSetFavorite,
						text = RobloxTranslatorModule:FormatByKey("CoreScripts.AvatarEditorPrompts.FavouriteItemPromptYes")
					}
				}
			}
		},
		position = UDim2.fromScale(0.5, 0.5),
		screenSize = p1.props.screenSize,
		middleContent = p1.renderAlertMiddleContent
	})
end

return RoactRoduxModule.connect(function(p1)
	return {
		itemId = p1.promptInfo.itemId,
		itemType = p1.promptInfo.itemType,
		itemName = p1.promptInfo.itemName,
		shouldFavorite = p1.promptInfo.shouldFavorite,
		screenSize = p1.screenSize
	}
end, function(Callback)
	-- upvalues: PerformSetFavoriteModule (copy), SignalSetFavoritePermissionDeniedModule (copy)
	return {
		performSetFavorite = function()
			-- upvalues: Callback (copy), PerformSetFavoriteModule (upval)
			return Callback(PerformSetFavoriteModule)
		end,
		signalSetFavoritePermissionDenied = function()
			-- upvalues: Callback (copy), SignalSetFavoritePermissionDeniedModule (upval)
			return Callback(SignalSetFavoritePermissionDeniedModule)
		end
	}
end)(SetFavoritePrompt)