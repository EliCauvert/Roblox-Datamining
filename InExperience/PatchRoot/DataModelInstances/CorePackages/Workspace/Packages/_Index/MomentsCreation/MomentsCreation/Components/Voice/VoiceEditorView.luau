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

return function(p1)
	-- upvalues: useDeviceInsets (ref), useTokens (ref), reactModule (ref), view (ref), videoTimelineModule (ref), audioWaveformOverlayModule (ref), text (ref), voiceActionBarModule (ref), foundationModule (ref), button (ref)
	local var1
	local var2 = useDeviceInsets()
	local var3 = useTokens()
	local keyboardInset = p1.keyboardInset
	local isGenerating = p1.isGenerating
	local isInputInvalid = p1.isInputInvalid
	local createElement = reactModule.createElement
	local t = {
		tag = "col align-x-center align-y-top gap-xlarge size-full-0 auto-y",
		LayoutOrder = p1.layoutOrder,
		onAbsoluteSizeChanged = p1.onContainerMeasured,
		padding = {
			top = UDim.new(0, var3.Padding.XLarge),
			bottom = if typeof(keyboardInset) == "number" then UDim.new(0, math.max(var2.bottom, var3.Padding.XLarge) + keyboardInset) else keyboardInset:map(function(p2)
				-- upvalues: var2 (ref), var3 (ref)
				return UDim.new(0, math.max(var2.bottom, var3.Padding.XLarge) + p2)
			end),
			left = UDim.new(0, math.max(var2.left, var3.Padding.XLarge)),
			right = UDim.new(0, math.max(var2.right, var3.Padding.XLarge))
		}
	}
	local t_1 = {
		Timeline = reactModule.createElement(videoTimelineModule, {
			interactive = true,
			layoutOrder = 1,
			playback = p1.playback,
			capture = p1.capture,
			onSeek = p1.onTimelineSeek
		}, {
			AudioWaveform = if p1.showAudioWaveform then reactModule.createElement(audioWaveformOverlayModule, {
				audioDuration = p1.audioDuration,
				videoDuration = p1.videoDuration,
				samples = p1.waveformSamples
			}) else nil
		}),
		ComposerSection = reactModule.createElement(view, { LayoutOrder = 2, tag = "col size-full-0 auto-y" }, {
			InputContainer = reactModule.createElement(view, {
				LayoutOrder = 1,
				tag = "size-full-0 auto-y",
				GroupTransparency = if isGenerating then 0.3 else 0,
				stroke = {
					Color = if isInputInvalid then var3.Color.System.Alert.Color3 else var3.Color.Stroke.Default.Color3,
					Transparency = if isInputInvalid then 0 else var3.Color.Stroke.Default.Transparency,
					Thickness = var3.Stroke.Standard
				},
				cornerRadius = UDim.new(0, 24),
				padding = {
					top = UDim.new(0, var3.Padding.Medium),
					bottom = UDim.new(0, var3.Padding.Medium),
					left = UDim.new(0, var3.Padding.Medium),
					right = UDim.new(0, var3.Padding.Medium)
				}
			}, {
				TextBox = reactModule.createElement("TextBox", {
					Size = UDim2.new(1, 0, 0, 76),
					BackgroundTransparency = 1,
					ClearTextOnFocus = false,
					ClipsDescendants = true,
					Font = Enum.Font.BuilderSans,
					MultiLine = true,
					PlaceholderColor3 = var3.Color.Content.Muted.Color3,
					PlaceholderText = p1.placeholderText,
					Text = p1.text,
					TextEditable = not isGenerating,
					ref = p1.textBoxRef,
					ShowNativeInput = true,
					TextColor3 = var3.Color.Content.Emphasis.Color3,
					TextTransparency = if isGenerating then 0.5 else 0,
					TextSize = var3.FontSize.FontSize_350,
					TextWrapped = true,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextYAlignment = Enum.TextYAlignment.Top,
					[reactModule.Change.Text] = p1.onTextChanged
				})
			}),
			HelperRow = reactModule.createElement(view, {
				LayoutOrder = 2,
				tag = "row flex-x-between align-y-center size-full-0 auto-y",
				padding = { top = UDim.new(0, var3.Gap.Small) }
			}, {
				HelperText = reactModule.createElement(text, {
					LayoutOrder = 1,
					tag = {
						["auto-xy text-caption-small content-alert"] = isInputInvalid,
						["auto-xy text-caption-small content-default"] = not isInputInvalid
					},
					Text = p1.helperText
				}),
				CharCount = reactModule.createElement(text, {
					LayoutOrder = 2,
					tag = {
						["auto-xy text-caption-small content-alert"] = p1.isOverLimit,
						["auto-xy text-caption-small content-default"] = not p1.isOverLimit
					},
					Text = `{p1.charCount} / {p1.maxChars}`
				})
			})
		})
	}
	
	if p1.showDelete then
		var1 = reactModule.createElement
		var1 = var1(voiceActionBarModule, {
			layoutOrder = 3,
			onDelete = p1.onDelete,
			primaryText = if p1.showSave then p1.saveText elseif isGenerating then "" else p1.createText,
			primaryOnActivated = if p1.showSave then p1.onSave else p1.onCreateVoiceover,
			primaryIsDisabled = if p1.showSave then false else not p1.canGenerate and not isGenerating,
			primaryIsLoading = not p1.showSave and isGenerating,
			primaryVariant = if p1.showSave or p1.canGenerate or isGenerating then foundationModule.Enums.ButtonVariant.Emphasis else foundationModule.Enums.ButtonVariant.Standard
		})
	elseif p1.showSave then
		var1 = reactModule.createElement(button, {
			LayoutOrder = 3,
			fillBehavior = foundationModule.Enums.FillBehavior.Fill,
			onActivated = p1.onSave,
			size = foundationModule.Enums.InputSize.Large,
			text = p1.saveText,
			variant = foundationModule.Enums.ButtonVariant.Emphasis,
			width = UDim.new(1, 0)
		})
	else
		var1 = reactModule.createElement
		var1 = var1(button, {
			LayoutOrder = 3,
			fillBehavior = foundationModule.Enums.FillBehavior.Fill,
			isDisabled = not p1.canGenerate and not isGenerating,
			isLoading = isGenerating,
			onActivated = p1.onCreateVoiceover,
			size = foundationModule.Enums.InputSize.Large,
			text = if isGenerating then "" else p1.createText,
			variant = if p1.canGenerate or isGenerating then foundationModule.Enums.ButtonVariant.Emphasis else foundationModule.Enums.ButtonVariant.Standard,
			width = UDim.new(1, 0)
		})
	end
	t_1.ActionButton = var1
	
	return createElement(view, t, t_1)
end