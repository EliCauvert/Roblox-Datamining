local Parent = script.Parent.Parent
local RoactModule = require(Parent.Roact)
local UIBloxModule = require(Parent.UIBlox)
local Images = UIBloxModule.App.ImageSet.Images
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local Interactable = UIBloxModule.Core.Control.Interactable
local RobloxTranslatorModule = require(Parent.RobloxTranslator)
local CoreScriptsAdsLabelWhyThisAd = RobloxTranslatorModule:FormatByKey("CoreScripts.Ads.Label.WhyThisAd")
local CoreScriptsAdsLabelReportAd = RobloxTranslatorModule:FormatByKey("CoreScripts.Ads.Label.ReportAd")
local IconsActionsInfo = Images["icons/actions/info"]
local IconsActionsFeedback = Images["icons/actions/feedback"]
local AdGuiInteractivityPixelsPerStudRatio = require(script.Parent.Flags).GetAdGuiInteractivityPixelsPerStud() / 50

local function _(p1): UDim
	-- upvalues: AdGuiInteractivityPixelsPerStudRatio (copy)
	return UDim.new(p1.Scale, p1.Offset * AdGuiInteractivityPixelsPerStudRatio)
end

local _ = function(Vector): UDim2
	-- upvalues: AdGuiInteractivityPixelsPerStudRatio (copy)
	return UDim2.new(Vector.X.Scale, Vector.X.Offset * AdGuiInteractivityPixelsPerStudRatio, Vector.Y.Scale, Vector.Y.Offset * AdGuiInteractivityPixelsPerStudRatio)
end

local _ = function(p1)
	-- upvalues: AdGuiInteractivityPixelsPerStudRatio (copy)
	return p1 * AdGuiInteractivityPixelsPerStudRatio
end

local function WhyThisAdRow(Frame)
	-- upvalues: RoactModule (copy), Interactable (copy), AdGuiInteractivityPixelsPerStudRatio (copy), ImageSetLabel (copy), IconsActionsInfo (copy), CoreScriptsAdsLabelWhyThisAd (copy)
	local _UDim = UDim.new(0, 10)
	local config = {
		CornerRadius = UDim.new(_UDim.Scale, _UDim.Offset * AdGuiInteractivityPixelsPerStudRatio)
	}
	local _UDim1 = UDim.new(0, 16)
	local _UDim11 = UDim.new(_UDim1.Scale, _UDim1.Offset * AdGuiInteractivityPixelsPerStudRatio)
	local _UDim2 = UDim.new(0, 8)
	local _UDim21 = UDim.new(_UDim2.Scale, _UDim2.Offset * AdGuiInteractivityPixelsPerStudRatio)
	local _UDim3 = UDim.new(0, 16)
	local _UDim31 = UDim.new(_UDim3.Scale, _UDim3.Offset * AdGuiInteractivityPixelsPerStudRatio)
	local _UDim4 = UDim.new(0, 48)
	local config1 = {
		PaddingTop = _UDim11,
		PaddingBottom = _UDim21,
		PaddingLeft = _UDim31,
		PaddingRight = UDim.new(_UDim4.Scale, _UDim4.Offset * AdGuiInteractivityPixelsPerStudRatio)
	}
	local _UDim5 = UDim.new(0, 16)
	local config2 = {
		FillDirection = Enum.FillDirection.Horizontal,
		HorizontalAlignment = Enum.HorizontalAlignment.Left,
		VerticalAlignment = Enum.VerticalAlignment.Center,
		Padding = UDim.new(_UDim5.Scale, _UDim5.Offset * AdGuiInteractivityPixelsPerStudRatio)
	}
	local _UDim22 = UDim2.fromOffset(24, 24)
	
	return RoactModule.createElement(Interactable, {
		AutomaticSize = Enum.AutomaticSize.XY,
		BackgroundTransparency = 1,
		[RoactModule.Event.Activated] = Frame.onWhyThisAdActivated,
		onStateChanged = function() end
	}, {
		UICorner = RoactModule.createElement("UICorner", config),
		UIPadding = RoactModule.createElement("UIPadding", config1),
		UIListLayout = RoactModule.createElement("UIListLayout", config2),
		Icon = RoactModule.createElement(ImageSetLabel, {
			BackgroundTransparency = 1,
			Image = IconsActionsInfo,
			Size = UDim2.new(_UDim22.X.Scale, _UDim22.X.Offset * AdGuiInteractivityPixelsPerStudRatio, _UDim22.Y.Scale, _UDim22.Y.Offset * AdGuiInteractivityPixelsPerStudRatio)
		}),
		TextLabel = RoactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			TextScaled = false,
			TextWrapped = true,
			Text = CoreScriptsAdsLabelWhyThisAd,
			TextColor3 = Color3.new(1, 1, 1),
			Font = Enum.Font.GothamMedium,
			TextSize = 24 * AdGuiInteractivityPixelsPerStudRatio,
			AutomaticSize = Enum.AutomaticSize.XY
		})
	})
