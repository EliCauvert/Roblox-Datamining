local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local coreGuiService = game:GetService("CoreGui")
local localizationModule = require(parent_1.Localization)
local reactModule = require(parent_1.React)
local UIBloxModule = require(parent_1.UIBlox)
local foundationModule = require(parent_1.Foundation)
local normalizeFontFace = foundationModule.Utility.normalizeFontFace
local foundationFontFaceMigration = foundationModule.Utility.Flags.FoundationFontFaceMigration
local useAnalyticsModule = require(parent.Analytics.useAnalytics)
local useLocalization = localizationModule.Hooks.useLocalization
local useStyle = UIBloxModule.Core.Style.useStyle
local button = UIBloxModule.App.Button.Button
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local eventNamesModule = require(parent.Analytics.EventNames)

return function(p1)
	-- upvalues: useAnalyticsModule (ref), useStyle (ref), useLocalization (ref), reactModule (ref), eventNamesModule (ref), coreGuiService (ref), foundationFontFaceMigration (ref), normalizeFontFace (ref), button (ref), buttonType (ref)
	local var1 = useAnalyticsModule()
	local var2 = useStyle()
	local var3 = useLocalization({
		videoCTATitle = "Feature.Captures.Title.VideoCTA",
		videoEducationalText = "Feature.Captures.Label.VideoEducationalText",
		startRecording = "Feature.Captures.Control.StartRecordingVideo",
		stopRecording = "Feature.Captures.Control.StopRecordingVideo"
	})
	local var4, var5 = reactModule.useState(false)
	reactModule.useEffect(function()
		-- upvalues: var5 (ref)
		local videoRecordingChangeRequestConnection = nil
		local var6 = settings():FindFirstChild("Game Options")
		
		if var6 then
			videoRecordingChangeRequestConnection = var6.VideoRecordingChangeRequest:connect(function(p2)
				-- upvalues: var5 (copy)
				var5(p2)
			end)
		end
		return function()
			-- upvalues: videoRecordingChangeRequestConnection (write)
			if videoRecordingChangeRequestConnection then
				videoRecordingChangeRequestConnection:disconnect()
			end
		end
	end, { var1.fireEvent })
	
	return reactModule.createElement("Frame", {
		BorderSizePixel = 0,
		LayoutOrder = 3,
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundColor3 = var2.Theme.BackgroundDefault.Color,
		BackgroundTransparency = var2.Theme.BackgroundDefault.Transparency,
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
				Font = if foundationFontFaceMigration then nil else var2.Font.Header2.Font,
				FontFace = if foundationFontFaceMigration then normalizeFontFace(var2.Tokens.Typography.TitleLarge.Font) else nil,
				Size = UDim2.new(1, 0, 0, 30),
				Text = var3.videoCTATitle,
				TextColor3 = var2.Theme.TextEmphasis.Color,
				TextSize = var2.Font.BaseSize * var2.Font.Header2.RelativeSize,
				TextXAlignment = Enum.TextXAlignment.Left
			}),
			EducationalLabel = reactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				LayoutOrder = 2,
				TextWrapped = true,
				Font = if foundationFontFaceMigration then nil else var2.Font.CaptionBody.Font,
				FontFace = if foundationFontFaceMigration then normalizeFontFace(var2.Tokens.Typography.BodySmall.Font) else nil,
				Size = UDim2.new(1, 0, 0, 40),
				Text = var3.videoEducationalText,
				TextColor3 = var2.Theme.TextDefault.Color,
				TextSize = var2.Font.BaseSize * var2.Font.CaptionBody.RelativeSize,
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
				onActivated = reactModule.useCallback(function()
					-- upvalues: var4 (ref), p1 (ref), var1 (ref), eventNamesModule (copy), coreGuiService (copy)
					if var4 then
						var1.fireEvent(eventNamesModule.CapturesMigratedLegacyVideoRecordDeactivated)
					else
						p1.closeSettingsMenu()
						var1.fireEvent(eventNamesModule.CapturesMigratedLegacyVideoRecordActivated)
					end
					coreGuiService:ToggleRecording()
				end, { var1.fireEvent, var4, p1.closeSettingsMenu }),
				size = UDim2.fromScale(1, 1),
				text = if var4 then var3.stopRecording else var3.startRecording
			})
		})
	})
end