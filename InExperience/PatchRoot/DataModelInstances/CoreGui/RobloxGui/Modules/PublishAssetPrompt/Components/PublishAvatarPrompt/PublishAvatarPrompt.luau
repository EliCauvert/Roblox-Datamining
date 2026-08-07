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

function publishAvatarPrompt.init(p0) --[[ line: 50 ]]
	-- upvalues: playersService (ref), publishAssetAnalytics (ref), purchasePromptModule (ref), mutedError (ref)
	local localPlayer = playersService.LocalPlayer
	assert(localPlayer, "LocalPlayer must not be nil")
	p0:setState({
		showingPreviewView = false,
		isNameValid = true,
		isDescValid = true,
		showTopScrim = false,
		purchasePromptReady = true,
		name = localPlayer.Name .. "'s Body",
		description = localPlayer.Name .. "'s Body"
	})
	
	function p0.openPreviewView() --[[ line: 65 ]]
		-- upvalues: publishAssetAnalytics (copy), p0 (ref)
		publishAssetAnalytics.sendButtonClicked(publishAssetAnalytics.Section.BuyCreationPage, publishAssetAnalytics.Element.Expand)
		p0:setState({ showingPreviewView = true })
	end
	
	function p0.closePreviewView() --[[ line: 71 ]]
		-- upvalues: p0 (ref)
		p0:setState({ showingPreviewView = false })
	end
	
	function p0.canSubmit() --[[ line: 78 ]]
		-- upvalues: p0 (ref)
		return p0.state.isNameValid and (p0.state.isDescValid and (p0.props.humanoidModel ~= nil and p0.state.purchasePromptReady))
	end
	
	function p0.onSubmit() --[[ line: 85 ]]
		-- upvalues: publishAssetAnalytics (copy), p0 (ref), purchasePromptModule (copy), mutedError (copy)
		publishAssetAnalytics.sendButtonClicked(publishAssetAnalytics.Section.BuyCreationPage, publishAssetAnalytics.Element.Buy)
		local t = { name = p0.state.name, description = p0.state.description }
		
		if purchasePromptModule.initiateAvatarCreationFeePurchase then
			purchasePromptModule.initiateAvatarCreationFeePurchase(t, p0.props.guid, p0.props.humanoidModel, p0.props.priceInRobux)
			
			return
		end
		mutedError("PurchasePrompt.initiateAvatarCreationFeePurchase is not available")
	end
	
	function p0.onNameUpdated(p1, p2) --[[ line: 104 ]]
		-- upvalues: p0 (ref), publishAssetAnalytics (copy)
		p0:setState({ name = p1, isNameValid = p2 })
		
		if not p0.sentNameFieldTouched then
			p0.sentNameFieldTouched = true
			publishAssetAnalytics.sendFieldTouched(publishAssetAnalytics.Section.BuyCreationPage, publishAssetAnalytics.Element.Name)
		end
	end
	
	function p0.onDescriptionUpdated(p3, p4) --[[ line: 116 ]]
		-- upvalues: p0 (ref), publishAssetAnalytics (copy)
		p0:setState({ description = p3, isDescValid = p4 })
		
		if not p0.sentDescriptionFieldTouched then
			p0.sentDescriptionFieldTouched = true
			publishAssetAnalytics.sendFieldTouched(publishAssetAnalytics.Section.BuyCreationPage, publishAssetAnalytics.Element.Description)
		end
	end
	
	function p0.onWindowStateChanged(p5) --[[ line: 128 ]]
		-- upvalues: p0 (ref)
		local isShown = p5.isShown
		
		if p5.hasCompletedPurchase and not isShown then
			p0.props.SetPromptVisibility(false)
			
			return
		end
		p0:setState({ showTopScrim = isShown })
		
		if isShown then
			p0:setState({ purchasePromptReady = false })
		end
	end
	
	function p0.onPromptStateSetToNone() --[[ line: 153 ]]
		-- upvalues: p0 (ref)
		p0:setState({ purchasePromptReady = true })
	end
end

function publishAvatarPrompt.didMount(p6) --[[ line: 160 ]]
	-- upvalues: purchasePromptModule (ref), mutedError (ref), publishAssetAnalytics (ref)
	p6.sentNameFieldTouched = false
	p6.sentDescriptionFieldTouched = false
	local windowStateChangedEvent = purchasePromptModule.windowStateChangedEvent
	local promptStateSetToNoneEvent = purchasePromptModule.promptStateSetToNoneEvent
	
	if windowStateChangedEvent and promptStateSetToNoneEvent then
		p6.windowStateChangedConnection = windowStateChangedEvent:Connect(p6.onWindowStateChanged)
		p6.promptStateSetToNoneConnection = promptStateSetToNoneEvent:Connect(p6.onPromptStateSetToNone)
	else
		mutedError("PurchasePrompt.windowStateChangedEvent or PurchasePrompt.promptStateSetToNoneEvent is not available")
	end
	publishAssetAnalytics.sendPageLoad(publishAssetAnalytics.Section.BuyCreationPage)
