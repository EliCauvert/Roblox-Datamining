local corePackagesService = game:GetService("CorePackages")
local guiService = game:GetService("GuiService")
local coreGuiService = game:GetService("CoreGui")
local appStorageService = game:GetService("AppStorageService")
local useLocalization = require(corePackagesService.Workspace.Packages.Localization).Hooks.useLocalization
local reactModule = require(corePackagesService.Packages.React)
local cryoModule = require(corePackagesService.Packages.Cryo)
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local withTooltip = UIBloxModule.App.Dialog.TooltipV2.withTooltip
local tooltipOrientation = UIBloxModule.App.Dialog.Enum.TooltipOrientation
local _ = require(corePackagesService.Workspace.Packages.AppCommonLib).Signal
local luauPolyfillModule = require(corePackagesService.Packages.LuauPolyfill)
local clearTimeout = luauPolyfillModule.clearTimeout
local setTimeout = luauPolyfillModule.setTimeout
local t = {
	showDelay = 1000,
	dismissDelay = 7000,
	onDismissed = function(_, _) end
}

return function(p0)
	-- upvalues: cryoModule (ref), t (ref), reactModule (ref), setTimeout (ref), appStorageService (ref), useLocalization (ref), guiService (ref), clearTimeout (ref), withTooltip (ref), coreGuiService (ref), tooltipOrientation (ref)
	local var9 = cryoModule.Dictionary.union(t, p0)
	local var10, var11 = reactModule.useState(false)
	local var12, var13 = reactModule.useState(false)
	local var14 = reactModule.useRef(setTimeout(function() end, var9.showDelay))
	local var15 = reactModule.useRef(setTimeout(function() end, var9.dismissDelay))
	local var16 = not (reactModule.useMemo(function()
		-- upvalues: var9 (ref), appStorageService (copy)
		local var20 = false
		
		if var9.localStorageKey then
			local ok, status = pcall(function()
				-- upvalues: appStorageService (copy), var9 (copy)
				return appStorageService:GetItem(var9.localStorageKey)
			end)
			
			if ok then
				return status == "true"
			end
			var20 = true
		end
		return var20
	end, { var9.localStorageKey }) or var12)
	local var16_1 = var10 and var16
	local var18 = useLocalization({ headerText = var9.headerKey, bodyText = var9.bodyKey })
	local var19 = reactModule.useCallback(function(p1)
		-- upvalues: var9 (ref), var16_1 (ref), var13 (ref)
		if var9.onDismissed then
			var9.onDismissed(var16_1, p1)
		end
		var13(true)
	end, { var13, var16_1 })
	reactModule.useEffect(function()
		-- upvalues: guiService (copy), var16 (ref), var19 (ref), var9 (ref)
		local list = {
			guiService.MenuOpened:Connect(function()
				-- upvalues: var16 (copy), var19 (copy)
				if var16 then
					var19("menuOpened")
				end
			end),
			var9.iconClickedSignal:connect(function()
				-- upvalues: var16 (copy), var19 (copy)
				if var16 then
					var19("chatIconClicked")
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
		guiService.MenuOpened,
		var9.iconClickedSignal,
		var16,
		var19
	})
	reactModule.useEffect(function()
		-- upvalues: clearTimeout (copy), var14 (ref), var16 (ref), setTimeout (copy), var11 (ref), var9 (ref)
		clearTimeout(var14.current)
		
		if var16 then
			var14.current = setTimeout(function()
				-- upvalues: var16 (copy), var11 (copy)
				if var16 then
					var11(true)
				end
			end, var9.showDelay)
		end
	end, { var16, var14 })
	reactModule.useEffect(function()
		-- upvalues: clearTimeout (copy), var15 (ref), var10 (ref), setTimeout (copy), var19 (ref), var9 (ref)
		clearTimeout(var15.current)
		
		if var10 then
			var15.current = setTimeout(function()
				-- upvalues: var19 (copy)
				var19("timeout")
			end, var9.dismissDelay)
		end
	end, { var10, var15 })
	reactModule.useEffect(function()
		-- upvalues: var16_1 (ref), var9 (ref), appStorageService (copy)
		if var16_1 and var9.localStorageKey then
			pcall(function()
				-- upvalues: appStorageService (copy), var9 (copy)
				appStorageService:SetItem(var9.localStorageKey, "true")
			end)
		end
	end, { var16_1, var9.localStorageKey })
	
	return withTooltip({ headerText = var18.headerText, bodyText = var18.bodyText }, {
		DisplayOrder = 10,
		active = var16_1,
		guiTarget = coreGuiService,
		preferredOrientation = tooltipOrientation.Bottom
	}, function(p2)
		-- upvalues: reactModule (copy)
		return reactModule.createElement("Frame", {
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundTransparency = 1,
			[reactModule.Change.AbsoluteSize] = p2,
			[reactModule.Change.AbsolutePosition] = p2
		})
	end)
end