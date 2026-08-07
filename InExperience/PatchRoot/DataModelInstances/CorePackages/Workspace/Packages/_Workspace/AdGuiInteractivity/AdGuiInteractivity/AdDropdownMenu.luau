local parent = script.Parent.Parent
local roactModule = require(parent.Roact)
local UIBloxModule = require(parent.UIBlox)
local images = UIBloxModule.App.ImageSet.Images
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local interactable = UIBloxModule.Core.Control.Interactable
local robloxTranslatorModule = require(parent.RobloxTranslator)
local var3 = robloxTranslatorModule:FormatByKey("CoreScripts.Ads.Label.WhyThisAd")
local var4 = robloxTranslatorModule:FormatByKey("CoreScripts.Ads.Label.ReportAd")
local info = images["icons/actions/info"]
local feedback = images["icons/actions/feedback"]
local var5 = require(script.Parent.Flags).GetAdGuiInteractivityPixelsPerStud() / 50

local function _(p0) --[[ line: 20 | named "applyScalingUDim" ]]
	-- upvalues: var5 (ref)
	return UDim.new(p0.Scale, p0.Offset * var5)
end

local _ = function(p1) --[[ line: 24 | named "applyScalingUDim2" ]]
	-- upvalues: var5 (ref)
	return UDim2.new(p1.X.Scale, p1.X.Offset * var5, p1.Y.Scale, p1.Y.Offset * var5)
end

local _ = function(p2) --[[ line: 28 | named "applyScalingNumber" ]]
	-- upvalues: var5 (ref)
	return p2 * var5
end

local function WhyThisAdRow(p3) --[[ line: 41 ]]
	-- upvalues: roactModule (ref), interactable (ref), var5 (ref), imageSetLabel (ref), info (ref), var3 (ref)
	local createElement = roactModule.createElement
	local t = {
		AutomaticSize = Enum.AutomaticSize.XY,
		BackgroundTransparency = 1,
		[roactModule.Event.Activated] = p3.onWhyThisAdActivated,
		onStateChanged = function() --[[ line: 46 ]] end
	}
	local t_1 = {}
	local createElement_1 = roactModule.createElement
	local var10 = "UICorner"
	local t_2 = {}
	local uDim = UDim.new(0, 10)
	t_2.CornerRadius = UDim.new(uDim.Scale, uDim.Offset * var5)
	t_1.UICorner = createElement_1(var10, t_2)
	local createElement_2 = roactModule.createElement
	local var13 = "UIPadding"
	local t_3 = {}
	local uDim_1 = UDim.new(0, 16)
	t_3.PaddingTop = UDim.new(uDim_1.Scale, uDim_1.Offset * var5)
	local uDim_2 = UDim.new(0, 8)
	t_3.PaddingBottom = UDim.new(uDim_2.Scale, uDim_2.Offset * var5)
	local uDim_3 = UDim.new(0, 16)
	t_3.PaddingLeft = UDim.new(uDim_3.Scale, uDim_3.Offset * var5)
	local uDim_4 = UDim.new(0, 48)
	t_3.PaddingRight = UDim.new(uDim_4.Scale, uDim_4.Offset * var5)
	t_1.UIPadding = createElement_2(var13, t_3)
	local createElement_3 = roactModule.createElement
	local var19 = "UIListLayout"
	local t_4 = {
		FillDirection = Enum.FillDirection.Horizontal,
		HorizontalAlignment = Enum.HorizontalAlignment.Left,
		VerticalAlignment = Enum.VerticalAlignment.Center
	}
	local uDim_5 = UDim.new(0, 16)
	t_4.Padding = UDim.new(uDim_5.Scale, uDim_5.Offset * var5)
	t_1.UIListLayout = createElement_3(var19, t_4)
	local createElement_4 = roactModule.createElement
	local t_5 = { BackgroundTransparency = 1, Image = info }
	local uDim2 = UDim2.fromOffset(24, 24)
	t_5.Size = UDim2.new(uDim2.X.Scale, uDim2.X.Offset * var5, uDim2.Y.Scale, uDim2.Y.Offset * var5)
	t_1.Icon = createElement_4(imageSetLabel, t_5)
	t_1.TextLabel = roactModule.createElement("TextLabel", {
		BackgroundTransparency = 1,
		TextScaled = false,
		TextWrapped = true,
		Text = var3,
		TextColor3 = Color3.new(1, 1, 1),
		Font = Enum.Font.GothamMedium,
		TextSize = 24 * var5,
		AutomaticSize = Enum.AutomaticSize.XY
	})
	
	return createElement(interactable, t, t_1)
end

