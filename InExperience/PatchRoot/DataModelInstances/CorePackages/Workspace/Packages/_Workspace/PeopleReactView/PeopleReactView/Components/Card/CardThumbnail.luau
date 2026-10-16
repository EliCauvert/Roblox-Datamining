local PeopleReactView = script:FindFirstAncestor("PeopleReactView")
local Parent = PeopleReactView.Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local ResponsiveModule = require(Parent.Responsive)
local UsePreferredInputFunction = ResponsiveModule.usePreferredInput
local Input = ResponsiveModule.Input
local UseLastInputModeFunction = require(Parent.FocusNavigationUtils).useLastInputMode
local FoundationModule = require(Parent.Foundation)
local GetRbxThumbFunction = FoundationModule.Utility.getRbxThumb
local ControlState = FoundationModule.Enums.ControlState
local InputSize = FoundationModule.Enums.InputSize
local StateLayerAffordance = FoundationModule.Enums.StateLayerAffordance
local ThumbnailType = FoundationModule.Enums.ThumbnailType
local ThumbnailSize = FoundationModule.Enums.ThumbnailSize
local Image = FoundationModule.Image
local View = FoundationModule.View
local PersonButtonConfigsModule = require(PeopleReactView.Configs.PersonButtonConfigs)
local UseGetPeopleServiceModule = require(PeopleReactView.Hooks.useGetPeopleService)
local UseIsComponentInputEndedModule = require(PeopleReactView.Hooks.useIsComponentInputEnded)
local CardMenuModule = require(PeopleReactView.Components.Card.CardMenu)
local ConnectButtonModule = require(PeopleReactView.Components.Card.ConnectButton)
local FFlagSideSheetOpenPeoplePage = require(Parent.SharedFlags).FFlagSideSheetOpenPeoplePage
local GetFFlagPeoplePageLazyRenderCardsFunction = require(Parent.PeopleService).getService("Flags").GetFFlagPeoplePageLazyRenderCards
local PeoplePageCardMenuUseVisibleProperty = game:DefineFastFlag("PeoplePageCardMenuUseVisibleProperty", false)
local PeoplePageFixCardMenuZIndex = game:DefineFastFlag("PeoplePageFixCardMenuZIndex", false)