end

local function ReportAdRow(Frame)
	-- upvalues: RoactModule (copy), Interactable (copy), AdGuiInteractivityPixelsPerStudRatio (copy), ImageSetLabel (copy), IconsActionsFeedback (copy), CoreScriptsAdsLabelReportAd (copy)
	local _UDim = UDim.new(0, 10)
	local config = {
		CornerRadius = UDim.new(_UDim.Scale, _UDim.Offset * AdGuiInteractivityPixelsPerStudRatio)
	}
	local _UDim1 = UDim.new(0, 8)
	local _UDim11 = UDim.new(_UDim1.Scale, _UDim1.Offset * AdGuiInteractivityPixelsPerStudRatio)
	local _UDim2 = UDim.new(0, 16)
	local _UDim21 = UDim.new(_UDim2.Scale, _UDim2.Offset * AdGuiInteractivityPixelsPerStudRatio)
	local _UDim3 = UDim.new(0, 16)
	local _UDim31 = UDim.new(_UDim3.Scale, _UDim3.Offset * AdGuiInteractivityPixelsPerStudRatio)
	local _UDim4 = UDim.new(0, 48)
	local config1 = {
		PaddingTop = _UDim11,
		PaddingBottom = _UDim21,
		PaddingLeft = _UDim31,
		PaddingRight = UDim.new(_UDim4.Scale, _UDim4.Offset * AdGuiInteractivityPixelsPerStudRatio)
	}
	local _UDim5 = UDim.new(0, 16)
	local config2 = {
		FillDirection = Enum.FillDirection.Horizontal,
		HorizontalAlignment = Enum.HorizontalAlignment.Left,
		VerticalAlignment = Enum.VerticalAlignment.Center,
		Padding = UDim.new(_UDim5.Scale, _UDim5.Offset * AdGuiInteractivityPixelsPerStudRatio)
	}
	local _UDim22 = UDim2.fromOffset(24, 24)
	
	return RoactModule.createElement(Interactable, {
		AutomaticSize = Enum.AutomaticSize.XY,
		BackgroundTransparency = 1,
		[RoactModule.Event.Activated] = Frame.onReportAdActivated,
		onStateChanged = function() end
	}, {
		UICorner = RoactModule.createElement("UICorner", config),
		UIPadding = RoactModule.createElement("UIPadding", config1),
		UIListLayout = RoactModule.createElement("UIListLayout", config2),
		Icon = RoactModule.createElement(ImageSetLabel, {
			BackgroundTransparency = 1,
			Image = IconsActionsFeedback,
			Size = UDim2.new(_UDim22.X.Scale, _UDim22.X.Offset * AdGuiInteractivityPixelsPerStudRatio, _UDim22.Y.Scale, _UDim22.Y.Offset * AdGuiInteractivityPixelsPerStudRatio)
		}),
		TextLabel = RoactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			TextScaled = false,
			TextWrapped = true,
			Text = CoreScriptsAdsLabelReportAd,
			TextColor3 = Color3.new(1, 1, 1),
			Font = Enum.Font.GothamMedium,
			TextSize = 24 * AdGuiInteractivityPixelsPerStudRatio,
			AutomaticSize = Enum.AutomaticSize.XY
		})
	})
end

function AdDropdownMenu(Frame)
	-- upvalues: RoactModule (copy), AdGuiInteractivityPixelsPerStudRatio (copy), WhyThisAdRow (copy), ReportAdRow (copy)
	local _UDim2 = UDim2.new(0.24, 0, 0.12, 0)
	local _UDim = UDim.new(0, 10)
	
	return RoactModule.createElement("Frame", {
		Visible = Frame.showDropDownMenu,
		Position = Frame.Position or UDim2.new(0.5, 0, 0.5, 0),
		BackgroundColor3 = Color3.new(0, 0, 0),
		BackgroundTransparency = Frame.transparency,
		AnchorPoint = Frame.AnchorPoint or Vector2.new(0.5, 0.5),
		Size = UDim2.new(_UDim2.X.Scale, _UDim2.X.Offset * AdGuiInteractivityPixelsPerStudRatio, _UDim2.Y.Scale, _UDim2.Y.Offset * AdGuiInteractivityPixelsPerStudRatio),
		AutomaticSize = Enum.AutomaticSize.XY
	}, {
		UICorner = RoactModule.createElement("UICorner", {
			CornerRadius = UDim.new(_UDim.Scale, _UDim.Offset * AdGuiInteractivityPixelsPerStudRatio)
		}),
		UIListLayout = RoactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Center
		}),
		WhyThisAdRow(Frame),
		ReportAdRow(Frame)
	})
end

return AdDropdownMenu