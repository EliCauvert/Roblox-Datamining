local chrome = script:FindFirstAncestor("Chrome")
local corePackagesService = game:GetService("CorePackages")
local guiService = game:GetService("GuiService")
local userInputService = game:GetService("UserInputService")
local useLocalization = require(corePackagesService.Workspace.Packages.Localization).Hooks.useLocalization
local reactModule = require(corePackagesService.Packages.React)
local cryoModule = require(corePackagesService.Packages.Cryo)
local serviceModule = require(chrome.Service)
local localStoreModule = require(chrome.ChromeShared.Service.LocalStore)
local tooltipContextModule = require(chrome.ChromeShared.Unibar.Tooltips.TooltipContext)
local _ = require(chrome.ChromeShared.Unibar.Tooltips.TooltipProvider)
local useIsTooltipTurnModule = require(chrome.ChromeShared.Unibar.Tooltips.useIsTooltipTurn)
local menuIconHoveredSignalModule = require(chrome.Parent.TopBar.Components.Presentation.menuIconHoveredSignal)
local ftuxTooltipAnchorModule = require(chrome.Integrations.FtuxTooltipAnchor)
local t = {
	id = nil,
	priority = 1,
	showDelay = 3000,
	dismissDelay = 5000,
	onDismissed = function(_, _) end
}

local var1 = function(p1)
	-- upvalues: reactModule (ref), tooltipContextModule (ref), useIsTooltipTurnModule (ref), localStoreModule (ref), useLocalization (ref), userInputService (ref), t (ref), serviceModule (ref), guiService (ref), menuIconHoveredSignalModule (ref), ftuxTooltipAnchorModule (ref)
	local var2 = reactModule.useRef(nil)
	local var3, _ = reactModule.useState(false)
	local var4, var5 = reactModule.useState(false)
	local var6 = reactModule.useContext(tooltipContextModule)
	local var7 = p1.isIconVisible and (not reactModule.useMemo(function()
		-- upvalues: p1 (ref), localStoreModule (copy)
		return if p1.localStorageKey then localStoreModule.getValue(p1.localStorageKey) or false else false
	end, { p1.localStorageKey }) and not var4)
	local id = var7 and (useIsTooltipTurnModule(p1.id) or false)
	local var8 = useLocalization({ headerText = p1.headerKey, bodyText = p1.bodyKey })
	local var9 = reactModule.useCallback(function(p2)
		-- upvalues: p1 (ref), id (ref), var5 (ref), var6 (ref)
		if p1.onDismissed then
			p1.onDismissed(id, p2)
		end
		var5(true)
		
		if var6 and p1.id then
			var6.dismissTooltip(p1.id, p2)
		end
	end, { var5, id })
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var3 (ref), var4 (ref), userInputService (copy), var2 (ref), var7 (ref), var9 (ref)
		local var10 = if p1.dismissOnOutsideInput and var3 and not var4 then userInputService.InputBegan:Connect(function(p2)
			-- upvalues: var2 (copy), var7 (copy), var9 (copy)
			if (p2.UserInputType == Enum.UserInputType.Touch or p2.UserInputType == Enum.UserInputType.MouseButton1) and var2.current ~= nil then
				local position = p2.Position
				local absolutePosition = var2.current.AbsolutePosition
				local absoluteSize = var2.current.AbsoluteSize
				
				if var7 and (absolutePosition.X > position.X or position.X > absolutePosition.X + absoluteSize.X or (absolutePosition.Y > position.Y or position.Y > absolutePosition.Y + absoluteSize.Y)) then
					var9("outsideInput")
				end
			end
		end) else nil
		
		return function()
			-- upvalues: var10 (write)
			if var10 then
				var10:Disconnect()
				var10 = nil
			end
		end
	end, { var4, var3, var7 })
	reactModule.useEffect(function()
		-- upvalues: var6 (ref), p1 (ref), var7 (ref), t (copy)
		if var6 and p1.id and var7 then
			var6.registerTooltip(p1.id, p1.priority, p1.showDelay or t.showDelay, p1.dismissDelay or t.dismissDelay)
		end
		return function()
			-- upvalues: var6 (copy), p1 (copy), var7 (copy)
			if var6 and p1.id and var7 then
				var6.unregisterTooltip(p1.id)
			end
		end
	end, { var7, p1.id })
	reactModule.useEffect(function()
		-- upvalues: serviceModule (copy), var7 (ref), var9 (ref), guiService (copy), menuIconHoveredSignalModule (copy)
		local list = {
			serviceModule:onIntegrationActivated():connect(function()
				-- upvalues: var7 (copy), var9 (copy)
				if var7 then
					var9("unibarActivated")
				end
			end),
			serviceModule:onIntegrationHovered():connect(function()
				-- upvalues: var7 (copy), var9 (copy)
				if var7 then
					var9("unibarHovered")
				end
			end),
			guiService.MenuOpened:Connect(function()
				-- upvalues: var7 (copy), var9 (copy)
				if var7 then
					var9("menuOpened")
				end
			end),
			menuIconHoveredSignalModule:connect(function(p2)
				-- upvalues: var7 (copy), var9 (copy)
				if var7 and p2 then
					var9("menuIconHovered")
				end
			end)
		}
		
		return function()
			-- upvalues: list (ref)
			for i, v in list do
				if v.disconnect then
					v:disconnect()
				elseif v.Disconnect then
					v:Disconnect()
				end
			end
		end
	end, {
		serviceModule,
		guiService,
		menuIconHoveredSignalModule,
		var7,
		var9
	})
	reactModule.useEffect(function()
		-- upvalues: id (ref), p1 (ref), localStoreModule (copy)
		if id and p1.localStorageKey then
			localStoreModule.storeForLocalPlayer(p1.localStorageKey, true)
		end
	end, { id, p1.localStorageKey })
	
	return reactModule.createElement(ftuxTooltipAnchorModule, {
		ref = var2,
		bodyText = var8.bodyText,
		headerText = var8.headerText,
		shouldShowTooltip = id
	})
end

return function(p2)
	-- upvalues: cryoModule (ref), t (ref), reactModule (ref), var1 (ref)
	return reactModule.createElement(var1, cryoModule.Dictionary.union(t, p2))
end