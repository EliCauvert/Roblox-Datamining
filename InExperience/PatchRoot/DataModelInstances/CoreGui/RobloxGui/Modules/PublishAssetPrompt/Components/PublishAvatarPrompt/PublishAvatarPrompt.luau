local corePackagesService = game:GetService("CorePackages")
local playersService = game:GetService("Players")
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local tModule = require(corePackagesService.Packages.t)
local robloxTranslatorModule = require(corePackagesService.Workspace.Packages.RobloxTranslator)
local avatarPartGridModule = require(script.Parent.AvatarParts.AvatarPartGrid)
local withStyle = require(corePackagesService.Packages.UIBlox).Style.withStyle
local mutedError = require(corePackagesService.Workspace.Packages.Loggers).mutedError
local parent = script.Parent.Parent
local basePublishPromptModule = require(parent.BasePublishPrompt)
local objectViewportModule = require(parent.Common.ObjectViewport)
local labeledTextBoxModule = require(parent.Common.LabeledTextBox)
local publishInfoListModule = require(parent.Common.PublishInfoList)
local purchasePromptModule = require(corePackagesService.Workspace.Packages.PurchasePrompt)
local publishAssetAnalytics = purchasePromptModule.PublishAssetAnalytics
local setPromptVisibilityModule = require(script.Parent.Parent.Parent.Actions.SetPromptVisibility)
local uDim = UDim.new(0, 20)
local publishAvatarPrompt = roactModule.PureComponent:extend("PublishAvatarPrompt")
publishAvatarPrompt.validateProps = tModule.strictInterface({
	screenSize = tModule.Vector2,
	humanoidModel = tModule.optional(tModule.instanceOf("Model")),
	guid = tModule.any,
	scopes = tModule.any,
	SetPromptVisibility = tModule.callback
})

function publishAvatarPrompt.init(p1)
	-- upvalues: playersService (ref), publishAssetAnalytics (ref), purchasePromptModule (ref), mutedError (ref)
	local localPlayer = playersService.LocalPlayer
	assert(localPlayer, "LocalPlayer must not be nil")
	p1:setState({
		showingPreviewView = false,
		isNameValid = true,
		isDescValid = true,
		showTopScrim = false,
		purchasePromptReady = true,
		name = localPlayer.Name .. "'s Body",
		description = localPlayer.Name .. "'s Body"
	})
	
	function p0.openPreviewView()
		-- upvalues: publishAssetAnalytics (copy), p1 (ref)
		publishAssetAnalytics.sendButtonClicked(publishAssetAnalytics.Section.BuyCreationPage, publishAssetAnalytics.Element.Expand)
		p1:setState({ showingPreviewView = true })
	end
	
	function p0.closePreviewView()
		-- upvalues: p1 (ref)
		p1:setState({ showingPreviewView = false })
	end
	
	function p0.canSubmit()
		-- upvalues: p1 (ref)
		return p1.state.isNameValid and (p1.state.isDescValid and (p1.props.humanoidModel ~= nil and p1.state.purchasePromptReady))
	end
	
	function p0.onSubmit()
		-- upvalues: publishAssetAnalytics (copy), p1 (ref), purchasePromptModule (copy), mutedError (copy)
		publishAssetAnalytics.sendButtonClicked(publishAssetAnalytics.Section.BuyCreationPage, publishAssetAnalytics.Element.Buy)
		local t = { name = p1.state.name, description = p1.state.description }
		
		if purchasePromptModule.initiateAvatarCreationFeePurchase then
			purchasePromptModule.initiateAvatarCreationFeePurchase(t, p1.props.guid, p1.props.humanoidModel, p1.props.priceInRobux)
			
			return
		end
		mutedError("PurchasePrompt.initiateAvatarCreationFeePurchase is not available")
	end
	
	function p0.onNameUpdated(p2, p3)
		-- upvalues: p1 (ref), publishAssetAnalytics (copy)
		p1:setState({ name = p2, isNameValid = p3 })
		
		if not p1.sentNameFieldTouched then
			p1.sentNameFieldTouched = true
			publishAssetAnalytics.sendFieldTouched(publishAssetAnalytics.Section.BuyCreationPage, publishAssetAnalytics.Element.Name)
		end
	end
	
	function p0.onDescriptionUpdated(p2, p3)
		-- upvalues: p1 (ref), publishAssetAnalytics (copy)
		p1:setState({ description = p2, isDescValid = p3 })
		
		if not p1.sentDescriptionFieldTouched then
			p1.sentDescriptionFieldTouched = true
			publishAssetAnalytics.sendFieldTouched(publishAssetAnalytics.Section.BuyCreationPage, publishAssetAnalytics.Element.Description)
		end
	end
	
	function p0.onWindowStateChanged(p2)
		-- upvalues: p1 (ref)
		local isShown = p2.isShown
		
		if p2.hasCompletedPurchase and not isShown then
			p1.props.SetPromptVisibility(false)
			
			return
		end
		p1:setState({ showTopScrim = isShown })
		
		if isShown then
			p1:setState({ purchasePromptReady = false })
		end
	end
	
	function p0.onPromptStateSetToNone()
		-- upvalues: p1 (ref)
		p1:setState({ purchasePromptReady = true })
	end
end

