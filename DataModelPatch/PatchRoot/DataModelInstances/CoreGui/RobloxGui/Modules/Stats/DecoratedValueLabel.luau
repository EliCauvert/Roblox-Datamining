local StatsUtilsModule = require(game:GetService("CoreGui").RobloxGui.Modules.Stats.StatsUtils)
local _ = require(game:GetService("CorePackages").Workspace.Packages.RobloxTranslator)
local DecoratedValueLabelModule = {}
DecoratedValueLabelModule.__index = DecoratedValueLabelModule

function DecoratedValueLabelModule.new(_statType, _valueName)
	-- upvalues: DecoratedValueLabelModule (copy), StatsUtilsModule (copy)
	local t = {}
	setmetatable(t, DecoratedValueLabelModule)
	t._frame = Instance.new("Frame")
	t._frame.Name = "PS_DecoratedValueLabel"
	t._frame.BackgroundTransparency = 1
	t._valueName = _valueName
	t._statType = _statType
	t._decorationFrame = Instance.new("Frame")
	t._decorationFrame.Name = "PS_Decoration"
	t._decorationFrame.Parent = t._frame
	t._decorationFrame.Position = UDim2.new(0, 0, 0.5, -StatsUtilsModule.DecorationSize / 2)
	t._decorationFrame.Size = UDim2.new(0, StatsUtilsModule.DecorationSize, 0, StatsUtilsModule.DecorationSize)
	t._decorationFrame.BackgroundTransparency = 1
	t._label = Instance.new("TextLabel")
	t._label.Name = "Label"
	t._label.Parent = t._frame
	t._label.Position = UDim2.new(0, StatsUtilsModule.DecorationSize + StatsUtilsModule.DecorationMargin, 0, 0)
	t._label.Size = UDim2.new(1, -(StatsUtilsModule.DecorationSize + StatsUtilsModule.DecorationMargin), 1, 0)
	t._label.FontSize = StatsUtilsModule.PanelValueFontSize
	t._label.TextXAlignment = Enum.TextXAlignment.Left
	t._label.TextYAlignment = Enum.TextYAlignment.Center
	StatsUtilsModule.StyleTextWidget(t._label)
	
	return t
end

function DecoratedValueLabelModule:SetZIndex(ZIndex)
	self._frame.ZIndex = ZIndex
	self._decorationFrame.ZIndex = ZIndex
	self._label.ZIndex = ZIndex
end

function DecoratedValueLabelModule:PlaceInParent(Parent, Size, Position)
	self._frame.Parent = Parent
	self._frame.Size = Size
	self._frame.Position = Position
end

function DecoratedValueLabelModule:GetDecorationFrame()
	return self._decorationFrame
end

function DecoratedValueLabelModule:SetValue(p1)
	-- upvalues: StatsUtilsModule (copy)
	self._label.Text = string.format("%s: %s", self._valueName, (StatsUtilsModule.FormatTypedValue(p1, self._statType)))
end

return DecoratedValueLabelModule