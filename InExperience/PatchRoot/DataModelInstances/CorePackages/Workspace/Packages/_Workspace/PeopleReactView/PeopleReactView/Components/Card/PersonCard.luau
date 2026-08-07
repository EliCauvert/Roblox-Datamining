local localPlayer = game:GetService("Players").LocalPlayer
local peopleReactView = script:FindFirstAncestor("PeopleReactView")
local parent = peopleReactView.Parent
local reactModule = require(parent.React)
local reactIsModule = require(parent.ReactIs)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local view = require(parent.Foundation).View
local peopleServiceModule = require(parent.PeopleService)
local cardDetailsModule = require(peopleReactView.Components.Card.CardDetails)
local cardThumbnailModule = require(peopleReactView.Components.Card.CardThumbnail)
local cardTooltipModule = require(peopleReactView.Components.Card.CardTooltip)
local flags = peopleServiceModule.getService("Flags")
local getFFlagPeoplePageEnablePersonSignalStore = flags.GetFFlagPeoplePageEnablePersonSignalStore
local getFFlagPeoplePageLazyRenderCards = flags.GetFFlagPeoplePageLazyRenderCards
local getFFlagFixPeoplePageCardTooltip = flags.GetFFlagFixPeoplePageCardTooltip
local fFlagPeopleCardsEnableVirtualizedGrid = flags.FFlagPeopleCardsEnableVirtualizedGrid

return reactModule.memo(function(p0) --[[ line: 36 | named "PersonCard" ]]
	-- upvalues: getFFlagPeoplePageEnablePersonSignalStore (ref), signalsReactModule (ref), signalsModule (ref), reactIsModule (ref), reactModule (ref), fFlagPeopleCardsEnableVirtualizedGrid (ref), localPlayer (ref), view (ref), getFFlagFixPeoplePageCardTooltip (ref), cardThumbnailModule (ref), getFFlagPeoplePageLazyRenderCards (ref), cardDetailsModule (ref), cardTooltipModule (ref)
	local var10 = if getFFlagPeoplePageEnablePersonSignalStore() then signalsReactModule.useSignalBinding(signalsModule.createComputed(function(p1) --[[ line: 38 ]]
		-- upvalues: p0 (ref)
		return if type(p0.layoutOrder) == "function" then p0.layoutOrder(p1) else p0.layoutOrder or 0
	end)) else nil
	local var11 = if reactIsModule.isBinding(p0.width) then p0.width:map(function(p2) --[[ line: 48 ]]
		return UDim2.new(0, p2, 0, 0)
	end) else UDim2.new(0, p0.width, 0, 0)
	local var12, var13 = reactModule.useState(if fFlagPeopleCardsEnableVirtualizedGrid then false else p0.showTooltip)
	
	if fFlagPeopleCardsEnableVirtualizedGrid then
		reactModule.useEffect(function() --[[ line: 60 ]]
			-- upvalues: var13 (ref), p0 (ref), localPlayer (copy)
			var13(p0.showTooltip and (localPlayer ~= nil and p0.person.UserId == localPlayer.UserId))
		end, { p0.showTooltip, p0.person })
	end
	return reactModule.createElement(view, {
		tag = "auto-y",
		Size = var11,
		ZIndex = if var12 then 2 else 1,
		LayoutOrder = if getFFlagPeoplePageEnablePersonSignalStore() then var10 else p0.layoutOrder
	}, {
		CardContent = reactModule.createElement(view, {
			tag = if getFFlagFixPeoplePageCardTooltip() then "size-full-0 auto-y col bg-surface-100 radius-medium" else "size-full col bg-surface-100 radius-medium"
		}, {
			CardThumbnail = reactModule.createElement(cardThumbnailModule, {
				layoutOrder = 1,
				person = p0.person,
				shouldShowMenu = if getFFlagPeoplePageLazyRenderCards() then p0.shouldShowMenu else nil
			}),
			CardDetails = reactModule.createElement(cardDetailsModule, { layoutOrder = 2, person = p0.person })
		}),
		CardTooltip = if var12 then reactModule.createElement(cardTooltipModule, {
			action = reactModule.useCallback(function() --[[ line: 65 ]]
				-- upvalues: var13 (ref), p0 (ref)
				var13(false)
				p0.onDismissTooltip()
			end, {})
		}) else nil
	})
end)