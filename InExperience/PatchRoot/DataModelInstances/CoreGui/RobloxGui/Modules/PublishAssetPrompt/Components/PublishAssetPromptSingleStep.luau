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

function publishAssetPromptSingleStep.getDefaultText(p0)
	-- upvalues: robloxTranslatorModule (ref), localPlayer (ref)
	return if p0.props.assetType == Enum.AssetType.Model then robloxTranslatorModule:FormatByKey("CoreScripts.PublishAssetPrompt.PackagesDefaultName", { RBX_NAME = if localPlayer then localPlayer.Name else "" }) else ""
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
	
	function p1.onAssetNameUpdated(p3, p4)
		-- upvalues: p1 (ref)
		if p4 then
			p1.assetName = p3
			p1.isNameValid = true
			
			return
		end
		p1.isNameValid = false
	end
	
	function p1.onAssetDescriptionUpdated(p5, p6)
		-- upvalues: p1 (ref)
		p1.assetDescription = p5
		p1.isDescriptionValid = p6
	end
	
	p1.nameTextBoxRef = roactModule.createRef()
	p1.descriptionTextBoxRef = roactModule.createRef()
end

function publishAssetPromptSingleStep.renderMiddle(p7, p8)
	-- upvalues: withStyle (ref), enableEmotePublishEngineFeature (ref), roactModule (ref), roactGamepadModule (ref), objectViewportModule (ref), emoteThumbnailViewModule (ref), iconButton (ref), previewExpand (ref), edit (ref), nameTextBoxModule (ref), assetDescriptionTextBoxModule (ref)
	return withStyle(function(p9)
		-- upvalues: enableEmotePublishEngineFeature (copy), p7 (ref), roactModule (copy), roactGamepadModule (copy), objectViewportModule (copy), emoteThumbnailViewModule (copy), iconButton (copy), previewExpand (copy), edit (copy), p8 (ref), nameTextBoxModule (copy), assetDescriptionTextBoxModule (copy)
		local font = p9.Font
		local theme = p9.Theme
		local var24 = enableEmotePublishEngineFeature and (p7.props.assetType == Enum.AssetType.EmoteAnimation and p7.props.assetInstance:IsA("AnimationClip"))
		
		return roactModule.createElement(roactGamepadModule.Focusable.Frame, {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 150),
			defaultChild = p7.nameTextBoxRef,
			[roactModule.Ref] = p7.middleContentRef
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
					ObjectViewport = not var24 and roactModule.createElement(objectViewportModule, { model = p7.props.assetInstance }) or nil,
					EmoteThumbnailParent = var24 and roactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1) }, {
						AspectRatioConstraint = roactModule.createElement("UIAspectRatioConstraint", {
							AspectRatio = 1,
							AspectType = Enum.AspectType.FitWithinMaxSize,
							DominantAxis = Enum.DominantAxis.Width
						}),
						EmoteThumbnailView = roactModule.createElement(emoteThumbnailViewModule, {
							animationClip = p7.props.assetInstance,
							thumbnailParameters = p7.state.thumbnailParameters
						}),
						PreviewButton = roactModule.createElement(iconButton, {
							showBackground = true,
							position = UDim2.new(1, -2, 1, -2),
							anchorPoint = Vector2.new(1, 1),
							icon = previewExpand,
							size = UDim2.new(0, 30, 0, 30),
							onActivated = p7.openAssetPreview
						}),
						EditButton = roactModule.createElement(iconButton, {
							showBackground = true,
							position = UDim2.new(0, 2, 1, -2),
							anchorPoint = Vector2.new(0, 1),
							icon = edit,
							size = UDim2.new(0, 30, 0, 30),
							onActivated = p7.openThumbnailEditor
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
						Text = p8.name,
						TextColor3 = theme.TextDefault.Color,
						TextXAlignment = Enum.TextXAlignment.Left
					}),
					NameInput = roactModule.createElement(nameTextBoxModule, {
						Size = UDim2.new(1, 0, 0, 30),
						Position = UDim2.new(0, 0, 0, 15),
						onNameUpdated = p7.onAssetNameUpdated,
						nameTextBoxRef = p7.nameTextBoxRef,
						NextSelectionDown = p7.descriptionTextBoxRef,
						defaultName = p7.assetName
					}),
					DescriptionLabel = roactModule.createElement("TextLabel", {
						TextSize = 12,
						BackgroundTransparency = 1,
						Size = UDim2.new(1, 0, 0, 15),
						Position = UDim2.new(0, 0, 0, 60),
						Font = font.Body.Font,
						Text = p8.description,
						TextColor3 = theme.TextDefault.Color,
						TextXAlignment = Enum.TextXAlignment.Left
					}),
					DescriptionInput = roactModule.createElement(assetDescriptionTextBoxModule, {
						Size = UDim2.new(1, 0, 0, 80),
						Position = UDim2.new(0, 0, 0, 75),
						onAssetDescriptionUpdated = p7.onAssetDescriptionUpdated,
						descriptionTextBoxRef = p7.descriptionTextBoxRef,
						NextSelectionUp = p7.nameTextBoxRef,
						defaultDescription = p7.assetDescription
					})
				})
			}),
			Disclaimer = roactModule.createElement("TextLabel", {
				TextSize = 12,
				BackgroundTransparency = 1,
				TextWrapped = true,
				Size = UDim2.new(1, 0, 0, 50),
				Text = p8.disclaimer,
				Font = font.Body.Font,
				TextColor3 = theme.TextEmphasis.Color,
				AnchorPoint = Vector2.new(0, 1),
				Position = UDim2.fromScale(0, 1)
			})
		})
	end)
