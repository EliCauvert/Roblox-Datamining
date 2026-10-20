local LocalPlayer = game:GetService("Players").LocalPlayer
local PeopleReactView = script:FindFirstAncestor("PeopleReactView")
local Parent = PeopleReactView.Parent
local ReactModule = require(Parent.React)
local ReactIsModule = require(Parent.ReactIs)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local View = require(Parent.Foundation).View
local CardDetailsModule = require(PeopleReactView.Components.Card.CardDetails)
local CardThumbnailModule = require(PeopleReactView.Components.Card.CardThumbnail)
local CardTooltipModule = require(PeopleReactView.Components.Card.CardTooltip)
local FlagsService = require(Parent.PeopleService).getService("Flags")
local GetFFlagPeoplePageEnablePersonSignalStoreFunction = FlagsService.GetFFlagPeoplePageEnablePersonSignalStore
local GetFFlagPeoplePageLazyRenderCardsFunction = FlagsService.GetFFlagPeoplePageLazyRenderCards
local GetFFlagFixPeoplePageCardTooltipFunction = FlagsService.GetFFlagFixPeoplePageCardTooltip
local FFlagPeopleCardsEnableVirtualizedGrid = FlagsService.FFlagPeopleCardsEnableVirtualizedGrid

return ReactModule.memo(function(p1)
	-- upvalues: GetFFlagPeoplePageEnablePersonSignalStoreFunction (copy), SignalsReactModule (copy), SignalsModule (copy), ReactIsModule (copy), ReactModule (copy), FFlagPeopleCardsEnableVirtualizedGrid (copy), LocalPlayer (copy), View (copy), GetFFlagFixPeoplePageCardTooltipFunction (copy), CardThumbnailModule (copy), GetFFlagPeoplePageLazyRenderCardsFunction (copy), CardDetailsModule (copy), CardTooltipModule (copy)
	local UseSignalBindingResult = if GetFFlagPeoplePageEnablePersonSignalStoreFunction() then SignalsReactModule.useSignalBinding(SignalsModule.createComputed(function(p2)
		-- upvalues: p1 (copy)
		return if type(p1.layoutOrder) == "function" then p1.layoutOrder(p2) else p1.layoutOrder or 0
	end)) else nil
	local MapResult = if ReactIsModule.isBinding(p1.width) then p1.width:map(function(XOffset): UDim2
		return UDim2.new(0, XOffset, 0, 0)
	end) else UDim2.new(0, p1.width, 0, 0)
	local UseStateResult, UseStateResult2 = ReactModule.useState(not FFlagPeopleCardsEnableVirtualizedGrid and p1.showTooltip)
	
	if FFlagPeopleCardsEnableVirtualizedGrid then
		ReactModule.useEffect(function()
			-- upvalues: UseStateResult2 (copy), p1 (copy), LocalPlayer (upval)
			UseStateResult2(p1.showTooltip and (LocalPlayer ~= nil and p1.person.UserId == LocalPlayer.UserId))
		end, { p1.showTooltip, p1.person })
	end
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy), p1 (copy)
		UseStateResult2(false)
		p1.onDismissTooltip()
	end, {})
	
	return ReactModule.createElement(View, {
		tag = "auto-y",
		Size = MapResult,
		ZIndex = if UseStateResult then 2 else 1,
		LayoutOrder = if GetFFlagPeoplePageEnablePersonSignalStoreFunction() then UseSignalBindingResult else p1.layoutOrder
	}, {
		CardContent = ReactModule.createElement(View, {
			tag = if GetFFlagFixPeoplePageCardTooltipFunction() then "size-full-0 auto-y col bg-surface-100 radius-medium" else "size-full col bg-surface-100 radius-medium"
		}, {
			CardThumbnail = ReactModule.createElement(CardThumbnailModule, {
				layoutOrder = 1,
				person = p1.person,
				shouldShowMenu = if GetFFlagPeoplePageLazyRenderCardsFunction() then p1.shouldShowMenu else nil,
				isCompactCardLayout = p1.isCompactCardLayout
			}),
			CardDetails = ReactModule.createElement(CardDetailsModule, {
				layoutOrder = 2,
				person = p1.person,
				isCompactCardLayout = p1.isCompactCardLayout
			})
		}),
		CardTooltip = if UseStateResult then ReactModule.createElement(CardTooltipModule, { action = UseResult }) else nil
	})
end)