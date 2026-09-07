local corePackagesService = game:GetService("CorePackages")
local experienceAuthService = game:GetService("ExperienceAuthService")
local playersService = game:GetService("Players")
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local tModule = require(corePackagesService.Packages.t)
local robloxTranslatorModule = require(corePackagesService.Workspace.Packages.RobloxTranslator)
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local withStyle = UIBloxModule.Style.withStyle
local interactiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local iconButton = UIBloxModule.App.Button.IconButton
local roactGamepadModule = require(corePackagesService.Packages.RoactGamepad)
local localPlayer = playersService.LocalPlayer
local nameTextBoxModule = require(script.Parent.Common.NameTextBox)
local assetDescriptionTextBoxModule = require(script.Parent.AssetDescriptionTextBox)
local objectViewportModule = require(script.Parent.ObjectViewport)
local previewViewportModule = require(script.Parent.Common.PreviewViewport)
local emoteThumbnailViewModule = require(script.Parent.EmoteThumbnailView)
local emoteThumbnailEditorModule = require(script.Parent.EmoteThumbnailEditor)
local emoteThumbnailParametersModule = require(script.Parent.EmoteThumbnailParameters)
local closeOpenPromptModule = require(script.Parent.Parent.Actions.CloseOpenPrompt)
local images = UIBloxModule.App.ImageSet.Images
local previewExpand = images["icons/actions/previewExpand"]
local edit = images["icons/actions/edit/edit"]
local t = {
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
local getFFlagValidateDescriptionModule = require(script.Parent.Parent.GetFFlagValidateDescription)
local sendConsentDeniedOnCancel = game:DefineFastFlag("SendConsentDeniedOnCancel", false)
local enableEmotePublishEngineFeature = game:GetEngineFeature("EnableEmotePublish")
local publishAssetPromptSingleStep = roactModule.PureComponent:extend("PublishAssetPromptSingleStep")
publishAssetPromptSingleStep.validateProps = tModule.strictInterface({
	screenSize = tModule.Vector2,
	assetInstance = tModule.Instance,
	assetType = tModule.enum(Enum.AssetType),
	guid = tModule.any,
	scopes = tModule.any,
	closePrompt = tModule.callback
})

function publishAssetPromptSingleStep.getDefaultText(p1)
	-- upvalues: robloxTranslatorModule (ref), localPlayer (ref)
	return if p1.props.assetType == Enum.AssetType.Model then robloxTranslatorModule:FormatByKey("CoreScripts.PublishAssetPrompt.PackagesDefaultName", { RBX_NAME = if localPlayer then localPlayer.Name else "" }) else ""
end

function publishAssetPromptSingleStep.init(p1)
	-- upvalues: emoteThumbnailParametersModule (ref), experienceAuthService (ref), getFFlagValidateDescriptionModule (ref), enableEmotePublishEngineFeature (ref), roactModule (ref)
	p1.assetName = p1:getDefaultText()
	p1.assetDescription = p1:getDefaultText()
	p1.isNameValid = true
	p1.isDescriptionValid = true
	p1:setState({
		showingThumbnailEditor = false,
		showingAssetPreview = false,
		thumbnailParameters = emoteThumbnailParametersModule.defaultParameters
	})
	
	function p1.closePrompt()
		-- upvalues: p1 (ref)
		p1.props.closePrompt()
	end
	
	function p1.openThumbnailEditor()
		-- upvalues: p1 (ref)
		p1:setState({ showingThumbnailEditor = true })
	end
	
	function p1.closeThumbnailEditor()
		-- upvalues: p1 (ref)
		p1:setState({ showingThumbnailEditor = false })
	end
	
	function p1.openAssetPreview()
		-- upvalues: p1 (ref)
		p1:setState({ showingAssetPreview = true })
	end
	
	function p1.closeAssetPreview()
		-- upvalues: p1 (ref)
		p1:setState({ showingAssetPreview = false })
	end
	
	function p1.updateThumbnailParameters(p2)
		-- upvalues: p1 (ref)
		p1:setState({ thumbnailParameters = p2 })
	end
	
	function p1.denyAndClose()
		-- upvalues: experienceAuthService (copy), p1 (ref)
		experienceAuthService:ScopeCheckUIComplete(p1.props.guid, p1.props.scopes, Enum.ScopeCheckResult.ConsentDenied, {})
		p1.closePrompt()
	end
	
	function p1.confirmAndUpload()
		-- upvalues: p1 (ref), getFFlagValidateDescriptionModule (copy), enableEmotePublishEngineFeature (copy), emoteThumbnailParametersModule (copy), experienceAuthService (copy)
		if not p1.isNameValid then return end
		if getFFlagValidateDescriptionModule() and not p1.isDescriptionValid then return end
		local t = {
			assetName = p1.assetName,
			assetDescription = p1.assetDescription
		}
		
		if enableEmotePublishEngineFeature and p1.props.assetType == Enum.AssetType.EmoteAnimation then
			t.emoteThumbnailParameters = emoteThumbnailParametersModule.encodeAsATable(p1.state.thumbnailParameters)
		end
		experienceAuthService:ScopeCheckUIComplete(p1.props.guid, p1.props.scopes, Enum.ScopeCheckResult.ConsentAccepted, t)
		p1.closePrompt()
	end
	
	function p1.onAssetNameUpdated(p2, p3)
		-- upvalues: p1 (ref)
		if p3 then
			p1.assetName = p2
			p1.isNameValid = true
			
			return
		end
		p1.isNameValid = false
	end
	
	function p1.onAssetDescriptionUpdated(p2, p3)
		-- upvalues: p1 (ref)
		p1.assetDescription = p2
		p1.isDescriptionValid = p3
	end
	
	p1.nameTextBoxRef = roactModule.createRef()
	p1.descriptionTextBoxRef = roactModule.createRef()
end

function publishAssetPromptSingleStep.renderMiddle(p1, p2)
	-- upvalues: withStyle (ref), enableEmotePublishEngineFeature (ref), roactModule (ref), roactGamepadModule (ref), objectViewportModule (ref), emoteThumbnailViewModule (ref), iconButton (ref), previewExpand (ref), edit (ref), nameTextBoxModule (ref), assetDescriptionTextBoxModule (ref)
	return withStyle(function(p3)
		-- upvalues: enableEmotePublishEngineFeature (copy), p1 (ref), roactModule (copy), roactGamepadModule (copy), objectViewportModule (copy), emoteThumbnailViewModule (copy), iconButton (copy), previewExpand (copy), edit (copy), p2 (ref), nameTextBoxModule (copy), assetDescriptionTextBoxModule (copy)
		local font = p3.Font
		local theme = p3.Theme
		local var1 = enableEmotePublishEngineFeature and (p1.props.assetType == Enum.AssetType.EmoteAnimation and p1.props.assetInstance:IsA("AnimationClip"))
		
		return roactModule.createElement(roactGamepadModule.Focusable.Frame, {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 150),
			defaultChild = p1.nameTextBoxRef,
			[roactModule.Ref] = p1.middleContentRef
		}, {
			UISizeConstraint = roactModule.createElement("UISizeConstraint", { MinSize = Vector2.new(200, 200) }),
			TopSection = roactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 1, -50)
			}, {
				ViewportParent = roactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					Size = UDim2.new(0.4, 0, 1, 0)
				}, {
					ObjectViewport = not var1 and roactModule.createElement(objectViewportModule, { model = p1.props.assetInstance }) or nil,
					EmoteThumbnailParent = var1 and roactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1) }, {
						AspectRatioConstraint = roactModule.createElement("UIAspectRatioConstraint", {
							AspectRatio = 1,
							AspectType = Enum.AspectType.FitWithinMaxSize,
							DominantAxis = Enum.DominantAxis.Width
						}),
						EmoteThumbnailView = roactModule.createElement(emoteThumbnailViewModule, {
							animationClip = p1.props.assetInstance,
							thumbnailParameters = p1.state.thumbnailParameters
						}),
						PreviewButton = roactModule.createElement(iconButton, {
							showBackground = true,
							position = UDim2.new(1, -2, 1, -2),
							anchorPoint = Vector2.new(1, 1),
							icon = previewExpand,
							size = UDim2.new(0, 30, 0, 30),
							onActivated = p1.openAssetPreview
						}),
						EditButton = roactModule.createElement(iconButton, {
							showBackground = true,
							position = UDim2.new(0, 2, 1, -2),
							anchorPoint = Vector2.new(0, 1),
							icon = edit,
							size = UDim2.new(0, 30, 0, 30),
							onActivated = p1.openThumbnailEditor
						})
					}) or nil
				}),
				NameDescriptionFields = roactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					Size = UDim2.new(0.6, -10, 1, 0),
					AnchorPoint = Vector2.new(1, 0),
					Position = UDim2.fromScale(1, 0)
				}, {
					NameLabel = roactModule.createElement("TextLabel", {
						TextSize = 12,
						BackgroundTransparency = 1,
						Size = UDim2.new(1, 0, 0, 15),
						Font = font.Body.Font,
						Text = p2.name,
						TextColor3 = theme.TextDefault.Color,
						TextXAlignment = Enum.TextXAlignment.Left
					}),
					NameInput = roactModule.createElement(nameTextBoxModule, {
						Size = UDim2.new(1, 0, 0, 30),
						Position = UDim2.new(0, 0, 0, 15),
						onNameUpdated = p1.onAssetNameUpdated,
						nameTextBoxRef = p1.nameTextBoxRef,
						NextSelectionDown = p1.descriptionTextBoxRef,
						defaultName = p1.assetName
					}),
					DescriptionLabel = roactModule.createElement("TextLabel", {
						TextSize = 12,
						BackgroundTransparency = 1,
						Size = UDim2.new(1, 0, 0, 15),
						Position = UDim2.new(0, 0, 0, 60),
						Font = font.Body.Font,
						Text = p2.description,
						TextColor3 = theme.TextDefault.Color,
						TextXAlignment = Enum.TextXAlignment.Left
					}),
					DescriptionInput = roactModule.createElement(assetDescriptionTextBoxModule, {
						Size = UDim2.new(1, 0, 0, 80),
						Position = UDim2.new(0, 0, 0, 75),
						onAssetDescriptionUpdated = p1.onAssetDescriptionUpdated,
						descriptionTextBoxRef = p1.descriptionTextBoxRef,
						NextSelectionUp = p1.nameTextBoxRef,
						defaultDescription = p1.assetDescription
					})
				})
			}),
			Disclaimer = roactModule.createElement("TextLabel", {
				TextSize = 12,
				BackgroundTransparency = 1,
				TextWrapped = true,
				Size = UDim2.new(1, 0, 0, 50),
				Text = p2.disclaimer,
				Font = font.Body.Font,
				TextColor3 = theme.TextEmphasis.Color,
				AnchorPoint = Vector2.new(0, 1),
				Position = UDim2.fromScale(0, 1)
			})
		})
	end)
