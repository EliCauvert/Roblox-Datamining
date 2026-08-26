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

return function(p1)
	-- upvalues: cryoModule (ref), t (ref), reactModule (ref), setTimeout (ref), appStorageService (ref), useLocalization (ref), guiService (ref), clearTimeout (ref), withTooltip (ref), coreGuiService (ref), tooltipOrientation (ref)
	local var1 = cryoModule.Dictionary.union(t, p1)
	local var2, var3 = reactModule.useState(false)
	local var4, var5 = reactModule.useState(false)
	local var6 = reactModule.useRef(setTimeout(function() end, var1.showDelay))
	local var7 = reactModule.useRef(setTimeout(function() end, var1.dismissDelay))
	local var8 = not (reactModule.useMemo(function()
		-- upvalues: var1 (ref), appStorageService (copy)
		local var9 = false
		
		if var1.localStorageKey then
			local ok, status = pcall(function()
				-- upvalues: appStorageService (copy), var1 (copy)
				return appStorageService:GetItem(var1.localStorageKey)
			end)
			
			if ok then
				return status == "true"
			end
			var9 = true
		end
		return var9
	end, { var1.localStorageKey }) or var4)
	local var9 = var2 and var8
	local var10 = useLocalization({ headerText = var1.headerKey, bodyText = var1.bodyKey })
	local var11 = reactModule.useCallback(function(p2)
		-- upvalues: var1 (ref), var9 (ref), var5 (ref)
		if var1.onDismissed then
			var1.onDismissed(var9, p2)
		end
		var5(true)
	end, { var5, var9 })
	reactModule.useEffect(function()
		-- upvalues: guiService (copy), var8 (ref), var11 (ref), var1 (ref)
		local list = {
			guiService.MenuOpened:Connect(function()
				-- upvalues: var8 (copy), var11 (copy)
				if var8 then
					var11("menuOpened")
				end
			end),
			var1.iconClickedSignal:connect(function()
				-- upvalues: var8 (copy), var11 (copy)
				if var8 then
					var11("chatIconClicked")
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
		var1.iconClickedSignal,
		var8,
		var11
	})
	reactModule.useEffect(function()
		-- upvalues: clearTimeout (copy), var6 (ref), var8 (ref), setTimeout (copy), var3 (ref), var1 (ref)
		clearTimeout(var6.current)
		
		if var8 then
			var6.current = setTimeout(function()
				-- upvalues: var8 (copy), var3 (copy)
				if var8 then
					var3(true)
				end
			end, var1.showDelay)
		end
	end, { var8, var6 })
	reactModule.useEffect(function()
		-- upvalues: clearTimeout (copy), var7 (ref), var2 (ref), setTimeout (copy), var11 (ref), var1 (ref)
		clearTimeout(var7.current)
		
		if var2 then
			var7.current = setTimeout(function()
				-- upvalues: var11 (copy)
				var11("timeout")
			end, var1.dismissDelay)
		end
	end, { var2, var7 })
	reactModule.useEffect(function()
		-- upvalues: var9 (ref), var1 (ref), appStorageService (copy)
		if var9 and var1.localStorageKey then
			pcall(function()
				-- upvalues: appStorageService (copy), var1 (copy)
				appStorageService:SetItem(var1.localStorageKey, "true")
			end)
		end
	end, { var9, var1.localStorageKey })
	
	return withTooltip({ headerText = var10.headerText, bodyText = var10.bodyText }, {
		DisplayOrder = 10,
		active = var9,
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