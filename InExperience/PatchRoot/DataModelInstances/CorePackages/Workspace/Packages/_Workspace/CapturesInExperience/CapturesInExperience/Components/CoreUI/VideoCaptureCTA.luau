local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local coreGuiService = game:GetService("CoreGui")
local localizationModule = require(parent_1.Localization)
local reactModule = require(parent_1.React)
local UIBloxModule = require(parent_1.UIBlox)
local useAnalyticsModule = require(parent.Analytics.useAnalytics)
local useLocalization = localizationModule.Hooks.useLocalization
local useStyle = UIBloxModule.Core.Style.useStyle
local button = UIBloxModule.App.Button.Button
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local eventNamesModule = require(parent.Analytics.EventNames)
local capturesAddLegacyVideoRecordingLoggingV2 = game:DefineFastFlag("CapturesAddLegacyVideoRecordingLogging_v2", false)

return function(p0) --[[ line: 32 ]]
	-- upvalues: useAnalyticsModule (ref), useStyle (ref), useLocalization (ref), reactModule (ref), capturesAddLegacyVideoRecordingLoggingV2 (ref), eventNamesModule (ref), coreGuiService (ref), button (ref), buttonType (ref)
	local var7 = useAnalyticsModule()
	local var8 = useStyle()
	local var9 = useLocalization({
		videoCTATitle = "Feature.Captures.Title.VideoCTA",
		videoEducationalText = "Feature.Captures.Label.VideoEducationalText",
		startRecording = "Feature.Captures.Control.StartRecordingVideo",
		stopRecording = "Feature.Captures.Control.StopRecordingVideo"
	})
	local var10, var11 = reactModule.useState(false)
	local var12 = reactModule.useRef(nil)
	reactModule.useEffect(function() --[[ line: 46 ]]
		-- upvalues: capturesAddLegacyVideoRecordingLoggingV2 (copy), var12 (ref), var7 (ref), eventNamesModule (copy), var11 (ref)
		local videoRecordingChangeRequestConnection = nil
		local var14 = settings():FindFirstChild("Game Options")
		
		if var14 then
			videoRecordingChangeRequestConnection = var14.VideoRecordingChangeRequest:connect(function(p1) --[[ line: 50 ]]
				-- upvalues: capturesAddLegacyVideoRecordingLoggingV2 (copy), var12 (copy), var7 (copy), eventNamesModule (copy), var11 (copy)
				if capturesAddLegacyVideoRecordingLoggingV2 then
					if p1 then
						var12.current = os.clock()
						var7.fireEvent(eventNamesModule.CapturesLegacyVideoRecordBeginSignalFired)
					elseif var12.current then
						var7.fireEvent(eventNamesModule.CapturesLegacyVideoRecordingDuration, { statValue = os.clock() - var12.current })
					end
					var7.fireEvent(eventNamesModule.CapturesLegacyVideoRecordEndSignalFired)
				end
				var11(p1)
			end)
		end
		return function() --[[ line: 70 ]]
			-- upvalues: videoRecordingChangeRequestConnection (write)
			if videoRecordingChangeRequestConnection then
				videoRecordingChangeRequestConnection:disconnect()
			end
		end
	end, { var7.fireEvent })
	
	return reactModule.createElement("Frame", {
		BorderSizePixel = 0,
		LayoutOrder = 3,
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundColor3 = var8.Theme.BackgroundDefault.Color,
		BackgroundTransparency = var8.Theme.BackgroundDefault.Transparency,
		Size = UDim2.fromScale(1, 0)
	}, {
		TextFrame = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.fromScale(0.7, 0)
		}, {
			Layout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder,
				VerticalAlignment = Enum.VerticalAlignment.Top
			}),
			Title = reactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				Font = var8.Font.Header2.Font,
				Size = UDim2.new(1, 0, 0, 30),
				Text = var9.videoCTATitle,
				TextColor3 = var8.Theme.TextEmphasis.Color,
				TextSize = var8.Font.BaseSize * var8.Font.Header2.RelativeSize,
				TextXAlignment = Enum.TextXAlignment.Left
			}),
			EducationalLabel = reactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				LayoutOrder = 2,
				TextWrapped = true,
				Font = var8.Font.CaptionBody.Font,
				Size = UDim2.new(1, 0, 0, 40),
				Text = var9.videoEducationalText,
				TextColor3 = var8.Theme.TextDefault.Color,
				TextSize = var8.Font.BaseSize * var8.Font.CaptionBody.RelativeSize,
				TextXAlignment = Enum.TextXAlignment.Left
			})
		}),
		CapturesToggleFrame = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			AnchorPoint = Vector2.new(1, 0.5),
			Position = UDim2.fromScale(1, 0.5),
			Size = UDim2.fromOffset(224, 44)
		}, {
			RecordButton = reactModule.createElement(button, {
				buttonType = buttonType.Secondary,
				onActivated = reactModule.useCallback(function() --[[ line: 77 ]]
					-- upvalues: var10 (ref), p0 (ref), var7 (ref), eventNamesModule (copy), coreGuiService (copy)
					if var10 then
						var7.fireEvent(eventNamesModule.CapturesMigratedLegacyVideoRecordDeactivated)
					else
						p0.closeSettingsMenu()
						var7.fireEvent(eventNamesModule.CapturesMigratedLegacyVideoRecordActivated)
					end
					coreGuiService:ToggleRecording()
				end, { var7.fireEvent, var10, p0.closeSettingsMenu }),
				size = UDim2.fromScale(1, 1),
				text = if var10 then var9.stopRecording else var9.startRecording
			})
		})
	})
end