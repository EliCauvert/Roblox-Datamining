local PeopleReactView = script:FindFirstAncestor("PeopleReactView")
local Parent = PeopleReactView.Parent
local ReactModule = require(Parent.React)
local RobloxAppEnumsModule = require(Parent.RobloxAppEnums)
local PeopleServiceModule = require(Parent.PeopleService)
local View = require(Parent.Foundation).View
local PersonButtonModule = require(PeopleReactView.Components.Buttons.PersonButton)
local MuteVolumeButtonModule = require(PeopleReactView.Components.Buttons.MuteVolumeButton)
local UseDeviceOrientationFunction = require(Parent.RobloxAppHooks).useDeviceOrientation
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local PersonButtonConfigsModule = require(PeopleReactView.Configs.PersonButtonConfigs)
local PeoplePageLayoutContextModule = require(PeopleReactView.PeoplePageLayoutContext)
local SideSheetFocusContextModule = require(PeopleReactView.SideSheetFocusContext)
local GetPersonButtonRowSelectionBehaviorLeftModule = require(PeopleReactView.Utils.getPersonButtonRowSelectionBehaviorLeft)
local FlagsService = PeopleServiceModule.getService("Flags")
local GetFFlagAddPeoplePageCardLayoutFunction = FlagsService.GetFFlagAddPeoplePageCardLayout
local FFlagVoiceVolumeControlsPerUserPlayerListButton = FlagsService.FFlagVoiceVolumeControlsPerUserPlayerListButton
local FFlagSideSheetOpenPeoplePage = require(Parent.SharedFlags).FFlagSideSheetOpenPeoplePage
local FFlagPeopleListButtonOverflowModule = require(PeopleReactView.Flags.FFlagPeopleListButtonOverflow)

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
	-- upvalues: ReactModule (copy), PeoplePageLayoutContextModule (copy), PersonButtonConfigsModule (copy), FFlagPeopleListButtonOverflowModule (copy), UseDeviceOrientationFunction (copy), RobloxAppEnumsModule (copy), PeopleServiceModule (copy), FFlagVoiceVolumeControlsPerUserPlayerListButton (copy), UseSignalStateFunction (copy), GetFFlagAddPeoplePageCardLayoutFunction (copy), FFlagSideSheetOpenPeoplePage (copy), SideSheetFocusContextModule (copy), GetPersonButtonRowSelectionBehaviorLeftModule (copy), MuteVolumeButtonModule (copy), MemoizedButton (copy), View (copy)
	local UseContextResult = ReactModule.useContext(PeoplePageLayoutContextModule)
	local PersonButtonConfigsModuleResult = PersonButtonConfigsModule(p1.userId, if FFlagPeopleListButtonOverflowModule then UseContextResult.isCompact else false)
	local IsUseDeviceOrientationResultMatch = UseDeviceOrientationFunction() == RobloxAppEnumsModule.DeviceOrientationMode.Portrait or FFlagPeopleListButtonOverflowModule and UseContextResult.isCompact
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: PeopleServiceModule (upval)
		return PeopleServiceModule.getService("FocusNavigationService")
	end, {})
	local UseMemoResult1 = if FFlagVoiceVolumeControlsPerUserPlayerListButton then ReactModule.useMemo(function()
		-- upvalues: PeopleServiceModule (upval)
		return PeopleServiceModule.getService("Constants")
	end, {}) else nil
	local UseMemoResult2 = if FFlagVoiceVolumeControlsPerUserPlayerListButton then ReactModule.useMemo(function()
		-- upvalues: PeopleServiceModule (upval)
		return PeopleServiceModule.getService("PeopleVoiceChatStore")
	end, {}) else nil
	local UseSignalStateResult = if FFlagVoiceVolumeControlsPerUserPlayerListButton then UseSignalStateFunction(UseMemoResult2.getShowVolumeControl) else false
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
	local UseMemoResult3 = ReactModule.useMemo(function(): string
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
	end, { PersonButtonConfigsModuleResult })
	ReactModule.useEffect(function()
		-- upvalues: FFlagVoiceVolumeControlsPerUserPlayerListButton (upval), UseRefResult (copy), UseSignalStateResult (copy), UseMemoResult1 (copy), GetFFlagAddPeoplePageCardLayoutFunction (upval), PersonButtonConfigsModuleResult (copy), p1 (copy), UseMemoResult (copy)
		local List = {}
		
		if FFlagVoiceVolumeControlsPerUserPlayerListButton then
			local function _(p2)
				-- upvalues: UseRefResult (upval), List (copy), UseSignalStateResult (upval), UseMemoResult1 (upval)
				if not p2.shouldShow() then return end
				local CurrentEntry = UseRefResult.current[p2.id]
				
				if CurrentEntry then
					table.insert(List, CurrentEntry)
				end
				if UseSignalStateResult and p2.id == UseMemoResult1.PERSON_BUTTONS.MUTE_PLAYER then
					local CurrentEntry1 = UseRefResult.current[p2.id .. "_volume"]
					
					if CurrentEntry1 then
						table.insert(List, CurrentEntry1)
					end
				end
			end
			
			if GetFFlagAddPeoplePageCardLayoutFunction() then
				for _, value in PersonButtonConfigsModuleResult do
					if value.shouldShow() then
						local CurrentEntry = UseRefResult.current[value.id]
						
						if CurrentEntry then
							table.insert(List, CurrentEntry)
						end
						if UseSignalStateResult and value.id == UseMemoResult1.PERSON_BUTTONS.MUTE_PLAYER then
							local CurrentEntry1 = UseRefResult.current[value.id .. "_volume"]
							
							if CurrentEntry1 then
								table.insert(List, CurrentEntry1)
							end
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
						if UseSignalStateResult and value1.id == UseMemoResult1.PERSON_BUTTONS.MUTE_PLAYER then
							local CurrentEntry2 = UseRefResult.current[value1.id .. "_volume"]
							
							if CurrentEntry2 then
								table.insert(List, CurrentEntry2)
							end
						end
					end
				end
			end
		elseif GetFFlagAddPeoplePageCardLayoutFunction() then
			for _, value2 in PersonButtonConfigsModuleResult do
				if value2.shouldShow() then
					local CurrentEntry = UseRefResult.current[value2.id]
					
					if CurrentEntry then
						table.insert(List, CurrentEntry)
					end
				end
			end
		else
			for _, value3 in ipairs(PersonButtonConfigsModuleResult) do
				if value3.shouldShow() then
					local CurrentEntry = UseRefResult.current[value3.id]
					
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
	end, if FFlagVoiceVolumeControlsPerUserPlayerListButton then {
		p1.userId,
		p1.index,
		UseMemoResult,
		UseMemoResult3,
		UseSignalStateResult
	} else { p1.userId, p1.index, UseMemoResult, UseMemoResult3 })
	ReactModule.useEffect(function()
		-- upvalues: UseMemoResult (copy), p1 (copy)
		return function()
			-- upvalues: UseMemoResult (upval), p1 (upval)
			UseMemoResult.handlePersonRemoved(p1.userId)
			UseMemoResult.unregisterButtonRow(p1.userId)
		end
	end, { p1.userId, UseMemoResult })
	local UseMemoResult4 = ReactModule.useMemo(function()
		-- upvalues: UseMemoResult (copy), p1 (copy)
		return UseMemoResult.hasSelectablePlatformButton(p1.userId)
	end, { p1.userId, UseMemoResult })
	local UseContextResult1 = if FFlagSideSheetOpenPeoplePage then ReactModule.useContext(SideSheetFocusContextModule) else false
	local UseMemoResult5 = ReactModule.useMemo(function()
		-- upvalues: FFlagSideSheetOpenPeoplePage (upval), GetPersonButtonRowSelectionBehaviorLeftModule (upval), UseMemoResult4 (copy), UseContextResult1 (copy)
		return if FFlagSideSheetOpenPeoplePage then GetPersonButtonRowSelectionBehaviorLeftModule(UseMemoResult4, UseContextResult1) elseif UseMemoResult4 then Enum.SelectionBehavior.Escape else Enum.SelectionBehavior.Stop
	end, { UseContextResult1, UseMemoResult4 })
	
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
		for _, Config1 in PersonButtonConfigsModuleResult do
			if Config1.shouldShow() then
				if FFlagVoiceVolumeControlsPerUserPlayerListButton and UseSignalStateResult and Config1.id == UseMemoResult1.PERSON_BUTTONS.MUTE_PLAYER then
					table.insert(Elements, ReactModule.createElement(MuteVolumeButtonModule, {
						key = Config1.id,
						config = Config1,
						userId = p1.userId,
						entryPoint = UseMemoResult1.ANALYTICS.ENTRY_POINT.PEOPLE_LIST,
						muteButtonName = Config1.id,
						volumeButtonName = Config1.id .. "_volume",
						onButtonMount = UseResult
					}))
				else
					table.insert(Elements, ReactModule.createElement(MemoizedButton, {
						key = Config1.id,
						config = Config1,
						buttonId = Config1.id,
						onButtonMount = UseResult
					}))
				end
			end
		end
	else
		for _, Config in ipairs(PersonButtonConfigsModuleResult) do
			if Config.shouldShow() then
				if FFlagVoiceVolumeControlsPerUserPlayerListButton and (UseSignalStateResult and Config.id == UseMemoResult1.PERSON_BUTTONS.MUTE_PLAYER) then
					table.insert(Elements, ReactModule.createElement(MuteVolumeButtonModule, {
						key = Config.id,
						config = Config,
						userId = p1.userId,
						entryPoint = UseMemoResult1.ANALYTICS.ENTRY_POINT.PEOPLE_LIST,
						muteButtonName = Config.id,
						volumeButtonName = Config.id .. "_volume",
						onButtonMount = UseResult
					}))
				else
					table.insert(Elements, ReactModule.createElement(MemoizedButton, {
						key = Config.id,
						config = Config,
						buttonId = Config.id,
						onButtonMount = UseResult
					}))
				end
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
			SelectionBehaviorLeft = UseMemoResult5,
			SelectionBehaviorRight = Enum.SelectionBehavior.Stop
		}
	}, Elements)
end