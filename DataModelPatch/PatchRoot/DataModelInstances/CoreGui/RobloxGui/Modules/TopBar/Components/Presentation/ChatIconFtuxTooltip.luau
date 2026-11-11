local CorePackages = game:GetService("CorePackages")
local GuiService = game:GetService("GuiService")
local CoreGui = game:GetService("CoreGui")
local AppStorageService = game:GetService("AppStorageService")
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local ReactModule = require(CorePackages.Packages.React)
local CryoModule = require(CorePackages.Packages.Cryo)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local WithTooltipFunction = UIBloxModule.App.Dialog.TooltipV2.withTooltip
local TooltipOrientation = UIBloxModule.App.Dialog.Enum.TooltipOrientation
local _ = require(CorePackages.Workspace.Packages.AppCommonLib).Signal
local LuauPolyfillModule = require(CorePackages.Packages.LuauPolyfill)
local ClearTimeoutFunction = LuauPolyfillModule.clearTimeout
local SetTimeoutFunction = LuauPolyfillModule.setTimeout
local config = {
	showDelay = 1000,
	dismissDelay = 7000,
	onDismissed = function(_, _) end
}

return function(p1)
	-- upvalues: CryoModule (copy), config (copy), ReactModule (copy), SetTimeoutFunction (copy), AppStorageService (copy), UseLocalizationFunction (copy), GuiService (copy), ClearTimeoutFunction (copy), WithTooltipFunction (copy), CoreGui (copy), TooltipOrientation (copy)
	local UnionResult = CryoModule.Dictionary.union(config, p1)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local UseRefResult = ReactModule.useRef(SetTimeoutFunction(function() end, UnionResult.showDelay))
	local UseRefResult1 = ReactModule.useRef(SetTimeoutFunction(function() end, UnionResult.dismissDelay))
	local Inverted = not (ReactModule.useMemo(function(): boolean
		-- upvalues: UnionResult (copy), AppStorageService (upval)
		local Flag = false
		
		if UnionResult.localStorageKey then
			local Success, Result = pcall(function()
				-- upvalues: AppStorageService (upval), UnionResult (upval)
				return AppStorageService:GetItem(UnionResult.localStorageKey)
			end)
			
			if Success then
				return Result == "true"
			end
			Flag = true
		end
		return Flag
	end, { UnionResult.localStorageKey }) or UseStateResult1)
	local Inverted1: boolean = UseStateResult and Inverted
	local UseLocalizationResult = UseLocalizationFunction({
		headerText = UnionResult.headerKey,
		bodyText = UnionResult.bodyKey
	})
	local UseResult = ReactModule.useCallback(function(p2)
		-- upvalues: UnionResult (copy), Inverted1 (copy), UseStateResult2_1 (copy)
		if UnionResult.onDismissed then
			UnionResult.onDismissed(Inverted1, p2)
		end
		UseStateResult2_1(true)
	end, { UseStateResult2_1, Inverted1 })
	ReactModule.useEffect(function()
		-- upvalues: GuiService (upval), Inverted (copy), UseResult (copy), UnionResult (copy)
		local Connections = {
			GuiService.MenuOpened:Connect(function()
				-- upvalues: Inverted (upval), UseResult (upval)
				if Inverted then
					UseResult("menuOpened")
				end
			end),
			UnionResult.iconClickedSignal:connect(function()
				-- upvalues: Inverted (upval), UseResult (upval)
				if Inverted then
					UseResult("chatIconClicked")
				end
			end)
		}
		
		return function()
			-- upvalues: Connections (copy)
			for _, connection in Connections do
				if connection.disconnect then
					connection:disconnect()
				elseif connection.Disconnect then
					connection:Disconnect()
				end
			end
		end
	end, {
		GuiService.MenuOpened,
		UnionResult.iconClickedSignal,
		Inverted,
		UseResult
	})
	ReactModule.useEffect(function()
		-- upvalues: ClearTimeoutFunction (upval), UseRefResult (copy), Inverted (copy), SetTimeoutFunction (upval), UseStateResult2 (copy), UnionResult (copy)
		ClearTimeoutFunction(UseRefResult.current)
		
		if Inverted then
			UseRefResult.current = SetTimeoutFunction(function()
				-- upvalues: Inverted (upval), UseStateResult2 (upval)
				if Inverted then
					UseStateResult2(true)
				end
			end, UnionResult.showDelay)
		end
	end, { Inverted, UseRefResult })
	ReactModule.useEffect(function()
		-- upvalues: ClearTimeoutFunction (upval), UseRefResult1 (copy), UseStateResult (copy), SetTimeoutFunction (upval), UseResult (copy), UnionResult (copy)
		ClearTimeoutFunction(UseRefResult1.current)
		
		if UseStateResult then
			UseRefResult1.current = SetTimeoutFunction(function()
				-- upvalues: UseResult (upval)
				UseResult("timeout")
			end, UnionResult.dismissDelay)
		end
	end, { UseStateResult, UseRefResult1 })
	ReactModule.useEffect(function()
		-- upvalues: Inverted1 (copy), UnionResult (copy), AppStorageService (upval)
		if Inverted1 and UnionResult.localStorageKey then
			pcall(function()
				-- upvalues: AppStorageService (upval), UnionResult (upval)
				AppStorageService:SetItem(UnionResult.localStorageKey, "true")
			end)
		end
	end, { Inverted1, UnionResult.localStorageKey })
	
	return WithTooltipFunction({
		headerText = UseLocalizationResult.headerText,
		bodyText = UseLocalizationResult.bodyText
	}, {
		DisplayOrder = 10,
		active = Inverted1,
		guiTarget = CoreGui,
		preferredOrientation = TooltipOrientation.Bottom
	}, function(p2)
		-- upvalues: ReactModule (upval)
		return ReactModule.createElement("Frame", {
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundTransparency = 1,
			[ReactModule.Change.AbsoluteSize] = p2,
			[ReactModule.Change.AbsolutePosition] = p2
		})
	end)
end