local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local parent = momentsCreation.Parent
local builderIconsModule = require(parent.BuilderIcons)
local foundationModule = require(parent.Foundation)
local momentsCommonModule = require(parent.MomentsCommon)
local reactModule = require(parent.React)
local button = foundationModule.Button
local icon = foundationModule.Icon
local text = foundationModule.Text
local textArea = foundationModule.TextArea
local view = foundationModule.View
local inputSize = foundationModule.Enums.InputSize
local inputVariant = foundationModule.Enums.InputVariant
local stateLayerAffordance = foundationModule.Enums.StateLayerAffordance
local useDeviceInsets = momentsCommonModule.Hooks.useDeviceInsets
local useTokens = foundationModule.Hooks.useTokens
local audioWaveformOverlayModule = require(momentsCreation.Components.Voice.AudioWaveformOverlay)
local videoTimelineModule = require(momentsCreation.Components.VideoTimeline)
local voiceActionBarModule = require(momentsCreation.Components.Voice.VoiceActionBar)
local _ = require(momentsCreation.Types.CreationFlowTypes)
local getFFlagMomentsTTSStartTimePositioningModule = require(momentsCreation.Flags.GetFFlagMomentsTTSStartTimePositioning)
local var1 = if require(momentsCreation.Flags.FFlagMomentsTTSCompactActionBar) then inputSize.Medium else inputSize.Large

