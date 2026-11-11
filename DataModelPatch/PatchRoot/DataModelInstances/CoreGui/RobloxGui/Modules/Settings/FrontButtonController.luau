local TeleportService = game:GetService("TeleportService")
local CorePackages = game:GetService("CorePackages")
local PromiseModule = require(CorePackages.Packages.Promise)
local RoactModule = require(CorePackages.Packages.Roact)
local v1 = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.Common.httpRequest)((game:GetService("HttpRbxApiService")))
local RobloxTranslatorModule = require(CorePackages.Workspace.Packages.RobloxTranslator)
local GetGameNameAndDescriptionFunction = require(CorePackages.Workspace.Packages.GameDetailRodux).GetGameNameAndDescription
local TeleportHistoryButtonsEngineFeature = game:GetEngineFeature("TeleportHistoryButtons")
local v2 = 0
local v3 = 0

if TeleportHistoryButtonsEngineFeature then
	local _
	v3, _ = TeleportService:GetThirdPartyTeleportInfo(true)
end
if TeleportHistoryButtonsEngineFeature and v3 > 0 then
	v2 = v3
end
local function _(Text: string, p1: number): string
	return if p1 < #Text then string.sub(Text, 1, p1 - 3) .. "..." else Text
end

local PlaceName = nil
local DeferResult = PromiseModule.defer(function(Callback: () -> ())
	-- upvalues: v2 (ref), GetGameNameAndDescriptionFunction (copy), v1 (copy), PlaceName (ref)
	if v2 > 0 then
		GetGameNameAndDescriptionFunction(v1, v2):andThen(function(Result)
			-- upvalues: PlaceName (upval)
			local Name: string = Result.Name
			PlaceName = if #Name > 30 then string.sub(Name, 1, 27) .. "..." else Name
		end):await()
		Callback()
		
		return
	else
		Callback()
	end
end)
local config = {
	getTooltipText = function()
		-- upvalues: PlaceName (ref), RobloxTranslatorModule (copy)
		return if PlaceName == nil then RobloxTranslatorModule:FormatByKey("InGame.CommonUI.Label.ReturnFallback") else RobloxTranslatorModule:FormatByKey("InGame.CommonUI.Label.ReturnTo", { placeName = PlaceName })
	end
}

function config.getTooltipTextTimeout()
	-- upvalues: PlaceName (ref), PromiseModule (copy), DeferResult (copy), config (copy)
	if PlaceName == nil then
		PromiseModule.any({ DeferResult, PromiseModule.delay(1) }):await()
	end
	return config.getTooltipText()
end

function config.getMenuText()
	-- upvalues: RoactModule (copy), config (copy), PlaceName (ref), DeferResult (copy)
	local Binding, Binding2 = RoactModule.createBinding(config.getTooltipText())
	
	if PlaceName == nil then
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

function config.initiateFrontButtonTeleport()
	-- upvalues: TeleportHistoryButtonsEngineFeature (copy), TeleportService (copy)
	if TeleportHistoryButtonsEngineFeature then
		TeleportService:TeleportTrustedBackForth(true)
	end
end

function config.hasReturnUniverse(): boolean
	-- upvalues: v2 (ref)
	return v2 > 0
end

return config