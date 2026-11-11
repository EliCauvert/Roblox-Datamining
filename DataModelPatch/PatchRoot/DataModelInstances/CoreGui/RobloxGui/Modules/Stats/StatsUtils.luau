local Players = game:GetService("Players")
local CorePackages = game:GetService("CorePackages")
local GameSettings = UserSettings().GameSettings
local StyleWidgetsModule = require(game:GetService("CoreGui").RobloxGui.Modules.StyleWidgets)
local RobloxTranslatorModule = require(CorePackages.Workspace.Packages.RobloxTranslator)
local _ = require(CorePackages.Workspace.Packages.Loggers).mutedError

function LocalizeWithFallback(p1, p2)
	-- upvalues: RobloxTranslatorModule (copy)
	local Success, Result = pcall(function()
		-- upvalues: RobloxTranslatorModule (upval), p1 (copy)
		return RobloxTranslatorModule:FormatByKey(p1)
	end)
	
	return if Success and Result then Result else p2
end

local StatsUtils = {
	SelectedBackgroundColor = Color3.new(0.4, 0.4, 0.4),
	FontColor = Color3.new(1, 1, 1),
	GraphBarGreenColor = Color3.new(0.49411764705882355, 0.8274509803921568, 0.12941176470588237),
	GraphBarYellowColor = Color3.new(0.8196078431372549, 0.8274509803921568, 0.12941176470588237),
	GraphBarRedColor = Color3.new(0.8274509803921568, 0.34509803921568627, 0.12941176470588237),
	GraphAverageLineColor = Color3.new(0.8156862745098039, 0.00392156862745098, 0.10588235294117647),
	GraphAverageLineBorderColor = Color3.new(1, 1, 1),
	NormalColor = Color3.fromRGB(31, 31, 31),
	Transparency = 0.5,
	MiniPanelTitleFontSize = Enum.FontSize.Size12,
	MiniPanelValueFontSize = Enum.FontSize.Size10,
	PanelTitleFontSize = Enum.FontSize.Size24,
	PanelValueFontSize = Enum.FontSize.Size14,
	PanelGraphFontSize = Enum.FontSize.Size10,
	ButtonHeight = 36 + StyleWidgetsModule.TabSelectionHeight,
	ViewerTopMargin = 10,
	ViewerHeight = 144,
	ViewerWidth = 306,
	TextZIndex = 5,
	GraphZIndex = 2,
	GraphTargetLineInnerThickness = 2,
	GraphAverageLineInnerThickness = 2,
	GraphAverageLineBorderThickness = 1
}
StatsUtils.GraphAverageLineTotalThickness = StatsUtils.GraphAverageLineInnerThickness + 2 * StatsUtils.GraphAverageLineBorderThickness
StatsUtils.TextPanelTitleHeightY = 52
StatsUtils.TextPanelLegendItemHeightY = 20
StatsUtils.TextPanelLeftMarginPix = 10
StatsUtils.TextPanelTopMarginPix = 10
StatsUtils.DecorationSize = 12
StatsUtils.OvalKeySize = 8
StatsUtils.TargetKeyWidth = 11
StatsUtils.TargetKeyHeight = 2
StatsUtils.DecorationMargin = 6
StatsUtils.StatType_Memory = "st_Memory"
StatsUtils.StatType_CPU = "st_CPU"
StatsUtils.StatType_GPU = "st_GPU"
StatsUtils.StatType_NetworkSent = "st_NetworkSent"
StatsUtils.StatType_NetworkReceived = "st_NetworkReceived"
StatsUtils.StatType_Ping = "st_Ping"
StatsUtils.AllStatTypes = {
	StatsUtils.StatType_Memory, StatsUtils.StatType_CPU, StatsUtils.StatType_GPU,
	StatsUtils.StatType_NetworkSent, StatsUtils.StatType_NetworkReceived,
	StatsUtils.StatType_Ping
}
StatsUtils.StatNames = {
	[StatsUtils.StatType_Memory] = "Memory",
	[StatsUtils.StatType_CPU] = "CPU",
	[StatsUtils.StatType_GPU] = "GPU",
	[StatsUtils.StatType_NetworkSent] = "NetworkSent",
	[StatsUtils.StatType_NetworkReceived] = "NetworkReceived",
	[StatsUtils.StatType_Ping] = "Ping"
}
StatsUtils.StatMaxNames = {
	[StatsUtils.StatType_Memory] = "MaxMemory",
	[StatsUtils.StatType_CPU] = "MaxCPU",
	[StatsUtils.StatType_GPU] = "MaxGPU",
	[StatsUtils.StatType_NetworkSent] = "MaxNetworkSent",
	[StatsUtils.StatType_NetworkReceived] = "MaxNetworkReceived",
	[StatsUtils.StatType_Ping] = "MaxPing"
}
StatsUtils.NumButtonTypes = #StatsUtils.AllStatTypes
local InGameUnknownNamespaceNetwork = LocalizeWithFallback("InGame.UnknownNamespace.Network", "Network")
StatsUtils.TypeToName = {
	[StatsUtils.StatType_Memory] = "Memory",
	[StatsUtils.StatType_CPU] = "CPU",
	[StatsUtils.StatType_GPU] = "GPU",
	[StatsUtils.StatType_NetworkSent] = LocalizeWithFallback("InGame.UnknownNamespace.Sent", "Sent") .. "\n" .. InGameUnknownNamespaceNetwork,
	[StatsUtils.StatType_NetworkReceived] = LocalizeWithFallback("InGame.UnknownNamespace.Received", "Received") .. "\n" .. InGameUnknownNamespaceNetwork,
	[StatsUtils.StatType_Ping] = "NetworkPing"
}
StatsUtils.TypeToShortName = {
	[StatsUtils.StatType_Memory] = "Mem",
	[StatsUtils.StatType_CPU] = "CPU",
	[StatsUtils.StatType_GPU] = "GPU",
	[StatsUtils.StatType_NetworkSent] = "Sent",
	[StatsUtils.StatType_NetworkReceived] = "Recv",
	[StatsUtils.StatType_Ping] = "NetworkPing"
}
StatsUtils.MemoryAnalyzerTypeToName = {
	HumanoidTexture = "Humanoid Textures",
	HumanoidTextureOrphan = "Humanoid Textures (Unused)",
	OtherTexture = "Other Textures",
	OtherTextureOrphan = "Other Textures (Unused)",
	CoreScript = "Core Scripts",
	UserScript = "User Scripts",
	Sounds = "Sounds",
	CSG = "Solid Models",
	Meshes = "Meshes"
}

