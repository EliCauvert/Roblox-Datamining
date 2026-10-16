local MomentsCreation = script:FindFirstAncestor("MomentsCreation")
local Parent = MomentsCreation.Parent
local BuilderIconsModule = require(Parent.BuilderIcons)
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local Button = FoundationModule.Button
local Icon = FoundationModule.Icon
local Text = FoundationModule.Text
local TextArea = FoundationModule.TextArea
local View = FoundationModule.View
local InputSize = FoundationModule.Enums.InputSize
local InputVariant = FoundationModule.Enums.InputVariant
local StateLayerAffordance = FoundationModule.Enums.StateLayerAffordance
local UseDeviceInsetsFunction = require(Parent.MomentsCommon).Hooks.useDeviceInsets
local UseTokensFunction = FoundationModule.Hooks.useTokens
local AudioWaveformOverlayModule = require(MomentsCreation.Components.Voice.AudioWaveformOverlay)
local VideoTimelineModule = require(MomentsCreation.Components.VideoTimeline)
local VoiceActionBarModule = require(MomentsCreation.Components.Voice.VoiceActionBar)
local _ = require(MomentsCreation.Types.CreationFlowTypes)
local GetFFlagMomentsTTSStartTimePositioningModule = require(MomentsCreation.Flags.GetFFlagMomentsTTSStartTimePositioning)
local Medium = if require(MomentsCreation.Flags.FFlagMomentsTTSCompactActionBar) then InputSize.Medium else InputSize.Large

