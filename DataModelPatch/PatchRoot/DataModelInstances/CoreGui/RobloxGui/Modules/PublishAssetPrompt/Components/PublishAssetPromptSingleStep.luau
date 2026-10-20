local CorePackages = game:GetService("CorePackages")
local ExperienceAuthService = game:GetService("ExperienceAuthService")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local TModule = require(CorePackages.Packages.t)
local RobloxTranslatorModule = require(CorePackages.Workspace.Packages.RobloxTranslator)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local WithStyleFunction = UIBloxModule.Style.withStyle
local InteractiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local IconButton = UIBloxModule.App.Button.IconButton
local RoactGamepadModule = require(CorePackages.Packages.RoactGamepad)
local LocalPlayer = game:GetService("Players").LocalPlayer
local NameTextBoxModule = require(script.Parent.Common.NameTextBox)
local AssetDescriptionTextBoxModule = require(script.Parent.AssetDescriptionTextBox)
local ObjectViewportModule = require(script.Parent.ObjectViewport)
local PreviewViewportModule = require(script.Parent.Common.PreviewViewport)
local EmoteThumbnailViewModule = require(script.Parent.EmoteThumbnailView)
local EmoteThumbnailEditorModule = require(script.Parent.EmoteThumbnailEditor)
local EmoteThumbnailParametersModule = require(script.Parent.EmoteThumbnailParameters)
local CloseOpenPromptModule = require(script.Parent.Parent.Actions.CloseOpenPrompt)
local Images = UIBloxModule.App.ImageSet.Images
local IconsActionsPreviewExpand = Images["icons/actions/previewExpand"]
local IconsActionsEditEdit = Images["icons/actions/edit/edit"]
local config = {
	[Enum.AssetType.TShirtAccessory] = true,
	[Enum.AssetType.ShirtAccessory] = true,
	[Enum.AssetType.PantsAccessory] = true,
	[Enum.AssetType.JacketAccessory] = true,
	[Enum.AssetType.SweaterAccessory] = true,
	[Enum.AssetType.ShortsAccessory] = true,
	[Enum.AssetType.LeftShoeAccessory] = true,
	[Enum.AssetType.RightShoeAccessory] = true,
	[Enum.AssetType.DressSkirtAccessory] = true,
	[Enum.AssetType.HairAccessory] = true
}
local GetFFlagValidateDescriptionModule = require(script.Parent.Parent.GetFFlagValidateDescription)
local SendConsentDeniedOnCancel = game:DefineFastFlag("SendConsentDeniedOnCancel", false)
local EnableEmotePublishEngineFeature = game:GetEngineFeature("EnableEmotePublish")
local PublishAssetPromptSingleStep = RoactModule.PureComponent:extend("PublishAssetPromptSingleStep")
PublishAssetPromptSingleStep.validateProps = TModule.strictInterface({
	screenSize = TModule.Vector2,
	assetInstance = TModule.Instance,
	assetType = TModule.enum(Enum.AssetType),
	guid = TModule.any,
	scopes = TModule.any,
	closePrompt = TModule.callback
})

function PublishAssetPromptSingleStep.getDefaultText(p1)
	-- upvalues: RobloxTranslatorModule (copy), LocalPlayer (copy)
	return if p1.props.assetType == Enum.AssetType.Model then RobloxTranslatorModule:FormatByKey("CoreScripts.PublishAssetPrompt.PackagesDefaultName", { RBX_NAME = LocalPlayer and LocalPlayer.Name or "" }) else ""
end

