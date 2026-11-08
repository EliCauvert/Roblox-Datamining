local CorePackages = game:GetService("CorePackages")
local ExperienceAuthService = game:GetService("ExperienceAuthService")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local TModule = require(CorePackages.Packages.t)
local RobloxTranslatorModule = require(CorePackages.Workspace.Packages.RobloxTranslator)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local NormalizeFontFaceFunction = require(CorePackages.Packages.Foundation).Utility.normalizeFontFace
local WithStyleFunction = UIBloxModule.Style.withStyle
local InteractiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local RoactGamepadModule = require(CorePackages.Packages.RoactGamepad)
local LocalPlayer = game:GetService("Players").LocalPlayer
local NameTextBoxModule = require(script.Parent.Common.NameTextBox)
local AssetDescriptionTextBoxModule = require(script.Parent.AssetDescriptionTextBox)
local ImagePreviewModule = require(script.Parent.ImagePreview)
local ObjectViewportModule = require(script.Parent.ObjectViewport)
local CloseOpenPromptModule = require(script.Parent.Parent.Actions.CloseOpenPrompt)
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
local SendConsentDeniedOnCancel = game:DefineFastFlag("SendConsentDeniedOnCancel", false)
local EnableImagePublishEngineFeature = game:GetEngineFeature("EnableImagePublish")
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
	-- upvalues: ExperienceAuthService (copy), RoactModule (copy)
	p1.assetName = p1:getDefaultText()
	p1.assetDescription = p1:getDefaultText()
	p1.isNameValid = true
	p1.isDescriptionValid = true
	
	function p1.closePrompt()
		-- upvalues: p1 (copy)
		p1.props.closePrompt()
	end
	
	function p1.denyAndClose()
		-- upvalues: ExperienceAuthService (upval), p1 (copy)
		ExperienceAuthService:ScopeCheckUIComplete(p1.props.guid, p1.props.scopes, Enum.ScopeCheckResult.ConsentDenied, {})
		p1.closePrompt()
	end
	
	function p1.confirmAndUpload()
		-- upvalues: p1 (copy), ExperienceAuthService (upval)
		if p1.isNameValid then
			ExperienceAuthService:ScopeCheckUIComplete(p1.props.guid, p1.props.scopes, Enum.ScopeCheckResult.ConsentAccepted, {
				assetName = p1.assetName,
				assetDescription = p1.assetDescription
			})
			p1.closePrompt()
			
			return
		end
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
	-- upvalues: WithStyleFunction (copy), EnableImagePublishEngineFeature (copy), RoactModule (copy), RoactGamepadModule (copy), ImagePreviewModule (copy), ObjectViewportModule (copy), NormalizeFontFaceFunction (copy), NameTextBoxModule (copy), AssetDescriptionTextBoxModule (copy)
	return WithStyleFunction(function(p3)
		-- upvalues: EnableImagePublishEngineFeature (upval), p1 (copy), RoactModule (upval), RoactGamepadModule (upval), ImagePreviewModule (upval), ObjectViewportModule (upval), NormalizeFontFaceFunction (upval), p2 (copy), NameTextBoxModule (upval), AssetDescriptionTextBoxModule (upval)
		local Theme = p3.Theme
		local IsDecal = EnableImagePublishEngineFeature and (p1.props.assetType == Enum.AssetType.Image and p1.props.assetInstance:IsA("Decal"))
		
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
					ImagePreview = if IsDecal then RoactModule.createElement(ImagePreviewModule, {
						autoRotateSeconds = 6,
						imageContent = p1.props.assetInstance.TextureContent
					}) else nil,
					ObjectViewport = if IsDecal then nil else RoactModule.createElement(ObjectViewportModule, { model = p1.props.assetInstance }) or nil
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
						FontFace = NormalizeFontFaceFunction(p3.Tokens.Typography.BodyLarge.Font),
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
						FontFace = NormalizeFontFaceFunction(p3.Tokens.Typography.BodyLarge.Font),
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
				TextYAlignment = Enum.TextYAlignment.Center,
				Text = p2.disclaimer,
				FontFace = NormalizeFontFaceFunction(p3.Tokens.Typography.BodyLarge.Font),
				TextColor3 = Theme.TextEmphasis.Color,
				AnchorPoint = Vector2.new(0, 1),
				Position = UDim2.fromScale(0, 1)
			})
		})
	end)
end

function PublishAssetPromptSingleStep.renderAlertLocalized(p1, p2)
	-- upvalues: RoactModule (copy), InteractiveAlert (copy), SendConsentDeniedOnCancel (copy), ButtonType (copy)
	return (RoactModule.createElement(InteractiveAlert, {
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
						delayInputSeconds = 6,
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
	}))
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
		
		return config1
	end
	if AssetType == Enum.AssetType.Image then
		config1.title = RobloxTranslatorModule:FormatByKey("CoreScripts.PublishAssetPrompt.TitleTextImage")
		config1.disclaimer = RobloxTranslatorModule:FormatByKey("CoreScripts.PublishAssetPrompt.DisclaimerImage")
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