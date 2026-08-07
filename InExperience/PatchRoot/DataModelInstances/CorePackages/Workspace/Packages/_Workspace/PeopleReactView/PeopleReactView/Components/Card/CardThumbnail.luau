local peopleReactView = script:FindFirstAncestor("PeopleReactView")
local parent = peopleReactView.Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local responsiveModule = require(parent.Responsive)
local usePreferredInput = responsiveModule.usePreferredInput
local input = responsiveModule.Input
local useLastInputMode = require(parent.FocusNavigationUtils).useLastInputMode
local foundationModule = require(parent.Foundation)
local getRbxThumb = foundationModule.Utility.getRbxThumb
local controlState = foundationModule.Enums.ControlState
local stateLayerAffordance = foundationModule.Enums.StateLayerAffordance
local thumbnailType = foundationModule.Enums.ThumbnailType
local thumbnailSize = foundationModule.Enums.ThumbnailSize
local image = foundationModule.Image
local view = foundationModule.View
local peopleServiceModule = require(parent.PeopleService)
local personButtonConfigsModule = require(peopleReactView.Configs.PersonButtonConfigs)
local useGetPeopleServiceModule = require(peopleReactView.Hooks.useGetPeopleService)
local useIsComponentInputEndedModule = require(peopleReactView.Hooks.useIsComponentInputEnded)
local cardMenuModule = require(peopleReactView.Components.Card.CardMenu)
local getFFlagPeoplePageLazyRenderCards = peopleServiceModule.getService("Flags").GetFFlagPeoplePageLazyRenderCards
local peoplePageCardMenuUseVisibleProperty = game:DefineFastFlag("PeoplePageCardMenuUseVisibleProperty", false)

return reactModule.memo(function(p0) --[[ line: 43 | named "CardThumbnail" ]]
	-- upvalues: reactModule (ref), getFFlagPeoplePageLazyRenderCards (ref), usePreferredInput (ref), useLastInputMode (ref), useGetPeopleServiceModule (ref), personButtonConfigsModule (ref), signalsReactModule (ref), useIsComponentInputEndedModule (ref), controlState (ref), input (ref), view (ref), stateLayerAffordance (ref), image (ref), getRbxThumb (ref), thumbnailType (ref), thumbnailSize (ref), peoplePageCardMenuUseVisibleProperty (ref), cardMenuModule (ref)
	local var11 = reactModule.useRef(nil)
	local var12 = if not getFFlagPeoplePageLazyRenderCards() then usePreferredInput() else nil
	local var13 = if not getFFlagPeoplePageLazyRenderCards() then useLastInputMode() else nil
	local var14 = useGetPeopleServiceModule("Constants")
	local var15 = useGetPeopleServiceModule("PeopleVoiceChatStore")
	local var16 = personButtonConfigsModule(p0.person.UserId)
	local var17 = reactModule.useMemo(function() --[[ line: 54 ]]
		-- upvalues: var16 (ref), var14 (ref)
		return var16[var14.PERSON_BUTTONS.INSPECT]
	end, { var16 })
	local var18 = signalsReactModule.useSignalState(var15.getPlayerIsTalking(p0.person.UserId))
	local var19, var20 = reactModule.useState(false)
	local var21, var22 = reactModule.useState(false)
	local var23, var24 = reactModule.useState(false)
	local var25 = useIsComponentInputEndedModule(var11)
	local var26 = reactModule.useMemo(function() --[[ line: 73 ]]
		-- upvalues: getFFlagPeoplePageLazyRenderCards (copy), p0 (ref), var13 (ref), var12 (ref), input (copy), var19 (ref), var23 (ref), var18 (ref)
		return var19 or (var23 or (var18 or (if getFFlagPeoplePageLazyRenderCards() then p0.shouldShowMenu elseif var13 ~= "Focus" then var12 ~= input.Pointer else true)))
	end, {
		var19, var23, var18, var12, var13, p0.shouldShowMenu
	})
	
	return reactModule.createElement(view, {
		tag = "size-full aspect-1-1 radius-medium",
		selection = { Selectable = var17.shouldShow() },
		LayoutOrder = p0.layoutOrder,
		stateLayer = {
			affordance = if reactModule.useMemo(function() --[[ line: 81 ]]
				-- upvalues: var21 (ref), var23 (ref), var25 (ref)
				return var21 or (var23 or var25)
			end, { var21, var23, var25 }) then stateLayerAffordance.None else stateLayerAffordance.Background
		},
		onActivated = if var17.shouldShow() then reactModule.useCallback(function() --[[ line: 85 ]]
			-- upvalues: var17 (ref), var14 (ref)
			var17.onActivated(var14.ANALYTICS.ENTRY_POINT.PEOPLE_CARD)
		end, { var17.onActivated }) else nil,
		onStateChanged = reactModule.useCallback(function(p1) --[[ line: 65 ]]
			-- upvalues: var20 (ref), controlState (copy)
			var20(p1 == controlState.Hover)
		end, {}),
		ref = var11
	}, {
		AvatarThumbnailContainer = reactModule.createElement(view, { tag = "size-full padding-medium" }, {
			AvatarThumbnail = reactModule.createElement(image, {
				tag = "size-full",
				Image = getRbxThumb(thumbnailType.Avatar, p0.person.UserId, thumbnailSize.Medium)
			})
		}),
		ThumbnailHeaderBar = reactModule.createElement(view, {
			tag = "row size-full-0 auto-y align-x-right padding-small"
		}, {
			CardMenuBackground = if peoplePageCardMenuUseVisibleProperty or var26 then reactModule.createElement(view, {
				AutomaticSize = Enum.AutomaticSize.XY,
				selection = { Selectable = false },
				stateLayer = { affordance = stateLayerAffordance.None },
				onStateChanged = reactModule.useCallback(function(p2) --[[ line: 69 ]]
					-- upvalues: var22 (ref), controlState (copy)
					var22(p2 == controlState.Hover)
				end, {}),
				Visible = if peoplePageCardMenuUseVisibleProperty then var26 else nil
			}, {
				CardMenu = reactModule.createElement(cardMenuModule, { person = p0.person, onIsOpenChanged = var24 })
			}) else nil
		})
	})
end)