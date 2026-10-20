local AdService = game:GetService("AdService")
local TeleportService = game:GetService("TeleportService")
local CorePackages = game:GetService("CorePackages")
local PromiseModule = require(CorePackages.Packages.Promise)
local RoactModule = require(CorePackages.Packages.Roact)
local v1 = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.Common.httpRequest)((game:GetService("HttpRbxApiService")))
local TeleportHistoryButtonsEngineFeature = game:GetEngineFeature("TeleportHistoryButtons")
local RobloxTranslatorModule = require(CorePackages.Workspace.Packages.RobloxTranslator)
local GetGameNameAndDescriptionFunction = require(CorePackages.Workspace.Packages.GameDetailRodux).GetGameNameAndDescription
local Flag = false
local v2 = 0
local AdTeleportInfo, AdTeleportInfo2 = AdService:GetAdTeleportInfo()

if AdTeleportInfo > 0 and (AdTeleportInfo2 == 0 or AdTeleportInfo2 == game.GameId) then
	v2 = AdTeleportInfo
	
	if TeleportHistoryButtonsEngineFeature then
		Flag = true
	end
end
if TeleportHistoryButtonsEngineFeature and v2 == 0 then
	local ThirdPartyTeleportInfo, _ = TeleportService:GetThirdPartyTeleportInfo(false)
	
	if ThirdPartyTeleportInfo > 0 then
		v2 = ThirdPartyTeleportInfo
	end
	Flag = false
end
local function _(Text: string, p1: number): string
	return if p1 < #Text then string.sub(Text, 1, p1 - 3) .. "..." else Text
end

local Name = nil
local DeferResult = PromiseModule.defer(function(Callback: () -> ())
	-- upvalues: v2 (ref), GetGameNameAndDescriptionFunction (copy), v1 (copy), Name (ref), TeleportHistoryButtonsEngineFeature (copy)
	if v2 > 0 then
		GetGameNameAndDescriptionFunction(v1, v2):andThen(function(Result)
			-- upvalues: Name (upval), TeleportHistoryButtonsEngineFeature (upval)
			Name = Result.Name
			
			if TeleportHistoryButtonsEngineFeature then
				local Name1: string = Result.Name
				Name = if #Name1 > 30 then string.sub(Name1, 1, 27) .. "..." else Name1
			end
		end):await()
		Callback()
		
		return
	else
		Callback()
	end
end)
local config = {
	getTooltipText = function()
		-- upvalues: Name (ref), RobloxTranslatorModule (copy)
		return if Name == nil then RobloxTranslatorModule:FormatByKey("InGame.CommonUI.Label.ReturnFallback") else RobloxTranslatorModule:FormatByKey("InGame.CommonUI.Label.ReturnTo", { placeName = Name })
	end
}

function config.getTooltipTextTimeout()
	-- upvalues: Name (ref), PromiseModule (copy), DeferResult (copy), config (copy)
	if Name == nil then
		PromiseModule.any({ DeferResult, PromiseModule.delay(1) }):await()
	end
	return config.getTooltipText()
end

function config.getMenuText()
	-- upvalues: RoactModule (copy), config (copy), Name (ref), DeferResult (copy)
	local Binding, Binding2 = RoactModule.createBinding(config.getTooltipText())
	
	if Name == nil then
		pcall(function()
			-- upvalues: DeferResult (upval), Binding2 (copy), config (upval)
			DeferResult:andThen(function()
				-- upvalues: Binding2 (upval), config (upval)
				Binding2(config.getTooltipText())
			end)
		end)
	end
	return Binding
end

function config.initiateBackButtonTeleport(AdTeleportMethod)
	-- upvalues: TeleportHistoryButtonsEngineFeature (copy), Flag (ref), AdService (copy), TeleportService (copy)
	if TeleportHistoryButtonsEngineFeature then
		if Flag then
			AdService:ReturnToPublisherExperience(AdTeleportMethod)
		else
			TeleportService:TeleportTrustedBackForth(false)
		end
	end
	AdService:ReturnToPublisherExperience(AdTeleportMethod)
end

function config.hasReturnUniverse(): boolean
	-- upvalues: v2 (ref)
	return v2 > 0
end

return config