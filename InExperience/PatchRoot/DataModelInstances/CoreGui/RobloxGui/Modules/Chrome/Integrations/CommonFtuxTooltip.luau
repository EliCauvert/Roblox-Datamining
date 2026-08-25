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

local var13 = function(p0)
	-- upvalues: reactModule (ref), tooltipContextModule (ref), useIsTooltipTurnModule (ref), localStoreModule (ref), useLocalization (ref), userInputService (ref), t (ref), serviceModule (ref), guiService (ref), menuIconHoveredSignalModule (ref), ftuxTooltipAnchorModule (ref)
	local var14 = reactModule.useRef(nil)
	local var15, _ = reactModule.useState(false)
	local var16, var17 = reactModule.useState(false)
	local var18 = reactModule.useContext(tooltipContextModule)
	local var19 = p0.isIconVisible and (not reactModule.useMemo(function()
		-- upvalues: p0 (ref), localStoreModule (copy)
		return if p0.localStorageKey then localStoreModule.getValue(p0.localStorageKey) or false else false
	end, { p0.localStorageKey }) and not var16)
	local id = var19 and (useIsTooltipTurnModule(p0.id) or false)
	local var21 = useLocalization({ headerText = p0.headerKey, bodyText = p0.bodyKey })
	local var22 = reactModule.useCallback(function(p1)
		-- upvalues: p0 (ref), id (ref), var17 (ref), var18 (ref)
		if p0.onDismissed then
			p0.onDismissed(id, p1)
		end
		var17(true)
		
		if var18 and p0.id then
			var18.dismissTooltip(p0.id, p1)
		end
	end, { var17, id })
	reactModule.useEffect(function()
		-- upvalues: p0 (ref), var15 (ref), var16 (ref), userInputService (copy), var14 (ref), var19 (ref), var22 (ref)
		local var23 = if p0.dismissOnOutsideInput and var15 and not var16 then userInputService.InputBegan:Connect(function(p2)
			-- upvalues: var14 (copy), var19 (copy), var22 (copy)
			if (p2.UserInputType == Enum.UserInputType.Touch or p2.UserInputType == Enum.UserInputType.MouseButton1) and var14.current ~= nil then
				local position = p2.Position
				local absolutePosition = var14.current.AbsolutePosition
				local absoluteSize = var14.current.AbsoluteSize
				
				if var19 and (absolutePosition.X > position.X or position.X > absolutePosition.X + absoluteSize.X or (absolutePosition.Y > position.Y or position.Y > absolutePosition.Y + absoluteSize.Y)) then
					var22("outsideInput")
				end
			end
		end) else nil
		
		return function()
			-- upvalues: var23 (write)
			if var23 then
				var23:Disconnect()
				var23 = nil
			end
		end
	end, { var16, var15, var19 })
	reactModule.useEffect(function()
		-- upvalues: var18 (ref), p0 (ref), var19 (ref), t (copy)
		if var18 and p0.id and var19 then
			var18.registerTooltip(p0.id, p0.priority, p0.showDelay or t.showDelay, p0.dismissDelay or t.dismissDelay)
		end
		return function()
			-- upvalues: var18 (copy), p0 (copy), var19 (copy)
			if var18 and p0.id and var19 then
				var18.unregisterTooltip(p0.id)
			end
		end
	end, { var19, p0.id })
	reactModule.useEffect(function()
		-- upvalues: serviceModule (copy), var19 (ref), var22 (ref), guiService (copy), menuIconHoveredSignalModule (copy)
		local list = {
			serviceModule:onIntegrationActivated():connect(function()
				-- upvalues: var19 (copy), var22 (copy)
				if var19 then
					var22("unibarActivated")
				end
			end),
			serviceModule:onIntegrationHovered():connect(function()
				-- upvalues: var19 (copy), var22 (copy)
				if var19 then
					var22("unibarHovered")
				end
			end),
			guiService.MenuOpened:Connect(function()
				-- upvalues: var19 (copy), var22 (copy)
				if var19 then
					var22("menuOpened")
				end
			end),
			menuIconHoveredSignalModule:connect(function(p3)
				-- upvalues: var19 (copy), var22 (copy)
				if var19 and p3 then
					var22("menuIconHovered")
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
		var19,
		var22
	})
	reactModule.useEffect(function()
		-- upvalues: id (ref), p0 (ref), localStoreModule (copy)
		if id and p0.localStorageKey then
			localStoreModule.storeForLocalPlayer(p0.localStorageKey, true)
		end
	end, { id, p0.localStorageKey })
	
	return reactModule.createElement(ftuxTooltipAnchorModule, {
		ref = var14,
		bodyText = var21.bodyText,
		headerText = var21.headerText,
		shouldShowTooltip = id
	})
end

return function(p4)
	-- upvalues: cryoModule (ref), t (ref), reactModule (ref), var13 (ref)
	return reactModule.createElement(var13, cryoModule.Dictionary.union(t, p4))
end