local function ReportAdRow(p4) --[[ line: 81 ]]
	-- upvalues: roactModule (ref), interactable (ref), var5 (ref), imageSetLabel (ref), feedback (ref), var4 (ref)
	local createElement = roactModule.createElement
	local t = {
		AutomaticSize = Enum.AutomaticSize.XY,
		BackgroundTransparency = 1,
		[roactModule.Event.Activated] = p4.onReportAdActivated,
		onStateChanged = function() --[[ line: 86 ]] end
	}
	local t_1 = {}
	local createElement_1 = roactModule.createElement
	local var26 = "UICorner"
	local t_2 = {}
	local uDim = UDim.new(0, 10)
	t_2.CornerRadius = UDim.new(uDim.Scale, uDim.Offset * var5)
	t_1.UICorner = createElement_1(var26, t_2)
	local createElement_2 = roactModule.createElement
	local var29 = "UIPadding"
	local t_3 = {}
	local uDim_1 = UDim.new(0, 8)
	t_3.PaddingTop = UDim.new(uDim_1.Scale, uDim_1.Offset * var5)
	local uDim_2 = UDim.new(0, 16)
	t_3.PaddingBottom = UDim.new(uDim_2.Scale, uDim_2.Offset * var5)
	local uDim_3 = UDim.new(0, 16)
	t_3.PaddingLeft = UDim.new(uDim_3.Scale, uDim_3.Offset * var5)
	local uDim_4 = UDim.new(0, 48)
	t_3.PaddingRight = UDim.new(uDim_4.Scale, uDim_4.Offset * var5)
	t_1.UIPadding = createElement_2(var29, t_3)
	local createElement_3 = roactModule.createElement
	local var35 = "UIListLayout"
	local t_4 = {
		FillDirection = Enum.FillDirection.Horizontal,
		HorizontalAlignment = Enum.HorizontalAlignment.Left,
		VerticalAlignment = Enum.VerticalAlignment.Center
	}
	local uDim_5 = UDim.new(0, 16)
	t_4.Padding = UDim.new(uDim_5.Scale, uDim_5.Offset * var5)
	t_1.UIListLayout = createElement_3(var35, t_4)
	local createElement_4 = roactModule.createElement
	local t_5 = { BackgroundTransparency = 1, Image = feedback }
	local uDim2 = UDim2.fromOffset(24, 24)
	t_5.Size = UDim2.new(uDim2.X.Scale, uDim2.X.Offset * var5, uDim2.Y.Scale, uDim2.Y.Offset * var5)
	t_1.Icon = createElement_4(imageSetLabel, t_5)
	t_1.TextLabel = roactModule.createElement("TextLabel", {
		BackgroundTransparency = 1,
		TextScaled = false,
		TextWrapped = true,
		Text = var4,
		TextColor3 = Color3.new(1, 1, 1),
		Font = Enum.Font.GothamMedium,
		TextSize = 24 * var5,
		AutomaticSize = Enum.AutomaticSize.XY
	})
	
	return createElement(interactable, t, t_1)
end

function AdDropdownMenu(p5) --[[ line: 121 ]]
	-- upvalues: roactModule (ref), var5 (ref), WhyThisAdRow (ref), ReportAdRow (ref)
	local createElement = roactModule.createElement
	local var40 = "Frame"
	local t = {
		Visible = p5.showDropDownMenu,
		Position = p5.Position or UDim2.new(0.5, 0, 0.5, 0),
		BackgroundColor3 = Color3.new(0, 0, 0),
		BackgroundTransparency = p5.transparency,
		AnchorPoint = p5.AnchorPoint or Vector2.new(0.5, 0.5)
	}
	local uDim2 = UDim2.new(0.24, 0, 0.12, 0)
	t.Size = UDim2.new(uDim2.X.Scale, uDim2.X.Offset * var5, uDim2.Y.Scale, uDim2.Y.Offset * var5)
	t.AutomaticSize = Enum.AutomaticSize.XY
	local t_1 = {}
	local createElement_1 = roactModule.createElement
	local var44 = "UICorner"
	local t_2 = {}
	local uDim = UDim.new(0, 10)
	t_2.CornerRadius = UDim.new(uDim.Scale, uDim.Offset * var5)
	t_1.UICorner = createElement_1(var44, t_2)
	t_1.UIListLayout = roactModule.createElement("UIListLayout", {
		FillDirection = Enum.FillDirection.Vertical,
		HorizontalAlignment = Enum.HorizontalAlignment.Left,
		VerticalAlignment = Enum.VerticalAlignment.Center
	})
	-- Unknown statement at pc 14: <SetList>
	
	return createElement(var40, t, t_1)
end

return AdDropdownMenu