end

function publishAssetPromptSingleStep.renderAlertLocalized(p1, p2)
	-- upvalues: roactModule (ref), interactiveAlert (ref), sendConsentDeniedOnCancel (ref), buttonType (ref), enableEmotePublishEngineFeature (ref), emoteThumbnailEditorModule (ref), previewViewportModule (ref)
	local var1 = roactModule.createElement(interactiveAlert, {
		isMiddleContentFocusable = true,
		title = p2.title,
		buttonStackInfo = {
			buttons = {
				{
					isDefaultChild = true,
					props = {
						onActivated = if sendConsentDeniedOnCancel then p1.denyAndClose else p1.closePrompt,
						text = p2.cancel
					}
				},
				{
					isDefaultChild = false,
					buttonType = buttonType.PrimarySystem,
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
			-- upvalues: p1 (ref), p2 (ref)
			return p1:renderMiddle(p2)
		end,
		screenSize = p1.props.screenSize,
		defaultChildRef = p1.props.defaultChildRef
	})
	
	return if enableEmotePublishEngineFeature then roactModule.createFragment({
		Prompt = var1,
		ThumbnailEditor = p1.state.showingThumbnailEditor and roactModule.createElement(emoteThumbnailEditorModule, {
			animationClip = p1.props.assetInstance,
			initialThumbnailParameters = p1.state.thumbnailParameters,
			screenSize = p1.props.screenSize,
			updateThumbnailCallback = p1.updateThumbnailParameters,
			closePromptCallback = p1.closeThumbnailEditor
		}) or nil,
		PreviewFrame = p1.state.showingAssetPreview and roactModule.createElement("Frame", {
			BackgroundTransparency = 0,
			Size = UDim2.new(0.5, 0, 0.5, 0),
			BackgroundColor3 = Color3.new(0.2, 0.2, 0.2),
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5)
		}, {
			PreviewViewport = roactModule.createElement(previewViewportModule, {
				asset = p1.props.assetInstance,
				closePreviewView = p1.closeAssetPreview
			})
		}) or nil
	}) else var1
end

local function _(p1)
	-- upvalues: t (ref)
	return t[p1] == true
end

local function GetLocalizedStringsForAssetType(value)
	-- upvalues: robloxTranslatorModule (ref), t (ref)
	local t_1 = {
		name = robloxTranslatorModule:FormatByKey("CoreScripts.PublishAssetPrompt.Name"),
		description = robloxTranslatorModule:FormatByKey("CoreScripts.PublishAssetPrompt.Description"),
		invalidName = robloxTranslatorModule:FormatByKey("CoreScripts.PublishAssetPrompt.InvalidName"),
		invalidDescription = robloxTranslatorModule:FormatByKey("CoreScripts.PublishAssetPrompt.InvalidDescription"),
		cancel = robloxTranslatorModule:FormatByKey("CoreScripts.PublishAssetPrompt.Cancel"),
		submit = robloxTranslatorModule:FormatByKey("CoreScripts.PublishAssetPrompt.Submit")
	}
	
	if t[value] ~= true then
		t_1.title = robloxTranslatorModule:FormatByKey("CoreScripts.PublishAssetPrompt.TitleTextClothing")
		t_1.disclaimer = robloxTranslatorModule:FormatByKey("CoreScripts.PublishAssetPrompt.DisclaimerAvatar")
		
		return t_1
	elseif value == Enum.AssetType.EmoteAnimation then
		t_1.title = robloxTranslatorModule:FormatByKey("CoreScripts.PublishAssetPrompt.TitleTextEmote")
		t_1.disclaimer = robloxTranslatorModule:FormatByKey("CoreScripts.PublishAssetPrompt.DisclaimerEmote")
		
		return t_1
	elseif value == Enum.AssetType.Model then
		t_1.title = robloxTranslatorModule:FormatByKey("CoreScripts.PublishAssetPrompt.TitleTextModel")
		t_1.disclaimer = robloxTranslatorModule:FormatByKey("CoreScripts.PublishAssetPrompt.DisclaimerModel")
		
		return t_1
	elseif value == Enum.AssetType.Package then
		t_1.title = robloxTranslatorModule:FormatByKey("CoreScripts.PublishAssetPrompt.TitleTextPackage")
		t_1.disclaimer = robloxTranslatorModule:FormatByKey("CoreScripts.PublishAssetPrompt.DisclaimerModel")
	end
	return t_1
end

function publishAssetPromptSingleStep.render(p1)
	-- upvalues: GetLocalizedStringsForAssetType (ref)
	return p1:renderAlertLocalized(GetLocalizedStringsForAssetType(p1.props.assetType))
end

return roactRoduxModule.connect(function(p1)
	return {
		assetInstance = p1.promptRequest.promptInfo.assetInstance,
		assetType = p1.promptRequest.promptInfo.assetType,
		guid = p1.promptRequest.promptInfo.guid,
		scopes = p1.promptRequest.promptInfo.scopes
	}
end, function(p1)
	-- upvalues: closeOpenPromptModule (ref)
	return {
		closePrompt = function()
			-- upvalues: p1 (ref), closeOpenPromptModule (copy)
			return p1(closeOpenPromptModule())
		end
	}
end)(publishAssetPromptSingleStep)