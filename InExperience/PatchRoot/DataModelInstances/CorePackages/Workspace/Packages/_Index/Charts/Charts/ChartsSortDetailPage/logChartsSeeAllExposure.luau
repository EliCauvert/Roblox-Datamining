local IXPService = game:GetService("IXPService")
local SduiChartsSeeAllIxpLayer = game:DefineFastString("SduiChartsSeeAllIxpLayer", "PlayerApp.Discovery.Charts.SeeAll.Exposure")

return function()
	-- upvalues: IXPService (copy), SduiChartsSeeAllIxpLayer (copy)
	IXPService:LogFlagLinkedUserLayerExposure(SduiChartsSeeAllIxpLayer)
end