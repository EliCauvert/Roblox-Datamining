local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactGamepadModule = require(CorePackages.Packages.RoactGamepad)
local TModule = require(CorePackages.Packages.t)
local RobloxTranslatorModule = require(CorePackages.Workspace.Packages.RobloxTranslator)
local EmoteUtility = require(CorePackages.Packages.Thumbnailing).EmoteUtility
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local FoundationModule = require(CorePackages.Packages.Foundation)
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local WithStyleFunction = UIBloxModule.Style.withStyle
local InteractiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local SystemSlider = UIBloxModule.App.Slider.SystemSlider
local EmoteThumbnailParametersModule = require(script.Parent.EmoteThumbnailParameters)
local EmoteThumbnailViewModule = require(script.Parent.EmoteThumbnailView)
local config = {
	Rotation = {
		Precision = 0,
		Default = 0,
		Increments = 361,
		Range = NumberRange.new(0, 360)
	}
}
local EmoteThumbnailEditor = RoactModule.PureComponent:extend("EmoteThumbnailEditor")
EmoteThumbnailEditor.validateProps = TModule.strictInterface({
	screenSize = TModule.Vector2,
	animationClip = TModule.instanceIsA("AnimationClip"),
	initialThumbnailParameters = TModule.optional(EmoteThumbnailParametersModule.validate),
	closePromptCallback = TModule.callback,
	updateThumbnailCallback = TModule.callback
})

function EmoteThumbnailEditor.init(p1)
	-- upvalues: EmoteThumbnailParametersModule (copy), RoactModule (copy)
	p1:setState({
		thumbnailParameters = p1.props.initialThumbnailParameters or EmoteThumbnailParametersModule.defaultParameters
	})
	
	function p1.onCancelPressed()
		-- upvalues: p1 (copy)
		p1.props.closePromptCallback()
	end
	
	function p1.onUpdatePressed()
		-- upvalues: p1 (copy)
		p1.props.updateThumbnailCallback(p1.state.thumbnailParameters)
		p1.props.closePromptCallback()
	end
	
	function p1.onRotateChanged(ThumbnailCharacterRotation)
		-- upvalues: p1 (copy)
		local Copy = table.clone(p1.state.thumbnailParameters)
		Copy.thumbnailCharacterRotation = ThumbnailCharacterRotation
		p1:updateThumbnailParameters(Copy)
	end
	
	function p1.onKeyframeOrTimeChanged(ThumbnailKeyframe)
		-- upvalues: p1 (copy)
		local Copy = table.clone(p1.state.thumbnailParameters)
		Copy.thumbnailTime = ThumbnailKeyframe
		Copy.thumbnailKeyframe = ThumbnailKeyframe
		p1:updateThumbnailParameters(Copy)
	end
	
	p1.rotationSliderRef = RoactModule.createRef()
	p1.timeSliderRef = RoactModule.createRef()
	p1:updateSliderValuesForAnimationClip()
end

function EmoteThumbnailEditor.updateSliderValuesForAnimationClip(p1)
	-- upvalues: EmoteUtility (copy)
	local Props = p1.props
	local TimeSliderMin: number? = nil
	local Count: number? = nil
	local TimeSliderStepInterval: number? = nil
	
	if Props.animationClip:IsA("KeyframeSequence") then
		TimeSliderMin = 1
		Count = #Props.animationClip:GetKeyframes()
		TimeSliderStepInterval = 1
	elseif Props.animationClip:IsA("CurveAnimation") then
		TimeSliderMin = 0
		Count = math.floor(EmoteUtility.GetCurveAnimationTimeLength(Props.animationClip) / 0.01) * 0.01
		TimeSliderStepInterval = 0.01
	else
		error("Unsupported animation type:", Props.animationClip.ClassName)
	end
	p1:setState({
		timeSliderMin = TimeSliderMin,
		timeSliderMax = Count,
		timeSliderStepInterval = TimeSliderStepInterval
	})
end

function EmoteThumbnailEditor.updateThumbnailParameters(p1, ThumbnailParameters)
	p1:setState({ thumbnailParameters = ThumbnailParameters })
