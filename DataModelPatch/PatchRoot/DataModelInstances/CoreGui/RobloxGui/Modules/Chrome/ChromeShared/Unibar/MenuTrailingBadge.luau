local ChromeShared = script:FindFirstAncestor("ChromeShared")
local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local FoundationModule = require(CorePackages.Packages.Foundation)
local Badge = FoundationModule.Badge
local View = FoundationModule.View
local BadgeVariant = FoundationModule.Enums.BadgeVariant
local BadgeShape = FoundationModule.Enums.BadgeShape
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local ServiceModule = require(ChromeShared.Service)
local LocalStoreModule = require(ChromeShared.Service.LocalStore)
local _ = require(CorePackages.Workspace.Packages.Chrome)
local t = {}

local function _(p1, p2): boolean
	-- upvalues: t (copy), LocalStoreModule (copy)
	if t[p1] then
		return true
	end
	local MaxViewCount: number = p2.maxViewCount
	
	if MaxViewCount <= 0 then
		return true
	else
		local Value = LocalStoreModule.getValue(p2.localStorageKey)
		
		return MaxViewCount <= (if type(Value) == "number" then Value else 0)
	end
end

local _ = function(p1)
	-- upvalues: LocalStoreModule (copy)
	if p1.maxViewCount > 0 then
		local Value = LocalStoreModule.getValue(p1.localStorageKey)
		LocalStoreModule.storeForLocalPlayer(p1.localStorageKey, (if type(Value) == "number" then Value else 0) + 1)
		
		return
	end
end

return function(p1)
	-- upvalues: ReactModule (copy), t (copy), LocalStoreModule (copy), UseLocalizationFunction (copy), ServiceModule (copy), View (copy), Badge (copy), BadgeVariant (copy), BadgeShape (copy)
	local IntegrationId = p1.integrationId
	local Config = p1.config
	local UseStateResult, UseStateResult2 = ReactModule.useState(function(): boolean
		-- upvalues: IntegrationId (copy), Config (copy), t (upval), LocalStoreModule (upval)
		local Flag = nil
		if t[IntegrationId] then
			Flag = true
		else
			local MaxViewCount: number = Config.maxViewCount
			
			if MaxViewCount <= 0 then
				Flag = true
			else
				local Value = LocalStoreModule.getValue(Config.localStorageKey)
				Flag = MaxViewCount <= (if type(Value) == "number" then Value else 0)
			end
		end
		local NoFlag = not Flag
		
		if NoFlag then
			if Config.maxViewCount <= 0 then
				return NoFlag
			end
			local Value = LocalStoreModule.getValue(Config.localStorageKey)
			LocalStoreModule.storeForLocalPlayer(Config.localStorageKey, (if type(Value) == "number" then Value else 0) + 1)
		end
		return NoFlag
	end)
	local FeatureCatalogLabelNew = UseLocalizationFunction({ text = "Feature.Catalog.Label.New" })
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult (copy), ServiceModule (upval), IntegrationId (copy), t (upval), LocalStoreModule (upval), Config (copy), UseStateResult2 (copy)
		if not UseStateResult then return end
		local Connection = ServiceModule:onIntegrationActivated():connect(function(IntegrationId1)
			-- upvalues: IntegrationId (upval), t (upval), LocalStoreModule (upval), Config (upval), UseStateResult2 (upval)
			if IntegrationId1 == IntegrationId then
				t[IntegrationId] = true
				LocalStoreModule.storeForLocalPlayer(Config.localStorageKey, Config.maxViewCount)
				UseStateResult2(false)
				
				return
			end
		end)
		
		return function()
			-- upvalues: Connection (copy)
			Connection:disconnect()
		end
	end, {
		IntegrationId,
		Config.localStorageKey,
		Config.maxViewCount,
		UseStateResult
	})
	
	return if UseStateResult then ReactModule.createElement(View, { tag = "auto-xy", LayoutOrder = p1.layoutOrder }, {
		Badge = ReactModule.createElement(Badge, {
			text = FeatureCatalogLabelNew.text,
			variant = BadgeVariant.Emphasis,
			shape = BadgeShape.Box
		})
	}) else nil
end