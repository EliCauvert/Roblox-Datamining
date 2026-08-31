local chromeShared = script:FindFirstAncestor("ChromeShared")
local corePackagesService = game:GetService("CorePackages")
local reactModule = require(corePackagesService.Packages.React)
local foundationModule = require(corePackagesService.Packages.Foundation)
local badge = foundationModule.Badge
local view = foundationModule.View
local badgeVariant = foundationModule.Enums.BadgeVariant
local badgeShape = foundationModule.Enums.BadgeShape
local signalsModule = require(corePackagesService.Packages.Signals)
local signalsReactModule = require(corePackagesService.Packages.SignalsReact)
local useLocalization = require(corePackagesService.Workspace.Packages.Localization).Hooks.useLocalization
local fFlagEnableCustomTextInMenuTrailingBadge = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagEnableCustomTextInMenuTrailingBadge
local serviceModule = require(chromeShared.Service)
local localStoreModule = require(chromeShared.Service.LocalStore)
local _ = require(corePackagesService.Workspace.Packages.Chrome)
local var1 = signalsModule.createSignal(nil)
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

local function renderBadge(p1, p2)
	-- upvalues: reactModule (ref), view (ref), badge (ref), badgeVariant (ref), badgeShape (ref)
	return reactModule.createElement(view, { tag = "auto-xy", LayoutOrder = p2 }, {
		Badge = reactModule.createElement(badge, {
			text = p1,
			variant = badgeVariant.Emphasis,
			shape = badgeShape.Box
		})
	})
end

return function(p1)
	-- upvalues: fFlagEnableCustomTextInMenuTrailingBadge (ref), signalsReactModule (ref), var1 (ref), reactModule (ref), t (ref), localStoreModule (ref), useLocalization (ref), serviceModule (ref), renderBadge (ref)
	local useSignalState
	local integrationId = p1.integrationId
	local config = p1.config
	
	if fFlagEnableCustomTextInMenuTrailingBadge then
		useSignalState = signalsReactModule.useSignalState
		useSignalState = useSignalState(config.customText or var1)
	else
		useSignalState = nil
	end
	local var2, var3 = reactModule.useState(function()
		-- upvalues: integrationId (ref), config (ref), t (copy), localStoreModule (copy), useSignalState (ref)
		local var4
		local var5 = config
		
		if t[integrationId] then
			var4 = true
		else
			local maxViewCount = var5.maxViewCount
			
			if maxViewCount <= 0 then
				var4 = true
			else
				local value = localStoreModule.getValue(var5.localStorageKey)
				var4 = maxViewCount <= (if type(value) == "number" then value else 0)
			end
		end
		local var6 = not var4
		
		if var6 and useSignalState == nil then
			local var7 = config
			
			if var7.maxViewCount <= 0 then
				return var6
			end
			local value = localStoreModule.getValue(var7.localStorageKey)
			localStoreModule.storeForLocalPlayer(var7.localStorageKey, (if type(value) == "number" then value else 0) + 1)
		end
		return var6
	end)
	local var4 = useLocalization({ text = "Feature.Catalog.Label.New" })
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), serviceModule (copy), integrationId (ref), t (copy), localStoreModule (copy), config (ref), var3 (ref)
		if var2 then
			local var5 = serviceModule:onIntegrationActivated():connect(function(p2)
				-- upvalues: integrationId (copy), t (copy), localStoreModule (copy), config (copy), var3 (copy)
				if p2 == integrationId then
					t[integrationId] = true
					localStoreModule.storeForLocalPlayer(config.localStorageKey, config.maxViewCount)
					var3(false)
					
					return
				end
			end)
			
			return function()
				-- upvalues: var5 (ref)
				var5:disconnect()
			end
		end
	end, {
		integrationId,
		config.localStorageKey,
		config.maxViewCount,
		var2
	})
	
	return if useSignalState == nil then if var2 then renderBadge(var4.text, p1.layoutOrder) else nil else renderBadge(useSignalState, p1.layoutOrder)
end