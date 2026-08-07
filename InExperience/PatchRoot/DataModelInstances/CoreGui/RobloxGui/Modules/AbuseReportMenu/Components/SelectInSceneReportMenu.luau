local corePackagesService = game:GetService("CorePackages")
local reactModule = require(corePackagesService.Packages.React)
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local styledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local button = UIBloxModule.App.Button.Button
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local standardButtonSize = UIBloxModule.App.Button.Enum.StandardButtonSize
local useStyle = UIBloxModule.Core.Style.useStyle
local robloxTranslatorModule = require(corePackagesService.Workspace.Packages.RobloxTranslator)
local cryoModule = require(corePackagesService.Packages.Cryo)
local highlightModeVariants = require(corePackagesService.Workspace.Packages.InGameAssetReporting).HighlightModeVariants
local var5 = if require(corePackagesService.Workspace.Packages.SharedFlags).FFlagHighlightModePreciseSelectionEnabled then require(corePackagesService.Workspace.Packages.InExperienceLocales).Localization.new(game:GetService("LocalizationService").RobloxLocaleId) else nil

local var6 = function(p0, p1) --[[ line: 30 ]]
	-- upvalues: robloxTranslatorModule (ref), highlightModeVariants (ref), var5 (write), cryoModule (ref), reactModule (ref), styledTextLabel (ref)
	local t = {
		Layout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, 30)
		})
	}
	
	for i, v in ipairs(cryoModule.List.map(if p0 ~= highlightModeVariants.Default then {
		var5:Format("Feature.ReportAbuse.Label.SelectInSceneDescriptionPrecise1"),
		robloxTranslatorModule:FormatByKey("Feature.ReportAbuse.Label.SelectInSceneDescription2"),
		robloxTranslatorModule:FormatByKey("Feature.ReportAbuse.Label.SelectInSceneDescription3")
	} else {
		robloxTranslatorModule:FormatByKey("Feature.ReportAbuse.Label.SelectInSceneDescription1"),
		robloxTranslatorModule:FormatByKey("Feature.ReportAbuse.Label.SelectInSceneDescription2"),
		robloxTranslatorModule:FormatByKey("Feature.ReportAbuse.Label.SelectInSceneDescription3")
	}, function(p2, p3) --[[ line: 45 ]]
		-- upvalues: reactModule (copy), styledTextLabel (copy), p1 (ref)
		return reactModule.createElement(styledTextLabel, {
			text = "\226\128\162 " .. p2,
			fontStyle = p1.Font.Body,
			colorStyle = p1.Theme.TextEmphasis,
			layoutOrder = p3,
			automaticSize = Enum.AutomaticSize.XY
		})
	end)) do
		t["Subheading" .. i] = v
	end
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = 1,
		AutomaticSize = Enum.AutomaticSize.XY,
		Position = UDim2.new(0.5, 0, 0, 0),
		AnchorPoint = Vector2.new(0.5, 0)
	}, t)
end

return function(p4) --[[ line: 73 | named "SelectInSceneReportMenu" ]]
	-- upvalues: useStyle (ref), reactModule (ref), styledTextLabel (ref), robloxTranslatorModule (ref), var6 (ref), button (ref), buttonType (ref), standardButtonSize (ref)
	local var8 = useStyle()
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.new(1, 0, 0, 0)
	}, {
		Layout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			Padding = UDim.new(0, 30)
		}),
		Padding = reactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, 15) }),
		Title = reactModule.createElement(styledTextLabel, {
			layoutOrder = 0,
			text = robloxTranslatorModule:FormatByKey("Feature.ReportAbuse.Heading.ReportUsingSelectInScene"),
			fontStyle = var8.Font.Header1,
			colorStyle = var8.Theme.TextEmphasis,
			automaticSize = Enum.AutomaticSize.XY
		}),
		SubheadingFrame = if p4.variant then var6(p4.variant, var8) else reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			AutomaticSize = Enum.AutomaticSize.XY,
			Position = UDim2.new(0.5, 0, 0, 0),
			AnchorPoint = Vector2.new(0.5, 0)
		}, {
			Layout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, 30)
			}),
			Subheading1 = reactModule.createElement(styledTextLabel, {
				layoutOrder = 0,
				text = "\226\128\162 " .. robloxTranslatorModule:FormatByKey("Feature.ReportAbuse.Label.SelectInSceneDescription1"),
				fontStyle = var8.Font.Body,
				colorStyle = var8.Theme.TextEmphasis,
				automaticSize = Enum.AutomaticSize.XY
			}),
			Subheading2 = reactModule.createElement(styledTextLabel, {
				layoutOrder = 1,
				text = "\226\128\162 " .. robloxTranslatorModule:FormatByKey("Feature.ReportAbuse.Label.SelectInSceneDescription2"),
				fontStyle = var8.Font.Body,
				colorStyle = var8.Theme.TextEmphasis,
				automaticSize = Enum.AutomaticSize.XY
			}),
			Subheading3 = reactModule.createElement(styledTextLabel, {
				layoutOrder = 2,
				text = "\226\128\162 " .. robloxTranslatorModule:FormatByKey("Feature.ReportAbuse.Label.SelectInSceneDescription3"),
				fontStyle = var8.Font.Body,
				colorStyle = var8.Theme.TextEmphasis,
				automaticSize = Enum.AutomaticSize.XY
			})
		}),
		EnterSelectInSceneButton = reactModule.createElement(button, {
			layoutOrder = 2,
			fitContent = true,
			text = robloxTranslatorModule:FormatByKey("Feature.ReportAbuse.Action.EnterSceneReporting"),
			buttonType = buttonType.PrimarySystem,
			standardSize = standardButtonSize.Small,
			position = UDim2.new(0.5, 0, 0, 0),
			anchorPoint = Vector2.new(0.5, 0),
			onActivated = function() --[[ line: 144 ]]
				-- upvalues: p4 (ref)
				local safetyService = game:GetService("SafetyService")
				local experienceStateCaptureService = game:GetService("ExperienceStateCaptureService")
				
				if game:GetEngineFeature("ExperienceStateCaptureIsInBackground") then
					local var11 = nil
					var11 = experienceStateCaptureService:GetPropertyChangedSignal("IsInBackground"):Connect(function() --[[ line: 151 ]]
						-- upvalues: var11 (write), experienceStateCaptureService (ref), p4 (copy)
						if not var11.Connected then return end
						if not experienceStateCaptureService.IsInBackground then
							p4.hideReportTab()
							var11:Disconnect()
						end
					end)
				end
				safetyService.IsCaptureModeForReport = true
				experienceStateCaptureService:ToggleCaptureMode()
			end
		})
	})
end