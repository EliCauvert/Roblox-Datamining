local teleportService = game:GetService("TeleportService")
local corePackagesService = game:GetService("CorePackages")
local coreGuiService = game:GetService("CoreGui")
local httpRbxApiService = game:GetService("HttpRbxApiService")
local promiseModule = require(corePackagesService.Packages.Promise)
local roactModule = require(corePackagesService.Packages.Roact)
local var6 = require(coreGuiService:WaitForChild("RobloxGui").Modules.Common.httpRequest)(httpRbxApiService)
local robloxTranslatorModule = require(corePackagesService.Workspace.Packages.RobloxTranslator)
local getGameNameAndDescription = require(corePackagesService.Workspace.Packages.GameDetailRodux).GetGameNameAndDescription
local teleportHistoryButtonsEngineFeature = game:GetEngineFeature("TeleportHistoryButtons")
local var9 = 0
local var10 = 0
local var11 = 0

if teleportHistoryButtonsEngineFeature then
	local var12, var13 = teleportService:GetThirdPartyTeleportInfo(true)
	var10 = var12
	var11 = var13
end
if teleportHistoryButtonsEngineFeature and var10 > 0 then
	var9 = var10
end
local function _(p0, p1) --[[ line: 30 | named "truncateWithEllipsis" ]]
	return if p1 < #p0 then string.sub(p0, 1, p1 - 3) .. "..." else p0
end

local var14 = nil
local var15 = promiseModule.defer(function(p2) --[[ line: 39 ]]
	-- upvalues: var9 (write), getGameNameAndDescription (ref), var6 (ref), var14 (write)
	if var9 > 0 then
		getGameNameAndDescription(var6, var9):andThen(function(p3) --[[ line: 41 ]]
			-- upvalues: var14 (copy)
			local name = p3.Name
			var14 = if #name > 30 then string.sub(name, 1, 27) .. "..." else name
		end):await()
		p2()
		
		return
	end
	p2()
end)
local t = {
	getTooltipText = function() --[[ line: 51 ]]
		-- upvalues: var14 (write), robloxTranslatorModule (ref)
		return if var14 == nil then robloxTranslatorModule:FormatByKey("InGame.CommonUI.Label.ReturnFallback") else robloxTranslatorModule:FormatByKey("InGame.CommonUI.Label.ReturnTo", { placeName = var14 })
	end
}

function t.getTooltipTextTimeout() --[[ line: 61 ]]
	-- upvalues: var14 (write), promiseModule (ref), var15 (ref), t (ref)
	if var14 == nil then
		promiseModule.any({ var15, promiseModule.delay(1) }):await()
	end
	return t.getTooltipText()
end

function t.getMenuText() --[[ line: 67 ]]
	-- upvalues: roactModule (ref), t (ref), var14 (write), var15 (ref)
	local var17, var18 = roactModule.createBinding(t.getTooltipText())
	
	if var14 == nil then
		pcall(function() --[[ line: 70 ]]
			-- upvalues: var15 (copy), var18 (ref), t (copy)
			var15:andThen(function() --[[ line: 71 ]]
				-- upvalues: var18 (copy), t (copy)
				var18(t.getTooltipText())
			end)
		end)
	end
	return var17
end

function t.initiateFrontButtonTeleport() --[[ line: 78 ]]
	-- upvalues: teleportHistoryButtonsEngineFeature (ref), teleportService (ref)
	if teleportHistoryButtonsEngineFeature then
		teleportService:TeleportTrustedBackForth(true)
	end
end

function t.hasReturnUniverse() --[[ line: 83 ]]
	-- upvalues: var9 (write)
	return var9 > 0
end

return t