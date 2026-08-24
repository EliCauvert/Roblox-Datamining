local corePackagesService = game:GetService("CorePackages")
local playersService = game:GetService("Players")
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local tModule = require(corePackagesService.Packages.t)
local robloxTranslatorModule = require(corePackagesService.Workspace.Packages.RobloxTranslator)
local mutedError = require(corePackagesService.Workspace.Packages.Loggers).mutedError
local parent = script.Parent.Parent
local basePublishPromptModule = require(parent.BasePublishPrompt)
local objectViewportModule = require(parent.Common.ObjectViewport)
local labeledTextBoxModule = require(parent.Common.LabeledTextBox)
local publishInfoListModule = require(parent.Common.PublishInfoList)
local makeupPartGridModule = require(parent.Common.MakeupPartGrid)
local makeupPreviewUtilsModule = require(script.Parent.Parent.Parent.MakeupPreviewUtils)
local purchasePromptModule = require(corePackagesService.Workspace.Packages.PurchasePrompt)
local publishAssetAnalytics = purchasePromptModule.PublishAssetAnalytics
local setPromptVisibilityModule = require(script.Parent.Parent.Parent.Actions.SetPromptVisibility)
local uDim = UDim.new(0, 20)
local publishMakeupLookPrompt = roactModule.PureComponent:extend("PublishMakeupLookPrompt")
publishMakeupLookPrompt.validateProps = tModule.strictInterface({
	screenSize = tModule.Vector2,
	accessoryInstance = tModule.optional(tModule.union(tModule.instanceIsA("Folder"), tModule.instanceIsA("Decal"))),
	makeupEntries = tModule.optional(tModule.table),
	guid = tModule.any,
	scopes = tModule.any,
	priceInRobux = tModule.optional(tModule.number),
	SetPromptVisibility = tModule.callback
})

function publishMakeupLookPrompt.init(p0)
	-- upvalues: playersService (ref), publishAssetAnalytics (ref), purchasePromptModule (ref), mutedError (ref)
	local localPlayer = playersService.LocalPlayer
	assert(localPlayer, "LocalPlayer must not be nil")
	p0:setState({
		showingPreviewView = false,
		isNameValid = true,
		isDescValid = true,
		showTopScrim = false,
		purchasePromptReady = true,
		previewModel = nil,
		name = localPlayer.Name .. "'s Makeup",
		description = localPlayer.Name .. "'s Makeup"
	})
	
	function p0.openPreviewView()
		-- upvalues: publishAssetAnalytics (copy), p0 (ref)
		publishAssetAnalytics.sendButtonClicked(publishAssetAnalytics.Section.BuyCreationPage, publishAssetAnalytics.Element.Expand)
		p0:setState({ showingPreviewView = true })
	end
	
	function p0.closePreviewView()
		-- upvalues: p0 (ref)
		p0:setState({ showingPreviewView = false })
	end
	
	function p0.canSubmit()
		-- upvalues: p0 (ref)
		return p0.state.isNameValid and (p0.state.isDescValid and (p0.props.accessoryInstance ~= nil and p0.state.purchasePromptReady))
	end
	
	function p0.onSubmit()
		-- upvalues: publishAssetAnalytics (copy), p0 (ref), purchasePromptModule (copy), mutedError (copy)
		publishAssetAnalytics.sendButtonClicked(publishAssetAnalytics.Section.BuyCreationPage, publishAssetAnalytics.Element.Buy)
		local t = { name = p0.state.name, description = p0.state.description }
		
		if purchasePromptModule.initiateAvatarCreationFeePurchase then
			purchasePromptModule.initiateAvatarCreationFeePurchase(t, p0.props.guid, p0.state.previewModel, p0.props.priceInRobux)
			
			return
		end
		mutedError("PurchasePrompt.initiateAvatarCreationFeePurchase is not available")
	end
	
	function p0.onNameUpdated(p1, p2)
		-- upvalues: p0 (ref), publishAssetAnalytics (copy)
		p0:setState({ name = p1, isNameValid = p2 })
		
		if not p0.sentNameFieldTouched then
			p0.sentNameFieldTouched = true
			publishAssetAnalytics.sendFieldTouched(publishAssetAnalytics.Section.BuyCreationPage, publishAssetAnalytics.Element.Name)
		end
	end
	
	function p0.onDescriptionUpdated(p3, p4)
		-- upvalues: p0 (ref), publishAssetAnalytics (copy)
		p0:setState({ description = p3, isDescValid = p4 })
		
		if not p0.sentDescriptionFieldTouched then
			p0.sentDescriptionFieldTouched = true
			publishAssetAnalytics.sendFieldTouched(publishAssetAnalytics.Section.BuyCreationPage, publishAssetAnalytics.Element.Description)
		end
	end
	
	function p0.onWindowStateChanged(p5)
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
	
	function p0.onPromptStateSetToNone()
		-- upvalues: p0 (ref)
		p0:setState({ purchasePromptReady = true })
	end