function PublishAssetPromptSingleStep.init(p1)
	-- upvalues: EmoteThumbnailParametersModule (copy), ExperienceAuthService (copy), GetFFlagValidateDescriptionModule (copy), EnableEmotePublishEngineFeature (copy), RoactModule (copy)
	p1.assetName = p1:getDefaultText()
	p1.assetDescription = p1:getDefaultText()
	p1.isNameValid = true
	p1.isDescriptionValid = true
	p1:setState({
		showingThumbnailEditor = false,
		showingAssetPreview = false,
		thumbnailParameters = EmoteThumbnailParametersModule.defaultParameters
	})
	
	function p1.closePrompt()
		-- upvalues: p1 (copy)
		p1.props.closePrompt()
	end
	
	function p1.openThumbnailEditor()
		-- upvalues: p1 (copy)
		p1:setState({ showingThumbnailEditor = true })
	end
	
	function p1.closeThumbnailEditor()
		-- upvalues: p1 (copy)
		p1:setState({ showingThumbnailEditor = false })
	end
	
	function p1.openAssetPreview()
		-- upvalues: p1 (copy)
		p1:setState({ showingAssetPreview = true })
	end
	
	function p1.closeAssetPreview()
		-- upvalues: p1 (copy)
		p1:setState({ showingAssetPreview = false })
	end
	
	function p1.updateThumbnailParameters(ThumbnailParameters)
		-- upvalues: p1 (copy)
		p1:setState({ thumbnailParameters = ThumbnailParameters })
	end
	
	function p1.denyAndClose()
		-- upvalues: ExperienceAuthService (upval), p1 (copy)
		ExperienceAuthService:ScopeCheckUIComplete(p1.props.guid, p1.props.scopes, Enum.ScopeCheckResult.ConsentDenied, {})
		p1.closePrompt()
	end
	
	function p1.confirmAndUpload()
		-- upvalues: p1 (copy), GetFFlagValidateDescriptionModule (upval), EnableEmotePublishEngineFeature (upval), EmoteThumbnailParametersModule (upval), ExperienceAuthService (upval)
		if not p1.isNameValid then return end
		if GetFFlagValidateDescriptionModule() and not p1.isDescriptionValid then return end
		local config = {
			assetName = p1.assetName,
			assetDescription = p1.assetDescription
		}
		
		if EnableEmotePublishEngineFeature and p1.props.assetType == Enum.AssetType.EmoteAnimation then
			config.emoteThumbnailParameters = EmoteThumbnailParametersModule.encodeAsATable(p1.state.thumbnailParameters)
		end
		ExperienceAuthService:ScopeCheckUIComplete(p1.props.guid, p1.props.scopes, Enum.ScopeCheckResult.ConsentAccepted, config)
		p1.closePrompt()
	end
	
	function p1.onAssetNameUpdated(AssetName, p2)
		-- upvalues: p1 (copy)
		if p2 then
			p1.assetName = AssetName
			p1.isNameValid = true
			
			return
		else
			p1.isNameValid = false
		end
	end
	
	function p1.onAssetDescriptionUpdated(AssetDescription, IsDescriptionValid)
		-- upvalues: p1 (copy)
		p1.assetDescription = AssetDescription
		p1.isDescriptionValid = IsDescriptionValid
	end
	
	p1.nameTextBoxRef = RoactModule.createRef()
	p1.descriptionTextBoxRef = RoactModule.createRef()
end

