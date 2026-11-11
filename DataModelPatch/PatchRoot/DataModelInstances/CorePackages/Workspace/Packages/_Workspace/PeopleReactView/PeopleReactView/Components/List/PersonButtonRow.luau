local PeopleReactView = script:FindFirstAncestor("PeopleReactView")
local Parent = PeopleReactView.Parent
local ReactModule = require(Parent.React)
local RobloxAppEnumsModule = require(Parent.RobloxAppEnums)
local PeopleServiceModule = require(Parent.PeopleService)
local View = require(Parent.Foundation).View
local PersonButtonModule = require(PeopleReactView.Components.Buttons.PersonButton)
local UseDeviceOrientationFunction = require(Parent.RobloxAppHooks).useDeviceOrientation
local PersonButtonConfigsModule = require(PeopleReactView.Configs.PersonButtonConfigs)
local GetFFlagAddPeoplePageCardLayoutFunction = PeopleServiceModule.getService("Flags").GetFFlagAddPeoplePageCardLayout

local function MemoizedButton(p1)
	-- upvalues: GetFFlagAddPeoplePageCardLayoutFunction (copy), ReactModule (copy), PeopleServiceModule (copy), PersonButtonModule (copy)
	local Config = p1.config
	local UseMemoResult = if GetFFlagAddPeoplePageCardLayoutFunction() then ReactModule.useMemo(function()
		-- upvalues: PeopleServiceModule (upval)
		return PeopleServiceModule.getService("Constants")
	end, {}) else nil
	local UseResult = ReactModule.useCallback(function(p2)
		-- upvalues: p1 (copy)
		p1.onButtonMount(p2, p1.buttonId)
	end, { p1.onButtonMount })
	local UseResult1 = if GetFFlagAddPeoplePageCardLayoutFunction() then ReactModule.useCallback(function()
		-- upvalues: Config (copy), UseMemoResult (copy)
		if Config.id == UseMemoResult.PERSON_BUTTONS.BLOCK_PLAYER then
			Config.onActivated("ingame_menu")
			
			return
		end
		if Config.id == UseMemoResult.PERSON_BUTTONS.REPORT_PLAYER then
			Config.onActivated("MenuPlayerList")
			
			return
		else
			Config.onActivated(UseMemoResult.ANALYTICS.ENTRY_POINT.PEOPLE_LIST)
		end
	end, { Config.id, Config.onActivated }) else nil
	
	return ReactModule.useMemo(function()
		-- upvalues: ReactModule (upval), PersonButtonModule (upval), Config (copy), GetFFlagAddPeoplePageCardLayoutFunction (upval), UseResult1 (copy), UseResult (copy)
		return ReactModule.createElement(PersonButtonModule, {
			text = Config.text,
			icon = { on = Config.onIcon, off = Config.offIcon },
			animatedIcon = Config.animatedIcon,
			buttonState = Config.buttonState,
			LayoutOrder = Config.layoutOrder,
			onActivated = if GetFFlagAddPeoplePageCardLayoutFunction() then UseResult1 else Config.onActivated,
			isGrayedOut = Config.isGrayedOut,
			isDisabled = Config.isDisabled,
			isBuilderIcon = Config.isBuilderIcon,
			buttonVariant = Config.buttonVariant,
			onMount = UseResult
		})
	end, {
		Config.text, Config.onIcon, Config.offIcon, Config.animatedIcon,
		Config.buttonState, Config.layoutOrder, Config.onActivated, Config.isGrayedOut,
		Config.isDisabled, Config.isBuilderIcon, Config.buttonVariant, UseResult
	})
end