end

function publishAssetPromptSingleStep.renderAlertLocalized(p10, p11)
	-- upvalues: roactModule (ref), interactiveAlert (ref), sendConsentDeniedOnCancel (ref), buttonType (ref), enableEmotePublishEngineFeature (ref), emoteThumbnailEditorModule (ref), previewViewportModule (ref)
	local var25 = roactModule.createElement(interactiveAlert, {
		isMiddleContentFocusable = true,
		title = p11.title,
		buttonStackInfo = {
			buttons = {
				{
					isDefaultChild = true,
					props = {
						onActivated = if sendConsentDeniedOnCancel then p10.denyAndClose else p10.closePrompt,
						text = p11.cancel
					}
				},
				{
					isDefaultChild = false,
					buttonType = buttonType.PrimarySystem,
					props = {
						isDelayedInput = true,
						enableInputDelayed = true,
						delayInputSeconds = 3,
						onActivated = p10.confirmAndUpload,
						text = p11.submit
					}
				}
			}
		},
		middleContent = function()
			-- upvalues: p10 (ref), p11 (ref)
			return p10:renderMiddle(p11)
		end,
		screenSize = p10.props.screenSize,
		defaultChildRef = p10.props.defaultChildRef
	})
	
	return if enableEmotePublishEngineFeature then roactModule.createFragment({
		Prompt = var25,
		ThumbnailEditor = p10.state.showingThumbnailEditor and roactModule.createElement(emoteThumbnailEditorModule, {
			animationClip = p10.props.assetInstance,
			initialThumbnailParameters = p10.state.thumbnailParameters,
			screenSize = p10.props.screenSize,
			updateThumbnailCallback = p10.updateThumbnailParameters,
			closePromptCallback = p10.closeThumbnailEditor
		}) or nil,
		PreviewFrame = p10.state.showingAssetPreview and roactModule.createElement("Frame", {
			BackgroundTransparency = 0,
			Size = UDim2.new(0.5, 0, 0.5, 0),
			BackgroundColor3 = Color3.new(0.2, 0.2, 0.2),
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5)
		}, {
			PreviewViewport = roactModule.createElement(previewViewportModule, {
				asset = p10.props.assetInstance,
				closePreviewView = p10.closeAssetPreview
			})
		}) or nil
	}) else var25
end

local function _(p12)
	-- upvalues: t (ref)
	return t[p12] == true
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

function publishAssetPromptSingleStep.render(p13)
	-- upvalues: GetLocalizedStringsForAssetType (ref)
	return p13:renderAlertLocalized(GetLocalizedStringsForAssetType(p13.props.assetType))
end

return roactRoduxModule.connect(function(p14)
	return {
		assetInstance = p14.promptRequest.promptInfo.assetInstance,
		assetType = p14.promptRequest.promptInfo.assetType,
		guid = p14.promptRequest.promptInfo.guid,
		scopes = p14.promptRequest.promptInfo.scopes
	}
end, function(p15)
	-- upvalues: closeOpenPromptModule (ref)
	return {
		closePrompt = function()
			-- upvalues: p15 (ref), closeOpenPromptModule (copy)
			return p15(closeOpenPromptModule())
		end
	}
end)(publishAssetPromptSingleStep)