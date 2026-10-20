local CorePackages = game:GetService("CorePackages")
local Players = game:GetService("Players")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local TModule = require(CorePackages.Packages.t)
local RobloxTranslatorModule = require(CorePackages.Workspace.Packages.RobloxTranslator)
local MutedErrorFunction = require(CorePackages.Workspace.Packages.Loggers).mutedError
local Parent = script.Parent.Parent
local BasePublishPromptModule = require(Parent.BasePublishPrompt)
local ObjectViewportModule = require(Parent.Common.ObjectViewport)
local LabeledTextBoxModule = require(Parent.Common.LabeledTextBox)
local PublishInfoListModule = require(Parent.Common.PublishInfoList)
local MakeupPartGridModule = require(Parent.Common.MakeupPartGrid)
local MakeupPreviewUtilsModule = require(script.Parent.Parent.Parent.MakeupPreviewUtils)
local GetFFlagUploadMakeupSupportModule = require(script.Parent.Parent.Parent.Flags.GetFFlagUploadMakeupSupport)
local PurchasePromptModule = require(CorePackages.Workspace.Packages.PurchasePrompt)
local PublishAssetAnalytics = PurchasePromptModule.PublishAssetAnalytics
local SetPromptVisibilityModule = require(script.Parent.Parent.Parent.Actions.SetPromptVisibility)
local _UDim = UDim.new(0, 20)
local PublishMakeupLookPrompt = RoactModule.PureComponent:extend("PublishMakeupLookPrompt")
PublishMakeupLookPrompt.validateProps = TModule.strictInterface({
	screenSize = TModule.Vector2,
	accessoryInstance = TModule.optional(TModule.union(TModule.instanceIsA("Folder"), TModule.instanceIsA("Decal"))),
	makeupEntries = TModule.optional(TModule.table),
	guid = TModule.any,
	scopes = TModule.any,
	priceInRobux = TModule.optional(TModule.number),
	SetPromptVisibility = TModule.callback
})

function PublishMakeupLookPrompt.init(p1)
	-- upvalues: Players (copy), PublishAssetAnalytics (copy), PurchasePromptModule (copy), MutedErrorFunction (copy)
	local LocalPlayer = Players.LocalPlayer
	assert(LocalPlayer, "LocalPlayer must not be nil")
	p1:setState({
		showingPreviewView = false,
		isNameValid = true,
		isDescValid = true,
		showTopScrim = false,
		purchasePromptReady = true,
		previewModel = nil,
		name = LocalPlayer.Name .. "'s Makeup",
		description = LocalPlayer.Name .. "'s Makeup"
	})
	
	function p1.openPreviewView()
		-- upvalues: PublishAssetAnalytics (upval), p1 (copy)
		PublishAssetAnalytics.sendButtonClicked(PublishAssetAnalytics.Section.BuyCreationPage, PublishAssetAnalytics.Element.Expand)
		p1:setState({ showingPreviewView = true })
	end
	
	function p1.closePreviewView()
		-- upvalues: p1 (copy)
		p1:setState({ showingPreviewView = false })
	end
	
	function p1.canSubmit()
		-- upvalues: p1 (copy)
		return p1.state.isNameValid and (p1.state.isDescValid and (p1.props.accessoryInstance ~= nil and p1.state.purchasePromptReady))
	end
	
	function p1.onSubmit()
		-- upvalues: PublishAssetAnalytics (upval), p1 (copy), PurchasePromptModule (upval), MutedErrorFunction (upval)
		PublishAssetAnalytics.sendButtonClicked(PublishAssetAnalytics.Section.BuyCreationPage, PublishAssetAnalytics.Element.Buy)
		local config = { name = p1.state.name, description = p1.state.description }
		
		if PurchasePromptModule.initiateAvatarCreationFeePurchase then
			PurchasePromptModule.initiateAvatarCreationFeePurchase(config, p1.props.guid, p1.state.previewModel, p1.props.priceInRobux)
			
			return
		else
			MutedErrorFunction("PurchasePrompt.initiateAvatarCreationFeePurchase is not available")
		end
	end
	
	function p1.onNameUpdated(Name, IsNameValid)
		-- upvalues: p1 (copy), PublishAssetAnalytics (upval)
		p1:setState({ name = Name, isNameValid = IsNameValid })
		
		if not p1.sentNameFieldTouched then
			p1.sentNameFieldTouched = true
			PublishAssetAnalytics.sendFieldTouched(PublishAssetAnalytics.Section.BuyCreationPage, PublishAssetAnalytics.Element.Name)
		end
	end
	
	function p1.onDescriptionUpdated(Description, IsDescValid)
		-- upvalues: p1 (copy), PublishAssetAnalytics (upval)
		p1:setState({ description = Description, isDescValid = IsDescValid })
		
		if not p1.sentDescriptionFieldTouched then
			p1.sentDescriptionFieldTouched = true
			PublishAssetAnalytics.sendFieldTouched(PublishAssetAnalytics.Section.BuyCreationPage, PublishAssetAnalytics.Element.Description)
		end
	end
	
	function p1.onWindowStateChanged(p2)
		-- upvalues: p1 (copy)
		local IsShown = p2.isShown
		
		if p2.hasCompletedPurchase and not IsShown then
			p1.props.SetPromptVisibility(false)
			
			return
		end
		p1:setState({ showTopScrim = IsShown })
		
		if IsShown then
			p1:setState({ purchasePromptReady = false })
		end
	end
	
	function p1.onPromptStateSetToNone()
		-- upvalues: p1 (copy)
		p1:setState({ purchasePromptReady = true })
	end
