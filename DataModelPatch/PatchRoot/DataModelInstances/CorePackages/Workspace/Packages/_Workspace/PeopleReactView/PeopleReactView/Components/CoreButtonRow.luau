local PeopleReactView = script:FindFirstAncestor("PeopleReactView")
local Parent = PeopleReactView.Parent
local ReactModule = require(Parent.React)
local PeopleServiceModule = require(Parent.PeopleService)
local View = require(Parent.Foundation).View
local CoreButtonModule = require(PeopleReactView.Components.Buttons.CoreButton)
local CoreButtonConfigsModule = require(PeopleReactView.Configs.CoreButtonConfigs)
local GetFFlagAddPeoplePageCardLayoutFunction = PeopleServiceModule.getService("Flags").GetFFlagAddPeoplePageCardLayout

local function MemoizedButton(p1)
	-- upvalues: ReactModule (copy), CoreButtonModule (copy)
	local Config = p1.config
	local UseResult = ReactModule.useCallback(function(p2)
		-- upvalues: p1 (copy), Config (copy)
		p1.onButtonMount(p2, Config.id)
	end, { p1.onButtonMount, Config.id })
	
	return ReactModule.useMemo(function()
		-- upvalues: ReactModule (upval), CoreButtonModule (upval), Config (copy), UseResult (copy)
		return ReactModule.createElement(CoreButtonModule, {
			text = Config.text,
			icon = { on = Config.onIcon, off = Config.offIcon },
			animatedIcon = Config.animatedIcon,
			buttonState = Config.buttonState,
			isNewIcon = Config.isNewIcon,
			LayoutOrder = Config.layoutOrder,
			onActivated = Config.onActivated,
			onMount = UseResult
		})
	end, {
		Config.text, Config.onIcon, Config.offIcon, Config.animatedIcon,
		Config.buttonState, Config.isNewIcon, Config.layoutOrder, Config.onActivated,
		UseResult
	})
end

return function(Frame)
	-- upvalues: CoreButtonConfigsModule (copy), ReactModule (copy), PeopleServiceModule (copy), MemoizedButton (copy), View (copy), GetFFlagAddPeoplePageCardLayoutFunction (copy)
	local CoreButtonConfigsModuleResult = CoreButtonConfigsModule(Frame.chromeEnabled, Frame.buttonActivatedTable)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: PeopleServiceModule (upval)
		return PeopleServiceModule.getService("FocusNavigationService")
	end, {})
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef({})
	local UseResult = ReactModule.useCallback(function(p1, p2)
		-- upvalues: UseRefResult1 (copy)
		if p1 then
			UseRefResult1.current[p2] = p1
			
			return
		else
			UseRefResult1.current[p2] = nil
		end
	end, {})
	local UseResult1 = ReactModule.useCallback(function(Current)
		-- upvalues: UseRefResult (copy), PeopleServiceModule (upval), UseMemoResult (copy)
		UseRefResult.current = Current
		
		if Current then
			UseMemoResult.registerScrollCallback(-1, function()
				-- upvalues: PeopleServiceModule (upval), UseRefResult (upval)
				local HubRefResult = PeopleServiceModule.getService("SettingsHubService").hubRef()
				
				if HubRefResult and HubRefResult.ScrollToFrame and UseRefResult.current then
					HubRefResult:ScrollToFrame(UseRefResult.current, true)
				end
			end)
		end
	end, { UseMemoResult })
	ReactModule.useEffect(function()
		-- upvalues: CoreButtonConfigsModuleResult (copy), UseRefResult1 (copy), UseMemoResult (copy)
		local List = {}
		
		for _, value in ipairs(CoreButtonConfigsModuleResult) do
			if value.shouldShow() then
				local CurrentEntry = UseRefResult1.current[value.id]
				
				if CurrentEntry then
					table.insert(List, CurrentEntry)
				end
			end
		end
		if #List > 0 then
			table.sort(List, function(A, B): boolean
				return A.LayoutOrder < B.LayoutOrder
			end)
			UseMemoResult.registerButtonRow(-1, List, 0)
		end
	end, {
		UseMemoResult,
		(ReactModule.useMemo(function(): string
			-- upvalues: CoreButtonConfigsModuleResult (copy)
			local List = {}
			
			for _, value in ipairs(CoreButtonConfigsModuleResult) do
				if value.shouldShow() then
					table.insert(List, value.id)
				end
			end
			table.sort(List)
			
			return table.concat(List, ",")
		end, { CoreButtonConfigsModuleResult }))
	})
	ReactModule.useEffect(function()
		-- upvalues: UseMemoResult (copy)
		return function()
			-- upvalues: UseMemoResult (upval)
			UseMemoResult.unregisterScrollCallback(-1)
			UseMemoResult.unregisterButtonRow(-1)
		end
	end, { UseMemoResult })
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: CoreButtonConfigsModuleResult (copy), ReactModule (upval), MemoizedButton (upval), UseResult (copy)
		local Elements = {}
		
		for _, Config in ipairs(CoreButtonConfigsModuleResult) do
			if Config.shouldShow() then
				table.insert(Elements, ReactModule.createElement(MemoizedButton, {
					key = Config.id,
					config = Config,
					onButtonMount = UseResult
				}))
			end
		end
		return Elements
	end, { CoreButtonConfigsModuleResult, UseResult })
	
	if #UseMemoResult1 == 0 then
		return nil
	end
	local function _()
		-- upvalues: UseMemoResult1 (copy)
		local t = {}
		
		for i, value in ipairs(UseMemoResult1) do
			t["Button" .. i] = value
		end
		return t
	end
	
	local CreateElementFunction = ReactModule.createElement
	local config = {
		tag = "size-full-0 auto-y row gap-large",
		LayoutOrder = if GetFFlagAddPeoplePageCardLayoutFunction() then Frame.LayoutOrder else 1,
		ref = UseResult1
	}
	local t = {}
	local t1 = {}
	
	for i, value in ipairs(UseMemoResult1) do
		t1["Button" .. i] = value
	end
	t[1] = t1
	
	return CreateElementFunction(View, config, t)
end