function PublishAssetPromptSingleStep.renderMiddle(p1, p2)
	-- upvalues: WithStyleFunction (copy), EnableEmotePublishEngineFeature (copy), RoactModule (copy), RoactGamepadModule (copy), ObjectViewportModule (copy), EmoteThumbnailViewModule (copy), IconButton (copy), IconsActionsPreviewExpand (copy), IconsActionsEditEdit (copy), NameTextBoxModule (copy), AssetDescriptionTextBoxModule (copy)
	return WithStyleFunction(function(p3)
		-- upvalues: EnableEmotePublishEngineFeature (upval), p1 (copy), RoactModule (upval), RoactGamepadModule (upval), ObjectViewportModule (upval), EmoteThumbnailViewModule (upval), IconButton (upval), IconsActionsPreviewExpand (upval), IconsActionsEditEdit (upval), p2 (copy), NameTextBoxModule (upval), AssetDescriptionTextBoxModule (upval)
		local _Font = p3.Font
		local Theme = p3.Theme
		local IsAnimationClip = EnableEmotePublishEngineFeature and (p1.props.assetType == Enum.AssetType.EmoteAnimation and p1.props.assetInstance:IsA("AnimationClip"))
		
		return RoactModule.createElement(RoactGamepadModule.Focusable.Frame, {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 150),
			defaultChild = p1.nameTextBoxRef,
			[RoactModule.Ref] = p1.middleContentRef
		}, {
			UISizeConstraint = RoactModule.createElement("UISizeConstraint", { MinSize = Vector2.new(200, 200) }),
			TopSection = RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 1, -50)
			}, {
				ViewportParent = RoactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					Size = UDim2.new(0.4, 0, 1, 0)
				}, {
					ObjectViewport = if IsAnimationClip then nil else RoactModule.createElement(ObjectViewportModule, { model = p1.props.assetInstance }) or nil,
					EmoteThumbnailParent = IsAnimationClip and RoactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1) }, {
						AspectRatioConstraint = RoactModule.createElement("UIAspectRatioConstraint", {
							AspectRatio = 1,
							AspectType = Enum.AspectType.FitWithinMaxSize,
							DominantAxis = Enum.DominantAxis.Width
						}),
						EmoteThumbnailView = RoactModule.createElement(EmoteThumbnailViewModule, {
							animationClip = p1.props.assetInstance,
							thumbnailParameters = p1.state.thumbnailParameters
						}),
						PreviewButton = RoactModule.createElement(IconButton, {
							showBackground = true,
							position = UDim2.new(1, -2, 1, -2),
							anchorPoint = Vector2.new(1, 1),
							icon = IconsActionsPreviewExpand,
							size = UDim2.new(0, 30, 0, 30),
							onActivated = p1.openAssetPreview
						}),
						EditButton = RoactModule.createElement(IconButton, {
							showBackground = true,
							position = UDim2.new(0, 2, 1, -2),
							anchorPoint = Vector2.new(0, 1),
							icon = IconsActionsEditEdit,
							size = UDim2.new(0, 30, 0, 30),
							onActivated = p1.openThumbnailEditor
						})
					}) or nil
				}),
				NameDescriptionFields = RoactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					Size = UDim2.new(0.6, -10, 1, 0),
					AnchorPoint = Vector2.new(1, 0),
					Position = UDim2.fromScale(1, 0)
				}, {
					NameLabel = RoactModule.createElement("TextLabel", {
						TextSize = 12,
						BackgroundTransparency = 1,
						Size = UDim2.new(1, 0, 0, 15),
						Font = _Font.Body.Font,
						Text = p2.name,
						TextColor3 = Theme.TextDefault.Color,
						TextXAlignment = Enum.TextXAlignment.Left
					}),
					NameInput = RoactModule.createElement(NameTextBoxModule, {
						Size = UDim2.new(1, 0, 0, 30),
						Position = UDim2.new(0, 0, 0, 15),
						onNameUpdated = p1.onAssetNameUpdated,
						nameTextBoxRef = p1.nameTextBoxRef,
						NextSelectionDown = p1.descriptionTextBoxRef,
						defaultName = p1.assetName
					}),
					DescriptionLabel = RoactModule.createElement("TextLabel", {
						TextSize = 12,
						BackgroundTransparency = 1,
						Size = UDim2.new(1, 0, 0, 15),
						Position = UDim2.new(0, 0, 0, 60),
						Font = _Font.Body.Font,
						Text = p2.description,
						TextColor3 = Theme.TextDefault.Color,
						TextXAlignment = Enum.TextXAlignment.Left
					}),
					DescriptionInput = RoactModule.createElement(AssetDescriptionTextBoxModule, {
						Size = UDim2.new(1, 0, 0, 80),
						Position = UDim2.new(0, 0, 0, 75),
						onAssetDescriptionUpdated = p1.onAssetDescriptionUpdated,
						descriptionTextBoxRef = p1.descriptionTextBoxRef,
						NextSelectionUp = p1.nameTextBoxRef,
						defaultDescription = p1.assetDescription
					})
				})
			}),
			Disclaimer = RoactModule.createElement("TextLabel", {
				TextSize = 12,
				BackgroundTransparency = 1,
				TextWrapped = true,
				Size = UDim2.new(1, 0, 0, 50),
				Text = p2.disclaimer,
				Font = _Font.Body.Font,
				TextColor3 = Theme.TextEmphasis.Color,
				AnchorPoint = Vector2.new(0, 1),
				Position = UDim2.fromScale(0, 1)
			})
		})
	end)
end

