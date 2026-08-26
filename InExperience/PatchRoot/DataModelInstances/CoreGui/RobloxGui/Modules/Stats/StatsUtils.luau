local coreGuiService = game:GetService("CoreGui")
local playersService = game:GetService("Players")
local corePackagesService = game:GetService("CorePackages")
local gameSettings = UserSettings().GameSettings
local styleWidgetsModule = require(coreGuiService.RobloxGui.Modules.StyleWidgets)
local robloxTranslatorModule = require(corePackagesService.Workspace.Packages.RobloxTranslator)
local _ = require(corePackagesService.Workspace.Packages.Loggers).mutedError

function LocalizeWithFallback(p1, p2)
	-- upvalues: robloxTranslatorModule (ref)
	local ok, status = pcall(function()
		-- upvalues: robloxTranslatorModule (copy), p1 (ref)
		return robloxTranslatorModule:FormatByKey(p1)
	end)
	
	return if ok and status then status else p2
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
local var1 = LocalizeWithFallback("InGame.UnknownNamespace.Network", "Network")
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

function t.GetMemoryAnalyzerStatName(p1)
	-- upvalues: t (ref)
	return if t.MemoryAnalyzerTypeToName[p1] == nil then p1 else t.MemoryAnalyzerTypeToName[p1]
end

function t.StyleFrame(p1)
	-- upvalues: t (ref)
	p1.BackgroundColor3 = t.NormalColor
	p1.BackgroundTransparency = t.Transparency
end

function t.StyleButton(p1)
	-- upvalues: t (ref)
	p1.BackgroundColor3 = t.NormalColor
	p1.BackgroundTransparency = t.Transparency
end

function t.StyleTextWidget(p1)
	-- upvalues: t (ref)
	p1.BackgroundTransparency = 1
	p1.TextColor3 = t.FontColor
	p1.Font = Enum.Font.SourceSansBold
end

function t.StyleButtonSelected(p1, p2)
	-- upvalues: t (ref)
	t.StyleButton(p1)
	
	if p2 then
		p1.BackgroundColor3 = t.SelectedBackgroundColor
	end
end

function t.FormatTypedValue(p1, p2)
	-- upvalues: t (ref)
	if p2 == t.StatType_Memory then
		return string.format("%.2f MB", p1)
	elseif p2 == t.StatType_CPU then
		return string.format("%.2f ms", p1)
	elseif p2 == t.StatType_GPU then
		return string.format("%.2f ms", p1)
	elseif p2 == t.StatType_NetworkSent then
		return string.format("%.2f KB/s", p1)
	elseif p2 == t.StatType_NetworkReceived then
		return string.format("%.2f KB/s", p1)
	elseif p2 == t.StatType_Ping then
		return string.format("%.0f ms", p1)
	end
end

function t.StyleAverageLine(p1)
	-- upvalues: t (ref)
	p1.BackgroundColor3 = t.GraphAverageLineColor
	p1.BorderSizePixel = t.GraphAverageLineBorderThickness
	p1.BorderColor3 = t.GraphAverageLineBorderColor
end

function t.GetColorForValue(p1, p2)
	-- upvalues: t (ref)
	return if p1 < 0.666 * p2 then t.GraphBarGreenColor elseif p1 < 1.333 * p2 then t.GraphBarYellowColor else t.GraphBarRedColor
end

function t.PerformanceStatsShouldBeVisible()
	-- upvalues: playersService (ref), gameSettings (ref)
	return gameSettings.PerformanceStatsVisible and playersService.LocalPlayer ~= nil
end

return t