end

function PublishMakeupLookPrompt.updatePreviewModel(p1)
	-- upvalues: MakeupPreviewUtilsModule (copy)
	local AccessoryInstance = p1.props.accessoryInstance
	
	if AccessoryInstance and AccessoryInstance:IsA("Folder") then
		local MakeupEntries = p1.props.makeupEntries
		task.spawn(function()
			-- upvalues: MakeupPreviewUtilsModule (upval), AccessoryInstance (copy), MakeupEntries (copy), p1 (copy)
			local CompositeMakeupFolderResult = MakeupPreviewUtilsModule.compositeMakeupFolder(AccessoryInstance)
			local FolderAccessories = MakeupPreviewUtilsModule.getFolderAccessories(AccessoryInstance, MakeupEntries)
			
			if not CompositeMakeupFolderResult and #FolderAccessories == 0 or not p1.isMounted then return end
			local MakeupHeadPreview = MakeupPreviewUtilsModule.createMakeupHeadPreview(CompositeMakeupFolderResult, Enum.AvatarAssetType.FaceMakeup, FolderAccessories)
			
			if MakeupHeadPreview and p1.isMounted then
				local PreviewModel = p1.state.previewModel
				p1:setState({ previewModel = MakeupHeadPreview }, function()
					-- upvalues: PreviewModel (copy)
					if PreviewModel then
						PreviewModel:Destroy()
					end
				end)
			end
		end)
		
		return
	end
end

function PublishMakeupLookPrompt.didMount(p1)
	-- upvalues: PurchasePromptModule (copy), MutedErrorFunction (copy), PublishAssetAnalytics (copy)
	p1.isMounted = true
	p1:updatePreviewModel()
	p1.sentNameFieldTouched = false
	p1.sentDescriptionFieldTouched = false
	local WindowStateChangedEvent = PurchasePromptModule.windowStateChangedEvent
	local PromptStateSetToNoneEvent = PurchasePromptModule.promptStateSetToNoneEvent
	
	if WindowStateChangedEvent and PromptStateSetToNoneEvent then
		p1.windowStateChangedConnection = WindowStateChangedEvent:Connect(p1.onWindowStateChanged)
		p1.promptStateSetToNoneConnection = PromptStateSetToNoneEvent:Connect(p1.onPromptStateSetToNone)
	else
		MutedErrorFunction("PurchasePrompt.windowStateChangedEvent or PurchasePrompt.promptStateSetToNoneEvent is not available")
	end
	PublishAssetAnalytics.sendPageLoad(PublishAssetAnalytics.Section.BuyCreationPage)
end

function PublishMakeupLookPrompt.didUpdate(p1, p2)
	if p2.accessoryInstance ~= p1.props.accessoryInstance then
		p1:updatePreviewModel()
	end
end

function PublishMakeupLookPrompt.willUnmount(p1)
	-- upvalues: MutedErrorFunction (copy)
	p1.isMounted = false
	
	if p1.state.previewModel then
		p1.state.previewModel:Destroy()
	end
	if p1.windowStateChangedConnection then
		p1.windowStateChangedConnection:Disconnect()
	else
		MutedErrorFunction("windowStateChangedConnection was not established")
	end
	if p1.promptStateSetToNoneConnection then
		p1.promptStateSetToNoneConnection:Disconnect()
		
		return
	else
		MutedErrorFunction("promptStateSetToNoneConnection was not established")
	end