end

function publishAvatarPrompt.willUnmount(p7) --[[ line: 179 ]]
	-- upvalues: mutedError (ref)
	if p7.windowStateChangedConnection then
		p7.windowStateChangedConnection:Disconnect()
	else
		mutedError("windowStateChangedConnection was not established")
	end
	if p7.promptStateSetToNoneConnection then
		p7.promptStateSetToNoneConnection:Disconnect()
		
		return
	end
	mutedError("promptStateSetToNoneConnection was not established")
end

function publishAvatarPrompt.renderPromptBody(p8) --[[ line: 193 ]]
	-- upvalues: withStyle (ref), roactModule (ref), uDim (ref), objectViewportModule (ref), labeledTextBoxModule (ref), robloxTranslatorModule (ref), publishInfoListModule (ref), avatarPartGridModule (ref)
	local var16 = p8.props.humanoidModel == nil
	
	return withStyle(function(_) --[[ line: 195 ]]
		-- upvalues: roactModule (copy), uDim (copy), objectViewportModule (copy), p8 (ref), var16 (ref), labeledTextBoxModule (copy), robloxTranslatorModule (copy), publishInfoListModule (copy), avatarPartGridModule (copy)
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
				openPreviewView = p8.openPreviewView,
				model = p8.props.humanoidModel,
				isLoading = var16
			}),
			DescriptionInput = roactModule.createElement(labeledTextBoxModule, {
				LayoutOrder = 2,
				centerText = false,
				maxLength = 1000,
				textBoxHeight = 104,
				labelText = robloxTranslatorModule:FormatByKey("CoreScripts.PublishAssetPrompt.Description"),
				defaultText = p8.state.description,
				onTextUpdated = p8.onDescriptionUpdated,
				invalidInputText = robloxTranslatorModule:FormatByKey("CoreScripts.PublishAssetPrompt.InvalidDescription")
			}),
			InfoList = roactModule.createElement(publishInfoListModule, {
				LayoutOrder = 3,
				typeName = robloxTranslatorModule:FormatByKey("Feature.Catalog.Label.Body")
			}),
			AvatarPartGrid = roactModule.createElement(avatarPartGridModule, {
				LayoutOrder = 4,
				humanoidModel = p8.props.humanoidModel,
				name = p8.state.name,
				screenSize = p8.props.screenSize
			})
		})
	end)
end

function publishAvatarPrompt.render(p9) --[[ line: 240 ]]
	-- upvalues: playersService (ref), roactModule (ref), basePublishPromptModule (ref), robloxTranslatorModule (ref)
	assert(playersService, "Players must not be nil")
	
	return roactModule.createElement(basePublishPromptModule, {
		delayInputSeconds = 3,
		promptBody = p9:renderPromptBody(),
		screenSize = p9.props.screenSize,
		showingPreviewView = p9.state.showingPreviewView,
		closePreviewView = p9.closePreviewView,
		asset = p9.props.humanoidModel,
		nameLabel = robloxTranslatorModule:FormatByKey("CoreScripts.PublishAvatarPrompt.BodyName"),
		defaultName = p9.state.name,
		titleText = robloxTranslatorModule:FormatByKey("CoreScripts.PublishAvatarPrompt.BuyCreation"),
		onNameUpdated = p9.onNameUpdated,
		canSubmit = p9.canSubmit,
		onSubmit = p9.onSubmit,
		priceInRobux = p9.props.priceInRobux,
		showTopScrim = p9.state.showTopScrim
	})
end

return roactRoduxModule.connect(function(p10) --[[ line: 261 | named "mapStateToProps" ]]
	return {
		humanoidModel = p10.promptRequest.promptInfo.humanoidModel,
		guid = p10.promptRequest.promptInfo.guid,
		scopes = p10.promptRequest.promptInfo.scopes,
		priceInRobux = p10.promptRequest.promptInfo.priceInRobux
	}
end, function(p11) --[[ line: 270 | named "mapDispatchToProps" ]]
	-- upvalues: setPromptVisibilityModule (ref)
	return {
		SetPromptVisibility = function(value) --[[ line: 272 ]]
			-- upvalues: p11 (ref), setPromptVisibilityModule (copy)
			p11(setPromptVisibilityModule(value))
		end
	}
end)(publishAvatarPrompt)