end

function publishMakeupLookPrompt.updatePreviewModel(p6)
	-- upvalues: makeupPreviewUtilsModule (ref)
	local accessoryInstance = p6.props.accessoryInstance
	
	if accessoryInstance and accessoryInstance:IsA("Folder") then
		local makeupEntries = p6.props.makeupEntries
		task.spawn(function()
			-- upvalues: makeupPreviewUtilsModule (copy), accessoryInstance (ref), makeupEntries (ref), p6 (ref)
			local var17 = makeupPreviewUtilsModule.compositeMakeupFolder(accessoryInstance)
			local folderAccessories = makeupPreviewUtilsModule.getFolderAccessories(accessoryInstance, makeupEntries)
			
			if not var17 and #folderAccessories == 0 or not p6.isMounted then return end
			local var19 = makeupPreviewUtilsModule.createMakeupHeadPreview(var17, Enum.AvatarAssetType.FaceMakeup, folderAccessories)
			
			if var19 and p6.isMounted then
				local previewModel = p6.state.previewModel
				p6:setState({ previewModel = var19 }, function()
					-- upvalues: previewModel (ref)
					if previewModel then
						previewModel:Destroy()
					end
				end)
			end
		end)
		
		return
	end
end

function publishMakeupLookPrompt.didMount(p7)
	-- upvalues: purchasePromptModule (ref), mutedError (ref), publishAssetAnalytics (ref)
	p7.isMounted = true
	p7:updatePreviewModel()
	p7.sentNameFieldTouched = false
	p7.sentDescriptionFieldTouched = false
	local windowStateChangedEvent = purchasePromptModule.windowStateChangedEvent
	local promptStateSetToNoneEvent = purchasePromptModule.promptStateSetToNoneEvent
	
	if windowStateChangedEvent and promptStateSetToNoneEvent then
		p7.windowStateChangedConnection = windowStateChangedEvent:Connect(p7.onWindowStateChanged)
		p7.promptStateSetToNoneConnection = promptStateSetToNoneEvent:Connect(p7.onPromptStateSetToNone)
	else
		mutedError("PurchasePrompt.windowStateChangedEvent or PurchasePrompt.promptStateSetToNoneEvent is not available")
	end
	publishAssetAnalytics.sendPageLoad(publishAssetAnalytics.Section.BuyCreationPage)
end

function publishMakeupLookPrompt.didUpdate(p8, p9)
	if p9.accessoryInstance ~= p8.props.accessoryInstance then
		p8:updatePreviewModel()
	end
end

function publishMakeupLookPrompt.willUnmount(p10)
	-- upvalues: mutedError (ref)
	p10.isMounted = false
	
	if p10.state.previewModel then
		p10.state.previewModel:Destroy()
	end
	if p10.windowStateChangedConnection then
		p10.windowStateChangedConnection:Disconnect()
	else
		mutedError("windowStateChangedConnection was not established")
	end
	if p10.promptStateSetToNoneConnection then
		p10.promptStateSetToNoneConnection:Disconnect()
		
		return
	end
	mutedError("promptStateSetToNoneConnection was not established")
