local teleportService = game:GetService("TeleportService")
local corePackagesService = game:GetService("CorePackages")
local coreGuiService = game:GetService("CoreGui")
local httpRbxApiService = game:GetService("HttpRbxApiService")
local promiseModule = require(corePackagesService.Packages.Promise)
local roactModule = require(corePackagesService.Packages.Roact)
local var1 = require(coreGuiService:WaitForChild("RobloxGui").Modules.Common.httpRequest)(httpRbxApiService)
local robloxTranslatorModule = require(corePackagesService.Workspace.Packages.RobloxTranslator)
local getGameNameAndDescription = require(corePackagesService.Workspace.Packages.GameDetailRodux).GetGameNameAndDescription
local teleportHistoryButtonsEngineFeature = game:GetEngineFeature("TeleportHistoryButtons")
local var2 = 0
local var3 = 0
local var4 = 0

if teleportHistoryButtonsEngineFeature then
	local var5, var6 = teleportService:GetThirdPartyTeleportInfo(true)
	var3 = var5
	var4 = var6
end
if teleportHistoryButtonsEngineFeature and var3 > 0 then
	var2 = var3
end
local function _(p1, p2)
	return if p2 < #p1 then string.sub(p1, 1, p2 - 3) .. "..." else p1
end

local var7 = nil
local var8 = promiseModule.defer(function(p1)
	-- upvalues: var2 (write), getGameNameAndDescription (ref), var1 (ref), var7 (write)
	if var2 > 0 then
		getGameNameAndDescription(var1, var2):andThen(function(p2)
			-- upvalues: var7 (copy)
			local name = p2.Name
			var7 = if #name > 30 then string.sub(name, 1, 27) .. "..." else name
		end):await()
		p1()
		
		return
	end
	p1()
end)
local t = {
	getTooltipText = function()
		-- upvalues: var7 (write), robloxTranslatorModule (ref)
		return if var7 == nil then robloxTranslatorModule:FormatByKey("InGame.CommonUI.Label.ReturnFallback") else robloxTranslatorModule:FormatByKey("InGame.CommonUI.Label.ReturnTo", { placeName = var7 })
	end
}

function t.getTooltipTextTimeout()
	-- upvalues: var7 (write), promiseModule (ref), var8 (ref), t (ref)
	if var7 == nil then
		promiseModule.any({ var8, promiseModule.delay(1) }):await()
	end
	return t.getTooltipText()
end

function t.getMenuText()
	-- upvalues: roactModule (ref), t (ref), var7 (write), var8 (ref)
	local var9, var10 = roactModule.createBinding(t.getTooltipText())
	
	if var7 == nil then
		pcall(function()
			-- upvalues: var8 (copy), var10 (ref), t (copy)
			var8:andThen(function()
				-- upvalues: var10 (copy), t (copy)
				var10(t.getTooltipText())
			end)
		end)
	end
	return var9
end

function t.initiateFrontButtonTeleport()
	-- upvalues: teleportHistoryButtonsEngineFeature (ref), teleportService (ref)
	if teleportHistoryButtonsEngineFeature then
		teleportService:TeleportTrustedBackForth(true)
	end
end

function t.hasReturnUniverse()
	-- upvalues: var2 (write)
	return var2 > 0
end

return t