local corePackagesService = game:GetService("CorePackages")
local coreGuiService = game:GetService("CoreGui")
local guiService = game:GetService("GuiService")
local contextActionService = game:GetService("ContextActionService")
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local tModule = require(corePackagesService.Packages.t)
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local _ = coreGuiService:WaitForChild("RobloxGui")
local robloxTranslatorModule = require(corePackagesService.Workspace.Packages.RobloxTranslator)
local interactiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local loadableImage = UIBloxModule.App.Loading.LoadableImage
local parent = script.Parent.Parent.Parent
local performSetFavoriteModule = require(parent.Thunks.PerformSetFavorite)
local signalSetFavoritePermissionDeniedModule = require(parent.Thunks.SignalSetFavoritePermissionDenied)
local closeFavoritePromptWithB = game:DefineFastFlag("CloseFavoritePromptWithB", false)
local setFavoritePrompt = roactModule.PureComponent:extend("SetFavoritePrompt")
setFavoritePrompt.validateProps = tModule.strictInterface({
	itemId = tModule.integer,
	itemType = tModule.enum(Enum.AvatarItemType),
	itemName = tModule.string,
	shouldFavorite = tModule.boolean,
	screenSize = tModule.Vector2,
	performSetFavorite = tModule.callback,
	signalSetFavoritePermissionDenied = tModule.callback
})

function setFavoritePrompt.init(p0)
	-- upvalues: roactModule (ref), loadableImage (ref), closeFavoritePromptWithB (ref), guiService (ref), contextActionService (ref)
	function p0.renderAlertMiddleContent()
		-- upvalues: p0 (ref), roactModule (copy), loadableImage (copy)
		local var13 = nil
		
		if p0.props.itemType == Enum.AvatarItemType.Asset then
			var13 = "Asset"
		elseif p0.props.itemType == Enum.AvatarItemType.Bundle then
			var13 = "BundleThumbnail"
		end
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
				Image = "rbxthumb://type=" .. var13 .. "&id=" .. p0.props.itemId .. "&w=150&h=150"
			})
		})
	end
	
	if closeFavoritePromptWithB then
		p0.menuKey = "favorite_prompt_" .. p0.props.itemId
		guiService:SetMenuIsOpen(true, p0.menuKey)
		contextActionService:BindCoreAction(p0.menuKey, function(_, p1, _)
			-- upvalues: p0 (ref)
			if p1 == Enum.UserInputState.End then
				p0.props.signalSetFavoritePermissionDenied()
				
				return Enum.ContextActionResult.Sink
			end
			return Enum.ContextActionResult.Pass
		end, false, Enum.KeyCode.ButtonB, Enum.KeyCode.Escape)
	end
end

function setFavoritePrompt.willUnmount(p2)
	-- upvalues: closeFavoritePromptWithB (ref), guiService (ref), contextActionService (ref)
	if closeFavoritePromptWithB then
		guiService:SetMenuIsOpen(false, p2.menuKey)
		contextActionService:UnbindCoreAction(p2.menuKey)
	end
end

function setFavoritePrompt.render(p3)
	-- upvalues: robloxTranslatorModule (ref), roactModule (ref), interactiveAlert (ref), buttonType (ref)
	local var14, var15
	local _ = nil
	local _ = nil
	
	if p3.props.shouldFavorite then
		var14 = robloxTranslatorModule:FormatByKey("CoreScripts.AvatarEditorPrompts.FavouriteItemPromptTitle")
		var15 = robloxTranslatorModule:FormatByKey("CoreScripts.AvatarEditorPrompts.FavouriteItemPromptText", { RBX_NAME = p3.props.itemName })
	else
		var14 = robloxTranslatorModule:FormatByKey("CoreScripts.AvatarEditorPrompts.UnfavouriteItemPromptTitle")
		var15 = robloxTranslatorModule:FormatByKey("CoreScripts.AvatarEditorPrompts.UnfavouriteItemPromptText", { RBX_NAME = p3.props.itemName })
	end
	return roactModule.createElement(interactiveAlert, {
		isMiddleContentFocusable = false,
		title = var14,
		bodyText = var15,
		buttonStackInfo = {
			buttons = {
				{
					isDefaultChild = true,
					props = {
						onActivated = p3.props.signalSetFavoritePermissionDenied,
						text = robloxTranslatorModule:FormatByKey("CoreScripts.AvatarEditorPrompts.FavouriteItemPromptNo")
					}
				},
				{
					isDefaultChild = false,
					buttonType = buttonType.PrimarySystem,
					props = {
						isDelayedInput = true,
						enableInputDelayed = true,
						delayInputSeconds = 3,
						onActivated = p3.props.performSetFavorite,
						text = robloxTranslatorModule:FormatByKey("CoreScripts.AvatarEditorPrompts.FavouriteItemPromptYes")
					}
				}
			}
		},
		position = UDim2.fromScale(0.5, 0.5),
		screenSize = p3.props.screenSize,
		middleContent = p3.renderAlertMiddleContent
	})
end

return roactRoduxModule.connect(function(p4)
	return {
		itemId = p4.promptInfo.itemId,
		itemType = p4.promptInfo.itemType,
		itemName = p4.promptInfo.itemName,
		shouldFavorite = p4.promptInfo.shouldFavorite,
		screenSize = p4.screenSize
	}
end, function(p5)
	-- upvalues: performSetFavoriteModule (ref), signalSetFavoritePermissionDeniedModule (ref)
	return {
		performSetFavorite = function()
			-- upvalues: p5 (ref), performSetFavoriteModule (copy)
			return p5(performSetFavoriteModule)
		end,
		signalSetFavoritePermissionDenied = function()
			-- upvalues: p5 (ref), signalSetFavoritePermissionDeniedModule (copy)
			return p5(signalSetFavoritePermissionDeniedModule)
		end
	}
end)(setFavoritePrompt)