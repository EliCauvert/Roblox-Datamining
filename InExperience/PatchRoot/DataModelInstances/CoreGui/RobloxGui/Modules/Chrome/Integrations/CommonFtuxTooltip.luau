local Chrome = script:FindFirstAncestor("Chrome")
local CorePackages = game:GetService("CorePackages")
local GuiService = game:GetService("GuiService")
local UserInputService = game:GetService("UserInputService")
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local ReactModule = require(CorePackages.Packages.React)
local CryoModule = require(CorePackages.Packages.Cryo)
local ServiceModule = require(Chrome.Service)
local LocalStoreModule = require(Chrome.ChromeShared.Service.LocalStore)
local TooltipContextModule = require(Chrome.ChromeShared.Unibar.Tooltips.TooltipContext)
local _ = require(Chrome.ChromeShared.Unibar.Tooltips.TooltipProvider)
local UseIsTooltipTurnModule = require(Chrome.ChromeShared.Unibar.Tooltips.useIsTooltipTurn)
local MenuIconHoveredSignalModule = require(Chrome.Parent.TopBar.Components.Presentation.menuIconHoveredSignal)
local FtuxTooltipAnchorModule = require(Chrome.Integrations.FtuxTooltipAnchor)
local config = {
	id = nil,
	priority = 1,
	showDelay = 3000,
	dismissDelay = 5000,
	onDismissed = function(_, _) end
}

local function v14(p1)
	-- upvalues: ReactModule (copy), TooltipContextModule (copy), UseIsTooltipTurnModule (copy), LocalStoreModule (copy), UseLocalizationFunction (copy), UserInputService (copy), config (copy), ServiceModule (copy), GuiService (copy), MenuIconHoveredSignalModule (copy), FtuxTooltipAnchorModule (copy)
	local UseRefResult = ReactModule.useRef(nil)
	local UseStateResult, _ = ReactModule.useState(false)
	local UseStateResult1, UseStateResult2 = ReactModule.useState(false)
	local UseContextResult = ReactModule.useContext(TooltipContextModule)
	local UseIsTooltipTurnModuleResult = UseIsTooltipTurnModule(p1.id) or false
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: p1 (copy), LocalStoreModule (upval)
		return p1.localStorageKey and LocalStoreModule.getValue(p1.localStorageKey) or false
	end, { p1.localStorageKey })
	local NoUseStateResult1: boolean = p1.isIconVisible and (not UseMemoResult and not UseStateResult1)
	local UseIsTooltipTurnModuleResult1 = NoUseStateResult1 and UseIsTooltipTurnModuleResult
	local UseLocalizationResult = UseLocalizationFunction({ headerText = p1.headerKey, bodyText = p1.bodyKey })
	local UseResult = ReactModule.useCallback(function(p2)
		-- upvalues: p1 (copy), UseIsTooltipTurnModuleResult1 (copy), UseStateResult2 (copy), UseContextResult (copy)
		if p1.onDismissed then
			p1.onDismissed(UseIsTooltipTurnModuleResult1, p2)
		end
		UseStateResult2(true)
		
		if UseContextResult and p1.id then
			UseContextResult.dismissTooltip(p1.id, p2)
		end
	end, { UseStateResult2, UseIsTooltipTurnModuleResult1 })
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), UseStateResult (copy), UseStateResult1 (copy), UserInputService (upval), UseRefResult (copy), NoUseStateResult1 (copy), UseResult (copy)
		local InputBeganConnection = if p1.dismissOnOutsideInput and UseStateResult and not UseStateResult1 then UserInputService.InputBegan:Connect(function(Input)
			-- upvalues: UseRefResult (upval), NoUseStateResult1 (upval), UseResult (upval)
			if (Input.UserInputType == Enum.UserInputType.Touch or Input.UserInputType == Enum.UserInputType.MouseButton1) and UseRefResult.current ~= nil then
				local Position = Input.Position
				local AbsolutePosition = UseRefResult.current.AbsolutePosition
				local AbsoluteSize = UseRefResult.current.AbsoluteSize
				
				if NoUseStateResult1 and (AbsolutePosition.X > Position.X or Position.X > AbsolutePosition.X + AbsoluteSize.X or AbsolutePosition.Y > Position.Y or Position.Y > AbsolutePosition.Y + AbsoluteSize.Y) then
					UseResult("outsideInput")
				end
			end
		end) else nil
		
		return function()
			-- upvalues: InputBeganConnection (ref)
			if InputBeganConnection then
				InputBeganConnection:Disconnect()
				InputBeganConnection = nil
			end
		end
	end, { UseStateResult1, UseStateResult, NoUseStateResult1 })
	ReactModule.useEffect(function()
		-- upvalues: UseContextResult (copy), p1 (copy), NoUseStateResult1 (copy), config (upval)
		if UseContextResult and p1.id and NoUseStateResult1 then
			UseContextResult.registerTooltip(p1.id, p1.priority, p1.showDelay or config.showDelay, p1.dismissDelay or config.dismissDelay)
		end
		return function()
			-- upvalues: UseContextResult (upval), p1 (upval), NoUseStateResult1 (upval)
			if UseContextResult and p1.id and NoUseStateResult1 then
				UseContextResult.unregisterTooltip(p1.id)
			end
		end
	end, { NoUseStateResult1, p1.id })
	ReactModule.useEffect(function()
		-- upvalues: ServiceModule (upval), NoUseStateResult1 (copy), UseResult (copy), GuiService (upval), MenuIconHoveredSignalModule (upval)
		local Connections = {
			ServiceModule:onIntegrationActivated():connect(function()
				-- upvalues: NoUseStateResult1 (upval), UseResult (upval)
				if NoUseStateResult1 then
					UseResult("unibarActivated")
				end
			end),
			ServiceModule:onIntegrationHovered():connect(function()
				-- upvalues: NoUseStateResult1 (upval), UseResult (upval)
				if NoUseStateResult1 then
					UseResult("unibarHovered")
				end
			end),
			GuiService.MenuOpened:Connect(function()
				-- upvalues: NoUseStateResult1 (upval), UseResult (upval)
				if NoUseStateResult1 then
					UseResult("menuOpened")
				end
			end),
			MenuIconHoveredSignalModule:connect(function(p2)
				-- upvalues: NoUseStateResult1 (upval), UseResult (upval)
				if NoUseStateResult1 and p2 then
					UseResult("menuIconHovered")
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
		ServiceModule,
		GuiService,
		MenuIconHoveredSignalModule,
		NoUseStateResult1,
		UseResult
	})
	ReactModule.useEffect(function()
		-- upvalues: UseIsTooltipTurnModuleResult1 (copy), p1 (copy), LocalStoreModule (upval)
		if UseIsTooltipTurnModuleResult1 and p1.localStorageKey then
			LocalStoreModule.storeForLocalPlayer(p1.localStorageKey, true)
		end
	end, { UseIsTooltipTurnModuleResult1, p1.localStorageKey })
	
	return ReactModule.createElement(FtuxTooltipAnchorModule, {
		ref = UseRefResult,
		bodyText = UseLocalizationResult.bodyText,
		headerText = UseLocalizationResult.headerText,
		shouldShowTooltip = UseIsTooltipTurnModuleResult1
	})
end

return function(p2)
	-- upvalues: CryoModule (copy), config (copy), ReactModule (copy), v14 (copy)
	return ReactModule.createElement(v14, (CryoModule.Dictionary.union(config, p2)))
end