end

function EmoteThumbnailEditor.renderMiddle(p1, LocalizedStrings)
	-- upvalues: WithStyleFunction (copy), RoactModule (copy), RoactGamepadModule (copy), EmoteThumbnailViewModule (copy), FoundationFontFaceMigration (copy), NormalizeFontFaceFunction (copy), SystemSlider (copy), config (copy)
	return WithStyleFunction(function(p2)
		-- upvalues: p1 (copy), RoactModule (upval), RoactGamepadModule (upval), EmoteThumbnailViewModule (upval), FoundationFontFaceMigration (upval), NormalizeFontFaceFunction (upval), LocalizedStrings (copy), SystemSlider (upval), config (upval)
		local _Font = p2.Font
		local Theme = p2.Theme
		local t = {}
		
		if p1.props.screenSize.Y > 481 then
			t.contentSize = UDim2.new(1, 0, 0, 262)
			t.thumbnailPosition = UDim2.new(0.5, 0, 0, 0)
			t.thumbnailAnchorPoint = Vector2.new(0.5, 0)
			t.leversPosition = UDim2.new(0, 0, 0, 160)
			t.leversSize = UDim2.new(1, 0, 0, 102)
		else
			t.contentSize = UDim2.new(1, 0, 0, 150)
			t.thumbnailPosition = UDim2.new(0, 0, 0, 0)
			t.thumbnailAnchorPoint = Vector2.new(0, 0)
			t.leversPosition = UDim2.new(0, 160, 0, 0)
			t.leversSize = UDim2.new(1, -160, 0, 102)
		end
		local ThumbnailParameters = p1.state.thumbnailParameters
		
		local function _(p3)
			return (p3.Range.Max - p3.Range.Min) / (p3.Increments - 1)
		end
		
		local Rotation = config.Rotation
		
		return RoactModule.createElement(RoactGamepadModule.Focusable.Frame, {
			Size = t.contentSize,
			BackgroundColor3 = Color3.new(1, 0, 1),
			BackgroundTransparency = 1,
			[RoactModule.Ref] = p1.middleContentRef
		}, {
			TopSection = RoactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
				ThumbnailViewParent = RoactModule.createElement("Frame", {
					LayoutOrder = 0,
					BackgroundTransparency = 1,
					Position = t.thumbnailPosition,
					AnchorPoint = t.thumbnailAnchorPoint,
					Size = UDim2.new(0, 150, 0, 150),
					BackgroundColor3 = Color3.new(1, 1, 0)
				}, {
					EmoteThumbnailView = RoactModule.createElement(EmoteThumbnailViewModule, {
						position = UDim2.new(0.5, 0, 0.5, 0),
						anchorPoint = Vector2.new(0.5, 0.5),
						animationClip = p1.props.animationClip,
						thumbnailParameters = p1.state.thumbnailParameters
					})
				}),
				Levers = RoactModule.createElement("Frame", {
					LayoutOrder = 1,
					BackgroundTransparency = 1,
					Size = t.leversSize,
					AnchorPoint = Vector2.new(0, 0),
					Position = t.leversPosition,
					BackgroundColor3 = Color3.new(1, 0, 0)
				}, {
					ListLayout = RoactModule.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Vertical,
						SortOrder = Enum.SortOrder.LayoutOrder,
						HorizontalAlignment = Enum.HorizontalAlignment.Center
					}),
					FrameDescriptionLabel = RoactModule.createElement("TextLabel", {
						LayoutOrder = 0,
						TextSize = 12,
						BackgroundTransparency = 1,
						Size = UDim2.new(1, 0, 0, 15),
						Font = if FoundationFontFaceMigration then nil else _Font.Body.Font,
						FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(p2.Tokens.Typography.BodyLarge.Font) else nil,
						Text = LocalizedStrings.timeLabelText,
						TextColor3 = Theme.TextDefault.Color,
						TextXAlignment = Enum.TextXAlignment.Left
					}),
					TimeSlider = RoactModule.createElement(SystemSlider, {
						layoutOrder = 1,
						min = p1.state.timeSliderMin,
						max = p1.state.timeSliderMax,
						stepInterval = p1.state.timeSliderStepInterval,
						value = ThumbnailParameters.thumbnailKeyframe,
						onValueChanged = p1.onKeyframeOrTimeChanged,
						width = UDim.new(1, 0),
						position = UDim2.new(0, 0, 0.5, 0),
						anchorPoint = Vector2.new(0, 0.5),
						NextSelectionDown = p1.rotationSliderRef,
						[RoactModule.Ref] = p1.timeSliderRef
					}),
					RotationDescriptionLabel = RoactModule.createElement("TextLabel", {
						LayoutOrder = 2,
						TextSize = 12,
						BackgroundTransparency = 1,
						Size = UDim2.new(1, 0, 0, 15),
						Font = if FoundationFontFaceMigration then nil else _Font.Body.Font,
						FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(p2.Tokens.Typography.BodyLarge.Font) else nil,
						Text = LocalizedStrings.rotationLabelText,
						TextColor3 = Theme.TextDefault.Color,
						TextXAlignment = Enum.TextXAlignment.Left
					}),
					RotationSlider = RoactModule.createElement(SystemSlider, {
						layoutOrder = 3,
						min = config.Rotation.Range.Min,
						max = config.Rotation.Range.Max,
						stepInterval = (Rotation.Range.Max - Rotation.Range.Min) / (Rotation.Increments - 1),
						value = ThumbnailParameters.thumbnailCharacterRotation,
						onValueChanged = p1.onRotateChanged,
						width = UDim.new(1, 0),
						position = UDim2.new(0, 0, 0.5, 0),
						anchorPoint = Vector2.new(0, 0.5),
						NextSelectionUp = p1.timeSliderRef,
						[RoactModule.Ref] = p1.rotationSliderRef
					})
				})
			})
		})
	end)
