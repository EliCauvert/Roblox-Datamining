local corePackagesService = game:GetService("CorePackages")
local chrome = game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.Chrome
local reactModule = require(corePackagesService.Packages.React)
local sharedFlagsModule = require(corePackagesService.Workspace.Packages.SharedFlags)
local signalsReactModule = require(corePackagesService.Packages.SignalsReact)
local useObservableValueModule = require(chrome.ChromeShared.Hooks.useObservableValue)
local var1 = require(corePackagesService.Workspace.Packages.Chrome).Enabled()
local var2 = if sharedFlagsModule.FFlagEnableConsoleExpControls and var1 then require(script.Parent.Parent.GamepadConnector) else nil
local var3 = require(chrome.ChromeShared.Service.ChromeUtils).ObservableValue.new(true)
local inExperienceShopModule = require(corePackagesService.Workspace.Packages.InExperienceShop)
local var4 = inExperienceShopModule.FFlagEnableExperienceShopGlobalIcon and (sharedFlagsModule.FFlagEnableInExperienceShop and var1)
local fFlagCenterInExperienceShopWindow = inExperienceShopModule.FFlagCenterInExperienceShopWindow
local fFlagExperienceShopNewIconography = inExperienceShopModule.FFlagExperienceShopNewIconography
local shopGlobalIcon = inExperienceShopModule.ShopGlobalIcon
local var5 = if var4 then require(chrome.Integrations.CommonIcon) else nil
local var6 = if var4 then require(chrome.Service) else nil
local var7 = if var4 then require(chrome.ChromeShared.Unibar.Constants) else nil
local var8 = if var4 then require(corePackagesService.Workspace.Packages.Chrome).Hooks.useMappedSignal else nil
local var9 = if var4 and var6 and var7 then require(chrome.ChromeShared.Service.ChromeUtils).MappedSignal.new(var6:onIntegrationStatusChanged(), function()
	-- upvalues: var6 (ref), var7 (ref)
	return var6:isWindowOpen(var7.IN_EXPERIENCE_SHOP_ID)
end) else nil
local var10 = if var4 then require(chrome.Integrations.InExperienceShop.ShopWindowLayout).toggleInExperienceShopWindow else nil

local function getShopGlobalIconEnabled(p1)
	-- upvalues: var4 (ref), inExperienceShopModule (ref)
	if not var4 then
		return false
	end
	local getShopGlobalIconStore = inExperienceShopModule.GetShopGlobalIconStore
	
	return if getShopGlobalIconStore then getShopGlobalIconStore(p1).getEnabled(p1) else false
end

local function getShopGlobalStatusIndicatorEnabled(p1)
	-- upvalues: var4 (ref), inExperienceShopModule (ref)
	if not var4 then
		return false
	end
	local getShopGlobalIconStore = inExperienceShopModule.GetShopGlobalIconStore
	
	return if getShopGlobalIconStore then getShopGlobalIconStore(p1).getStatusIndicatorEnabled(p1) else false
end

local function handleShopGlobalIconActivated()
	-- upvalues: var4 (ref), fFlagCenterInExperienceShopWindow (ref), var10 (ref), var6 (ref), var7 (ref)
	if not var4 then return end
	if fFlagCenterInExperienceShopWindow then
		if var10 then
			var10()
			
			return
		end
	elseif var6 and var7 then
		var6:toggleWindow(var7.IN_EXPERIENCE_SHOP_ID)
	end
end

return function(p1)
	-- upvalues: signalsReactModule (ref), getShopGlobalIconEnabled (ref), getShopGlobalStatusIndicatorEnabled (ref), reactModule (ref), var4 (ref), inExperienceShopModule (ref), var8 (ref), var9 (ref), useObservableValueModule (ref), var2 (ref), var3 (ref), shopGlobalIcon (ref), handleShopGlobalIconActivated (ref), fFlagExperienceShopNewIconography (ref), var5 (ref)
	local var11 = signalsReactModule.useSignalState(getShopGlobalIconEnabled)
	local var12 = signalsReactModule.useSignalState(getShopGlobalStatusIndicatorEnabled)
	reactModule.useEffect(function()
		-- upvalues: var4 (copy), inExperienceShopModule (copy)
		if var4 then
			return inExperienceShopModule.initShopGlobalIcon and inExperienceShopModule.initShopGlobalIcon() or function() end
		end
	end, {})
	
	return if not (not var4 or not var11 or not shopGlobalIcon) then reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.fromOffset(0, p1.buttonSize),
		AutomaticSize = Enum.AutomaticSize.X,
		LayoutOrder = p1.layoutOrder
	}, {
		Icon = reactModule.createElement(shopGlobalIcon, {
			buttonSize = p1.buttonSize,
			leftGap = p1.leftGap,
			hidden = useObservableValueModule(if var2 == nil then var3 else var2:getShowTopBar()) == false,
			showStatusIndicator = var12,
			onActivated = handleShopGlobalIconActivated,
			onAreaChanged = p1.onAreaChanged,
			isActive = (var8 or function()
				return nil
			end)(if var11 then var9 else nil),
			icon = if fFlagExperienceShopNewIconography or not var5 or not var9 then nil else var5("BuildingStore", nil, var9)
		})
	}) else nil
end