function StatsUtils.GetMemoryAnalyzerStatName(p1)
	-- upvalues: StatsUtils (copy)
	return if StatsUtils.MemoryAnalyzerTypeToName[p1] == nil then p1 else StatsUtils.MemoryAnalyzerTypeToName[p1]
end

function StatsUtils.StyleFrame(p1)
	-- upvalues: StatsUtils (copy)
	p1.BackgroundColor3 = StatsUtils.NormalColor
	p1.BackgroundTransparency = StatsUtils.Transparency
end

function StatsUtils.StyleButton(p1)
	-- upvalues: StatsUtils (copy)
	p1.BackgroundColor3 = StatsUtils.NormalColor
	p1.BackgroundTransparency = StatsUtils.Transparency
end

function StatsUtils.StyleTextWidget(Label)
	-- upvalues: StatsUtils (copy)
	Label.BackgroundTransparency = 1
	Label.TextColor3 = StatsUtils.FontColor
	Label.Font = Enum.Font.SourceSansBold
end

function StatsUtils.StyleButtonSelected(p1, p2)
	-- upvalues: StatsUtils (copy)
	StatsUtils.StyleButton(p1)
	
	if p2 then
		p1.BackgroundColor3 = StatsUtils.SelectedBackgroundColor
	end
end

function StatsUtils.FormatTypedValue(p1, StatTypeCPU): string?
	-- upvalues: StatsUtils (copy)
	if StatTypeCPU == StatsUtils.StatType_Memory then
		return string.format("%.2f MB", p1)
	elseif StatTypeCPU == StatsUtils.StatType_CPU then
		return string.format("%.2f ms", p1)
	elseif StatTypeCPU == StatsUtils.StatType_GPU then
		return string.format("%.2f ms", p1)
	elseif StatTypeCPU == StatsUtils.StatType_NetworkSent then
		return string.format("%.2f KB/s", p1)
	elseif StatTypeCPU == StatsUtils.StatType_NetworkReceived then
		return string.format("%.2f KB/s", p1)
	elseif StatTypeCPU ~= StatsUtils.StatType_Ping then return end
	return string.format("%.0f ms", p1)
end

function StatsUtils.StyleAverageLine(p1)
	-- upvalues: StatsUtils (copy)
	p1.BackgroundColor3 = StatsUtils.GraphAverageLineColor
	p1.BorderSizePixel = StatsUtils.GraphAverageLineBorderThickness
	p1.BorderColor3 = StatsUtils.GraphAverageLineBorderColor
end

function StatsUtils.GetColorForValue(p1, p2: number)
	-- upvalues: StatsUtils (copy)
	return if p1 < 0.666 * p2 then StatsUtils.GraphBarGreenColor elseif p1 < 1.333 * p2 then StatsUtils.GraphBarYellowColor else StatsUtils.GraphBarRedColor
end

function StatsUtils.PerformanceStatsShouldBeVisible(): boolean
	-- upvalues: Players (copy), GameSettings (copy)
	local LocalPlayer = Players.LocalPlayer
	
	return GameSettings.PerformanceStatsVisible and LocalPlayer ~= nil
end

return StatsUtils