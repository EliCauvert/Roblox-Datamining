local adService = game:GetService("AdService")
local teleportService = game:GetService("TeleportService")
local corePackagesService = game:GetService("CorePackages")
local coreGuiService = game:GetService("CoreGui")
local httpRbxApiService = game:GetService("HttpRbxApiService")
local promiseModule = require(corePackagesService.Packages.Promise)
local roactModule = require(corePackagesService.Packages.Roact)
local var1 = require(coreGuiService:WaitForChild("RobloxGui").Modules.Common.httpRequest)(httpRbxApiService)
local teleportHistoryButtonsEngineFeature = game:GetEngineFeature("TeleportHistoryButtons")
local robloxTranslatorModule = require(corePackagesService.Workspace.Packages.RobloxTranslator)
local getGameNameAndDescription = require(corePackagesService.Workspace.Packages.GameDetailRodux).GetGameNameAndDescription
local var2 = false
local var3 = 0
local adTeleportInfo, adTeleportInfo_1 = adService:GetAdTeleportInfo()

if adTeleportInfo > 0 and (adTeleportInfo_1 == 0 or adTeleportInfo_1 == game.GameId) then
	var3 = adTeleportInfo
	
	if teleportHistoryButtonsEngineFeature then
		var2 = true
	end
end
if teleportHistoryButtonsEngineFeature and var3 == 0 then
	local var4, _ = teleportService:GetThirdPartyTeleportInfo(false)
	
	if var4 > 0 then
		var3 = var4
	end
	var2 = false
end
local function _(p1, p2)
	return if p2 < #p1 then string.sub(p1, 1, p2 - 3) .. "..." else p1
end

local var5 = nil
local var6 = promiseModule.defer(function(p1)
	-- upvalues: var3 (write), getGameNameAndDescription (ref), var1 (ref), var5 (write), teleportHistoryButtonsEngineFeature (ref)
	if var3 > 0 then
		getGameNameAndDescription(var1, var3):andThen(function(p2)
			-- upvalues: var5 (copy), teleportHistoryButtonsEngineFeature (copy)
			var5 = p2.Name
			
			if teleportHistoryButtonsEngineFeature then
				local name = p2.Name
				var5 = if #name > 30 then string.sub(name, 1, 27) .. "..." else name
			end
		end):await()
		p1()
		
		return
	end
	p1()
end)
local t = {
	getTooltipText = function()
		-- upvalues: var5 (write), robloxTranslatorModule (ref)
		return if var5 == nil then robloxTranslatorModule:FormatByKey("InGame.CommonUI.Label.ReturnFallback") else robloxTranslatorModule:FormatByKey("InGame.CommonUI.Label.ReturnTo", { placeName = var5 })
	end
}

function t.getTooltipTextTimeout()
	-- upvalues: var5 (write), promiseModule (ref), var6 (ref), t (ref)
	if var5 == nil then
		promiseModule.any({ var6, promiseModule.delay(1) }):await()
	end
	return t.getTooltipText()
end

function t.getMenuText()
	-- upvalues: roactModule (ref), t (ref), var5 (write), var6 (ref)
	local var7, var8 = roactModule.createBinding(t.getTooltipText())
	
	if var5 == nil then
		pcall(function()
			-- upvalues: var6 (copy), var8 (ref), t (copy)
			var6:andThen(function()
				-- upvalues: var8 (copy), t (copy)
				var8(t.getTooltipText())
			end)
		end)
	end
	return var7
end

function t.initiateBackButtonTeleport(p1)
	-- upvalues: teleportHistoryButtonsEngineFeature (ref), var2 (write), adService (ref), teleportService (ref)
	if teleportHistoryButtonsEngineFeature then
		if var2 then
			adService:ReturnToPublisherExperience(p1)
		else
			teleportService:TeleportTrustedBackForth(false)
		end
	end
	adService:ReturnToPublisherExperience(p1)
end

function t.hasReturnUniverse()
	-- upvalues: var3 (write)
	return var3 > 0
end

return t