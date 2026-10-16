local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local StyledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local Button = UIBloxModule.App.Button.Button
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local StandardButtonSize = UIBloxModule.App.Button.Enum.StandardButtonSize
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local RobloxTranslatorModule = require(CorePackages.Workspace.Packages.RobloxTranslator)
local CryoModule = require(CorePackages.Packages.Cryo)
local HighlightModeVariants = require(CorePackages.Workspace.Packages.InGameAssetReporting).HighlightModeVariants
local NewResult = if require(CorePackages.Workspace.Packages.SharedFlags).FFlagHighlightModePreciseSelectionEnabled then require(CorePackages.Workspace.Packages.InExperienceLocales).Localization.new(game:GetService("LocalizationService").RobloxLocaleId) else nil

local function v11(Variant, p1) --[[ Line: 30 ]]
	-- upvalues: RobloxTranslatorModule (copy), HighlightModeVariants (copy), NewResult (ref), CryoModule (copy), ReactModule (copy), StyledTextLabel (copy)
	local config = {
		Layout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, 30)
		})
	}
	
	for i, value in ipairs((CryoModule.List.map(if Variant == HighlightModeVariants.Default then {
		RobloxTranslatorModule:FormatByKey("Feature.ReportAbuse.Label.SelectInSceneDescription1"),
		RobloxTranslatorModule:FormatByKey("Feature.ReportAbuse.Label.SelectInSceneDescription2"),
		RobloxTranslatorModule:FormatByKey("Feature.ReportAbuse.Label.SelectInSceneDescription3")
	} else {
		NewResult:Format("Feature.ReportAbuse.Label.SelectInSceneDescriptionPrecise1"),
		RobloxTranslatorModule:FormatByKey("Feature.ReportAbuse.Label.SelectInSceneDescription2"),
		RobloxTranslatorModule:FormatByKey("Feature.ReportAbuse.Label.SelectInSceneDescription3")
	}, function(Text, LayoutOrder) --[[ Line: 45 ]]
		-- upvalues: ReactModule (upval), StyledTextLabel (upval), p1 (copy)
		return ReactModule.createElement(StyledTextLabel, {
			text = "• " .. Text,
			fontStyle = p1.Font.Body,
			colorStyle = p1.Theme.TextEmphasis,
			layoutOrder = LayoutOrder,
			automaticSize = Enum.AutomaticSize.XY
		})
	end))) do
		config["Subheading" .. i] = value
	end
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = 1,
		AutomaticSize = Enum.AutomaticSize.XY,
		Position = UDim2.new(0.5, 0, 0, 0),
		AnchorPoint = Vector2.new(0.5, 0)
	}, config)
end

return function(p2) --[[ Line: 73 | Named "SelectInSceneReportMenu" ]]
	-- upvalues: UseStyleFunction (copy), ReactModule (copy), StyledTextLabel (copy), RobloxTranslatorModule (copy), v11 (copy), Button (copy), ButtonType (copy), StandardButtonSize (copy)
	local UseStyleResult = UseStyleFunction()
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.new(1, 0, 0, 0)
	}, {
		Layout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			Padding = UDim.new(0, 30)
		}),
		Padding = ReactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, 15) }),
		Title = ReactModule.createElement(StyledTextLabel, {
			layoutOrder = 0,
			text = RobloxTranslatorModule:FormatByKey("Feature.ReportAbuse.Heading.ReportUsingSelectInScene"),
			fontStyle = UseStyleResult.Font.Header1,
			colorStyle = UseStyleResult.Theme.TextEmphasis,
			automaticSize = Enum.AutomaticSize.XY
		}),
		SubheadingFrame = if p2.variant then v11(p2.variant, UseStyleResult) else ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			AutomaticSize = Enum.AutomaticSize.XY,
			Position = UDim2.new(0.5, 0, 0, 0),
			AnchorPoint = Vector2.new(0.5, 0)
		}, {
			Layout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, 30)
			}),
			Subheading1 = ReactModule.createElement(StyledTextLabel, {
				layoutOrder = 0,
				text = "• " .. RobloxTranslatorModule:FormatByKey("Feature.ReportAbuse.Label.SelectInSceneDescription1"),
				fontStyle = UseStyleResult.Font.Body,
				colorStyle = UseStyleResult.Theme.TextEmphasis,
				automaticSize = Enum.AutomaticSize.XY
			}),
			Subheading2 = ReactModule.createElement(StyledTextLabel, {
				layoutOrder = 1,
				text = "• " .. RobloxTranslatorModule:FormatByKey("Feature.ReportAbuse.Label.SelectInSceneDescription2"),
				fontStyle = UseStyleResult.Font.Body,
				colorStyle = UseStyleResult.Theme.TextEmphasis,
				automaticSize = Enum.AutomaticSize.XY
			}),
			Subheading3 = ReactModule.createElement(StyledTextLabel, {
				layoutOrder = 2,
				text = "• " .. RobloxTranslatorModule:FormatByKey("Feature.ReportAbuse.Label.SelectInSceneDescription3"),
				fontStyle = UseStyleResult.Font.Body,
				colorStyle = UseStyleResult.Theme.TextEmphasis,
				automaticSize = Enum.AutomaticSize.XY
			})
		}),
		EnterSelectInSceneButton = ReactModule.createElement(Button, {
			layoutOrder = 2,
			fitContent = true,
			text = RobloxTranslatorModule:FormatByKey("Feature.ReportAbuse.Action.EnterSceneReporting"),
			buttonType = ButtonType.PrimarySystem,
			standardSize = StandardButtonSize.Small,
			position = UDim2.new(0.5, 0, 0, 0),
			anchorPoint = Vector2.new(0.5, 0),
			onActivated = function() --[[ Line: 144 ]]
				-- upvalues: p2 (copy)
				local SafetyService = game:GetService("SafetyService")
				local ExperienceStateCaptureService = game:GetService("ExperienceStateCaptureService")
				
				if game:GetEngineFeature("ExperienceStateCaptureIsInBackground") then
					local Connection = nil
					Connection = ExperienceStateCaptureService:GetPropertyChangedSignal("IsInBackground"):Connect(function() --[[ Line: 151 ]]
						-- upvalues: Connection (ref), ExperienceStateCaptureService (copy), p2 (upval)
						if not Connection.Connected then return end
						if not ExperienceStateCaptureService.IsInBackground then
							p2.hideReportTab()
							Connection:Disconnect()
						end
					end)
				end
				SafetyService.IsCaptureModeForReport = true
				ExperienceStateCaptureService:ToggleCaptureMode()
			end
		})
	})
end