return function(p1) --[[ Line: 106 | Named "VoiceEditorView" ]]
	-- upvalues: UseDeviceInsetsFunction (copy), UseTokensFunction (copy), ReactModule (copy), View (copy), VideoTimelineModule (copy), GetFFlagMomentsTTSStartTimePositioningModule (copy), AudioWaveformOverlayModule (copy), TextArea (copy), InputSize (copy), InputVariant (copy), StateLayerAffordance (copy), Text (copy), Icon (copy), BuilderIconsModule (copy), FoundationModule (copy), VoiceActionBarModule (copy), Button (copy), Medium (copy)
	local UseDeviceInsetsResult = UseDeviceInsetsFunction()
	local UseTokensResult = UseTokensFunction()
	local IsGenerating = p1.isGenerating
	local IsInputInvalid = p1.isInputInvalid
	
	return ReactModule.createElement(View, {
		tag = "col align-x-center align-y-top gap-xlarge size-full-0 auto-y",
		LayoutOrder = p1.layoutOrder,
		padding = {
			top = UDim.new(0, UseTokensResult.Padding.XLarge),
			bottom = UDim.new(0, (math.max(UseDeviceInsetsResult.bottom, UseTokensResult.Padding.XLarge))),
			left = UDim.new(0, (math.max(UseDeviceInsetsResult.left, UseTokensResult.Padding.XLarge))),
			right = UDim.new(0, (math.max(UseDeviceInsetsResult.right, UseTokensResult.Padding.XLarge)))
		}
	}, {
		Timeline = ReactModule.createElement(VideoTimelineModule, {
			interactive = true,
			layoutOrder = 1,
			playback = p1.playback,
			capture = p1.capture,
			dragOnly = GetFFlagMomentsTTSStartTimePositioningModule,
			onSeek = p1.onTimelineSeek,
			playheadPosition = p1.playheadPosition
		}, {
			AudioWaveform = if p1.showAudioWaveform then ReactModule.createElement(AudioWaveformOverlayModule, {
				audioDuration = p1.audioDuration,
				videoDuration = p1.videoDuration,
				startTime = p1.startTime,
				dragDetectorRef = p1.waveformDragDetectorRef,
				isSelected = p1.waveformSelected,
				samples = p1.waveformSamples
			}) else nil
		}),
		ComposerSection = ReactModule.createElement(View, { LayoutOrder = 2, tag = "col size-full-0 auto-y" }, {
			InputContainer = ReactModule.createElement(View, {
				LayoutOrder = 1,
				tag = {
					["col size-full-0 auto-y"] = p1.showVoiceSelector,
					["size-full-0 auto-y"] = not p1.showVoiceSelector
				},
				stroke = {
					Color = if IsInputInvalid then UseTokensResult.Color.System.Alert.Color3 else UseTokensResult.Color.Stroke.Emphasis.Color3,
					Transparency = if IsInputInvalid then 0 else UseTokensResult.Color.Stroke.Emphasis.Transparency,
					Thickness = UseTokensResult.Stroke.Standard
				},
				cornerRadius = UDim.new(0, UseTokensResult.Radius.Medium),
				onAbsoluteSizeChanged = p1.onComposerResize,
				ref = p1.composerContainerRef
			}, {
				Composer = ReactModule.createElement(TextArea, {
					LayoutOrder = 1,
					label = "",
					text = p1.text,
					width = UDim.new(1, 0),
					placeholder = p1.placeholderText,
					numLines = p1.numLines,
					size = InputSize.Medium,
					variant = InputVariant.Utility,
					onChanged = p1.onTextChanged,
					onFocusLost = p1.onTextBoxFocusLost,
					isDisabled = IsGenerating,
					textBoxRef = p1.textBoxRef
				}),
				VoicePill = if p1.showVoiceSelector then ReactModule.createElement(View, {
					LayoutOrder = 2,
					tag = "auto-xy",
					padding = {
						top = UDim.new(0, UseTokensResult.Padding.Small),
						bottom = UDim.new(0, UseTokensResult.Padding.Small),
						left = UDim.new(0, UseTokensResult.Padding.Small),
						right = UDim.new(0, UseTokensResult.Padding.Small)
					}
				}, {
					Pill = ReactModule.createElement(View, {
						tag = "row align-y-center gap-small auto-xy radius-circle bg-surface-300",
						ref = p1.voiceSelectorButtonRef,
						onActivated = p1.onOpenVoiceSelector,
						stateLayer = { affordance = StateLayerAffordance.Background },
						padding = {
							top = UDim.new(0, UseTokensResult.Padding.Small),
							bottom = UDim.new(0, UseTokensResult.Padding.Small),
							left = UDim.new(0, UseTokensResult.Padding.Medium),
							right = UDim.new(0, UseTokensResult.Padding.Medium)
						}
					}, {
						Label = ReactModule.createElement(Text, {
							LayoutOrder = 1,
							tag = "auto-xy text-label-small content-emphasis",
							Text = p1.selectedVoiceName or ""
						}),
						Chevron = ReactModule.createElement(Icon, {
							LayoutOrder = 2,
							name = BuilderIconsModule.Icon.ChevronSmallDown,
							size = FoundationModule.Enums.IconSize.Small,
							style = UseTokensResult.Color.Content.Default
						})
					})
				}) else nil
			}),
			HelperRow = ReactModule.createElement(View, {
				LayoutOrder = 2,
				tag = "row flex-x-between align-y-center size-full-0 auto-y",
				padding = { top = UDim.new(0, UseTokensResult.Gap.Small) }
			}, {
				HelperText = ReactModule.createElement(Text, {
					LayoutOrder = 1,
					tag = {
						["auto-xy text-caption-small content-alert"] = IsInputInvalid,
						["auto-xy text-caption-small content-default"] = not IsInputInvalid
					},
					Text = p1.helperText
				}),
				CharCount = ReactModule.createElement(Text, {
					LayoutOrder = 2,
					tag = {
						["auto-xy text-caption-small content-alert"] = p1.isOverLimit,
						["auto-xy text-caption-small content-default"] = not p1.isOverLimit
					},
					Text = `{p1.charCount} / {p1.maxChars}`
				})
			})
		}),
		ActionButton = if p1.showDelete then ReactModule.createElement(VoiceActionBarModule, {
			layoutOrder = 3,
			onDelete = p1.onDelete,
			primaryRef = p1.createButtonRef,
			deleteRef = p1.deleteButtonRef,
			primaryText = if p1.showSave then p1.saveText elseif IsGenerating then "" else p1.createText,
			primaryOnActivated = if p1.showSave then p1.onSave else p1.onCreateVoiceover,
			primaryIsDisabled = not p1.showSave and (not p1.canGenerate and not IsGenerating),
			primaryIsLoading = not p1.showSave and IsGenerating,
			primaryVariant = if p1.showSave or p1.canGenerate or IsGenerating then FoundationModule.Enums.ButtonVariant.Emphasis else FoundationModule.Enums.ButtonVariant.Standard
		}) elseif p1.showSave then ReactModule.createElement(Button, {
			LayoutOrder = 3,
			fillBehavior = FoundationModule.Enums.FillBehavior.Fill,
			onActivated = p1.onSave,
			size = Medium,
			text = p1.saveText,
			variant = FoundationModule.Enums.ButtonVariant.Emphasis,
			width = UDim.new(1, 0)
		}) else ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 3,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.new(1, 0, 0, 0),
			ref = p1.createButtonRef
		}, {
			Button = ReactModule.createElement(Button, {
				fillBehavior = FoundationModule.Enums.FillBehavior.Fill,
				isDisabled = not p1.canGenerate and not IsGenerating,
				isLoading = IsGenerating,
				onActivated = p1.onCreateVoiceover,
				size = Medium,
				text = if IsGenerating then "" else p1.createText,
				variant = if p1.canGenerate or IsGenerating then FoundationModule.Enums.ButtonVariant.Emphasis else FoundationModule.Enums.ButtonVariant.Standard,
				width = UDim.new(1, 0)
			})
		})
	})
end