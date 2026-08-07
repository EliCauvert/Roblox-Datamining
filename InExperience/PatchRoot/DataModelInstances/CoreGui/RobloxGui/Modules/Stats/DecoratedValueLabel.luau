local statsUtilsModule = require(game:GetService("CoreGui").RobloxGui.Modules.Stats.StatsUtils)
local _ = require(game:GetService("CorePackages").Workspace.Packages.RobloxTranslator)
local t = {}
t.__index = t

function t.new(p0, p1) --[[ line: 19 ]]
	-- upvalues: t (ref), statsUtilsModule (ref)
	local label = {}
	setmetatable(label, t)
	label._frame = Instance.new("Frame")
	label._frame.Name = "PS_DecoratedValueLabel"
	label._frame.BackgroundTransparency = 1
	label._valueName = p1
	label._statType = p0
	label._decorationFrame = Instance.new("Frame")
	label._decorationFrame.Name = "PS_Decoration"
	label._decorationFrame.Parent = label._frame
	label._decorationFrame.Position = UDim2.new(0, 0, 0.5, -statsUtilsModule.DecorationSize / 2)
	label._decorationFrame.Size = UDim2.new(0, statsUtilsModule.DecorationSize, 0, statsUtilsModule.DecorationSize)
	label._decorationFrame.BackgroundTransparency = 1
	label._label = Instance.new("TextLabel")
	label._label.Name = "Label"
	label._label.Parent = label._frame
	label._label.Position = UDim2.new(0, statsUtilsModule.DecorationSize + statsUtilsModule.DecorationMargin, 0, 0)
	label._label.Size = UDim2.new(1, -(statsUtilsModule.DecorationSize + statsUtilsModule.DecorationMargin), 1, 0)
	label._label.FontSize = statsUtilsModule.PanelValueFontSize
	label._label.TextXAlignment = Enum.TextXAlignment.Left
	label._label.TextYAlignment = Enum.TextYAlignment.Center
	statsUtilsModule.StyleTextWidget(label._label)
	
	return label
end

function t:SetZIndex(p2) --[[ line: 53 ]]
	self._frame.ZIndex = p2
	self._decorationFrame.ZIndex = p2
	self._label.ZIndex = p2
end

function t:PlaceInParent(p3, p4, p5) --[[ line: 60 ]]
	self._frame.Parent = p3
	self._frame.Size = p4
	self._frame.Position = p5
end

function t:GetDecorationFrame() --[[ line: 67 ]]
	return self._decorationFrame
end

function t:SetValue(p6) --[[ line: 71 ]]
	-- upvalues: statsUtilsModule (ref)
	self._label.Text = string.format("%s: %s", self._valueName, statsUtilsModule.FormatTypedValue(p6, self._statType))
end

return t