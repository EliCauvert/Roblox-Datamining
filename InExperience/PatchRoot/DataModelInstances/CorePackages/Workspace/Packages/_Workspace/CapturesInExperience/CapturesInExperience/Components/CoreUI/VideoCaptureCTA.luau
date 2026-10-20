local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local CoreGui = game:GetService("CoreGui")
local ReactModule = require(Parent1.React)
local UIBloxModule = require(Parent1.UIBlox)
local FoundationModule = require(Parent1.Foundation)
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local UseAnalyticsModule = require(Parent.Analytics.useAnalytics)
local UseLocalizationFunction = require(Parent1.Localization).Hooks.useLocalization
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local Button = UIBloxModule.App.Button.Button
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local EventNamesModule = require(Parent.Analytics.EventNames)

return function(p1)
	-- upvalues: UseAnalyticsModule (copy), UseStyleFunction (copy), UseLocalizationFunction (copy), ReactModule (copy), EventNamesModule (copy), CoreGui (copy), FoundationFontFaceMigration (copy), NormalizeFontFaceFunction (copy), Button (copy), ButtonType (copy)
	local UseAnalyticsModuleResult = UseAnalyticsModule()
	local UseStyleResult = UseStyleFunction()
	local UseLocalizationResult = UseLocalizationFunction({
		videoCTATitle = "Feature.Captures.Title.VideoCTA",
		videoEducationalText = "Feature.Captures.Label.VideoEducationalText",
		startRecording = "Feature.Captures.Control.StartRecordingVideo",
		stopRecording = "Feature.Captures.Control.StopRecordingVideo"
	})
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult2 (copy)
		local VideoRecordingChangeRequestConnection = nil
		local GameOptions = settings():FindFirstChild("Game Options")
		
		if GameOptions then
			VideoRecordingChangeRequestConnection = GameOptions.VideoRecordingChangeRequest:connect(function(Recording)
				-- upvalues: UseStateResult2 (upval)
				UseStateResult2(Recording)
			end)
		end
		return function()
			-- upvalues: VideoRecordingChangeRequestConnection (ref)
			if VideoRecordingChangeRequestConnection then
				VideoRecordingChangeRequestConnection:disconnect()
			end
		end
	end, { UseAnalyticsModuleResult.fireEvent })
	local CaptionBodyFont = UseStyleResult.Font.CaptionBody.Font
	local HeaderFont = UseStyleResult.Font.Header2.Font
	
	return ReactModule.createElement("Frame", {
		BorderSizePixel = 0,
		LayoutOrder = 3,
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundColor3 = UseStyleResult.Theme.BackgroundDefault.Color,
		BackgroundTransparency = UseStyleResult.Theme.BackgroundDefault.Transparency,
		Size = UDim2.fromScale(1, 0)
	}, {
		TextFrame = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.fromScale(0.7, 0)
		}, {
			Layout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder,
				VerticalAlignment = Enum.VerticalAlignment.Top
			}),
			Title = ReactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				Font = if FoundationFontFaceMigration then nil else HeaderFont,
				FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(UseStyleResult.Tokens.Typography.TitleLarge.Font) else nil,
				Size = UDim2.new(1, 0, 0, 30),
				Text = UseLocalizationResult.videoCTATitle,
				TextColor3 = UseStyleResult.Theme.TextEmphasis.Color,
				TextSize = UseStyleResult.Font.BaseSize * UseStyleResult.Font.Header2.RelativeSize,
				TextXAlignment = Enum.TextXAlignment.Left
			}),
			EducationalLabel = ReactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				LayoutOrder = 2,
				TextWrapped = true,
				Font = if FoundationFontFaceMigration then nil else CaptionBodyFont,
				FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(UseStyleResult.Tokens.Typography.BodySmall.Font) else nil,
				Size = UDim2.new(1, 0, 0, 40),
				Text = UseLocalizationResult.videoEducationalText,
				TextColor3 = UseStyleResult.Theme.TextDefault.Color,
				TextSize = UseStyleResult.Font.BaseSize * UseStyleResult.Font.CaptionBody.RelativeSize,
				TextXAlignment = Enum.TextXAlignment.Left
			})
		}),
		CapturesToggleFrame = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			AnchorPoint = Vector2.new(1, 0.5),
			Position = UDim2.fromScale(1, 0.5),
			Size = UDim2.fromOffset(224, 44)
		}, {
			RecordButton = ReactModule.createElement(Button, {
				buttonType = ButtonType.Secondary,
				onActivated = ReactModule.useCallback(function()
					-- upvalues: UseStateResult (copy), p1 (copy), UseAnalyticsModuleResult (copy), EventNamesModule (upval), CoreGui (upval)
					if UseStateResult then
						UseAnalyticsModuleResult.fireEvent(EventNamesModule.CapturesMigratedLegacyVideoRecordDeactivated)
					else
						p1.closeSettingsMenu()
						UseAnalyticsModuleResult.fireEvent(EventNamesModule.CapturesMigratedLegacyVideoRecordActivated)
					end
					CoreGui:ToggleRecording()
				end, {
					UseAnalyticsModuleResult.fireEvent,
					UseStateResult,
					p1.closeSettingsMenu
				}),
				size = UDim2.fromScale(1, 1),
				text = if UseStateResult then UseLocalizationResult.stopRecording else UseLocalizationResult.startRecording
			})
		})
	})
end