return function(p1)
	-- upvalues: PersonButtonConfigsModule (copy), UseDeviceOrientationFunction (copy), RobloxAppEnumsModule (copy), ReactModule (copy), PeopleServiceModule (copy), GetFFlagAddPeoplePageCardLayoutFunction (copy), MemoizedButton (copy), View (copy)
	local PersonButtonConfigsModuleResult = PersonButtonConfigsModule(p1.userId)
	local IsUseDeviceOrientationResultMatch = UseDeviceOrientationFunction() == RobloxAppEnumsModule.DeviceOrientationMode.Portrait
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: PeopleServiceModule (upval)
		return PeopleServiceModule.getService("FocusNavigationService")
	end, {})
	local UseRefResult = ReactModule.useRef({})
	local UseResult = ReactModule.useCallback(function(p2, p3)
		-- upvalues: UseRefResult (copy)
		if p2 then
			UseRefResult.current[p3] = p2
			
			return
		else
			UseRefResult.current[p3] = nil
		end
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: GetFFlagAddPeoplePageCardLayoutFunction (upval), PersonButtonConfigsModuleResult (copy), UseRefResult (copy), p1 (copy), UseMemoResult (copy)
		local List = {}
		
		if GetFFlagAddPeoplePageCardLayoutFunction() then
			for _, value in PersonButtonConfigsModuleResult do
				if value.shouldShow() then
					local CurrentEntry = UseRefResult.current[value.id]
					
					if CurrentEntry then
						table.insert(List, CurrentEntry)
					end
				end
			end
		else
			for _, value1 in ipairs(PersonButtonConfigsModuleResult) do
				if value1.shouldShow() then
					local CurrentEntry = UseRefResult.current[value1.id]
					
					if CurrentEntry then
						table.insert(List, CurrentEntry)
					end
				end
			end
		end
		if #List > 0 then
			table.sort(List, function(A, B): boolean
				return A.LayoutOrder < B.LayoutOrder
			end)
			UseMemoResult.registerButtonRow(p1.userId, List, p1.index or 0)
		end
	end, {
		p1.userId,
		p1.index,
		UseMemoResult,
		(ReactModule.useMemo(function(): string
			-- upvalues: GetFFlagAddPeoplePageCardLayoutFunction (upval), PersonButtonConfigsModuleResult (copy)
			local List = {}
			
			if GetFFlagAddPeoplePageCardLayoutFunction() then
				for _, value in PersonButtonConfigsModuleResult do
					if value.shouldShow() then
						table.insert(List, value.id)
					end
				end
			else
				for _, value1 in ipairs(PersonButtonConfigsModuleResult) do
					if value1.shouldShow() then
						table.insert(List, value1.id)
					end
				end
			end
			table.sort(List)
			
			return table.concat(List, ",")
		end, { PersonButtonConfigsModuleResult }))
	})
	ReactModule.useEffect(function()
		-- upvalues: UseMemoResult (copy), p1 (copy)
		return function()
			-- upvalues: UseMemoResult (upval), p1 (upval)
			UseMemoResult.handlePersonRemoved(p1.userId)
			UseMemoResult.unregisterButtonRow(p1.userId)
		end
	end, { p1.userId, UseMemoResult })
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: UseMemoResult (copy), p1 (copy)
		return UseMemoResult.hasSelectablePlatformButton(p1.userId)
	end, { p1.userId, UseMemoResult })
	local UseMemoResult2 = ReactModule.useMemo(function()
		-- upvalues: UseMemoResult1 (copy)
		return if UseMemoResult1 then Enum.SelectionBehavior.Escape else Enum.SelectionBehavior.Stop
	end, { UseMemoResult1 })
	
	if not ReactModule.useMemo(function(): boolean
		-- upvalues: GetFFlagAddPeoplePageCardLayoutFunction (upval), PersonButtonConfigsModuleResult (copy)
		if GetFFlagAddPeoplePageCardLayoutFunction() then
			for _, value in PersonButtonConfigsModuleResult do
				if value.shouldShow() then
					return true
				end
			end
		else
			for _, value1 in ipairs(PersonButtonConfigsModuleResult) do
				if value1.shouldShow() then
					return true
				end
			end
		end
		return false
	end, { PersonButtonConfigsModuleResult }) then
		return nil
	end
	local Elements = {}
	
	if GetFFlagAddPeoplePageCardLayoutFunction() then
		for _, Config in PersonButtonConfigsModuleResult do
			if Config.shouldShow() then
				table.insert(Elements, ReactModule.createElement(MemoizedButton, {
					key = Config.id,
					config = Config,
					buttonId = Config.id,
					onButtonMount = UseResult
				}))
			end
		end
	else
		for _, Config1 in ipairs(PersonButtonConfigsModuleResult) do
			if Config1.shouldShow() then
				table.insert(Elements, ReactModule.createElement(MemoizedButton, {
					key = Config1.id,
					config = Config1,
					buttonId = Config1.id,
					onButtonMount = UseResult
				}))
			end
		end
	end
	return ReactModule.createElement(View, {
		LayoutOrder = 1,
		tag = {
			["auto-xy row"] = true,
			["gap-small"] = IsUseDeviceOrientationResultMatch,
			["gap-medium"] = not IsUseDeviceOrientationResultMatch
		},
		selectionGroup = {
			SelectionBehaviorLeft = UseMemoResult2,
			SelectionBehaviorRight = Enum.SelectionBehavior.Stop
		}
	}, Elements)
end