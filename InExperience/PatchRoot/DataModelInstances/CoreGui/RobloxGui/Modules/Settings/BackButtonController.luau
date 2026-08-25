local adService = game:GetService("AdService")
local teleportService = game:GetService("TeleportService")
local corePackagesService = game:GetService("CorePackages")
local coreGuiService = game:GetService("CoreGui")
local httpRbxApiService = game:GetService("HttpRbxApiService")
local promiseModule = require(corePackagesService.Packages.Promise)
local roactModule = require(corePackagesService.Packages.Roact)
local var7 = require(coreGuiService:WaitForChild("RobloxGui").Modules.Common.httpRequest)(httpRbxApiService)
local teleportHistoryButtonsEngineFeature = game:GetEngineFeature("TeleportHistoryButtons")
local robloxTranslatorModule = require(corePackagesService.Workspace.Packages.RobloxTranslator)
local getGameNameAndDescription = require(corePackagesService.Workspace.Packages.GameDetailRodux).GetGameNameAndDescription
local var10 = false
local var11 = 0
local adTeleportInfo, adTeleportInfo_1 = adService:GetAdTeleportInfo()

if adTeleportInfo > 0 and (adTeleportInfo_1 == 0 or adTeleportInfo_1 == game.GameId) then
	var11 = adTeleportInfo
	
	if teleportHistoryButtonsEngineFeature then
		var10 = true
	end
end
if teleportHistoryButtonsEngineFeature and var11 == 0 then
	local var14, _ = teleportService:GetThirdPartyTeleportInfo(false)
	
	if var14 > 0 then
		var11 = var14
	end
	var10 = false
end
local function _(p0, p1)
	return if p1 < #p0 then string.sub(p0, 1, p1 - 3) .. "..." else p0
end

local var15 = nil
local var16 = promiseModule.defer(function(p2)
	-- upvalues: var11 (write), getGameNameAndDescription (ref), var7 (ref), var15 (write), teleportHistoryButtonsEngineFeature (ref)
	if var11 > 0 then
		getGameNameAndDescription(var7, var11):andThen(function(p3)
			-- upvalues: var15 (copy), teleportHistoryButtonsEngineFeature (copy)
			var15 = p3.Name
			
			if teleportHistoryButtonsEngineFeature then
				local name = p3.Name
				var15 = if #name > 30 then string.sub(name, 1, 27) .. "..." else name
			end
		end):await()
		p2()
		
		return
	end
	p2()
end)
local t = {
	getTooltipText = function()
		-- upvalues: var15 (write), robloxTranslatorModule (ref)
		return if var15 == nil then robloxTranslatorModule:FormatByKey("InGame.CommonUI.Label.ReturnFallback") else robloxTranslatorModule:FormatByKey("InGame.CommonUI.Label.ReturnTo", { placeName = var15 })
	end
}

function t.getTooltipTextTimeout()
	-- upvalues: var15 (write), promiseModule (ref), var16 (ref), t (ref)
	if var15 == nil then
		promiseModule.any({ var16, promiseModule.delay(1) }):await()
	end
	return t.getTooltipText()
end

function t.getMenuText()
	-- upvalues: roactModule (ref), t (ref), var15 (write), var16 (ref)
	local var18, var19 = roactModule.createBinding(t.getTooltipText())
	
	if var15 == nil then
		pcall(function()
			-- upvalues: var16 (copy), var19 (ref), t (copy)
			var16:andThen(function()
				-- upvalues: var19 (copy), t (copy)
				var19(t.getTooltipText())
			end)
		end)
	end
	return var18
end

function t.initiateBackButtonTeleport(p4)
	-- upvalues: teleportHistoryButtonsEngineFeature (ref), var10 (write), adService (ref), teleportService (ref)
	if teleportHistoryButtonsEngineFeature then
		if var10 then
			adService:ReturnToPublisherExperience(p4)
		else
			teleportService:TeleportTrustedBackForth(false)
		end
	end
	adService:ReturnToPublisherExperience(p4)
end

function t.hasReturnUniverse()
	-- upvalues: var11 (write)
	return var11 > 0
end

return t