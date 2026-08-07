local coreGuiService = game:GetService("CoreGui")
local playersService = game:GetService("Players")
local corePackagesService = game:GetService("CorePackages")
local gameSettings = UserSettings().GameSettings
local styleWidgetsModule = require(coreGuiService.RobloxGui.Modules.StyleWidgets)
local robloxTranslatorModule = require(corePackagesService.Workspace.Packages.RobloxTranslator)
local _ = require(corePackagesService.Workspace.Packages.Loggers).mutedError

function LocalizeWithFallback(p0, p1) --[[ line: 20 ]]
	-- upvalues: robloxTranslatorModule (ref)
	local ok, status = pcall(function() --[[ line: 21 ]]
		-- upvalues: robloxTranslatorModule (copy), p0 (ref)
		return robloxTranslatorModule:FormatByKey(p0)
	end)
	
	return if ok and status then status else p1
end

local t = {
	SelectedBackgroundColor = Color3.new(0.4, 0.4, 0.4),
	FontColor = Color3.new(1, 1, 1),
	GraphBarGreenColor = Color3.new(0.494117647059, 0.827450980392, 0.129411764706),
	GraphBarYellowColor = Color3.new(0.819607843137, 0.827450980392, 0.129411764706),
	GraphBarRedColor = Color3.new(0.827450980392, 0.345098039216, 0.129411764706),
	GraphAverageLineColor = Color3.new(0.81568627451, 0.003921568627, 0.105882352941),
	GraphAverageLineBorderColor = Color3.new(1, 1, 1),
	NormalColor = Color3.fromRGB(31, 31, 31),
	Transparency = 0.5,
	MiniPanelTitleFontSize = Enum.FontSize.Size12,
	MiniPanelValueFontSize = Enum.FontSize.Size10,
	PanelTitleFontSize = Enum.FontSize.Size24,
	PanelValueFontSize = Enum.FontSize.Size14,
	PanelGraphFontSize = Enum.FontSize.Size10,
	ButtonHeight = 36 + styleWidgetsModule.TabSelectionHeight,
	ViewerTopMargin = 10,
	ViewerHeight = 144,
	ViewerWidth = 306,
	TextZIndex = 5,
	GraphZIndex = 2,
	GraphTargetLineInnerThickness = 2,
	GraphAverageLineInnerThickness = 2,
	GraphAverageLineBorderThickness = 1
}
t.GraphAverageLineTotalThickness = t.GraphAverageLineInnerThickness + 2 * t.GraphAverageLineBorderThickness
t.TextPanelTitleHeightY = 52
t.TextPanelLegendItemHeightY = 20
t.TextPanelLeftMarginPix = 10
t.TextPanelTopMarginPix = 10
t.DecorationSize = 12
t.OvalKeySize = 8
t.TargetKeyWidth = 11
t.TargetKeyHeight = 2
t.DecorationMargin = 6
t.StatType_Memory = "st_Memory"
t.StatType_CPU = "st_CPU"
t.StatType_GPU = "st_GPU"
t.StatType_NetworkSent = "st_NetworkSent"
t.StatType_NetworkReceived = "st_NetworkReceived"
t.StatType_Ping = "st_Ping"
t.AllStatTypes = {
	t.StatType_Memory, t.StatType_CPU, t.StatType_GPU, t.StatType_NetworkSent,
	t.StatType_NetworkReceived, t.StatType_Ping
}
t.StatNames = {
	[t.StatType_Memory] = "Memory",
	[t.StatType_CPU] = "CPU",
	[t.StatType_GPU] = "GPU",
	[t.StatType_NetworkSent] = "NetworkSent",
	[t.StatType_NetworkReceived] = "NetworkReceived",
	[t.StatType_Ping] = "Ping"
}
t.StatMaxNames = {
	[t.StatType_Memory] = "MaxMemory",
	[t.StatType_CPU] = "MaxCPU",
	[t.StatType_GPU] = "MaxGPU",
	[t.StatType_NetworkSent] = "MaxNetworkSent",
	[t.StatType_NetworkReceived] = "MaxNetworkReceived",
	[t.StatType_Ping] = "MaxPing"
}
t.NumButtonTypes = #t.AllStatTypes
local var6 = LocalizeWithFallback("InGame.UnknownNamespace.Network", "Network")
t.TypeToName = {
	[t.StatType_Memory] = "Memory",
	[t.StatType_CPU] = "CPU",
	[t.StatType_GPU] = "GPU",
	[t.StatType_NetworkSent] = LocalizeWithFallback("InGame.UnknownNamespace.Sent", "Sent") .. "\n" .. var6,
	[t.StatType_NetworkReceived] = LocalizeWithFallback("InGame.UnknownNamespace.Received", "Received") .. "\n" .. var6,
	[t.StatType_Ping] = "NetworkPing"
}
t.TypeToShortName = {
	[t.StatType_Memory] = "Mem",
	[t.StatType_CPU] = "CPU",
	[t.StatType_GPU] = "GPU",
	[t.StatType_NetworkSent] = "Sent",
	[t.StatType_NetworkReceived] = "Recv",
	[t.StatType_Ping] = "NetworkPing"
}
t.MemoryAnalyzerTypeToName = {
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

function t.GetMemoryAnalyzerStatName(p2) --[[ line: 158 ]]
	-- upvalues: t (ref)
	return if t.MemoryAnalyzerTypeToName[p2] == nil then p2 else t.MemoryAnalyzerTypeToName[p2]
end

function t.StyleFrame(p3) --[[ line: 166 ]]
	-- upvalues: t (ref)
	p3.BackgroundColor3 = t.NormalColor
	p3.BackgroundTransparency = t.Transparency
end

function t.StyleButton(p4) --[[ line: 171 ]]
	-- upvalues: t (ref)
	p4.BackgroundColor3 = t.NormalColor
	p4.BackgroundTransparency = t.Transparency
end

function t.StyleTextWidget(p5) --[[ line: 176 ]]
	-- upvalues: t (ref)
	p5.BackgroundTransparency = 1
	p5.TextColor3 = t.FontColor
	p5.Font = Enum.Font.SourceSansBold
end

function t.StyleButtonSelected(p6, p7) --[[ line: 182 ]]
	-- upvalues: t (ref)
	t.StyleButton(p6)
	
	if p7 then
		p6.BackgroundColor3 = t.SelectedBackgroundColor
	end
end

function t.FormatTypedValue(p8, p9) --[[ line: 189 ]]
	-- upvalues: t (ref)
	if p9 == t.StatType_Memory then
		return string.format("%.2f MB", p8)
	elseif p9 == t.StatType_CPU then
		return string.format("%.2f ms", p8)
	elseif p9 == t.StatType_GPU then
		return string.format("%.2f ms", p8)
	elseif p9 == t.StatType_NetworkSent then
		return string.format("%.2f KB/s", p8)
	elseif p9 == t.StatType_NetworkReceived then
		return string.format("%.2f KB/s", p8)
	elseif p9 == t.StatType_Ping then
		return string.format("%.0f ms", p8)
	end
end

function t.StyleAverageLine(p10) --[[ line: 205 ]]
	-- upvalues: t (ref)
	p10.BackgroundColor3 = t.GraphAverageLineColor
	p10.BorderSizePixel = t.GraphAverageLineBorderThickness
	p10.BorderColor3 = t.GraphAverageLineBorderColor
end

function t.GetColorForValue(p11, p12) --[[ line: 211 ]]
	-- upvalues: t (ref)
	return if p11 < 0.666 * p12 then t.GraphBarGreenColor elseif p11 < 1.333 * p12 then t.GraphBarYellowColor else t.GraphBarRedColor
end

function t.PerformanceStatsShouldBeVisible() --[[ line: 221 ]]
	-- upvalues: playersService (ref), gameSettings (ref)
	return gameSettings.PerformanceStatsVisible and playersService.LocalPlayer ~= nil
end

return t