local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local parent = momentsCreation.Parent
local foundationModule = require(parent.Foundation)
local momentsCommonModule = require(parent.MomentsCommon)
local reactModule = require(parent.React)
local button = foundationModule.Button
local text = foundationModule.Text
local view = foundationModule.View
local useDeviceInsets = momentsCommonModule.Hooks.useDeviceInsets
local useTokens = foundationModule.Hooks.useTokens
local audioWaveformOverlayModule = require(momentsCreation.Components.Voice.AudioWaveformOverlay)
local videoTimelineModule = require(momentsCreation.Components.VideoTimeline)
local voiceActionBarModule = require(momentsCreation.Components.Voice.VoiceActionBar)
local _ = require(momentsCreation.Types.CreationFlowTypes)

return function(p0) --[[ line: 67 | named "VoiceEditorView" ]]
	-- upvalues: useDeviceInsets (ref), useTokens (ref), reactModule (ref), view (ref), videoTimelineModule (ref), audioWaveformOverlayModule (ref), text (ref), voiceActionBarModule (ref), foundationModule (ref), button (ref)
	local var11
	local var7 = useDeviceInsets()
	local var8 = useTokens()
	local keyboardInset = p0.keyboardInset
	local isGenerating = p0.isGenerating
	local isInputInvalid = p0.isInputInvalid
	local createElement = reactModule.createElement
	local t = {
		tag = "col align-x-center align-y-top gap-xlarge size-full-0 auto-y",
		LayoutOrder = p0.layoutOrder,
		onAbsoluteSizeChanged = p0.onContainerMeasured,
		padding = {
			top = UDim.new(0, var8.Padding.XLarge),
			bottom = if typeof(keyboardInset) == "number" then UDim.new(0, math.max(var7.bottom, var8.Padding.XLarge) + keyboardInset) else keyboardInset:map(function(p1) --[[ line: 83 ]]
				-- upvalues: var7 (ref), var8 (ref)
				return UDim.new(0, math.max(var7.bottom, var8.Padding.XLarge) + p1)
			end),
			left = UDim.new(0, math.max(var7.left, var8.Padding.XLarge)),
			right = UDim.new(0, math.max(var7.right, var8.Padding.XLarge))
		}
	}
	local t_1 = {
		Timeline = reactModule.createElement(videoTimelineModule, {
			interactive = true,
			layoutOrder = 1,
			playback = p0.playback,
			capture = p0.capture,
			onSeek = p0.onTimelineSeek
		}, {
			AudioWaveform = if p0.showAudioWaveform then reactModule.createElement(audioWaveformOverlayModule, {
				audioDuration = p0.audioDuration,
				videoDuration = p0.videoDuration,
				samples = p0.waveformSamples
			}) else nil
		}),
		ComposerSection = reactModule.createElement(view, { LayoutOrder = 2, tag = "col size-full-0 auto-y" }, {
			InputContainer = reactModule.createElement(view, {
				LayoutOrder = 1,
				tag = "size-full-0 auto-y",
				GroupTransparency = if isGenerating then 0.3 else 0,
				stroke = {
					Color = if isInputInvalid then var8.Color.System.Alert.Color3 else var8.Color.Stroke.Default.Color3,
					Transparency = if isInputInvalid then 0 else var8.Color.Stroke.Default.Transparency,
					Thickness = var8.Stroke.Standard
				},
				cornerRadius = UDim.new(0, 24),
				padding = {
					top = UDim.new(0, var8.Padding.Medium),
					bottom = UDim.new(0, var8.Padding.Medium),
					left = UDim.new(0, var8.Padding.Medium),
					right = UDim.new(0, var8.Padding.Medium)
				}
			}, {
				TextBox = reactModule.createElement("TextBox", {
					Size = UDim2.new(1, 0, 0, 76),
					BackgroundTransparency = 1,
					ClearTextOnFocus = false,
					ClipsDescendants = true,
					Font = Enum.Font.BuilderSans,
					MultiLine = true,
					PlaceholderColor3 = var8.Color.Content.Muted.Color3,
					PlaceholderText = p0.placeholderText,
					Text = p0.text,
					TextEditable = not isGenerating,
					ref = p0.textBoxRef,
					ShowNativeInput = true,
					TextColor3 = var8.Color.Content.Emphasis.Color3,
					TextTransparency = if isGenerating then 0.5 else 0,
					TextSize = var8.FontSize.FontSize_350,
					TextWrapped = true,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextYAlignment = Enum.TextYAlignment.Top,
					[reactModule.Change.Text] = p0.onTextChanged
				})
			}),
			HelperRow = reactModule.createElement(view, {
				LayoutOrder = 2,
				tag = "row flex-x-between align-y-center size-full-0 auto-y",
				padding = { top = UDim.new(0, var8.Gap.Small) }
			}, {
				HelperText = reactModule.createElement(text, {
					LayoutOrder = 1,
					tag = {
						["auto-xy text-caption-small content-alert"] = isInputInvalid,
						["auto-xy text-caption-small content-default"] = not isInputInvalid
					},
					Text = p0.helperText
				}),
				CharCount = reactModule.createElement(text, {
					LayoutOrder = 2,
					tag = {
						["auto-xy text-caption-small content-alert"] = p0.isOverLimit,
						["auto-xy text-caption-small content-default"] = not p0.isOverLimit
					},
					Text = `{p0.charCount} / {p0.maxChars}`
				})
			})
		})
	}
	
	if p0.showDelete then
		var11 = reactModule.createElement
		var11 = var11(voiceActionBarModule, {
			layoutOrder = 3,
			onDelete = p0.onDelete,
			primaryText = if p0.showSave then p0.saveText elseif isGenerating then "" else p0.createText,
			primaryOnActivated = if p0.showSave then p0.onSave else p0.onCreateVoiceover,
			primaryIsDisabled = if p0.showSave then false else not p0.canGenerate and not isGenerating,
			primaryIsLoading = not p0.showSave and isGenerating,
			primaryVariant = if p0.showSave or p0.canGenerate or isGenerating then foundationModule.Enums.ButtonVariant.Emphasis else foundationModule.Enums.ButtonVariant.Standard
		})
	elseif p0.showSave then
		var11 = reactModule.createElement(button, {
			LayoutOrder = 3,
			fillBehavior = foundationModule.Enums.FillBehavior.Fill,
			onActivated = p0.onSave,
			size = foundationModule.Enums.InputSize.Large,
			text = p0.saveText,
			variant = foundationModule.Enums.ButtonVariant.Emphasis,
			width = UDim.new(1, 0)
		})
	else
		var11 = reactModule.createElement
		var11 = var11(button, {
			LayoutOrder = 3,
			fillBehavior = foundationModule.Enums.FillBehavior.Fill,
			isDisabled = not p0.canGenerate and not isGenerating,
			isLoading = isGenerating,
			onActivated = p0.onCreateVoiceover,
			size = foundationModule.Enums.InputSize.Large,
			text = if isGenerating then "" else p0.createText,
			variant = if p0.canGenerate or isGenerating then foundationModule.Enums.ButtonVariant.Emphasis else foundationModule.Enums.ButtonVariant.Standard,
			width = UDim.new(1, 0)
		})
	end
	t_1.ActionButton = var11
	
	return createElement(view, t, t_1)
end