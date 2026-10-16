local CorePackages = game:GetService("CorePackages")
local Chrome = game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.Chrome
local ReactModule = require(CorePackages.Packages.React)
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local SignalsReactModule = require(CorePackages.Packages.SignalsReact)
local UseObservableValueModule = require(Chrome.ChromeShared.Hooks.useObservableValue)
local EnabledResult = require(CorePackages.Workspace.Packages.Chrome).Enabled()
local GamepadConnectorModule = if SharedFlagsModule.FFlagEnableConsoleExpControls and EnabledResult then require(script.Parent.Parent.GamepadConnector) else nil
local NewResult = require(Chrome.ChromeShared.Service.ChromeUtils).ObservableValue.new(true)
local InExperienceShopModule = require(CorePackages.Workspace.Packages.InExperienceShop)
local FFlagEnableInExperienceShop = SharedFlagsModule.FFlagEnableInExperienceShop
local EnabledResult1 = InExperienceShopModule.FFlagEnableExperienceShopGlobalIcon and (FFlagEnableInExperienceShop and EnabledResult)
local FFlagCenterInExperienceShopWindow = InExperienceShopModule.FFlagCenterInExperienceShopWindow
local FFlagExperienceShopNewIconography = InExperienceShopModule.FFlagExperienceShopNewIconography
local ShopGlobalIcon = InExperienceShopModule.ShopGlobalIcon
local CommonIconModule = if EnabledResult1 then require(Chrome.Integrations.CommonIcon) else nil
local ServiceModule = if EnabledResult1 then require(Chrome.Service) else nil
local ConstantsModule = if EnabledResult1 then require(Chrome.ChromeShared.Unibar.Constants) else nil
local UseMappedSignal = if EnabledResult1 then require(CorePackages.Workspace.Packages.Chrome).Hooks.useMappedSignal else nil
local NewResult1 = if EnabledResult1 and ServiceModule and ConstantsModule then require(Chrome.ChromeShared.Service.ChromeUtils).MappedSignal.new(ServiceModule:onIntegrationStatusChanged(), function() --[[ Line: 52 ]]
	-- upvalues: ServiceModule (copy), ConstantsModule (copy)
	return ServiceModule:isWindowOpen(ConstantsModule.IN_EXPERIENCE_SHOP_ID)
end) else nil
local ToggleInExperienceShopWindow = if EnabledResult1 then require(Chrome.Integrations.InExperienceShop.ShopWindowLayout).toggleInExperienceShopWindow else nil

local function getShopGlobalIconEnabled(p1) --[[ Line: 61 ]]
	-- upvalues: EnabledResult1 (copy), InExperienceShopModule (copy)
	if EnabledResult1 then
		local GetShopGlobalIconStoreFunction = InExperienceShopModule.GetShopGlobalIconStore
		
		return if GetShopGlobalIconStoreFunction then GetShopGlobalIconStoreFunction(p1).getEnabled(p1) else false
	else
		return false
	end
end

local function getShopGlobalStatusIndicatorEnabled(p1) --[[ Line: 69 ]]
	-- upvalues: EnabledResult1 (copy), InExperienceShopModule (copy)
	if EnabledResult1 then
		local GetShopGlobalIconStoreFunction = InExperienceShopModule.GetShopGlobalIconStore
		
		return if GetShopGlobalIconStoreFunction then GetShopGlobalIconStoreFunction(p1).getStatusIndicatorEnabled(p1) else false
	else
		return false
	end
end

local function handleShopGlobalIconActivated() --[[ Line: 77 ]]
	-- upvalues: EnabledResult1 (copy), FFlagCenterInExperienceShopWindow (copy), ToggleInExperienceShopWindow (copy), ServiceModule (copy), ConstantsModule (copy)
	if not EnabledResult1 then return end
	if FFlagCenterInExperienceShopWindow then
		if ToggleInExperienceShopWindow then
			ToggleInExperienceShopWindow()
			
			return
		end
	elseif ServiceModule and ConstantsModule then
		ServiceModule:toggleWindow(ConstantsModule.IN_EXPERIENCE_SHOP_ID)
	end
end

return function(p1) --[[ Line: 101 | Named "ShopIcon" ]]
	-- upvalues: SignalsReactModule (copy), getShopGlobalIconEnabled (copy), getShopGlobalStatusIndicatorEnabled (copy), ReactModule (copy), EnabledResult1 (copy), InExperienceShopModule (copy), UseMappedSignal (copy), NewResult1 (copy), UseObservableValueModule (copy), GamepadConnectorModule (copy), NewResult (copy), ShopGlobalIcon (copy), handleShopGlobalIconActivated (copy), FFlagExperienceShopNewIconography (copy), CommonIconModule (copy)
	local UseSignalStateResult = SignalsReactModule.useSignalState(getShopGlobalIconEnabled)
	local UseSignalStateResult1 = SignalsReactModule.useSignalState(getShopGlobalStatusIndicatorEnabled)
	ReactModule.useEffect(function() --[[ Line: 105 ]]
		-- upvalues: EnabledResult1 (upval), InExperienceShopModule (upval)
		if not EnabledResult1 then return end
		return InExperienceShopModule.initShopGlobalIcon and InExperienceShopModule.initShopGlobalIcon() or function() --[[ Line: 110 ]] end
	end, {})
	local IsActive = (UseMappedSignal or function() --[[ Line: 116 ]]
		return nil
	end)(if UseSignalStateResult then NewResult1 else nil)
	local UseObservableValueModuleResult = UseObservableValueModule(if GamepadConnectorModule == nil then NewResult else GamepadConnectorModule:getShowTopBar())
	
	return if EnabledResult1 and UseSignalStateResult and ShopGlobalIcon then ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.fromOffset(0, p1.buttonSize),
		AutomaticSize = Enum.AutomaticSize.X,
		LayoutOrder = p1.layoutOrder
	}, {
		Icon = ReactModule.createElement(ShopGlobalIcon, {
			buttonSize = p1.buttonSize,
			leftGap = p1.leftGap,
			hidden = UseObservableValueModuleResult == false,
			showStatusIndicator = UseSignalStateResult1,
			onActivated = handleShopGlobalIconActivated,
			onAreaChanged = p1.onAreaChanged,
			isActive = IsActive,
			icon = if FFlagExperienceShopNewIconography or not CommonIconModule or not NewResult1 then nil else CommonIconModule("BuildingStore", nil, NewResult1)
		})
	}) else nil
end