return function(p1)
	-- upvalues: useDeviceInsets (ref), useTokens (ref), reactModule (ref), view (ref), videoTimelineModule (ref), getFFlagMomentsTTSStartTimePositioningModule (ref), audioWaveformOverlayModule (ref), textArea (ref), inputSize (ref), inputVariant (ref), stateLayerAffordance (ref), text (ref), icon (ref), builderIconsModule (ref), foundationModule (ref), voiceActionBarModule (ref), button (ref), var1 (ref)
	local var2
	local var3 = useDeviceInsets()
	local var4 = useTokens()
	local isGenerating = p1.isGenerating
	local isInputInvalid = p1.isInputInvalid
	local createElement = reactModule.createElement
	local t = {
		tag = "col align-x-center align-y-top gap-xlarge size-full-0 auto-y",
		LayoutOrder = p1.layoutOrder,
		padding = {
			top = UDim.new(0, var4.Padding.XLarge),
			bottom = UDim.new(0, math.max(var3.bottom, var4.Padding.XLarge)),
			left = UDim.new(0, math.max(var3.left, var4.Padding.XLarge)),
			right = UDim.new(0, math.max(var3.right, var4.Padding.XLarge))
		}
	}
	local t_1 = {
		Timeline = reactModule.createElement(videoTimelineModule, {
			interactive = true,
			layoutOrder = 1,
			playback = p1.playback,
			capture = p1.capture,
			dragOnly = getFFlagMomentsTTSStartTimePositioningModule,
			onSeek = p1.onTimelineSeek,
			playheadPosition = p1.playheadPosition
		}, {
			AudioWaveform = if p1.showAudioWaveform then reactModule.createElement(audioWaveformOverlayModule, {
				audioDuration = p1.audioDuration,
				videoDuration = p1.videoDuration,
				startTime = p1.startTime,
				dragDetectorRef = p1.waveformDragDetectorRef,
				isSelected = p1.waveformSelected,
				samples = p1.waveformSamples
			}) else nil
		}),
		ComposerSection = reactModule.createElement(view, { LayoutOrder = 2, tag = "col size-full-0 auto-y" }, {
			InputContainer = reactModule.createElement(view, {
				LayoutOrder = 1,
				tag = {
					["col size-full-0 auto-y"] = p1.showVoiceSelector,
					["size-full-0 auto-y"] = not p1.showVoiceSelector
				},
				stroke = {
					Color = if isInputInvalid then var4.Color.System.Alert.Color3 else var4.Color.Stroke.Emphasis.Color3,
					Transparency = if isInputInvalid then 0 else var4.Color.Stroke.Emphasis.Transparency,
					Thickness = var4.Stroke.Standard
				},
				cornerRadius = UDim.new(0, var4.Radius.Medium),
				onAbsoluteSizeChanged = p1.onComposerResize,
				ref = p1.composerContainerRef
			}, {
				Composer = reactModule.createElement(textArea, {
					LayoutOrder = 1,
					label = "",
					text = p1.text,
					width = UDim.new(1, 0),
					placeholder = p1.placeholderText,
					numLines = p1.numLines,
					size = inputSize.Medium,
					variant = inputVariant.Utility,
					onChanged = p1.onTextChanged,
					onFocusLost = p1.onTextBoxFocusLost,
					isDisabled = isGenerating,
					textBoxRef = p1.textBoxRef
				}),
				VoicePill = if p1.showVoiceSelector then reactModule.createElement(view, {
					LayoutOrder = 2,
					tag = "auto-xy",
					padding = {
						top = UDim.new(0, var4.Padding.Small),
						bottom = UDim.new(0, var4.Padding.Small),
						left = UDim.new(0, var4.Padding.Small),
						right = UDim.new(0, var4.Padding.Small)
					}
				}, {
					Pill = reactModule.createElement(view, {
						tag = "row align-y-center gap-small auto-xy radius-circle bg-surface-300",
						ref = p1.voiceSelectorButtonRef,
						onActivated = p1.onOpenVoiceSelector,
						stateLayer = { affordance = stateLayerAffordance.Background },
						padding = {
							top = UDim.new(0, var4.Padding.Small),
							bottom = UDim.new(0, var4.Padding.Small),
							left = UDim.new(0, var4.Padding.Medium),
							right = UDim.new(0, var4.Padding.Medium)
						}
					}, {
						Label = reactModule.createElement(text, {
							LayoutOrder = 1,
							tag = "auto-xy text-label-small content-emphasis",
							Text = p1.selectedVoiceName or ""
						}),
						Chevron = reactModule.createElement(icon, {
							LayoutOrder = 2,
							name = builderIconsModule.Icon.ChevronSmallDown,
							size = foundationModule.Enums.IconSize.Small,
							style = var4.Color.Content.Default
						})
					})
				}) else nil
			}),
			HelperRow = reactModule.createElement(view, {
				LayoutOrder = 2,
				tag = "row flex-x-between align-y-center size-full-0 auto-y",
				padding = { top = UDim.new(0, var4.Gap.Small) }
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
		var2 = reactModule.createElement
		var2 = var2(voiceActionBarModule, {
			layoutOrder = 3,
			onDelete = p1.onDelete,
			primaryRef = p1.createButtonRef,
			deleteRef = p1.deleteButtonRef,
			primaryText = if p1.showSave then p1.saveText elseif isGenerating then "" else p1.createText,
			primaryOnActivated = if p1.showSave then p1.onSave else p1.onCreateVoiceover,
			primaryIsDisabled = if p1.showSave then false else not p1.canGenerate and not isGenerating,
			primaryIsLoading = not p1.showSave and isGenerating,
			primaryVariant = if p1.showSave or p1.canGenerate or isGenerating then foundationModule.Enums.ButtonVariant.Emphasis else foundationModule.Enums.ButtonVariant.Standard
		})
	elseif p1.showSave then
		var2 = reactModule.createElement(button, {
			LayoutOrder = 3,
			fillBehavior = foundationModule.Enums.FillBehavior.Fill,
			onActivated = p1.onSave,
			size = var1,
			text = p1.saveText,
			variant = foundationModule.Enums.ButtonVariant.Emphasis,
			width = UDim.new(1, 0)
		})
	else
		var2 = reactModule.createElement
		var2 = var2("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 3,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.new(1, 0, 0, 0),
			ref = p1.createButtonRef
		}, {
			Button = reactModule.createElement(button, {
				fillBehavior = foundationModule.Enums.FillBehavior.Fill,
				isDisabled = not p1.canGenerate and not isGenerating,
				isLoading = isGenerating,
				onActivated = p1.onCreateVoiceover,
				size = var1,
				text = if isGenerating then "" else p1.createText,
				variant = if p1.canGenerate or isGenerating then foundationModule.Enums.ButtonVariant.Emphasis else foundationModule.Enums.ButtonVariant.Standard,
				width = UDim.new(1, 0)
			})
		})
	end
	t_1.ActionButton = var2
	
	return createElement(view, t, t_1)
end