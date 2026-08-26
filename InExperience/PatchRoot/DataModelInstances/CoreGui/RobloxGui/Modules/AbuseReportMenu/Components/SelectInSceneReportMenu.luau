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
local var1 = if require(corePackagesService.Workspace.Packages.SharedFlags).FFlagHighlightModePreciseSelectionEnabled then require(corePackagesService.Workspace.Packages.InExperienceLocales).Localization.new(game:GetService("LocalizationService").RobloxLocaleId) else nil

local var2 = function(p1, p2)
	-- upvalues: robloxTranslatorModule (ref), highlightModeVariants (ref), var1 (write), cryoModule (ref), reactModule (ref), styledTextLabel (ref)
	local t = {
		Layout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, 30)
		})
	}
	
	for i, v in ipairs(cryoModule.List.map(if p1 ~= highlightModeVariants.Default then {
		var1:Format("Feature.ReportAbuse.Label.SelectInSceneDescriptionPrecise1"),
		robloxTranslatorModule:FormatByKey("Feature.ReportAbuse.Label.SelectInSceneDescription2"),
		robloxTranslatorModule:FormatByKey("Feature.ReportAbuse.Label.SelectInSceneDescription3")
	} else {
		robloxTranslatorModule:FormatByKey("Feature.ReportAbuse.Label.SelectInSceneDescription1"),
		robloxTranslatorModule:FormatByKey("Feature.ReportAbuse.Label.SelectInSceneDescription2"),
		robloxTranslatorModule:FormatByKey("Feature.ReportAbuse.Label.SelectInSceneDescription3")
	}, function(p3, p4)
		-- upvalues: reactModule (copy), styledTextLabel (copy), p2 (ref)
		return reactModule.createElement(styledTextLabel, {
			text = "\226\128\162 " .. p2,
			fontStyle = p2.Font.Body,
			colorStyle = p2.Theme.TextEmphasis,
			layoutOrder = p4,
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

return function(p3)
	-- upvalues: useStyle (ref), reactModule (ref), styledTextLabel (ref), robloxTranslatorModule (ref), var2 (ref), button (ref), buttonType (ref), standardButtonSize (ref)
	local var3 = useStyle()
	
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
			fontStyle = var3.Font.Header1,
			colorStyle = var3.Theme.TextEmphasis,
			automaticSize = Enum.AutomaticSize.XY
		}),
		SubheadingFrame = if p3.variant then var2(p3.variant, var3) else reactModule.createElement("Frame", {
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
				fontStyle = var3.Font.Body,
				colorStyle = var3.Theme.TextEmphasis,
				automaticSize = Enum.AutomaticSize.XY
			}),
			Subheading2 = reactModule.createElement(styledTextLabel, {
				layoutOrder = 1,
				text = "\226\128\162 " .. robloxTranslatorModule:FormatByKey("Feature.ReportAbuse.Label.SelectInSceneDescription2"),
				fontStyle = var3.Font.Body,
				colorStyle = var3.Theme.TextEmphasis,
				automaticSize = Enum.AutomaticSize.XY
			}),
			Subheading3 = reactModule.createElement(styledTextLabel, {
				layoutOrder = 2,
				text = "\226\128\162 " .. robloxTranslatorModule:FormatByKey("Feature.ReportAbuse.Label.SelectInSceneDescription3"),
				fontStyle = var3.Font.Body,
				colorStyle = var3.Theme.TextEmphasis,
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
			onActivated = function()
				-- upvalues: p3 (ref)
				local safetyService = game:GetService("SafetyService")
				local experienceStateCaptureService = game:GetService("ExperienceStateCaptureService")
				
				if game:GetEngineFeature("ExperienceStateCaptureIsInBackground") then
					local var4 = nil
					var4 = experienceStateCaptureService:GetPropertyChangedSignal("IsInBackground"):Connect(function()
						-- upvalues: var4 (write), experienceStateCaptureService (ref), p3 (copy)
						if not var4.Connected then return end
						if not experienceStateCaptureService.IsInBackground then
							p3.hideReportTab()
							var4:Disconnect()
						end
					end)
				end
				safetyService.IsCaptureModeForReport = true
				experienceStateCaptureService:ToggleCaptureMode()
			end
		})
	})
end