return ReactModule.memo(function(p1) --[[ Line: 50 | Named "CardThumbnail" ]]
	-- upvalues: ReactModule (copy), GetFFlagPeoplePageLazyRenderCardsFunction (copy), UsePreferredInputFunction (copy), UseLastInputModeFunction (copy), UseGetPeopleServiceModule (copy), PersonButtonConfigsModule (copy), SignalsReactModule (copy), FFlagSideSheetOpenPeoplePage (copy), UseIsComponentInputEndedModule (copy), ControlState (copy), Input (copy), View (copy), StateLayerAffordance (copy), Image (copy), GetRbxThumbFunction (copy), ThumbnailType (copy), ThumbnailSize (copy), PeoplePageFixCardMenuZIndex (copy), PeoplePageCardMenuUseVisibleProperty (copy), CardMenuModule (copy), ConnectButtonModule (copy), InputSize (copy)
	local UseRefResult = ReactModule.useRef(nil)
	local UsePreferredInputResult = if GetFFlagPeoplePageLazyRenderCardsFunction() then nil else UsePreferredInputFunction()
	local UseLastInputModeResult = if GetFFlagPeoplePageLazyRenderCardsFunction() then nil else UseLastInputModeFunction()
	local Constants = UseGetPeopleServiceModule("Constants")
	local PeopleVoiceChatStore = UseGetPeopleServiceModule("PeopleVoiceChatStore")
	local PersonButtonConfigsModuleResult = PersonButtonConfigsModule(p1.person.UserId)
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 61 ]]
		-- upvalues: PersonButtonConfigsModuleResult (copy), Constants (copy)
		return PersonButtonConfigsModuleResult[Constants.PERSON_BUTTONS.INSPECT]
	end, { PersonButtonConfigsModuleResult })
	local UseSignalStateResult = SignalsReactModule.useSignalState(PeopleVoiceChatStore.getPlayerIsTalking(p1.person.UserId))
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local v1 = nil
	local Callback = nil
	
	if FFlagSideSheetOpenPeoplePage then
		v1, Callback = ReactModule.useState(false)
	end
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(false)
	local UseIsComponentInputEndedModuleResult = UseIsComponentInputEndedModule(UseRefResult)
	local UseResult = ReactModule.useCallback(function(Hover) --[[ Line: 80 ]]
		-- upvalues: UseStateResult2_1 (copy), ControlState (upval)
		UseStateResult2_1(Hover == ControlState.Hover)
	end, {})
	local UseResult1 = if FFlagSideSheetOpenPeoplePage then ReactModule.useCallback(function(Hover) --[[ Line: 85 ]]
		-- upvalues: Callback (ref), ControlState (upval)
		Callback(Hover == ControlState.Hover or Hover == ControlState.Pressed)
	end, {}) else nil
	local UseMemoResult1 = ReactModule.useMemo(function() --[[ Line: 90 ]]
		-- upvalues: GetFFlagPeoplePageLazyRenderCardsFunction (upval), p1 (copy), UseLastInputModeResult (copy), UsePreferredInputResult (copy), Input (upval), UseStateResult (copy), UseStateResult3 (copy), UseSignalStateResult (copy)
		local ShouldShowMenu = if GetFFlagPeoplePageLazyRenderCardsFunction() then p1.shouldShowMenu else UseLastInputModeResult == "Focus" or UsePreferredInputResult ~= Input.Pointer
		
		return UseStateResult or (UseStateResult3 or (UseSignalStateResult or ShouldShowMenu))
	end, {
		UseStateResult, UseStateResult3, UseSignalStateResult, UsePreferredInputResult,
		UseLastInputModeResult, p1.shouldShowMenu
	})
	local UseMemoResult2 = ReactModule.useMemo(function() --[[ Line: 99 ]]
		-- upvalues: FFlagSideSheetOpenPeoplePage (upval), UseStateResult1 (copy), v1 (ref), UseStateResult3 (copy), UseIsComponentInputEndedModuleResult (copy)
		return (if FFlagSideSheetOpenPeoplePage then UseStateResult1 or v1 else UseStateResult1) or (UseStateResult3 or UseIsComponentInputEndedModuleResult)
	end, if FFlagSideSheetOpenPeoplePage then {
		UseStateResult1,
		v1,
		UseStateResult3,
		UseIsComponentInputEndedModuleResult
	} else {
		UseStateResult1,
		UseStateResult3,
		UseIsComponentInputEndedModuleResult
	})
	local UseResult2 = ReactModule.useCallback(function() --[[ Line: 110 ]]
		-- upvalues: UseMemoResult (copy), Constants (copy)
		UseMemoResult.onActivated(Constants.ANALYTICS.ENTRY_POINT.PEOPLE_CARD)
	end, { UseMemoResult.onActivated })
	
	return ReactModule.createElement(View, {
		tag = "size-full aspect-1-1 radius-medium",
		selection = { Selectable = UseMemoResult.shouldShow() },
		LayoutOrder = p1.layoutOrder,
		stateLayer = {
			affordance = if UseMemoResult2 then StateLayerAffordance.None else StateLayerAffordance.Background
		},
		onActivated = if UseMemoResult.shouldShow() then UseResult2 else nil,
		onStateChanged = ReactModule.useCallback(function(Hover) --[[ Line: 76 ]]
			-- upvalues: UseStateResult2 (copy), ControlState (upval)
			UseStateResult2(Hover == ControlState.Hover)
		end, {}),
		ref = UseRefResult
	}, {
		AvatarThumbnailContainer = ReactModule.createElement(View, { tag = "size-full padding-medium" }, {
			AvatarThumbnail = ReactModule.createElement(Image, {
				tag = "size-full",
				Image = GetRbxThumbFunction(ThumbnailType.Avatar, p1.person.UserId, ThumbnailSize.Medium)
			})
		}),
		ThumbnailHeaderBar = ReactModule.createElement(View, {
			tag = "row size-full-0 auto-y align-x-right padding-small",
			ZIndex = if PeoplePageFixCardMenuZIndex then 2 else nil
		}, {
			CardMenuBackground = if PeoplePageCardMenuUseVisibleProperty or UseMemoResult1 then ReactModule.createElement(View, {
				AutomaticSize = Enum.AutomaticSize.XY,
				selection = { Selectable = false },
				stateLayer = { affordance = StateLayerAffordance.None },
				onStateChanged = UseResult,
				Visible = if PeoplePageCardMenuUseVisibleProperty then UseMemoResult1 else nil
			}, {
				CardMenu = ReactModule.createElement(CardMenuModule, { person = p1.person, onIsOpenChanged = UseStateResult2_2 })
			}) else nil
		}),
		ConnectButtonAnchor = if FFlagSideSheetOpenPeoplePage and p1.isCompactCardLayout then ReactModule.createElement(View, {
			tag = "position-bottom-left anchor-bottom-left auto-xy padding-small",
			ZIndex = 2
		}, {
			ConnectButtonBackground = ReactModule.createElement(ConnectButtonModule, {
				person = p1.person,
				size = InputSize.Small,
				onStateChanged = UseResult1
			})
		}) else nil
	})
end)