end

function PublishMakeupLookPrompt.renderPromptBody(p1)
	-- upvalues: RoactModule (copy), _UDim (copy), ObjectViewportModule (copy), GetFFlagUploadMakeupSupportModule (copy), LabeledTextBoxModule (copy), RobloxTranslatorModule (copy), PublishInfoListModule (copy), MakeupPartGridModule (copy)
	local PreviewModel = p1.state.previewModel
	
	return RoactModule.createFragment({
		UIListLayout = RoactModule.createElement("UIListLayout", {
			Padding = _UDim,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Vertical
		}),
		UIPadding = RoactModule.createElement("UIPadding", { PaddingBottom = _UDim, PaddingTop = _UDim }),
		EmbeddedPreview = RoactModule.createElement(ObjectViewportModule, {
			useFullBodyCameraSettings = false,
			fieldOfView = 30,
			LayoutOrder = 1,
			openPreviewView = p1.openPreviewView,
			model = PreviewModel,
			isLoading = PreviewModel == nil,
			isMakeupPreview = GetFFlagUploadMakeupSupportModule()
		}),
		DescriptionInput = RoactModule.createElement(LabeledTextBoxModule, {
			LayoutOrder = 2,
			centerText = false,
			maxLength = 1000,
			textBoxHeight = 104,
			labelText = RobloxTranslatorModule:FormatByKey("CoreScripts.PublishAssetPrompt.Description"),
			defaultText = p1.state.description,
			onTextUpdated = p1.onDescriptionUpdated,
			invalidInputText = RobloxTranslatorModule:FormatByKey("CoreScripts.PublishAssetPrompt.InvalidDescription")
		}),
		InfoList = RoactModule.createElement(PublishInfoListModule, {
			LayoutOrder = 3,
			typeName = RobloxTranslatorModule:FormatByKey("Feature.Catalog.Label.Makeup")
		}),
		MakeupGrid = RoactModule.createElement(MakeupPartGridModule, {
			LayoutOrder = 4,
			makeupFolder = p1.props.accessoryInstance,
			makeupEntries = p1.props.makeupEntries,
			name = p1.state.name,
			screenSize = p1.props.screenSize
		})
	})
end

function PublishMakeupLookPrompt.render(p1)
	-- upvalues: RoactModule (copy), BasePublishPromptModule (copy), GetFFlagUploadMakeupSupportModule (copy), RobloxTranslatorModule (copy)
	return RoactModule.createElement(BasePublishPromptModule, {
		delayInputSeconds = 3,
		promptBody = p1:renderPromptBody(),
		screenSize = p1.props.screenSize,
		showingPreviewView = p1.state.showingPreviewView,
		closePreviewView = p1.closePreviewView,
		isMakeupPreview = GetFFlagUploadMakeupSupportModule(),
		asset = p1.state.previewModel,
		nameLabel = RobloxTranslatorModule:FormatByKey("CoreScripts.PublishAssetPrompt.Name"),
		defaultName = p1.state.name,
		titleText = RobloxTranslatorModule:FormatByKey("CoreScripts.PublishAvatarPrompt.BuyCreation"),
		onNameUpdated = p1.onNameUpdated,
		canSubmit = p1.canSubmit,
		onSubmit = p1.onSubmit,
		priceInRobux = p1.props.priceInRobux,
		showTopScrim = p1.state.showTopScrim
	})
end

return RoactRoduxModule.connect(function(p1)
	return {
		accessoryInstance = p1.promptRequest.promptInfo.accessoryInstance,
		guid = p1.promptRequest.promptInfo.guid,
		scopes = p1.promptRequest.promptInfo.scopes,
		priceInRobux = p1.promptRequest.promptInfo.priceInRobux,
		makeupEntries = p1.promptRequest.promptInfo.makeupEntries
	}
end, function(Callback)
	-- upvalues: SetPromptVisibilityModule (copy)
	return {
		SetPromptVisibility = function(p1)
			-- upvalues: Callback (copy), SetPromptVisibilityModule (upval)
			Callback(SetPromptVisibilityModule(p1))
		end
	}
end)(PublishMakeupLookPrompt)