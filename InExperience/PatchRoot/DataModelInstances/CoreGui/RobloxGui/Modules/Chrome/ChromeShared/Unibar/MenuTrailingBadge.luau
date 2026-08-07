local chromeShared = script:FindFirstAncestor("ChromeShared")
local corePackagesService = game:GetService("CorePackages")
local reactModule = require(corePackagesService.Packages.React)
local foundationModule = require(corePackagesService.Packages.Foundation)
local badge = foundationModule.Badge
local view = foundationModule.View
local badgeVariant = foundationModule.Enums.BadgeVariant
local badgeShape = foundationModule.Enums.BadgeShape
local useLocalization = require(corePackagesService.Workspace.Packages.Localization).Hooks.useLocalization
local serviceModule = require(chromeShared.Service)
local localStoreModule = require(chromeShared.Service.LocalStore)
local _ = require(corePackagesService.Workspace.Packages.Chrome)
local t = {}

local function _(p0, p1) --[[ line: 56 | named "hasBeenDismissed" ]]
	-- upvalues: t (ref), localStoreModule (ref)
	if t[p0] then
		return true
	end
	local maxViewCount = p1.maxViewCount
	
	if maxViewCount <= 0 then
		return true
	end
	local value = localStoreModule.getValue(p1.localStorageKey)
	
	return maxViewCount <= (if type(value) == "number" then value else 0)
end

local _ = function(p2) --[[ line: 74 | named "recordView" ]]
	-- upvalues: localStoreModule (ref)
	if p2.maxViewCount <= 0 then
		return
	end
	local value = localStoreModule.getValue(p2.localStorageKey)
	localStoreModule.storeForLocalPlayer(p2.localStorageKey, (if type(value) == "number" then value else 0) + 1)
end

return function(p3) --[[ line: 83 | named "MenuTrailingBadge" ]]
	-- upvalues: reactModule (ref), t (ref), localStoreModule (ref), useLocalization (ref), serviceModule (ref), view (ref), badge (ref), badgeVariant (ref), badgeShape (ref)
	local integrationId = p3.integrationId
	local config = p3.config
	local var9, var10 = reactModule.useState(function() --[[ line: 87 ]]
		-- upvalues: integrationId (ref), config (ref), t (copy), localStoreModule (copy)
		local var13
		local var12 = config
		
		if t[integrationId] then
			var13 = true
		else
			local maxViewCount = var12.maxViewCount
			
			if maxViewCount <= 0 then
				var13 = true
			else
				local value = localStoreModule.getValue(var12.localStorageKey)
				var13 = maxViewCount <= (if type(value) == "number" then value else 0)
			end
		end
		local var15 = not var13
		
		if var15 then
			local var16 = config
			
			if var16.maxViewCount <= 0 then
				return var15
			end
			local value = localStoreModule.getValue(var16.localStorageKey)
			localStoreModule.storeForLocalPlayer(var16.localStorageKey, (if type(value) == "number" then value else 0) + 1)
		end
		return var15
	end)
	local var11 = useLocalization({ text = "Feature.Catalog.Label.New" })
	reactModule.useEffect(function() --[[ line: 101 ]]
		-- upvalues: var9 (ref), serviceModule (copy), integrationId (ref), t (copy), localStoreModule (copy), config (ref), var10 (ref)
		if var9 then
			local var18 = serviceModule:onIntegrationActivated():connect(function(p4) --[[ line: 106 ]]
				-- upvalues: integrationId (copy), t (copy), localStoreModule (copy), config (copy), var10 (copy)
				if p4 == integrationId then
					t[integrationId] = true
					localStoreModule.storeForLocalPlayer(config.localStorageKey, config.maxViewCount)
					var10(false)
					
					return
				end
			end)
			
			return function() --[[ line: 115 ]]
				-- upvalues: var18 (ref)
				var18:disconnect()
			end
		end
	end, {
		integrationId,
		config.localStorageKey,
		config.maxViewCount,
		var9
	})
	
	return if var9 then reactModule.createElement(view, { tag = "auto-xy", LayoutOrder = p3.layoutOrder }, {
		Badge = reactModule.createElement(badge, {
			text = var11.text,
			variant = badgeVariant.Emphasis,
			shape = badgeShape.Box
		})
	}) else nil
end