function PublishAssetPromptSingleStep.renderAlertLocalized(p1, p2)
	-- upvalues: RoactModule (copy), InteractiveAlert (copy), SendConsentDeniedOnCancel (copy), ButtonType (copy), EnableEmotePublishEngineFeature (copy), EmoteThumbnailEditorModule (copy), PreviewViewportModule (copy)
	local Element = RoactModule.createElement(InteractiveAlert, {
		isMiddleContentFocusable = true,
		title = p2.title,
		buttonStackInfo = {
			buttons = {
				{
					isDefaultChild = true,
					props = {
						onActivated = if SendConsentDeniedOnCancel then p1.denyAndClose else p1.closePrompt,
						text = p2.cancel
					}
				},
				{
					isDefaultChild = false,
					buttonType = ButtonType.PrimarySystem,
					props = {
						isDelayedInput = true,
						enableInputDelayed = true,
						delayInputSeconds = 3,
						onActivated = p1.confirmAndUpload,
						text = p2.submit
					}
				}
			}
		},
		middleContent = function()
			-- upvalues: p1 (copy), p2 (copy)
			return p1:renderMiddle(p2)
		end,
		screenSize = p1.props.screenSize,
		defaultChildRef = p1.props.defaultChildRef
	})
	
	return if EnableEmotePublishEngineFeature then RoactModule.createFragment({
		Prompt = Element,
		ThumbnailEditor = p1.state.showingThumbnailEditor and RoactModule.createElement(EmoteThumbnailEditorModule, {
			animationClip = p1.props.assetInstance,
			initialThumbnailParameters = p1.state.thumbnailParameters,
			screenSize = p1.props.screenSize,
			updateThumbnailCallback = p1.updateThumbnailParameters,
			closePromptCallback = p1.closeThumbnailEditor
		}) or nil,
		PreviewFrame = p1.state.showingAssetPreview and RoactModule.createElement("Frame", {
			BackgroundTransparency = 0,
			Size = UDim2.new(0.5, 0, 0.5, 0),
			BackgroundColor3 = Color3.new(0.2, 0.2, 0.2),
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5)
		}, {
			PreviewViewport = RoactModule.createElement(PreviewViewportModule, {
				asset = p1.props.assetInstance,
				closePreviewView = p1.closeAssetPreview
			})
		}) or nil
	}) else Element
end

local function _(p1): boolean
	-- upvalues: config (copy)
	return config[p1] == true
end

local function GetLocalizedStringsForAssetType(AssetType)
	-- upvalues: RobloxTranslatorModule (copy), config (copy)
	local config1 = {
		name = RobloxTranslatorModule:FormatByKey("CoreScripts.PublishAssetPrompt.Name"),
		description = RobloxTranslatorModule:FormatByKey("CoreScripts.PublishAssetPrompt.Description"),
		invalidName = RobloxTranslatorModule:FormatByKey("CoreScripts.PublishAssetPrompt.InvalidName"),
		invalidDescription = RobloxTranslatorModule:FormatByKey("CoreScripts.PublishAssetPrompt.InvalidDescription"),
		cancel = RobloxTranslatorModule:FormatByKey("CoreScripts.PublishAssetPrompt.Cancel"),
		submit = RobloxTranslatorModule:FormatByKey("CoreScripts.PublishAssetPrompt.Submit")
	}
	
	if config[AssetType] == true then
		config1.title = RobloxTranslatorModule:FormatByKey("CoreScripts.PublishAssetPrompt.TitleTextClothing")
		config1.disclaimer = RobloxTranslatorModule:FormatByKey("CoreScripts.PublishAssetPrompt.DisclaimerAvatar")
		
		return config1
	end
	if AssetType == Enum.AssetType.EmoteAnimation then
		config1.title = RobloxTranslatorModule:FormatByKey("CoreScripts.PublishAssetPrompt.TitleTextEmote")
		config1.disclaimer = RobloxTranslatorModule:FormatByKey("CoreScripts.PublishAssetPrompt.DisclaimerEmote")
		
		return config1
	end
	if AssetType == Enum.AssetType.Model then
		config1.title = RobloxTranslatorModule:FormatByKey("CoreScripts.PublishAssetPrompt.TitleTextModel")
		config1.disclaimer = RobloxTranslatorModule:FormatByKey("CoreScripts.PublishAssetPrompt.DisclaimerModel")
		
		return config1
	end
	if AssetType == Enum.AssetType.Package then
		config1.title = RobloxTranslatorModule:FormatByKey("CoreScripts.PublishAssetPrompt.TitleTextPackage")
		config1.disclaimer = RobloxTranslatorModule:FormatByKey("CoreScripts.PublishAssetPrompt.DisclaimerModel")
	end
	return config1
end

function PublishAssetPromptSingleStep.render(p1)
	-- upvalues: GetLocalizedStringsForAssetType (copy)
	return p1:renderAlertLocalized((GetLocalizedStringsForAssetType(p1.props.assetType)))
end

return RoactRoduxModule.connect(function(p1)
	return {
		assetInstance = p1.promptRequest.promptInfo.assetInstance,
		assetType = p1.promptRequest.promptInfo.assetType,
		guid = p1.promptRequest.promptInfo.guid,
		scopes = p1.promptRequest.promptInfo.scopes
	}
end, function(Callback)
	-- upvalues: CloseOpenPromptModule (copy)
	return {
		closePrompt = function()
			-- upvalues: Callback (copy), CloseOpenPromptModule (upval)
			return Callback(CloseOpenPromptModule())
		end
	}
end)(PublishAssetPromptSingleStep)