end

function EmoteThumbnailEditor.renderAlertLocalized(p1, LocalizedStrings)
	-- upvalues: RoactModule (copy), InteractiveAlert (copy), ButtonType (copy)
	return RoactModule.createElement(InteractiveAlert, {
		isMiddleContentFocusable = true,
		title = LocalizedStrings.titleText or "",
		buttonStackInfo = {
			buttons = {
				{
					isDefaultChild = true,
					props = {
						onActivated = p1.onCancelPressed,
						text = LocalizedStrings.cancelButtonText
					}
				},
				{
					isDefaultChild = false,
					buttonType = ButtonType.PrimarySystem,
					props = {
						onActivated = p1.onUpdatePressed,
						text = LocalizedStrings.updateButtonText
					}
				}
			}
		},
		middleContent = function()
			-- upvalues: p1 (copy), LocalizedStrings (copy)
			return p1:renderMiddle(LocalizedStrings)
		end,
		screenSize = p1.props.screenSize,
		defaultChildRef = p1.props.defaultChildRef
	})
end

local function GetLocalizedStrings()
	-- upvalues: RobloxTranslatorModule (copy)
	return {
		cancelButtonText = RobloxTranslatorModule:FormatByKey("CoreScripts.EmoteThumbnailEditor.Action.Cancel"),
		updateButtonText = RobloxTranslatorModule:FormatByKey("CoreScripts.EmoteThumbnailEditor.Action.Update"),
		titleText = RobloxTranslatorModule:FormatByKey("CoreScripts.EmoteThumbnailEditor.Heading.EditThumbnail"),
		rotationLabelText = RobloxTranslatorModule:FormatByKey("CoreScripts.EmoteThumbnailEditor.Label.Rotation"),
		timeLabelText = RobloxTranslatorModule:FormatByKey("CoreScripts.EmoteThumbnailEditor.Label.Time")
	}
end

function EmoteThumbnailEditor.render(p1)
	-- upvalues: GetLocalizedStrings (copy)
	return p1:renderAlertLocalized((GetLocalizedStrings()))
end

return EmoteThumbnailEditor