end

function publishMakeupLookPrompt.renderPromptBody(p11)
	-- upvalues: roactModule (ref), uDim (ref), objectViewportModule (ref), labeledTextBoxModule (ref), robloxTranslatorModule (ref), publishInfoListModule (ref), makeupPartGridModule (ref)
	local previewModel = p11.state.previewModel
	
	return roactModule.createFragment({
		UIListLayout = roactModule.createElement("UIListLayout", {
			Padding = uDim,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Vertical
		}),
		UIPadding = roactModule.createElement("UIPadding", { PaddingBottom = uDim, PaddingTop = uDim }),
		EmbeddedPreview = roactModule.createElement(objectViewportModule, {
			useFullBodyCameraSettings = false,
			fieldOfView = 30,
			LayoutOrder = 1,
			openPreviewView = p11.openPreviewView,
			model = previewModel,
			isLoading = previewModel == nil
		}),
		DescriptionInput = roactModule.createElement(labeledTextBoxModule, {
			LayoutOrder = 2,
			centerText = false,
			maxLength = 1000,
			textBoxHeight = 104,
			labelText = robloxTranslatorModule:FormatByKey("CoreScripts.PublishAssetPrompt.Description"),
			defaultText = p11.state.description,
			onTextUpdated = p11.onDescriptionUpdated,
			invalidInputText = robloxTranslatorModule:FormatByKey("CoreScripts.PublishAssetPrompt.InvalidDescription")
		}),
		InfoList = roactModule.createElement(publishInfoListModule, {
			LayoutOrder = 3,
			typeName = robloxTranslatorModule:FormatByKey("Feature.Catalog.Label.Makeup")
		}),
		MakeupGrid = roactModule.createElement(makeupPartGridModule, {
			LayoutOrder = 4,
			makeupFolder = p11.props.accessoryInstance,
			makeupEntries = p11.props.makeupEntries,
			name = p11.state.name,
			screenSize = p11.props.screenSize
		})
	})
end

function publishMakeupLookPrompt.render(p12)
	-- upvalues: roactModule (ref), basePublishPromptModule (ref), robloxTranslatorModule (ref)
	return roactModule.createElement(basePublishPromptModule, {
		delayInputSeconds = 3,
		promptBody = p12:renderPromptBody(),
		screenSize = p12.props.screenSize,
		showingPreviewView = p12.state.showingPreviewView,
		closePreviewView = p12.closePreviewView,
		asset = p12.state.previewModel,
		nameLabel = robloxTranslatorModule:FormatByKey("CoreScripts.PublishAssetPrompt.Name"),
		defaultName = p12.state.name,
		titleText = robloxTranslatorModule:FormatByKey("CoreScripts.PublishAvatarPrompt.BuyCreation"),
		onNameUpdated = p12.onNameUpdated,
		canSubmit = p12.canSubmit,
		onSubmit = p12.onSubmit,
		priceInRobux = p12.props.priceInRobux,
		showTopScrim = p12.state.showTopScrim
	})
end

return roactRoduxModule.connect(function(p13)
	return {
		accessoryInstance = p13.promptRequest.promptInfo.accessoryInstance,
		guid = p13.promptRequest.promptInfo.guid,
		scopes = p13.promptRequest.promptInfo.scopes,
		priceInRobux = p13.promptRequest.promptInfo.priceInRobux,
		makeupEntries = p13.promptRequest.promptInfo.makeupEntries
	}
end, function(p14)
	-- upvalues: setPromptVisibilityModule (ref)
	return {
		SetPromptVisibility = function(value)
			-- upvalues: p14 (ref), setPromptVisibilityModule (copy)
			p14(setPromptVisibilityModule(value))
		end
	}
end)(publishMakeupLookPrompt)