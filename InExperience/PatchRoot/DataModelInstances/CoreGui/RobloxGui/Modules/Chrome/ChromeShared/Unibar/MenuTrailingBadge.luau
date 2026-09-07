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

local function _(p1, p2)
	-- upvalues: t (ref), localStoreModule (ref)
	if t[p1] then
		return true
	end
	local maxViewCount = p2.maxViewCount
	
	if maxViewCount <= 0 then
		return true
	end
	local value = localStoreModule.getValue(p2.localStorageKey)
	
	return maxViewCount <= (if type(value) == "number" then value else 0)
end

local _ = function(p1)
	-- upvalues: localStoreModule (ref)
	if p1.maxViewCount <= 0 then
		return
	end
	local value = localStoreModule.getValue(p1.localStorageKey)
	localStoreModule.storeForLocalPlayer(p1.localStorageKey, (if type(value) == "number" then value else 0) + 1)
end

return function(p1)
	-- upvalues: reactModule (ref), t (ref), localStoreModule (ref), useLocalization (ref), serviceModule (ref), view (ref), badge (ref), badgeVariant (ref), badgeShape (ref)
	local integrationId = p1.integrationId
	local config = p1.config
	local var1, var2 = reactModule.useState(function()
		-- upvalues: integrationId (ref), config (ref), t (copy), localStoreModule (copy)
		local var3
		local var4 = config
		
		if t[integrationId] then
			var3 = true
		else
			local maxViewCount = var4.maxViewCount
			
			if maxViewCount <= 0 then
				var3 = true
			else
				local value = localStoreModule.getValue(var4.localStorageKey)
				var3 = maxViewCount <= (if type(value) == "number" then value else 0)
			end
		end
		local var5 = not var3
		
		if var5 then
			local var6 = config
			
			if var6.maxViewCount <= 0 then
				return var5
			end
			local value = localStoreModule.getValue(var6.localStorageKey)
			localStoreModule.storeForLocalPlayer(var6.localStorageKey, (if type(value) == "number" then value else 0) + 1)
		end
		return var5
	end)
	local var3 = useLocalization({ text = "Feature.Catalog.Label.New" })
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), serviceModule (copy), integrationId (ref), t (copy), localStoreModule (copy), config (ref), var2 (ref)
		if var1 then
			local var4 = serviceModule:onIntegrationActivated():connect(function(p2)
				-- upvalues: integrationId (copy), t (copy), localStoreModule (copy), config (copy), var2 (copy)
				if p2 == integrationId then
					t[integrationId] = true
					localStoreModule.storeForLocalPlayer(config.localStorageKey, config.maxViewCount)
					var2(false)
					
					return
				end
			end)
			
			return function()
				-- upvalues: var4 (ref)
				var4:disconnect()
			end
		end
	end, {
		integrationId,
		config.localStorageKey,
		config.maxViewCount,
		var1
	})
	
	return if var1 then reactModule.createElement(view, { tag = "auto-xy", LayoutOrder = p1.layoutOrder }, {
		Badge = reactModule.createElement(badge, {
			text = var3.text,
			variant = badgeVariant.Emphasis,
			shape = badgeShape.Box
		})
	}) else nil
end