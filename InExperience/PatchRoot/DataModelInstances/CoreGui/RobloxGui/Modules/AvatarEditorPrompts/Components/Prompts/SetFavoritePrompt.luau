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

function setFavoritePrompt.init(p1)
	-- upvalues: roactModule (ref), loadableImage (ref), closeFavoritePromptWithB (ref), guiService (ref), contextActionService (ref)
	function p0.renderAlertMiddleContent()
		-- upvalues: p1 (ref), roactModule (copy), loadableImage (copy)
		local var1 = nil
		
		if p1.props.itemType == Enum.AvatarItemType.Asset then
			var1 = "Asset"
		elseif p1.props.itemType == Enum.AvatarItemType.Bundle then
			var1 = "BundleThumbnail"
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
		p1.menuKey = "favorite_prompt_" .. p0.props.itemId
		guiService:SetMenuIsOpen(true, p1.menuKey)
		contextActionService:BindCoreAction(p1.menuKey, function(_, p2, _)
			-- upvalues: p1 (ref)
			if p2 == Enum.UserInputState.End then
				p1.props.signalSetFavoritePermissionDenied()
				
				return Enum.ContextActionResult.Sink
			end
			return Enum.ContextActionResult.Pass
		end, false, Enum.KeyCode.ButtonB, Enum.KeyCode.Escape)
	end
end

function setFavoritePrompt.willUnmount(p1)
	-- upvalues: closeFavoritePromptWithB (ref), guiService (ref), contextActionService (ref)
	if closeFavoritePromptWithB then
		guiService:SetMenuIsOpen(false, p1.menuKey)
		contextActionService:UnbindCoreAction(p1.menuKey)
	end
end

function setFavoritePrompt.render(p1)
	-- upvalues: robloxTranslatorModule (ref), roactModule (ref), interactiveAlert (ref), buttonType (ref)
	local var1, var2
	local _ = nil
	local _ = nil
	
	if p1.props.shouldFavorite then
		var1 = robloxTranslatorModule:FormatByKey("CoreScripts.AvatarEditorPrompts.FavouriteItemPromptTitle")
		var2 = robloxTranslatorModule:FormatByKey("CoreScripts.AvatarEditorPrompts.FavouriteItemPromptText", { RBX_NAME = p1.props.itemName })
	else
		var1 = robloxTranslatorModule:FormatByKey("CoreScripts.AvatarEditorPrompts.UnfavouriteItemPromptTitle")
		var2 = robloxTranslatorModule:FormatByKey("CoreScripts.AvatarEditorPrompts.UnfavouriteItemPromptText", { RBX_NAME = p1.props.itemName })
	end
	return roactModule.createElement(interactiveAlert, {
		isMiddleContentFocusable = false,
		title = var1,
		bodyText = var2,
		buttonStackInfo = {
			buttons = {
				{
					isDefaultChild = true,
					props = {
						onActivated = p1.props.signalSetFavoritePermissionDenied,
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
						onActivated = p1.props.performSetFavorite,
						text = robloxTranslatorModule:FormatByKey("CoreScripts.AvatarEditorPrompts.FavouriteItemPromptYes")
					}
				}
			}
		},
		position = UDim2.fromScale(0.5, 0.5),
		screenSize = p1.props.screenSize,
		middleContent = p1.renderAlertMiddleContent
	})
end

return roactRoduxModule.connect(function(p1)
	return {
		itemId = p1.promptInfo.itemId,
		itemType = p1.promptInfo.itemType,
		itemName = p1.promptInfo.itemName,
		shouldFavorite = p1.promptInfo.shouldFavorite,
		screenSize = p1.screenSize
	}
end, function(p1)
	-- upvalues: performSetFavoriteModule (ref), signalSetFavoritePermissionDeniedModule (ref)
	return {
		performSetFavorite = function()
			-- upvalues: p1 (ref), performSetFavoriteModule (copy)
			return p1(performSetFavoriteModule)
		end,
		signalSetFavoritePermissionDenied = function()
			-- upvalues: p1 (ref), signalSetFavoritePermissionDeniedModule (copy)
			return p1(signalSetFavoritePermissionDeniedModule)
		end
	}
end)(setFavoritePrompt)