function publishAvatarPrompt.didMount(p1)
	-- upvalues: purchasePromptModule (ref), mutedError (ref), publishAssetAnalytics (ref)
	p1.sentNameFieldTouched = false
	p1.sentDescriptionFieldTouched = false
	local windowStateChangedEvent = purchasePromptModule.windowStateChangedEvent
	local promptStateSetToNoneEvent = purchasePromptModule.promptStateSetToNoneEvent
	
	if windowStateChangedEvent and promptStateSetToNoneEvent then
		p1.windowStateChangedConnection = windowStateChangedEvent:Connect(p1.onWindowStateChanged)
		p1.promptStateSetToNoneConnection = promptStateSetToNoneEvent:Connect(p1.onPromptStateSetToNone)
	else
		mutedError("PurchasePrompt.windowStateChangedEvent or PurchasePrompt.promptStateSetToNoneEvent is not available")
	end
	publishAssetAnalytics.sendPageLoad(publishAssetAnalytics.Section.BuyCreationPage)
end

function publishAvatarPrompt.willUnmount(p1)
	-- upvalues: mutedError (ref)
	if p1.windowStateChangedConnection then
		p1.windowStateChangedConnection:Disconnect()
	else
		mutedError("windowStateChangedConnection was not established")
	end
	if p1.promptStateSetToNoneConnection then
		p1.promptStateSetToNoneConnection:Disconnect()
		
		return
	end
	mutedError("promptStateSetToNoneConnection was not established")
end

function publishAvatarPrompt.renderPromptBody(p1)
	-- upvalues: withStyle (ref), roactModule (ref), uDim (ref), objectViewportModule (ref), labeledTextBoxModule (ref), robloxTranslatorModule (ref), publishInfoListModule (ref), avatarPartGridModule (ref)
	local var1 = p1.props.humanoidModel == nil
	
	return withStyle(function(_)
		-- upvalues: roactModule (copy), uDim (copy), objectViewportModule (copy), p1 (ref), var1 (ref), labeledTextBoxModule (copy), robloxTranslatorModule (copy), publishInfoListModule (copy), avatarPartGridModule (copy)
		return roactModule.createFragment({
			UIListLayout = roactModule.createElement("UIListLayout", {
				Padding = uDim,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Vertical
			}),
			UIPadding = roactModule.createElement("UIPadding", { PaddingBottom = uDim, PaddingTop = uDim }),
			EmbeddedPreview = roactModule.createElement(objectViewportModule, {
				useFullBodyCameraSettings = true,
				fieldOfView = 30,
				LayoutOrder = 1,
				isHumanoidModel = true,
				openPreviewView = p1.openPreviewView,
				model = p1.props.humanoidModel,
				isLoading = var1
			}),
			DescriptionInput = roactModule.createElement(labeledTextBoxModule, {
				LayoutOrder = 2,
				centerText = false,
				maxLength = 1000,
				textBoxHeight = 104,
				labelText = robloxTranslatorModule:FormatByKey("CoreScripts.PublishAssetPrompt.Description"),
				defaultText = p1.state.description,
				onTextUpdated = p1.onDescriptionUpdated,
				invalidInputText = robloxTranslatorModule:FormatByKey("CoreScripts.PublishAssetPrompt.InvalidDescription")
			}),
			InfoList = roactModule.createElement(publishInfoListModule, {
				LayoutOrder = 3,
				typeName = robloxTranslatorModule:FormatByKey("Feature.Catalog.Label.Body")
			}),
			AvatarPartGrid = roactModule.createElement(avatarPartGridModule, {
				LayoutOrder = 4,
				humanoidModel = p1.props.humanoidModel,
				name = p1.state.name,
				screenSize = p1.props.screenSize
			})
		})
	end)
end

function publishAvatarPrompt.render(p1)
	-- upvalues: playersService (ref), roactModule (ref), basePublishPromptModule (ref), robloxTranslatorModule (ref)
	assert(playersService, "Players must not be nil")
	
	return roactModule.createElement(basePublishPromptModule, {
		delayInputSeconds = 3,
		promptBody = p1:renderPromptBody(),
		screenSize = p1.props.screenSize,
		showingPreviewView = p1.state.showingPreviewView,
		closePreviewView = p1.closePreviewView,
		asset = p1.props.humanoidModel,
		nameLabel = robloxTranslatorModule:FormatByKey("CoreScripts.PublishAvatarPrompt.BodyName"),
		defaultName = p1.state.name,
		titleText = robloxTranslatorModule:FormatByKey("CoreScripts.PublishAvatarPrompt.BuyCreation"),
		onNameUpdated = p1.onNameUpdated,
		canSubmit = p1.canSubmit,
		onSubmit = p1.onSubmit,
		priceInRobux = p1.props.priceInRobux,
		showTopScrim = p1.state.showTopScrim
	})
end

return roactRoduxModule.connect(function(p1)
	return {
		humanoidModel = p1.promptRequest.promptInfo.humanoidModel,
		guid = p1.promptRequest.promptInfo.guid,
		scopes = p1.promptRequest.promptInfo.scopes,
		priceInRobux = p1.promptRequest.promptInfo.priceInRobux
	}
end, function(p1)
	-- upvalues: setPromptVisibilityModule (ref)
	return {
		SetPromptVisibility = function(value)
			-- upvalues: p1 (ref), setPromptVisibilityModule (copy)
			p1(setPromptVisibilityModule(value))
		end
	}
end)(publishAvatarPrompt)